//
//  EditSingerView.swift
//  MyFavoriteSinger
//
//  Created by dimitri on 08/03/2024.
//

import SwiftUI
import SwiftData

struct EditSingerView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    var singer: Singer
    
    @State private var newName: String = ""
    @State private var newFamousSong: String = ""
    
    var body: some View {
        Form {
            TextField("Nom", text: $newName)
            TextField("Chanson célèbre", text: $newFamousSong)
            Button("Sauvegarder") {
                singer.update(name: newName, famousSong: newFamousSong, context: context)
                dismiss()
            }
        }
        .onAppear {
            newName = singer.name
            newFamousSong = singer.famousSong
        }
    }
}



