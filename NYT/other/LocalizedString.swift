//
//  LocalizedString.swift
//  NYT
//
//  Created by Oleg Tverdyy on 11/8/21.
//

import Foundation

struct LS {
    private init() { }
    static func string(_ key: LocalizedKey) -> String {
        return NSLocalizedString(key.rawValue, comment: "")
    }
    
    struct LocalizedKey: RawRepresentable {
        public let rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        
        static let title_info = LocalizedKey(rawValue: "title_info")
        static let description_empty = LocalizedKey(rawValue: "description_empty")
        static let accept_button = LocalizedKey(rawValue: "accept_button")
        static let title_article_search = LocalizedKey(rawValue: "title_article_search")
        static let title_results = LocalizedKey(rawValue: "title_results")
        static let title_error = LocalizedKey(rawValue: "title_error")
        static let description_error_loading = LocalizedKey(rawValue: "description_error_loading")
    }
}
