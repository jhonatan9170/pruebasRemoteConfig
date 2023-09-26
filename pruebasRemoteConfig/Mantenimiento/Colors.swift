//
//  Colors.swift
//  pruebasRemoteConfig
//
//  Created by Whiz on 25/09/23.
//

import SwiftUI

enum ButtonColor {
    case redButtonActive
    case redButtonPressed
    case redButtonDisable
    case grayButtonDisable
}

extension ButtonColor {
    var value: Color {
        get {
            switch self {
            case .redButtonActive:
                return Color.custom(red: 218, green: 41, blue: 28)
            case .redButtonPressed:
                return Color.custom(red:162, green: 13, blue: 2)
            case .redButtonDisable:
                return Color.custom(red: 165, green: 165, blue: 165)
            case .grayButtonDisable:
                return Color.custom(red: 213, green: 213, blue: 213, opacity: 1.0)
            }
        }
    }
}

extension Color {
    public static func custom(red : Double, green:  Double, blue: Double) -> Color{
        return Color(red: red/255, green: green/255, blue: blue/255, opacity: 1.0)
    }
    
    public static func custom(red : Double, green:  Double, blue: Double, opacity: Double) -> Color{
        return Color(red: red/255, green: green/255, blue: blue/255, opacity: opacity)
    }

    static let customRed = Color.custom(red: 218, green: 41, blue: 28, opacity: 1)
    static let creditCapsulBlue = Color.custom(red: 224, green: 247, blue: 249, opacity: 1)
    static let creditCapsulDeepBlue = Color.custom(red: 0, green: 148, blue: 162, opacity: 1)
    static let customeYellow = Color.custom(red: 255, green: 233, blue: 49, opacity: 1)
    static let customBlack83 = Color.custom(red: 51, green: 51, blue: 51, opacity: 0.83)
    static let darkGray = Color.custom(red: 51, green: 51, blue: 51, opacity: 1)
    static let lightGrayColor = Color.custom(red: 102, green: 102, blue: 102, opacity: 1)
    static let backgroundGrayLight =  Color.custom(red: 245, green: 245, blue: 245, opacity: 1)
    static let backgroundYellowLight = Color.custom(red: 255, green: 254, blue: 230)
    static let lineOutRadioButton = Color.custom(red: 255, green: 214, blue: 120)
    static let thakyouPageTitle = Color.custom(red: 0, green: 159, blue: 3)
    static let alertSuccess = Color.custom(red: 230, green: 245, blue: 228)
    static let alertWaring = Color.custom(red: 252, green: 229, blue: 205)
    static let alertError =  Color.custom(red: 255, green: 235, blue: 237)
    static let alertInfo = Color.custom(red: 224, green: 247, blue: 249)
    static let alertSuccessText = Color.custom(red: 0, green: 94, blue: 0)
    static let alertErrorText = Color.custom(red: 162, green: 13, blue: 2)
    static let blueLinkColor = Color.custom(red: 0, green: 148, blue: 162, opacity: 1)
    static let grayLineColor = Color.custom(red: 212, green: 214, blue: 213)
    static let greenColor = Color.custom(red: 0, green: 159, blue: 3, opacity: 1)
    static let greenLightColor = Color.custom(red: 230, green: 245, blue: 228, opacity: 1)
    static let orangeColor = Color.custom(red: 255, green: 125, blue: 0, opacity: 1)
    static let orangeOpacityColor = Color.custom(red: 255, green: 125, blue: 0, opacity: 0.1)
    static let yellowColor = Color.custom(red: 255, green: 170, blue: 0, opacity: 1)
    static let orangeLightBGColor = Color.custom(red: 255, green: 114, blue: 34, opacity: 0.1)
    static let orangeLightColor = Color.custom(red: 255, green: 254, blue: 230, opacity: 1)
    static let grayColor = Color.custom(red: 102, green: 102, blue: 102, opacity: 1)
    static let redColor = Color.custom(red: 162, green: 13, blue: 2, opacity: 1)
    static let redLightColor = Color.custom(red: 255, green: 235, blue: 237, opacity: 1)
    static let grayMediumColor = Color.custom(red: 213, green: 213, blue: 213, opacity: 1)
    static let whiteBackColorHome = Color.custom(red: 244, green: 244, blue: 244, opacity: 1)
    static let secondLightGrayColor = Color.custom(red: 102, green: 102, blue: 102, opacity: 1)
    static let grayColorButton = Color.custom(red: 212, green: 212, blue: 212, opacity: 1)
    static let lightGrayTwo = Color.custom(red: 59, green: 59, blue: 67, opacity: 1)
    static let darkGrayColor = Color.custom(red: 51, green: 51, blue: 41, opacity: 1)
    static let lightWhite = Color.custom(red: 255, green: 255, blue: 255, opacity: 0)
    static let redTextColor = Color.custom(red: 246, green: 80 ,blue: 65, opacity: 1)
    static let colorImageCount = Color.custom(red: 235, green: 235, blue: 235, opacity: 1)
    static let colorBorder = Color.custom(red: 159, green: 159, blue: 159, opacity: 1)
    static let passedPriceColor = Color.custom(red: 163, green: 163, blue: 163, opacity: 1)
    static let MSIColor = Color.custom(red: 26, green: 26, blue: 26, opacity: 1)
    static let textColorForget = Color.custom(red: 0, green: 147, blue: 161, opacity: 1)
    static let redBannerColor = Color.custom(red: 199, green: 59, blue: 44, opacity: 1)
    static let textGreenColor = Color.custom(red: 2, green: 94, blue: 96, opacity: 1)
    static let grayDisable = Color.custom(red: 165, green: 165, blue: 165, opacity: 1)
    static let redCreditEkt = Color.custom(red: 200, green: 60, blue: 43, opacity: 1)
}


extension Color {
    public static func strToHex(hexString: String, alpha: Double = 1.0) -> Color{
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: Int32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = Double(r) / 255.0
        let green = Double(g) / 255.0
        let blue  = Double(b) / 255.0
        return self.init(red:red, green:green, blue:blue, opacity:alpha)
    }
        
//        func toHexString() -> String {
//              var r:Float = 0
//              var g:Float = 0
//              var b:Float = 0
//              var a:Float = 0
//              getRed(&r, green: &g, blue: &b, alpha: &a)
//              let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
//              return String(format:"#%06x", rgb)
//          }
        
}


