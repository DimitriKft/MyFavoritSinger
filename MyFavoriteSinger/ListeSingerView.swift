//
//  ListeSingerView.swift
//  MyFavoriteSinger
//
//  Created by dimitri on 07/03/2024.
//

import SwiftUI
import SwiftData

struct ListeSingerView: View {
    @Query private var singers: [Singer]
    @State private var createNewSong = false
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack {
            VStack {
                if singers.isEmpty{
                    Image(systemName: "mic.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(.yellow)
                        .padding()
                    Text("Aucun artiste dans votre liste")
                        .font(.caption)
                        .fontWeight(.bold)
                        .fontWidth(.expanded)
                }else{
                    ScrollView {
                        ForEach(singers) { singer in
                            NavigationLink {
                                DetailSingerView(singer: singer)
                            } label: {
                                HStack{
                                    Image(systemName: "mic.fill")
                                        .foregroundStyle(.yellow)
                                    Text(singer.name)
                                        .foregroundStyle(.white)
                                    Spacer()
                                    Image(systemName: "arrow.right")
                                }
                                .font(.title2)
                                .fontWeight(.semibold)
                                .fontWidth(.expanded)
                                .padding()
                                
                                
                            }
                            Divider()
                                .foregroundStyle(.yellow)
                        }
                        
                    }
                }
            }
            .navigationBarTitle("Mes artistes", displayMode: .large)
            .toolbar {
                Button {
                    createNewSong = true
                }label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 30))
                }
            }
            .sheet(isPresented: $createNewSong) {
                NewSingerView()
                    .presentationDetents([.medium])
            }
        }
        .tint(.yellow)
    }
}


#Preview {
    ListeSingerView()
        .modelContainer(for: Singer.self, inMemory: true)
}
