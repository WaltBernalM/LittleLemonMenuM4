//
//  OurDishes.swift
//  LittleLemonMenuM4
//
//  Created by Walter Bernal Montero on 09/10/23.
//

import SwiftUI
import CoreData

struct OurDishes: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var dishesModel = DishesModel()
    @State private var showAlert = false
    @State var searchText = ""
    @State var itemToOrder = ""
    
    static private var sortDescriptors: [NSSortDescriptor] {
        [NSSortDescriptor(
            key: "name",
            ascending: true,
            selector: #selector(NSString.localizedStandardCompare)
        )]
    }
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Dish.name, ascending: true)],
        animation: .default
    )
    var dishes: FetchedResults<Dish>
    
    var body: some View {
        VStack {
            LittleLemonLogo()
                .padding(.bottom, 20)
                .padding(.top, 50)
            
            Text("Tap to order")
                .foregroundColor(.black)
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .background(Color("approvedYellow"))
                .cornerRadius(20)
            
            NavigationView {
                FetchedObjects(
                    predicate: buildPredicate(),
                    sortDescriptors: buildSortDescriptors()
                ) {
                    (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id:\.self) {dish in
                            DisplayDish(dish)
                                .onTapGesture {
                                    showAlert.toggle()
                                    itemToOrder = dish.name!
                                }
                        }
                    }
                    // Add search bar modifier
                }
            }
            .padding(.top, -40)
            .alert("Order placed, thanks!", isPresented: $showAlert) {
                Button("OK", role: .cancel){
                    
                }
            }
            .scrollContentBackground(.hidden)
            .task {
                await dishesModel.reload(viewContext)
            }
        }
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.count == 0 {
            return NSPredicate(value: true)
        }
        return NSPredicate(format: "name CONTAINS[cd] %@", searchText)
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(
                key: "name",
                ascending: true, 
                selector: #selector(NSString.localizedStandardCompare)
            )
        ]
    }
}

struct OurDishes_Previews: PreviewProvider {
    static var previews: some View {
        OurDishes()
    }
}
