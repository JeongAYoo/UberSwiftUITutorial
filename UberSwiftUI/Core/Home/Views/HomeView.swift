//
//  HomeView.swift
//  UberSwiftUI
//
//  Created by Jade Yoo on 2023/05/23.
//

import SwiftUI

struct HomeView: View {
//    @State private var showLocationSearchView = false
    @State private var mapState = MapViewState.noInput
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // map
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
            
            // show ride request view at bottom
            // when location is selected
            if mapState == .locationSelected || mapState == .polylineAdded {
                RideRequestView()
                    .transition(.move(edge: .bottom))   // slide up from bottom edge
            }
        }
        .edgesIgnoringSafeArea(.bottom) // ride request covers bottom safe area
        .onReceive(LocationManager.shared.$userLocation) { location in
            if let location = location {
                locationViewModel.userLocation = location
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
