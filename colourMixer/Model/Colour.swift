//
//  Colour.swift
//  colourMixer
//
//  Created by Martynas Adomaitis on 1/30/18.
//  Copyright © 2018 Martynas Adomaitis. All rights reserved.
//

import Foundation
import UIKit
class Colour{
    
    var redValue : Float = 0.0
    var greenValue : Float = 0.0
    var blueValue : Float = 0.0
    
    init(red : Float, green : Float, blue : Float){
        
        redValue = red
        greenValue = green
        blueValue = blue
        
    }
    
    func getColour()->UIColor{
        
        let newColour = UIColor(red : CGFloat(redValue/255.0),
                                green : CGFloat(greenValue/255.0),
                                blue : CGFloat(blueValue/255.0), alpha : 1.0)
        
        return newColour
        
    }
    
}
