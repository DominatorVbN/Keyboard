//
//  Colors.swift
//  Keyboarddd
//
//  Created by Federica Benacquista on 28/10/2020.
//

import Foundation
import UIKit

enum ColorScheme {
    case dark
    case light
}

struct CColors {
    
    let keysDefaultColor: UIColor
    let keysHighlightColor: UIColor
    
    let buttonTextColor: UIColor
   
    
    init(colorScheme: ColorScheme) {
        switch colorScheme {
        case .light:
           
            keysDefaultColor = .systemRed
                //UIColor.white
            keysHighlightColor = UIColor.lightGray.withAlphaComponent(0.6)
         
            buttonTextColor = .black
           
        case .dark:
            
            keysDefaultColor = .systemBlue
                // UIColor.gray.withAlphaComponent(0.5)
            keysHighlightColor = UIColor.lightGray.withAlphaComponent(0.5)
            
            buttonTextColor = .white
        }
    }
}
