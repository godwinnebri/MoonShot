//
//  MissionView.swift
//  MoonShot
//
//  Created by Godwin IE on 01/11/2023.
//

import SwiftUI

struct MissionView: View {
    struct crewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [crewMember]
    
    var body: some View {
        ScrollView{
            VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                
                Text(mission.formattedLaunchDate)
                
                VStack(alignment: .leading) {
                    
                    Color.clear
                        .frame(height: 20)
                    
                    Text("Mission highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    Color.clear
                        .frame(height: 20)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)

                    
                }
                .padding(.horizontal)
                        
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(crew, id: \.role) { crewMember in
                            NavigationLink{
                                AstronautDetailView(astronaut: crewMember.astronaut)
                            } label: {
                                HStack{
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(.capsule)
                                        .overlay(
                                            Capsule()
                                                .strokeBorder(.white, lineWidth: 1)
                                        )
                                    
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                        
                                        Text(crewMember.role)
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map{ member in
            if let astronaut = astronauts[member.name] {
                return crewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("We are missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        let missions: [Mission] = Bundle.main.decode ("missions.json")
        let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        
        return MissionView(mission: missions[0], astronauts: astronauts)
    }
}
