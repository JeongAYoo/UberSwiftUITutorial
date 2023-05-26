//
//  LocationManager.swift
//  UberSwiftUI
//
//  Created by Jade Yoo on 2023/05/23.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // most accurate user location
        locationManager.requestWhenInUseAuthorization()     // request permission
        locationManager.startUpdatingLocation()
    }
    
    // + update 'Privacy - Location When In Use Usage Description' in info.plist
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else { return }
        //print(locations.first)
        locationManager.stopUpdatingLocation()  // 권한 요청 후 한번 유저 위치를 받아온 후에는 멈추기. 맵뷰에서 나머지 위치관련한 것들 수행
    }
}
