//
//  Dish+Extension.swift
//  LittleLemonMenuM4
//
//  Created by Walter Bernal Montero on 09/10/23.
//

import Foundation
import CoreData

extension Dish {
    /// Creation of dishes in the Core Data entity Dish
    static func createDishesFrom(menuItems: [MenuItem], _ context: NSManagedObjectContext) {
        for item in menuItems {
            /// Verification of the existance of the item  in current database.
            guard let _ = exists(name: item.title, context)
            else { continue } /// If the verification provides false, the item is created.
            let newDish = Dish(context: context)
            newDish.name = item.title
            newDish.price = item.price
        }
    }
    
    /// Function to verify existance of a Dish with its name.
    static func exists(name: String, _ context:NSManagedObjectContext) -> Bool? {
        let request = Dish.request()
        let predicate = NSPredicate(format: "name CONTAINS[cd] %@", name)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Dish], results.count > 0
            else { return false }
            return true
        } catch (let error){
            print(error.localizedDescription)
            return false
        }
    }
}
