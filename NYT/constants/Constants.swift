//
//  Constants.swift
//  NYT
//
//  Created by Oleg Tverdyy on 10/8/21.
//

import Foundation

public struct Constants {
    
    private init() {}
    
    static let base_url = "https://api.nytimes.com/svc/mostpopular/v2/"
    
    static let api_key = "2bB0BGGe2pysadVQorASzqyClBzI5w1G"
    
    struct WS {
        private init() {}
        
        static func getArticles(type: ArticleType, days: DaysPeriod, socials: [SocialNetworks]) -> String {
            return "\(Constants.base_url)\(type.stringValue())/all-sections\(socials.count != 0 ? "/\(socials.map { $0.rawValue }.joined(separator: ";"))" : "")/\(days.stringValue()).json?api-key=\(Constants.api_key)"
        }
    }
}
