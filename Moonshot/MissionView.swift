//
//  MissionView.swift
//  Moonshot
//
//  Created by Robert Clements on 11/12/2021.
//

import SwiftUI

struct MissionView: View {
  struct CrewMember {
    let role: String
    let astronaut: Astronaut
  }
  
  let mission: Mission
  let crew: [CrewMember]
  
  init(mission: Mission, astronauts: [String: Astronaut]) {
    self.mission = mission
    
    self.crew = mission.crew.map { member in
      if let astronaut = astronauts[member.name] {
        return CrewMember(role: member.role, astronaut: astronaut)
      } else {
        fatalError("Missing \(member.name)")
      }
    }
  }
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView {
        VStack {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: geometry.size.width * 0.6)
            .padding(.top)
          
          Text(mission.formattedLaunchDateLong)
            .font(.headline)
          
          VStack(alignment: .leading) {
            Rectangle()
              .frame(height: 2)
              .foregroundColor(.lightBackground)
              .padding(.vertical)
            
            Text("Mission Highlights")
              .font(.title.bold())
              .padding(.bottom, 5)
            
            Text(mission.description)
            
            Rectangle()
              .frame(height: 2)
              .foregroundColor(.lightBackground)
              .padding(.vertical)
            
            Text("Crew")
              .font(.title.bold())
              .padding(.bottom, 5)
          }
          .padding(.horizontal)
          
          CrewMembers(crew: crew)
        }
        .padding(.bottom)
      }
    }
    .navigationTitle(mission.displayName)
    .navigationBarTitleDisplayMode(.inline)
    .background(.darkBackground)
  }
}

struct MissionView_Previews: PreviewProvider {
  static let missions: [Mission] = Bundle.main.decode("missions.json")
  static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  
  static var previews: some View {
    MissionView(mission: missions[1], astronauts: astronauts)
      .preferredColorScheme(.dark)
  }
}
