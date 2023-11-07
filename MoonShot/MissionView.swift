//
//  MissionView.swift
//  MoonShot
//
//  Created by Godwin IE on 01/11/2023.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    var body: some View {
        ScrollView{
            VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                
                VStack(alignment: .leading) {
                    Text("Mission highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                }
                .padding(.horizontal)
                        
                }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        let missions: [Mission] = Bundle.main.decode ("missions.json")
        return MissionView(mission: missions[0])
    }
}
