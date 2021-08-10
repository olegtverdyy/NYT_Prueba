// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let result = try? newJSONDecoder().decode(Result.self, from: jsonData)

import Foundation

// MARK: - Result
struct Article: Codable {
    let uri: String?
    let url: String?
    let author: String?
    let id: Int?
    let publishedDate, section: String?
    let title: String?
    let media: [Media]?

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case author = "byline"
        case publishedDate = "published_date"
        case section
        case title
        case media
    }
}
