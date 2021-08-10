// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let media = try? newJSONDecoder().decode(Media.self, from: jsonData)

import Foundation

// MARK: - Media
struct Media: Codable {
    let mediaMetadata: [MediaMetadata]?

    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}
