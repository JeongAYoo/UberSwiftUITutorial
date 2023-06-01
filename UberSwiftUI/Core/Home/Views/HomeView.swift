//
//  HomeView.swift
//  UberSwiftUI
//
//  Created by Jade Yoo on 2023/05/23.
//

import SwiftUI

struct HomeView: View {
    // 검색화면 on/off
    @State private var showLocationSearchView = false
    
    var body: some View {
        ZStack(alignment: .top) {
            UberMapViewRepresentable()
                .ignoresSafeArea()
            
            if showLocationSearchView {
                // 검색화면 보여주기
                LocationSearchView()
            } else {
                // 검색창만 보여주기
                LocationSearchActivationView()
                    .padding(.top, 72)
                    .onTapGesture {
                        withAnimation(.spring()) {  // animation
                            showLocationSearchView.toggle()
                        }
                    }
            }
            
            MapViewActionButton(showLocationSearchView: $showLocationSearchView) // 검색화면 on/off 여부 전달
                .padding(.leading)
                .padding(.top, 4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
