//
//  ListView.swift
//  MoonShot
//
//  Created by Godwin IE on 10/11/2023.
//

import SwiftUI

struct ListView: View {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        VStack {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        } .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                    .padding()
                    
                }
            }
        } // VStack    }
    }
}
