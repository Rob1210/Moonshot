//
//  Mission.swift
//  Moonshot
//
//  Created by Robert Clements on 10/12/2021.
//

import Foundation

struct Mission: Codable, Identifiable {
  struct CrewRole: Codable {
    let name: String
    let role: String
  }
  
  let id: Int
  let launchDate: Date?
  let crew: [CrewRole]
  let description: String
  
  var displayName: String {
      "Apollo \(id)"
  }

  var image: String {
      "apollo\(id)"
  }
  
  var formattedLaunchDate: String {
    launchDate?.formatted(date: .abbreviated, time: .omitted) ?? ""
  }
  
  var formattedLaunchDateLong: String {
    launchDate?.formatted(date: .long, time: .omitted) ?? ""
  }
}
