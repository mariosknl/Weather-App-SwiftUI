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
    
    private func fetchWeatherData(for city: String) async throws -> WeatherResponse {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city)&aqi=no"
        
        
        return .init(
            location: .init(name: "London", country: "England"),
            current: .init(
                tempC: 30.0,
                condition: .init(text: "Great Conditions", icon: "Icon Name"),
                feelslikeC: 32.5
            )
        )
    }
}

