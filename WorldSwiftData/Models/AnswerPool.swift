//
//  AnswerPool.swift
//  WorldTrivia
//
//  Created by Michael Campbell on 7/24/23.
//

import Foundation

struct AnswerElement: Codable, Hashable {
    let name: String
    let capital: String
    let isCorrect: Bool
    
    init(name: String = "", capital: String = "", isCorrect: Bool = false) {
        self.name = name
        self.capital = capital
        self.isCorrect = isCorrect
    }
}
