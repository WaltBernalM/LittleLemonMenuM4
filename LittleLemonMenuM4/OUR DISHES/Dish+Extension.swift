//
//  Dish+Extension.swift
//  LittleLemonMenuM4
//
//  Created by Walter Bernal Montero on 09/10/23.
//

import Foundation
import CoreData

extension Dish {
    static func createDishesFrom(menuItems: [MenuItem], _ context: NSManagedObjectContext) {
        for item in menuItems {
            guard let _ = exists(name: item.title, context)
            else { continue }
            let newDish = Dish(context: context)
            newDish.name = item.title
            newDish.price = item.price
        }
    }
    
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
