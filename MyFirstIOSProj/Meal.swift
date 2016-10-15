//
//  Meal.swift
//  MyFirstIOSProj
//
//  Created by Mark Sun on 10/15/16.
//  Copyright © 2016 Mark Sun. All rights reserved.
//

import Foundation
import UIKit

class Meal {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    

}

