//
//  MapModel.swift
//  Holofy
//
//  Created Sagar Mahindrakar on 24/05/21.
//


import Foundation

// MARK: - Welcome
struct MapModel: Codable {
    var poiList: [PoiList]?
}

// MARK: - PoiList
struct PoiList: Codable {
    var id: Int?
    var coordinate: Coordinate?
    var fleetType: FleetType?
    var heading: Double?
}

// MARK: - Coordinate
struct Coordinate: Codable {
    var latitude, longitude: Double?
}

enum FleetType: String, Codable {
    case pooling = "POOLING"
    case taxi = "TAXI"
}

struct Category: Codable {
    var title: String?
    var nodes: [String]?
}


struct Weather: Codable {
    var coord: Coord?
    var weather: [WeatherElement]?
    var base: String?
    var main: Main?
    var visibility: Int?
    var wind: Wind?
    var clouds: Clouds?
    var dt: Int?
    var sys: Sys?
    var timezone, id: Int?
    var name: String?
    var cod: Int?
}

// MARK: - Clouds
struct Clouds: Codable {
    var all: Int?
}

// MARK: - Coord
struct Coord: Codable {
    var lon, lat: Double?
}

// MARK: - Main
struct Main: Codable {
    var temp, feelsLike, tempMin, tempMax: Double?
    var pressure, humidity: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    var type, id: Int?
    var country: String?
    var sunrise, sunset: Int?
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    var id: Int?
    var main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    var speed: Double?
    var deg: Int?
    var gust: Double?
}

