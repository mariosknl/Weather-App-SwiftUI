//
//  WeatherResponse.swift
//  Weather App
//
//  Created by Marios Kanellopoulos on 7/5/26.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: jsonData)

import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let location: Location
    let current: Current
}

// MARK: - Current
struct Current: Codable {
    let tempC: Double
    let condition: Condition
    let feelslikeC : Double

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition
        case feelslikeC = "feelslike_c"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: String
    let icon: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let country: String

    enum CodingKeys: String, CodingKey {
        case name, country
    }
}
