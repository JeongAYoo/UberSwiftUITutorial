//
//  UberMapViewRepresentable.swift
//  UberSwiftUI
//
//  Created by Jade Yoo on 2023/05/23.
//

import SwiftUI
import MapKit

struct UberMapViewRepresentable: UIViewRepresentable {
    // UIViewRepresentable - UIKit을 SwiftUI에 맞게 wrapping
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    // 필수
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    // 필수
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension UberMapViewRepresentable {
    class MapCoordinator: NSObject, MKMapViewDelegate {
        /// communicate between UberMapViewRepresentable and MapCoordinator
        let parent: UberMapViewRepresentable
        
        init(parent: UberMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        /// delegate method - when the location of the user was updated
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                // span: zoom
            )
            
            parent.mapView.setRegion(region, animated: true)
        }
    }
}
