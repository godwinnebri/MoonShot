//
//  ContentView.swift
//  MoonShot
//
//  Created by Godwin IE on 24/10/2023.
//

import SwiftUI

struct ContentView: View {
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    @State private var layoutType = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                                
                if layoutType {
                    GridView()
                } else{
                    ListView()
                }
 
            } //scroll view
            .navigationTitle("Moon Shot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                    Button {
                        layoutType.toggle()
                    } label: {
                        Image(systemName: layoutType ? "rectangle.grid.1x2" : "square.grid.2x2")
                    }
                }
        }
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


