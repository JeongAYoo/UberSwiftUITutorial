//
//  LocationSearchViewModel.swift
//  UberSwiftUI
//
//  Created by Jade Yoo on 2023/06/02.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    
    // MARK: - Properties
    
    @Published var results = [MKLocalSearchCompletion]()  // 검색 자동완성 결과 저장
    @Published var selectedLocation: String?    // 선택한 목적지 저장
    
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {    // 검색어
        didSet {
//            print("DEBUG: Query fragment is \(queryFragment)")
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    // MARK: - Life cycle
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    // MARK: - Helpers
    
    func selectLocation(_ location: String) {
        self.selectedLocation = location
        
        print("DEBUG: Selected location is \(self.selectedLocation)")
    }
}

// MARK: - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
