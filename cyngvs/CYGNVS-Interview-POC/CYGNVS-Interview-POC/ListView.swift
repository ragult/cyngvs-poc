//
//  ContentView.swift
//  CYGNVS-Interview-POC
//
//  Created by Ragul kts on 06/08/23.
//

import SwiftUI

struct ListView: View {
    @ObservedObject private var viewModel = PhotoViewModel()
    
    
    var body: some View {
        NavigationView {
            List(viewModel.photos) { photo in
                NavigationLink(destination: DetailView(photo: photo, viewModel: viewModel)) {
                    HStack {
                        AsyncImage(url: URL(string: photo.thumbnailURL))
                            .frame(maxWidth: 50, maxHeight: 50)
                            .clipped()
                        Text(photo.title)
                    }
                    
                }
            }
            .navigationBarTitle("Photos")
            .task {
                if viewModel.photos.isEmpty {
                    await viewModel.fetchPhotos()
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
