import SwiftUI
import Combine
import SDWebImageSwiftUI

protocol IProducer {
  var id: Int { get }
  var avatar: String? { get }
  var nickname: String { get }
  var description: String { get }
}

extension IProducer {
  var avatarURL: URL? {
    guard let avatarPath = self.avatar else {
      return nil
    }
    return URL(string: avatarPath)
  }
}

struct Producer: IProducer {
  let id: Int
  let avatar: String?
  let nickname: String
  let description: String
}


extension Producer {
  init() {
    self.id = 0
    self.avatar = nil
    self.nickname = "Jon Doe"
    self.description = ""
  }
}

@available(iOS 13.0, *)
class ModernProducerViewModel: ObservableObject {
  @Published var producer: IProducer

  init(initialData: IProducer) {
    self.producer = initialData
  }

  func start() {

  }
}

@available(iOS 13.0, *)
struct ModernProducer: View {

  @ObservedObject var viewModel: ModernProducerViewModel

  var body: some View {
    VStack {
      WebImage(url: viewModel.producer.avatarURL)
        .placeholder {
          Rectangle().foregroundColor(.gray.opacity(0.2))
        }
        .frame(width: 100, height: 100, alignment: .center)
        .transition(.fade(duration: 0.5))
        .scaledToFit()
        .cornerRadius(50)
      Text(viewModel.producer.nickname)
        .foregroundColor(.gray)
      Text(viewModel.producer.description)
        .foregroundColor(.gray)
        .font(.footnote)
        .padding([.leading, .trailing, .top])

      HStack {
        Button("Follow") {}
          .frame(minWidth: 100, minHeight: 30)
          .background(
            Color(red: 101.0/255, green: 163.0/255, blue: 239.0/255)
          )
          .foregroundColor(.white)
          .cornerRadius(10)
        Button("Block") {}
          .frame(width: 100, height: 30)
          .background(
            Color.red
          )
          .foregroundColor(.white)
          .cornerRadius(10)
      }
      .padding()
    }
  }
}

@available(iOS 13.0, *)
struct ModernProducer_Previews: PreviewProvider {
  static var previews: some View {
    ModernProducer(
      viewModel: ModernProducerViewModel(
        initialData: Producer(
          id: 1,
          avatar: "https://avatars.githubusercontent.com/u/7995896?v=4",
          nickname: "SergeyPetrachkov",
          description: "Software developer from Russia, currently based in Amsterdam.\nWorked at Actonica, CFT and now working at Polarsteps.\nWorking on JuiceFit from time to time. Trying to keep fit and do some exercises on a daily basis."
        )
      )
    )
  }
}
