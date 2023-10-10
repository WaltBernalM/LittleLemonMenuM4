//
//  LocationsView.swift
//  LittleLemonMenuM4
//
//  Created by Walter Bernal Montero on 09/10/23.
//

import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        VStack {
            LittleLemonLogo()
                .padding(.top, 50)
            Text(model.displayingReservationForm ? "Reservation Details" : "Select a Location")
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
            
            NavigationView {
                // EmptyView()
                List(model.restaurants, id: \.self) { restaurant in
                    NavigationLink(destination: ReservationForm(restaurant)) {
                        RestaurantView(restaurant)
                    }
                }
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}
