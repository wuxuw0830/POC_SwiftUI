//
//  View_toastView.swift
//  app
//
//  Created by Kelly on 2024/8/19.
//

import Foundation
import SwiftUI
extension View{
    func toastView(toast: Binding<Toast?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }}
