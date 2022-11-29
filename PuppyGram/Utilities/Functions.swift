//
//  Functions.swift
//  PuppyGram
//
//  Created by Joseph Szafarowicz on 11/9/22.
//

import Foundation

func fetchPhotos(completion: @escaping (PhotoModel)-> ()) {
    var request = URLRequest(url: URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?tags=puppy&format=json&nojsoncallback=1")!)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    URLSession.shared.dataTask(with: request) {data, response, error in
        if let data = data {
            do {
                let json: PhotoModel = try JSONDecoder().decode(PhotoModel.self, from: data)
                completion(json)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }.resume()
}
