//
//  RentalsViewModel.swift
//  OutdoorsySearch
//
//  Created by Nikolay Raychev on 17/09/2023.
//
import SwiftUI

class RentalsViewModel: ObservableObject {
    @Published var rentals: [Rental] = []
    @Published var images: [String: URL] = [:]

    func searchRentals(with keyword: String, limit: Int = 8, offset: Int = 8) {
        guard var urlComponents = URLComponents(string: "https://search.outdoorsy.co/rentals") else {
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "filter[keywords]", value: keyword),
            URLQueryItem(name: "page[limit]", value: "\(limit)"),
            URLQueryItem(name: "page[offset]", value: "\(offset)")
        ]

        guard let url = urlComponents.url else {
            return
        }
        print(url)
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                print(String(data: data, encoding: .utf8) ?? "Invalid Data")
                do {
                    let response = try JSONDecoder().decode(RentalResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.rentals = response.data
                        if let included = response.included {
                            self.images = Dictionary(uniqueKeysWithValues: included.map { ($0.id, $0.attributes.url) })
                        }
                    }
                } catch {
                    print("Failed to decode: \(error)")
                }
            } else if let error = error {
                print("Failed to fetch rentals: \(error)")
            }
        }
        
        task.resume()
    }
}
