//
//  Geography.swift
//  CapitalsPlus
//
//  Created by Michael Campbell on 6/18/23.
//

import Foundation
import SwiftData

// MARK: - GeographyElement
@Model
class GeographyElement {
    @Attribute(.unique) let name: String = ""
    let capital: String = ""
    let lat: String = ""
    let long: String = ""
    let abbr: String = ""
    let continent: String = ""
    let flag: String = ""
    let type: String = ""
    
    typealias dict = [String: AnyObject]
    
    var stateCount: Int = 0
    var countryCount: Int = 0
    
//    init(name: String, capital: String, lat: String, long: String, abbr: String, continent: String, flag: String, type: String) {
//        self.name = name
//        self.capital = capital
//        self.lat = lat
//        self.long = long
//        self.abbr = abbr
//        self.continent = continent
//        self.flag = flag
//        self.type = type
//    }

    init() {
        if let path = Bundle.main.path(forResource: "world", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("result is ]-----> \(result)")
                
                guard let location = result as? [dict] else { return }
                print("json is ]-----> \(location)")
                
                for loc in location {
                    if loc["type"] as! String == "state" {
                        stateCount += 1
                    }
                    
                    if loc["type"] as! String == "country" {
                        countryCount += 1
                    }
                    
                    print("loc: \(loc)")
                }
             } catch {
                print("Error parsing JSON information.")
            }
            
            print("Number of states: \(stateCount)")
            print("Number of countries: \(countryCount)")
        }
    }
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case australia = "Australia"
    case centralAmerica = "Central America"
    case europe = "Europe"
    case northAmerica = "North America"
    case southAmerica = "South America"
    case um = "UM"
    case us = "US"
}

typealias Geography = [GeographyElement]

// MARK: - Helper functions for creating encoders and decoders
func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
