//
//  ContentView.swift
//  Moonshot
//
//  Created by Robert Clements on 09/12/2021.
//

import SwiftUI

struct ContentView: View {
  
  @AppStorage("showingGrid") private var showingGrid = true
  
  let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  let missions: [Mission] = Bundle.main.decode("missions.json")
  
    var body: some View {
      NavigationView {
            Group {
              if showingGrid {
                GridLayout(astronauts: astronauts, missions: missions)
              } else {
                ListLayout(astronauts: astronauts, missions: missions)
              }
            }
          .toolbar {
            ToolbarItem {
              Button() {
                print("Switched")
                showingGrid.toggle()
              } label: {
                Image(systemName: showingGrid ? "square.grid.2x2" : "list.dash")
                  .foregroundColor(.primary)
              }
            }
          }
          .navigationTitle("Moonshot")
          .background(.darkBackground)
          .preferredColorScheme(.dark)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
