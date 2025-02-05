//
//  ListLayout.swift
//  Moonshot
//
//  Created by Robert Clements on 13/12/2021.
//

import SwiftUI

struct ListLayout: View {
  
  let astronauts: [String: Astronaut]
  let missions: [Mission]
  
    var body: some View {
      List {
        ForEach(missions) { mission in
          NavigationLink {
            MissionView(mission: mission, astronauts: astronauts)
          } label: {
            HStack {
              Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50 , height: 50)
                .padding()
              
              VStack(alignment: .leading) {
                Text(mission.displayName)
                  .font(.headline)
                  .foregroundColor(.white)
                
                Text(mission.formattedLaunchDate)
                  .font(.caption)
                  .foregroundColor(.secondary)
              }
            }
            
          }
        }
        .listRowBackground(Color.darkBackground)
      }
      .listStyle(.plain)
      
    }
}

struct ListLayout_Previews: PreviewProvider {
  
  static let missions: [Mission] = Bundle.main.decode("missions.json")
  static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  
    static var previews: some View {
      ListLayout(astronauts: astronauts, missions: missions)
        .preferredColorScheme(.dark)
    }
}
