//
//  GeocodingClient.swift
//  Wetherly
//
//  Created by Rohan Sakhare on 26/06/24.
//

import Foundation
enum NetworkError : Error {
    
    case invalidResponse
}
struct GeocodingClient {
    
    func coordinateByCity(_ city: String) async throws -> Location? {
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .coordinatesByLocationName(city)))
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        // Parse data to Location object (Assuming you have a Location struct and a method to parse it)
        let location = try JSONDecoder().decode(Location.self, from: data)
        return location
    }
}
