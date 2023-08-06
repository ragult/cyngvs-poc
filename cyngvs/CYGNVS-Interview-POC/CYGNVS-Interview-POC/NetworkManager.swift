//
//  NetworkManager.swift
//  CYGNVS-Interview-POC
//
//  Created by Ragul kts on 06/08/23.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    enum NetworkError: Error {
        case invalidURL
    }
}
