//
//  PhotoViewModel.swift
//  CYGNVS-Interview-POC
//
//  Created by Ragul kts on 06/08/23.
//

import Foundation

@MainActor
class PhotoViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    
    func fetchPhotos() async  {
        do {
            self.photos = try await NetworkManager.shared.fetchData(from: URL(string: "https://jsonplaceholder.typicode.com/photos")!)
        } catch {
            print("Error fetching photos: \(error)")
        }
    }
    
    func updateTitle(for photo: Photo, with newTitle: String) {
        if let index = photos.firstIndex(where: { $0.id == photo.id }) {
            photos[index].title = newTitle
        }
    }
}
