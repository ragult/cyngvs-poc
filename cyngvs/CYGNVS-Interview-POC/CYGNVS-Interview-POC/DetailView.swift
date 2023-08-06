//
//  DetailView.swift
//  CYGNVS-Interview-POC
//
//  Created by Ragul kts on 06/08/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: PhotoViewModel
    let photo: Photo
    @State private var editedTitle: String
    @Environment(\.dismiss) var goBack
    
    init(photo: Photo, viewModel: PhotoViewModel) {
        self.photo = photo
        self.viewModel = viewModel
        _editedTitle = State(initialValue: photo.title)
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("Album Id : \(photo.albumID)")
            AsyncImage(url: URL(string: photo.url))
                .frame(maxWidth: 300, maxHeight: 300)
                .clipped()
            Spacer()
            Text("Edit Title")
            TextField("Edit Title", text: $editedTitle)
                .padding()
            
            Button("Save") {
                viewModel.updateTitle(for: photo, with: editedTitle)
                goBack()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            Spacer()
        }
        .padding()
        .navigationBarTitle(photo.title)
    }
}
