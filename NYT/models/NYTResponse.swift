// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let nYTResponse = try? newJSONDecoder().decode(NYTResponse.self, from: jsonData)

import Foundation

// MARK: - NYTResponse
struct NYTResponse: Codable {
    let results: [Article]?

    enum CodingKeys: String, CodingKey {
        case results
    }
}
