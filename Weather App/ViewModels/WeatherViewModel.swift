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
        // Build URL
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city)&aqi=no"
        guard let url = URL(string: urlString) else {
            throw WeatherError.invalidURL
        }
        
        // Fetch data
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Validate response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw WeatherError.unknown
        }
        
        guard httpResponse.statusCode == 200 else {
            throw WeatherError.requestFailed(statusCode: httpResponse.statusCode)
        }
        
        // Decode Model
        do {
            return try JSONDecoder().decode(WeatherResponse.self, from: data)
        } catch {
            throw WeatherError.decodingFailed
        }
        
    }
}

