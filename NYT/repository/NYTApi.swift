//
//  NYTApi.swift
//  NYT
//
//  Created by Oleg Tverdyy on 10/8/21.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
}

enum NYTError: Error {
    case responseError
    case parseError
}

struct NYTApi {
    static func getArticles(type: ArticleType, days: DaysPeriod, socials: [String], completion: @escaping (Result<[Article], NYTError>) -> ()) {
        guard let url = URL(string: Constants.WS.getArticles(type: type, days: days, socials: socials)) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = RequestMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  error == nil else {
                completion(.failure(.responseError))
                return
            }
            
            do {
                guard let nytResponse = try? JSONDecoder().decode(NYTResponse.self, from: data),
                      let articles = nytResponse.results else {
                    completion(.failure(.parseError))
                    return
                }
                completion(.success(articles))
            }
        }.resume()
    }
}
