//
//  Singer.swift
//  MyFavoriteSinger
//
//  Created by dimitri on 07/03/2024.
//

import Foundation
import SwiftData

@Model
class Singer{
    var name : String
    var famousSong: String
    
    init(name: String, famousSong: String) {
        self.name = name
        self.famousSong = famousSong
    }
    
    func update(name: String, famousSong: String, context: ModelContext) {
        self.name = name
        self.famousSong = famousSong
        do {
            try context.save()
        } catch {
            print("La modification a échoué : \(error)")
        }
    }
}
