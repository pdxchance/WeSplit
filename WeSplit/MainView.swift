//
//  MainView.swift
//  WeSplit
//
//  Created by Deanne Chance on 9/9/22.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            TipCalculatorView()
                .tabItem {
                    Label("Tip", systemImage: "list.dash")
                }

            TemperatureCalculatorView()
                .tabItem {
                    Label("Temperature", systemImage: "square.and.pencil")
                }
        }
    }
    

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
