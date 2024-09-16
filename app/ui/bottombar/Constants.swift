//
//  Constants.swift
//  app
//
//  Created by Kelly on 2024/8/22.
//

import SwiftUI
class SageAreaManager{
    static let shared  = SageAreaManager()
    var topInset:CGFloat = 59
    var bottomInset:CGFloat = 0
}
extension UIDevice{
    static var isIpad:Bool{
        UIDevice.current.userInterfaceIdiom == .pad
    }
    static var isPhone:Bool{
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
