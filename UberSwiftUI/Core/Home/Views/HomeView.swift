//
//  HomeView.swift
//  UberSwiftUI
//
//  Created by Jade Yoo on 2023/05/23.
//

import SwiftUI

struct HomeView: View {
    // 검색화면 on/off
//    @State private var showLocationSearchView = false
    @State private var mapState = MapViewState.noInput
    
    var body: some View {
        ZStack(alignment: .top) {
            UberMapViewRepresentable(mapState: $mapState)
                .ignoresSafeArea()
            // MapViewActionButton에서 mapState 변경해줌
            if mapState == .searchingForLocation {
                // 검색(결과)화면 보여주기
                LocationSearchView(mapState: $mapState)
            } else if mapState == .noInput {
                // 검색창만 보여주기
                LocationSearchActivationView()
                    .padding(.top, 72)
                    .onTapGesture {
                        withAnimation(.spring()) {  // animation
                            mapState = .searchingForLocation
                        }
                    }
            }
            
            MapViewActionButton(mapState: $mapState) // 검색화면 on/off 여부 전달
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
