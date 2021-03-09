//  Created by Yuliani Noriega on 8/14/20.
//

import Foundation
import Combine

final class Network: ObservableObject {
    private var cancellables: AnyCancellable?
    @Published private(set) var articles = [ArticleModel]()
    @Published private(set) var state: LoadingState = .idle
    
    init(articles: [ArticleModel]? = nil, state: LoadingState? = nil) {
        //for testing purposes & getting SwiftUI previews working
        if let tmpArticles = articles, let tmpState = state {
            self.articles = tmpArticles
            self.state = tmpState
        }
    }
    
    func getAllArticles() {
        state = .loading
        
        guard let url = URL(string: nytURL) else {
            self.state = .failed(ServiceError.invalidURL)
            return
        }
        
        cancellables = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else { throw ServiceError.unknown }
                
                if 200..<300 ~= httpResponse.statusCode {
                    return data
                } else {
                    throw ServiceError.network(code: httpResponse.statusCode)
                }
            }
            .decode(type: [ArticleModel].self, decoder: JSONDecoder())
            .mapError { error -> ServiceError in
                switch error {
                case is DecodingError:
                    return .parsing
                default:
                    return error as? ServiceError ?? .unknown
                }
            }
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.state = .failed(error)
                case .finished:
                    self.state = .loaded
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else { return }
                var tmpArticles = [ArticleModel]()
                for article in response {
                    let tmpArticle = ArticleModel(id: UUID(),
                                        title: article.title,
                                        body: article.body,
                                        imageURL: self.imageURL(for: article),
                                        images: article.images)
                    tmpArticles.append(tmpArticle)
                }
                
                self.articles = tmpArticles
            })
    }
    
    // find correct image
    func imageURL(for article: ArticleModel) -> String {
        var imageURL = ""
        for image in article.images {
            if image.topImage {
                imageURL = image.url
            }
        }
        return imageURL
    }
    
    func cancel() {
        cancellables?.cancel()
    }
}
