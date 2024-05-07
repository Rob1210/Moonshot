//
//  CrewMembers.swift
//  Moonshot
//
//  Created by Robert Clements on 13/12/2021.
//

import SwiftUI

struct CrewMembers: View {
  
  let crew: [MissionView.CrewMember]
  
    var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(crew, id: \.role) { crewMember in
            NavigationLink {
              AstronautView(astronaut: crewMember.astronaut)
            } label: {
              HStack {
                Image(crewMember.astronaut.id)
                  .resizable()
                  .frame(width: 104, height: 72)
                  .clipShape(Capsule())
                  .overlay(
                    Capsule()
                      .strokeBorder(.white, lineWidth: 1)
                  )
                
                VStack(alignment: .leading) {
                  Text(crewMember.astronaut.name)
                    .foregroundColor(.white)
                    .font(.headline)
                  Text(crewMember.role)
                    .foregroundColor(.secondary)
                }
              }
              .padding(.horizontal)
            }
          }
        }
      }

    }
}

struct CrewMembers_Previews: PreviewProvider {
    static var previews: some View {
        CrewMembers(crew: [])
    }
}
