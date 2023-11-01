//
//  MovieService.swift
//  Cinetopia
//
//  Created by Giovanna Moeller on 01/11/23.
//

import Foundation

enum MovieServiceError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

struct MovieService {
    func getMovies() async throws -> [Movie] {
        
        let urlString = "http://localhost:3000/movies"
        guard let url = URL(string: urlString) else {
            throw MovieServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MovieServiceError.invalidResponse
        }
        
        do {
            let movies = try JSONDecoder().decode([Movie].self, from: data)
            return movies
        } catch (let error) {
            print(error)
            throw MovieServiceError.decodingError
        }
    }
}
