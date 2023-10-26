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
    let name, capital, lat, long: String
    let abbr: String
    let continent: Continent
    let flag: String
    let type: String
    

    
    
}

// MARK: GeographyElement convenience initializers and mutators

extension GeographyElement {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(GeographyElement.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }

//    func with(
//        name: String? = nil,
//        capital: String? = nil,
//        lat: String? = nil,
//        long: String? = nil,
//        abbr: String? = nil,
//        continent: Continent? = nil,
//        flag: String? = nil,
//        type: String? = nil
//    ) -> GeographyElement {
//        return GeographyElement(
//            name: name ?? self.name,
//            capital: capital ?? self.capital,
//            lat: lat ?? self.lat,
//            long: long ?? self.long,
//            abbr: abbr ?? self.abbr,
//            continent: continent ?? self.continent,
//            flag: flag ?? self.flag,
//            type: type ?? self.type
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
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

extension Array where Element == Geography.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Geography.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

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
