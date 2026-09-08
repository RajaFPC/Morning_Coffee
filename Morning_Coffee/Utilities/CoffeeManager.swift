//
//  CoffeeManager.swift
//  Morning_Coffee
//
//  Created by Raja Abhishek Lagadapati on 8/27/26.
//

import Foundation

@Observable
class CoffeeManager {
    var coffee: [CoffeeImage] = []
    
    func getCoffee() async throws {
        print("Call Initiated")
        let url = URL(string: "https://coffee.alexflipnote.dev/random.json")!
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            // using _ here instead of URLResponse for any status codes since we aren't expecting them here for a proj like this.
            let decoder = JSONDecoder()
            let coffeePicture = try decoder.decode(CoffeeImage.self, from: data)
            coffee.insert(coffeePicture, at : 0)
        } catch {
            print("Failure caused by: \(error)")
            throw error
        }
        print("Successfully fetched coffee")
        }
    }

struct CoffeeImage: Codable, Identifiable {
    let id = UUID()
    let file: URL
    
    enum CodingKeys: String, CodingKey {
        case file  // only "file" is expected from JSON — id is deliberately left out
    }
}

