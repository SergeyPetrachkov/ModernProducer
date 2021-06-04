//
//  ModernProducerViewModel.swift
//  
//
//  Created by Sergey Petrachkov on 04.06.2021.
//

import Combine

@available(iOS 13.0, *)
public class ModernProducerViewModel: ObservableObject {
  @Published var producer: IProducer

  public init(initialData: IProducer) {
    self.producer = initialData
  }

  public func start() {

  }
}
