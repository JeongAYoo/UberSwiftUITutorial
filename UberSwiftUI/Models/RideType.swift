//
//  RideType.swift
//  UberSwiftUI
//
//  Created by Jade Yoo on 2023/06/04.
//

import Foundation

// CaseIterable: wrap all cases through diff options into an array
enum RideType: Int, CaseIterable, Identifiable {
    case uberX
    case black
    case uberXL
    
    // MARK: - Properties
    var id: Int { return rawValue }
    
    var description: String {
        switch self {
        case .uberX: return "UberX"
        case .black: return "UberBlack"
        case .uberXL: return "UberXL"
        }
    }
    
    var imageName: String {
        switch self {
        case .uberX: return "uber-x"
        case .black: return "uber-black"
        case .uberXL: return "uber-x"
        }
    }
    
    var baseFare: Double {
        switch self {
        case .uberX: return 5
        case .black: return 20
        case .uberXL: return 10
        }
    }
    
    // MARK: - Functions
    func computePrice(for distanceInMeters: Double) -> Double {
        let distanceInMiles = distanceInMeters / 1600
        
        switch self {
        case .uberX: return distanceInMiles * 1.5 + baseFare
        case .black: return distanceInMiles * 2.5 + baseFare
        case .uberXL: return distanceInMiles * 1.75 + baseFare
        }
    }
}
