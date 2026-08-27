//
//  File.swift
//  Morning_Coffee
//
//  Created by Raja Abhishek Lagadapati on 8/27/26.
//

import Foundation

@Observable
class CoffeeManager {
    var coffee: CoffeeImage?
    
    func getCoffee() async throws {
        let url = URL(string: "https://coffee.alexflipnote.dev/random.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        // using _ here instead of URLResponse for any status codes since we aren't expecting them here for a proj like this.
        let decoder = JSONDecoder()
        let coffeePicture = try decoder.decode(CoffeeImage.self, from: data)
        self.coffee = coffeePicture
        }
    }

struct CoffeeImage : Codable {
    let file: URL
}


