//
//  ModelData.swift
//  Love&War
//
//  Created by mac on 09/08/2023.
//

import Foundation
import CoreLocation

var characters = decodeJsonFromJsonFile(jsonFileName: "characters.json")


func decodeJsonFromJsonFile(jsonFileName: String) -> [Character] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Character].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [Character]
}

