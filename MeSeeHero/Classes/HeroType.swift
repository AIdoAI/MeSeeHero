//
//  HeroType.swift
//  MeSeeHero
//
//  Created by X1 on 10/31/19.
//  Copyright © 2019 X1. All rights reserved.
//

import Foundation
import UIKit

enum HeroType: Int{
    case finn, jake, pb, marceline, iceking,lsp, bmo
    static let allValues = [finn, jake, pb, marceline, iceking, bmo,lsp, bmo]
    
    func name() -> String{
        switch self {
        case .finn:
            return "Finn the Human"
        case .jake:
            return "Jake the Dog"
        case .pb:
            return "Princess Bonnibel Bubblegum"
        case .iceking:
            return "Ice King"
        case .marceline:
            return "Marceline the Vampire Queen"
        case .lsp:
            return "Lumpy Space Princess"
        case .bmo:
            return "BMO"
        }
    }
    
    func image() -> UIImage? {
        switch self {
        case .finn:
            return UIImage(named: "finn")
        case .jake:
            return UIImage(named: "jake")
        case .pb:
            return UIImage(named: "pb")
        case .iceking:
            return UIImage(named: "iceking")
        case .marceline:
            return UIImage(named: "marceline")
        case .lsp:
            return UIImage(named: "lsp")
        case .bmo:
            return UIImage(named:"bmo")
    }
}
    
    func residence() -> String{
        switch self {
        case .finn:
            return "Finn the Human"
        case .jake:
            return "Jake the Dog"
        case .pb:
            return "Princess Bonnibel Bubblegum"
        case .iceking:
            return "Ice King"
        case .marceline:
            return "Marceline the Vampire Queen"
        case .lsp:
            return "Lumpy Space Princess"
        case .bmo:
            return "BMO"
        }
    }
    
    func zodiac() -> String{
        switch self {
        case .finn:
            return "Finn the Human"
        case .jake:
            return "Jake the Dog"
        case .pb:
            return "Princess Bonnibel Bubblegum"
        case .iceking:
            return "Ice King"
        case .marceline:
            return "Marceline the Vampire Queen"
        case .lsp:
            return "Lumpy Space Princess"
        case .bmo:
            return "BMO"
        }
    }

}
