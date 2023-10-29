//
//  Geography.swift
//  CapitalsPlus
//
//  Created by Michael Campbell on 6/18/23.
//

import Foundation
import SwiftData

// MARK: - GeographyElement
//@Model
class GeographyElement {
    let name: String = ""
    let capital: String = ""
    let lat: String = ""
    let long: String = ""
    let abbr: String = ""
    let continent: String = ""
    let flag: String = ""
    let type: String = ""
    
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
                print("data is ]-----> \(String(describing: String(data: data, encoding: .utf8)))")
                
                let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("result is ]-----> \(result)")
                
                guard let json = result as? [[String : AnyObject]] else { return }
                print("json is ]-----> \(json)")
                
//                for countryJson in json {
//                    var dict: [String : String] = [:]
//                    
//                    guard let key = countryJson.name,
//                          let value = countryJson["code"] else { return }
//
//                    guard let strKey = key as? String else { return }
//                    
//                    dict[strKey] = value as? String
//                    countries.append(dict)
//                }
             } catch {
                print("Error parsing Country JSON information.")
            }
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
