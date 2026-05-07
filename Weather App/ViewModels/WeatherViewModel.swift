//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Marios Kanellopoulos on 7/5/26.
//

import Foundation

@Observable
class WeatherViewModel {
    var city: String = ""
    var weather: WeatherResponse?
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let apiKey = "1cbb8ba1f21e403eae892004260705"
    
}
