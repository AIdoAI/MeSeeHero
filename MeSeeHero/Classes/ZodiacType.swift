//
//  ZodiacType.swift
//  MeSeeHero
//
//  Created by X1 on 11/6/19.
//  Copyright © 2019 X1. All rights reserved.
//

import Foundation

enum ZodiacType: Int{
    case Aries, Taurus, Gemini, Cancer, Leo, Virgo, Libra, Scorpio, Sagittarius, Capricorn, Aquarius, Pisces
    static let allZodiacs = [Aries, Taurus, Gemini, Cancer, Leo, Virgo, Libra, Scorpio, Sagittarius, Capricorn, Aquarius, Pisces]
    func zodiac() -> String{
        switch self {
        case .Aries:
            return "Aries"
        case .Taurus:
            return "Taurus"
        case .Gemini:
            return "Gemini"
        case .Cancer:
            return "Cancer"
        case .Leo:
            return "Leo"
        case .Virgo:
            return "Virgo"
        case .Libra:
            return "Libra"
        case .Scorpio:
            return "Scorpio"
        case .Sagittarius:
            return "Sagittarius"
        case .Capricorn:
            return "Capricorn"
        case .Aquarius:
            return "Aquarius"
        case .Pisces:
            return "Pisces"
        }
    }
}
