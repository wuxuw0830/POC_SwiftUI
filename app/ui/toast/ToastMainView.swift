//
//  ToastMainView.swift
//  app
//
//  Created by Kelly on 2024/8/19.
//

import SwiftUI

struct ToastMainView: View {
    @State private var toast:Toast? = nil
    var body: some View {
        VStack(spacing: 32) {
            Button {
                toast = Toast(style: .success, message: "Saved.", width: 160)
            } label: {
                Text("Run (Success)")
            }
            Button {
                toast = Toast(style: .info, message: "Btw, you are a good person.")
            } label: {
                Text("Run (Info)")
            }
            
            
            Button {
                toast = Toast(style: .warning, message: "Beware of a dog!")
            } label: {
                Text("Run (Warning)")
            }
            
            Button {
                toast = Toast(style: .error, message: "Fatal error, blue screen level.")
            } label: {
                Text("Run (Error)")
            }    }
        .toastView(toast: $toast)
    }
}

#Preview {
    ToastMainView()
}

