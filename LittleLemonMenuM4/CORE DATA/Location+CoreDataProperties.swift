//
//  Location+CoreDataProperties.swift
//  LittleLemonMenuM4
//
//  Created by Walter Bernal Montero on 09/10/23.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var city: String?
    @NSManaged public var neighborhood: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var toCustomer: NSSet?
    @NSManaged public var toDessert: NSSet?
    @NSManaged public var toDish: NSSet?

}

// MARK: Generated accessors for toCustomer
extension Location {

    @objc(addToCustomerObject:)
    @NSManaged public func addToToCustomer(_ value: Customer)

    @objc(removeToCustomerObject:)
    @NSManaged public func removeFromToCustomer(_ value: Customer)

    @objc(addToCustomer:)
    @NSManaged public func addToToCustomer(_ values: NSSet)

    @objc(removeToCustomer:)
    @NSManaged public func removeFromToCustomer(_ values: NSSet)

}

// MARK: Generated accessors for toDessert
extension Location {

    @objc(addToDessertObject:)
    @NSManaged public func addToToDessert(_ value: Dessert)

    @objc(removeToDessertObject:)
    @NSManaged public func removeFromToDessert(_ value: Dessert)

    @objc(addToDessert:)
    @NSManaged public func addToToDessert(_ values: NSSet)

    @objc(removeToDessert:)
    @NSManaged public func removeFromToDessert(_ values: NSSet)

}

// MARK: Generated accessors for toDish
extension Location {

    @objc(addToDishObject:)
    @NSManaged public func addToToDish(_ value: Dish)

    @objc(removeToDishObject:)
    @NSManaged public func removeFromToDish(_ value: Dish)

    @objc(addToDish:)
    @NSManaged public func addToToDish(_ values: NSSet)

    @objc(removeToDish:)
    @NSManaged public func removeFromToDish(_ values: NSSet)

}

extension Location : Identifiable {

}
