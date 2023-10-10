//
//  MainView.swift
//  LittleLemonMenuM4
//
//  Created by Walter Bernal Montero on 09/10/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var model = Model()
    @State var tabSelection = 0
    @State var previousTabSelection = -1 // Any invalid value
    @State var menuLoaded = false

    var body: some View {
        TabView(selection: $model.tabViewSelectedIndex) {
            LocationsView()
                .tag(0)
                .tabItem {
                    if !model.displayingReservationForm {
                        Label("Locations", systemImage: "fork.knife")
                    }
                }
                .onAppear() {
                    tabSelection = 0
            }
            
            OurDishes(menuLoad: $menuLoaded)
                .tag(1)
                .tabItem {
                    if !model.displayingReservationForm {
                        Label("Our Dishes", systemImage: "fork.knife.circle")
                    }
                }
                .onAppear() {
                    tabSelection = 1
                }
            
            ReservationView()
                .tag(2)
                .tabItem {
                    if !model.displayingReservationForm {
                        Label("Reservation", systemImage: "square.and.pencil")
                    }
                }
                .onAppear() {
                    tabSelection = 2
                }
        }
        .id(tabSelection)
        .environmentObject(model)
    }
}

struct MainView_previews: PreviewProvider {
    static var  previews: some View {
        ContentView().environmentObject(Model())
    }
}
