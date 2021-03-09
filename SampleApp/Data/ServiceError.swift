//  Created by Yuliani Noriega on 1/31/21.
//

import Foundation

enum ServiceError: Swift.Error {
    case invalidURL
    case network(code: Int)
    case parsing
    case unknown
    
    var descriptionLocalized: String {
        switch self {
        case .invalidURL:
            return "invalid URL"
        case .network(let code):
            if 400..<500 ~= code {
                return "client error"
            } else if 500..<600 ~= code {
                return "service error"
            }
            return "server error"
        case .parsing:
            return "parsing error"
        case .unknown:
            return "service unknown"
        }
    }
}
