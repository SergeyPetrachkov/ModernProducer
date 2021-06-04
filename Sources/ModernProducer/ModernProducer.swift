import SwiftUI
import Combine
import SDWebImageSwiftUI

@available(iOS 13.0, *)
public struct ModernProducer: View {

  @ObservedObject var viewModel: ModernProducerViewModel

  public init(viewModel: ModernProducerViewModel) {
    self.viewModel = viewModel
  }

  public var body: some View {
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

      HStack(spacing: 16) {
        Image(systemName: "plus")
          .padding()
          .background(Color.neuBackground)
          .frame(width: 44, height: 44)
          .cornerRadius(22)
          .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 4)
          .onTapGesture {
            print("Subscribe")
          }
        Image(systemName: "eye.slash")
          .padding()
          .background(Color.neuBackground)
          .frame(width: 44, height: 44)
          .cornerRadius(22)
          .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 4)
          .onTapGesture {
            print("Block")
          }
      }
      .padding()

      Divider()
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
