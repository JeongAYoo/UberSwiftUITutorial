//
//  HomeView.swift
//  UberSwiftUI
//
//  Created by Jade Yoo on 2023/05/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
