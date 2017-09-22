//
//  EntrantModel.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/22/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import UIKit

// Protocols
protocol RideAccessable {
    var hasAccess: Bool { get }
    var canSkipLines: Bool { get }
}

protocol AreaAccessable {
    var amusementAreas: Bool { get }
    var kitchenAreas: Bool { get }
    var rideControlAreas: Bool { get }
    var maintanceAreas: Bool { get }
    var officeAreas: Bool { get }
}

protocol Discountable {
    var hasFoodDiscount: Bool { get }
    var hasMerchandiseDiscount: Bool { get }
}

protocol InfoSubmittable {
    var personalInfoRequired: Bool { get }
}

protocol SubmittableInfo {
    var firstName: String { get }
    var lastName: String { get }
    var city: String { get }
    var state: String { get }
    var zipCode: Int { get }
}

// Enums

enum InfoError: Error {
    case invalidFirstName
    case invalidLastName
    case invalidDateOfBirth
}

enum GuestType {
    case classicGuest
    case vipGuest
    case freeChildGuest
}

enum EmployeeType {
    case parkFoodServices
    case parkRideServices
    case parkMaintenace
    case parkManager
}

// Classes And SubClasses
class Guest: RideAccessable, AreaAccessable {
    var type: GuestType
    var hasAccess: Bool = true
    var canSkipLines: Bool
    var amusementAreas: Bool = true
    var kitchenAreas: Bool = false
    var rideControlAreas: Bool = false
    var maintanceAreas: Bool = false
    var officeAreas: Bool = false
    
    init(type: GuestType, canSkipLines: Bool) {
        self.type = type
        self.canSkipLines = canSkipLines
    }
}

class ClassicGuest: Guest, InfoSubmittable, Discountable {
    var hasFoodDiscount: Bool = false
    var hasMerchandiseDiscount: Bool = false
    var personalInfoRequired: Bool = false
}

class VipGuest: Guest, InfoSubmittable, Discountable {
    var hasFoodDiscount: Bool = true
    var hasMerchandiseDiscount: Bool = true
    var personalInfoRequired: Bool = false
}

class FreeChildGuest: Guest, InfoSubmittable, Discountable {
    var hasFoodDiscount: Bool = false
    var hasMerchandiseDiscount: Bool = false
    var personalInfoRequired: Bool = true
    var dateOfBirth = Date()
}

class Employee: RideAccessable, Discountable, InfoSubmittable, SubmittableInfo {
    var type: EmployeeType
    var hasAccess: Bool = true
    var canSkipLines: Bool = false
    var hasFoodDiscount: Bool = true
    var hasMerchandiseDiscount: Bool = true
    var personalInfoRequired: Bool = true
    var firstName: String
    var lastName: String
    var city: String
    var state: String
    var zipCode: Int
    
    init(type: EmployeeType, firstName: String, lastName: String, city: String, state: String, zipCode: Int) {
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}

class FoodServices: Employee, AreaAccessable {
    var amusementAreas: Bool = true
    var kitchenAreas: Bool = true
    var rideControlAreas: Bool = false
    var maintanceAreas: Bool = false
    var officeAreas: Bool = false
}

class RideServices: Employee, AreaAccessable {
    var amusementAreas: Bool = true
    var kitchenAreas: Bool = false
    var rideControlAreas: Bool = true
    var maintanceAreas: Bool = false
    var officeAreas: Bool = false
}

class Maintenance: Employee, AreaAccessable {
    var amusementAreas: Bool = true
    var kitchenAreas: Bool = true
    var rideControlAreas: Bool = true
    var maintanceAreas: Bool = true
    var officeAreas: Bool = false
}

class ParkManager: Employee, AreaAccessable {
    var amusementAreas: Bool = true
    var kitchenAreas: Bool = true
    var rideControlAreas: Bool = true
    var maintanceAreas: Bool = true
    var officeAreas: Bool = true
}














































































