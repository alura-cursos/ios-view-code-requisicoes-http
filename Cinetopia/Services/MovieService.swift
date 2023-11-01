//
//  MovieService.swift
//  Cinetopia
//
//  Created by Giovanna Moeller on 01/11/23.
//

import Foundation

struct MovieService {
    func getMovies() -> [Movie]? {
        
        var movies: [Movie] = []
        
        let urlString = "http://localhost:3000/movies"
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return
            }
            
            do {
                movies = try JSONDecoder().decode([Movie].self, from: data)
                //print(movies)
            } catch (let error) {
                print(error)
            }
        }
        
        task.resume()
        
        return movies
    }
}
