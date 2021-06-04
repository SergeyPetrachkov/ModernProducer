//
//  File.swift
//  
//
//  Created by Sergey Petrachkov on 04.06.2021.
//

import Foundation

public protocol IProducer {
  var id: Int { get }
  var avatar: String? { get }
  var nickname: String { get }
  var description: String { get }
}

public extension IProducer {
  var avatarURL: URL? {
    guard let avatarPath = self.avatar else {
      return nil
    }
    return URL(string: avatarPath)
  }
}

public struct Producer: IProducer {
  public let id: Int
  public let avatar: String?
  public let nickname: String
  public let description: String
}


extension Producer {
  init() {
    self.id = 0
    self.avatar = nil
    self.nickname = "Jon Doe"
    self.description = ""
  }
}
