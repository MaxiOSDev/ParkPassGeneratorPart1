//
//  EntrantModel.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Max Ramirez on 9/22/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import UIKit

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

class Guest: RideAccessable, AreaAccessable {
    var hasAccess: Bool = true
    var canSkipLines: Bool
    var amusementAreas: Bool = true
    var kitchenAreas: Bool = false
    var rideControlAreas: Bool = false
    var maintanceAreas: Bool = false
    var officeAreas: Bool = false
    
    init(canSkipLines: Bool) {
        self.canSkipLines = canSkipLines
    }
}

class ClassicGuest: Guest, InfoSubmittable, Discountable {
    var hasFoodDiscount: Bool = false
    var hasMerchandiseDiscount: Bool = false
    var personalInfoRequired: Bool = false
    
    override init(canSkipLines: Bool) {
        super.init(canSkipLines: false)
    }
}

class VipGuest: Guest, InfoSubmittable, Discountable {
    var hasFoodDiscount: Bool = true
    var hasMerchandiseDiscount: Bool = true
    var personalInfoRequired: Bool = false
    override init(canSkipLines: Bool) {
        super.init(canSkipLines: true)
    }
}

class FreeChildGuest: Guest, InfoSubmittable, Discountable {
    var hasFoodDiscount: Bool = false
    var hasMerchandiseDiscount: Bool = false
    var personalInfoRequired: Bool = true
    var dateOfBirth = Date()
    
    override init(canSkipLines: Bool) {
        super.init(canSkipLines: false)
    }
}

class Employee: RideAccessable, Discountable, InfoSubmittable {
    var hasAccess: Bool = true
    var canSkipLines: Bool = false
    var hasFoodDiscount: Bool = true
    var hasMerchandiseDiscount: Bool = true
    var personalInfoRequired: Bool = true
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

























































































