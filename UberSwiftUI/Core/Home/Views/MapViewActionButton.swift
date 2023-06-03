//
//  MapViewActionButton.swift
//  UberSwiftUI
//
//  Created by Jade Yoo on 2023/05/26.
//

import SwiftUI

struct MapViewActionButton: View {
//    @Binding var showLocationSearchView: Bool // bound to HomeView
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
//                showLocationSearchView.toggle()
                actionForState(mapState)
            }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    /**
     - noInput: 기본 상태
        - 버튼 탭 -> (사이드 메뉴 오픈. 구현X)
     - searchingForLocation: 검색 중일때
        - 버튼 탭 -> 다시 기본 맵뷰로 돌아가기
     - locationSelected: 장소가 선택된 상태
        - 버튼 탭 -> 맵뷰 클리어(마커, 폴리라인, 좌표 지우기)
        - 좌표 = nil, 안지우면 이전 루트 폴리라인 그대로 유지됨
     */
    func actionForState(_ state: MapViewState) {
        switch state {
        case .noInput:
            print("DEBUG: No input")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected, .polylineAdded:
            mapState = .noInput
            viewModel.selectedUberLocation = nil
            print("DEBUG: Clear map view..")
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String {
        switch state {
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected, .polylineAdded:
            return "arrow.left"
        }
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput))
    }
}
