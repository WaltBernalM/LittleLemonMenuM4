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
        
        do {
            guard let results = try context.fetch(request) as? [Dish]
            else { return nil }
            return results.count > 0
        } catch (let error){
            print(error.localizedDescription)
            return false
        }
    }
}
