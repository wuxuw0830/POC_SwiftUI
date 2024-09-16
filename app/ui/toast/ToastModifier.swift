//
//  ToastModifier.swift
//  app
//
//  Created by Kelly on 2024/8/19.
//

import SwiftUI
import Foundation

struct ToastModifier: ViewModifier {
    @Binding var toast:Toast?
    //DispatchWorkItem 包成task 在用quene執行或取消
    @State private var worlItems:DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .overlay(
                ZStack{
                    mainToastView().offset(y:32)
                }//spring .animation
                    .animation(.spring(), value: toast)
            )
        //of 要監聽的變量
        //'onChange(of:perform:)' was deprecated in iOS 17.0: Use `onChange` with a two or zero parameter action closure instead.
        //            .onChange(of: toast){ value in
        //                showToast()
        //
        //            }
            .onChange(of: toast) {
                showToast()
            }
    }
    //@ViewBuilder 自訂的函數包裝器 可建構多個視圖
    @ViewBuilder func mainToastView()->some View{
        if let toast = toast{
            VStack{
                ToastView(
                    style: toast.style, message: toast.message, width: toast.width
                ){
                    dismissToast()
                }
                Spacer()
            }
        }
    }
    private func showToast(){
        guard let toast = toast else {return}
        // 震動反饋
        UIImpactFeedbackGenerator(style:.light)
            .impactOccurred()
        
        if toast.duration > 0 {
            worlItems?.cancel()
            let task  = DispatchWorkItem{
                dismissToast()
            }
            worlItems = task
            DispatchQueue.main.asyncAfter(deadline:.now()+toast.duration,execute: task)
        }
    }
    private func dismissToast(){
        withAnimation{
            toast = nil
        }
        worlItems?.cancel()
        worlItems = nil
    }
}

//#Preview {
//    ToastModifier()
//}
