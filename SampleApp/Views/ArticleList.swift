//  Created by Yuliani Noriega on 8/14/20.
//

import SwiftUI

struct ArticleList: View {
    @EnvironmentObject var network: Network
    
    var body: some View {
        NavigationView {
            VStack {
                switch network.state {
                case .idle:
                    Color.clear
                case .loading:
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                case .loaded:
                    articleList
                case .failed(let error):
                    Text("Error \(error.descriptionLocalized)")
                }
            }
            .navigationBarTitle("SwiftUI Demo")
        }
    }
    
    // if there is an issue with the network and data isn't loaded, show a refresh button
    var refreshButton: some View {
        Button(action: {
            self.network.getAllArticles()
          }) {
            if network.articles.count == 0 {
                Text("refresh")
            }
          }
    }
    
    var articleList: some View {
        List(network.articles) { article in
            ArticleCell(article:article)
        }
    }
}

struct ArticleList_Previews: PreviewProvider {
    static var previews: some View {
        let networkLoaded = Network(articles: testArray, state: .loaded)
        let networkLoading = Network(articles: [], state: .loading)
        let networkError = Network(articles: [], state: .failed(ServiceError.parsing))
        
        Group {
            // Light Mode
            ArticleList()
                .environmentObject(networkLoaded)
                .previewDevice("iPhone SE (2nd generation)")
            // Dark Mode
            ArticleList()
                .environmentObject(networkLoading)
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                .previewDevice("iPhone 11 Pro Max")
            ArticleList()
                .environmentObject(networkError)
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
