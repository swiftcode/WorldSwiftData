//
//  DatabaseService.swift
//  WorldSwiftData
//
//  Created by Michael Campbell on 10/30/23.
//

import Foundation
import SwiftData

class DatabaseService {
    static var shared = DatabaseService()
    
    var container: ModelContainer?
    var context: ModelContext?
    
    init() {
        do {
            let schema = Schema([GeographyElement.self])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
            container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            if let container {
                context = ModelContext(container)
            }
        }
        catch {
            print("Error creating service: \(error)")
        }
    }
}
