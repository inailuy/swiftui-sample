//  Created by Yuliani Noriega on 8/14/20.
//

import Foundation

// MARK: - ArticleModel
struct ArticleModel: Codable, Identifiable {
    let id: UUID?
    let title: String
    let body: String
    let imageURL: String?
    let images: [NetworkImage]
}

// MARK: - NetworkImage
struct NetworkImage: Codable {
    let topImage: Bool
    let url: String
    enum CodingKeys: String, CodingKey {
        case topImage = "top_image"
        case url
    }
}
