//
//  DetailSingerView.swift
//  MyFavoriteSinger
//
//  Created by dimitri on 07/03/2024.
//

import SwiftUI

struct DetailSingerView: View {
    var singer: Singer
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text(singer.name)
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .fontWidth(.expanded)
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
                        .fontWidth(.expanded)
                }
                NavigationLink {
                    EditSingerView(singer: singer)
                } label: {
                    Text("Modifier")
                        .font(.title3)
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                        .padding()
                        .background(.yellow)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
        
    }
}

//#Preview {
//    DetailSingerView()
//}
