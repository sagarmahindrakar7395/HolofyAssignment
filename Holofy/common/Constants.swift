//
//  Constants.swift
//  Holofy
//
//  Created Sagar Mahindrakar on 24/05/21.
//

import Foundation
import UIKit

struct Constants
{
    struct LocalJSONFile {
        static let Name = "assignment"
        static let Extension = "json"
    }
    
    //String constants
    struct strings
    {
        static let poCellNibName = "PoListTableViewCell"
    }

    //String URL constants

    //Error contsants
    struct errors
    {
        static let networkTitle = "Oops"
        static let networkError = "something went wrong"
    }
    
    //Heading contsants
    struct heading
    {
        static let listHeading = "City List"
        static let mapHeading = "Weather"
    }
    
    struct P1Coordinates
    {
        static let latitude = 18.910000
        static let longitude = 72.809998
    }
    
    struct Radius
    {
        static let btnRadius = 8.0
        static let viewRadius = 12.0
    }
    
    static let kSize16AppFontMedium = UIFont(name: "AvenirNext-Medium", size: 16.0)

}
