//
//  Utils.swift
//  NYT
//
//  Created by Oleg Tverdyy on 10/8/21.
//

import Foundation

public enum ArticleType: Int {
    case mostEmailed = 0
    case mostShared
    case mostViewed
    
    func stringValue() -> String {
        switch self {
        case .mostEmailed: return "mostemailed"
        case .mostShared: return "mostshared"
        case .mostViewed: return "mostviewed"
        }
    }
}

public enum DaysPeriod: Int {
    case one = 0
    case seven
    case thirty
    
    func stringValue() -> String {
        switch self {
        case .one: return "1"
        case .seven: return "7"
        case .thirty: return "30"
        }
    }
}

public enum SocialNetworks: String, CaseIterable {
    case facebook = "facebook"
    case twitter = "twitter"
}
