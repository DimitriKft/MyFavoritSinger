//
//  NewSingerView.swift
//  MyFavoriteSinger
//
//  Created by dimitri on 07/03/2024.
//

import SwiftUI
import SwiftData

struct NewSingerView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    @State private var nameSinger = ""
    @State private var famousSong = ""
    
    var body: some View {
           Form {
               TextField("Nom de l'artiste ", text: $nameSinger)
               TextField("Votre son favori", text: $famousSong)
               
               Button("Ajouter") {
                   let newSinger = Singer(name: nameSinger,famousSong: famousSong)
                       context.insert(newSinger)
                       dismiss()
                   }
               }
               .tint(.yellow)
               .fontWeight(.bold)
               
           }
   }
#Preview {
    NewSingerView()
}
