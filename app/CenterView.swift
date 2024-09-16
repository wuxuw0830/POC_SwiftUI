//
//  CenterView.swift
//  app
//
//  Created by Kelly on 2024/9/12.
//

import SwiftUI

struct CenterView: View {
    @State private var showSheet = false

    var body: some View {
        TabView {
            TabBarMainView(showSheet: $showSheet)
                .tabItem {
                    Label("主頁", systemImage: "house")
                }
            HomeView()
                .tabItem {
                    Label("中心", systemImage: "2.circle")
                }
        }    }
}

#Preview {
    CenterView()
}
