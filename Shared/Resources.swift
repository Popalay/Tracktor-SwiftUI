//
//  Theme.swift
//  Tracktor
//
//  Created by Денис Никифоров on 16.07.2020.
//

import SwiftUI

struct Resources {
    struct Colors {
        static let primary = Color("primary")
        static let primaryVariant = Color("primaryVariant")
        static let secondary = Color("secondary")
        static let background = Color("background")
        static let surface = Color("surface")
        static let error = Color("error")
        static let onPrimary = Color("onPrimary")
        static let onSecondary = Color("onSecondary")
        static let onBackground = Color("onBackground")
        static let onSurface = Color("onSurface")
        static let onError = Color("onError")
        
        static let gradient1: [Color] = [
            Color.init(hex: "FF64BFE1"),
            Color.init(hex: "FFA091B7"),
            Color.init(hex: "FFE0608A")
        ]
    }
    
    struct Images {
        static let logoText = "ic_logo_text"
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
