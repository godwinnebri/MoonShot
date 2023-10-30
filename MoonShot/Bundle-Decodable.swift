//
//  Bundle-Decodable.swift
//  MoonShot
//
//  Created by Godwin IE on 26/10/2023.
//

import Foundation

extension Bundle {
    /// `T` Denotes a generic type
    /// Using `<T:Codable>`means we are letting swift determine the...
    /// ...type that will be returned and constrain it to the codable protocol
    /// the returned type was formerly `[String: Astronaut]`
    
    func decode<T: Codable> (_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}
