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
    
    func actionForState(_ state: MapViewState) {
        switch state {
        case .noInput:
            // 기본 상태에서 버튼 탭 -> (사이드 메뉴 오픈. 구현X)
            print("DEBUG: No input")
        case .searchingForLocation:
            // 검색 중일때 버튼 탭 -> 다시 기본 맵뷰로 돌아가기
            mapState = .noInput
        case .locationSelected:
            // 장소가 선택된 상태에서 버튼 탭 -> 맵뷰 클리어(마커, 폴리라인 지우기)
            mapState = .noInput
//            print("DEBUG: Clear map view..")
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String {
        switch state {
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected:
            return "arrow.left"
        }
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput))
    }
}
