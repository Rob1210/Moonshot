//
//  AstronautView.swift
//  Moonshot
//
//  Created by Robert Clements on 11/12/2021.
//

import SwiftUI

struct AstronautView: View {
  let astronaut: Astronaut
  
    var body: some View {
      ScrollView(showsIndicators: false) {
        VStack {
          Image(astronaut.id)
            .resizable()
            .scaledToFit()
          
          Text(astronaut.description)
            .padding()
        }
      }
      .background(.darkBackground)
      .navigationTitle(astronaut.name)
      .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
  static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
    }
}
