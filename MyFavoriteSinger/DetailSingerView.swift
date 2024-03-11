//
//  DetailSingerView.swift
//  MyFavoriteSinger
//
//  Created by dimitri on 07/03/2024.
//

import SwiftUI

import SwiftUI

struct DetailSingerView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var editSinger = false
    @State private var showingDeleteAlert = false
    var singer: Singer
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text(singer.name)
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Votre chanson préféré est :")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.footnote)
                HStack{
                    Image(systemName: "music.mic")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.yellow)
                    Text(singer.famousSong)
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Image(systemName: "minus.circle")
                    .foregroundColor(.red)
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
            }
            Button {
                editSinger = true
            }label: {
                Image(systemName: "square.and.pencil")
                    .foregroundColor(.yellow)
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
            }
        }
        .sheet(isPresented: $editSinger) {
            EditSingerView(singer: singer)
                .presentationDetents([.medium])
        }
        .alert("Supprimer le chanteur", isPresented: $showingDeleteAlert) {
            Button("Annuler", role: .cancel) { }
            Button("Supprimer", role: .destructive) {
                deleteSinger(singer: singer)
                dismiss()
            }
        } message: {
            Text("Êtes-vous sûr de vouloir supprimer \(singer.name) ? Cette action est irréversible.")
        }
    }
    
    private func deleteSinger(singer: Singer) {
        context.delete(singer)
    }
}


//#Preview {
//    DetailSingerView()
//}
