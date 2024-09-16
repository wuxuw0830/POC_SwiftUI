//
//  Toast.swift
//  app
//
//  Created by Kelly on 2024/8/19.
//

import Foundation
struct Toast:Equatable{
    var style:ToastStyle
    var message:String
    var duration:Double = 3
    var width:Double = .infinity
}
