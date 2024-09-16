//
//  TabBarMainView.swift
//  app
//
//  Created by Kelly on 2024/9/12.
//

import SwiftUI

struct TabBarMainView: View {
    @Binding var showSheet: Bool

    var body: some View {
        VStack {
            Button("選擇") {
                showSheet.toggle()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .bottom) {
            if showSheet {
                SheetContent()
                    .transition(.move(edge: .bottom))
            }
        }
        .animation(.easeInOut, value: showSheet)
    }
}

struct SheetContent: View {
    let minHeight: CGFloat = 200
    let maxHeight: CGFloat = 450
    @State private var extraHeight = CGFloat.zero
    @State private var dragHeight = CGFloat.zero

    var body: some View {
        VStack {
            Text("請選擇")
            //Text("More Content in the Sheet")
            // Add more content here as needed
        }
        .frame(maxWidth: .infinity, maxHeight: minHeight + extraHeight)
        .offset(y: -dragHeight / 2)
        .background {
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, topTrailing: 20))
                .padding(.bottom, -300)
                .foregroundStyle(.gray)
                .offset(y: -dragHeight)
        }
        .overlay(alignment: .top) {
            Capsule()
                .frame(width: 36, height: 5)
                .foregroundStyle(.secondary)
                .padding(5)
                .offset(y: -dragHeight)
                .gesture(
                    DragGesture()
                        .onChanged { val in
                            let dy = -val.translation.height
                            let minDragHeight = minHeight - (minHeight + extraHeight)
                            let maxDragHeight = maxHeight - (minHeight + extraHeight)
                            dragHeight = min(max(dy, minDragHeight), maxDragHeight)
                        }
                        .onEnded { val in
                            extraHeight = extraHeight + dragHeight
                            dragHeight = 0
                        }
                )
        }
    }
}


//#Preview {
//    @Binding var showSheet: Bool
//
//    TabBarMainView(showSheet: $showSheet)
//        .tabItem {
//            Label("Home", systemImage: "house")
//        }
//        .toolbarBackground(.visible, for: .tabBar)
//        .toolbarBackground(.background, for: .tabBar)}
//}
