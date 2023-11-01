//
//  MovieService.swift
//  Cinetopia
//
//  Created by Giovanna Moeller on 01/11/23.
//

import Foundation

struct MovieService {
    func getMovies() {
        let urlString = "http://localhost:3000/movies"
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            print(data)
            print(response)
            print(error)
        }
        
        task.resume()
    }
}
