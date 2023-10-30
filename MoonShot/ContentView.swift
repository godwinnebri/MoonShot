//
//  ContentView.swift
//  MoonShot
//
//  Created by Godwin IE on 24/10/2023.
//

import SwiftUI

struct ContentView: View {
    let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("\(astronauts["grissom"]?.description ?? "Grissom")")
            Text("\(mission[0].launchDate ?? "date of beni")")
            Text("\(mission[5].launchDate ?? "date of beni")")
            Text("\(mission[1].crew[2].role)")


        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
