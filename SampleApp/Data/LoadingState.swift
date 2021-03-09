//  Created by Yuliani Noriega on 1/31/21.
//

import Foundation

enum LoadingState: Equatable {
    case idle
    case loading
    case loaded
    case failed(ServiceError)
    
    static func ==(lhs: LoadingState, rhs: LoadingState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle): return true
        case (.loading, .loading): return true
        case (.loaded, .loaded): return true
        case (.failed, .failed): return true
        default: return false
        }
    }
}
