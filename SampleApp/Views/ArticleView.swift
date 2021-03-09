//  Created by Yuliani Noriega on 8/14/20.
//

import SwiftUI

struct ArticleView: View {
    var article: ArticleModel!
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing:16) {
                if let imgURL = self.article.imageURL {
                    ImageWithURL(imgURL)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8.0)
                        .shadow(radius: 8)
                }
                Text(article.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Divider()
                Text(article.body)
                    .font(.body)
                    .fontWeight(.light)
            }
            .padding([.leading, .trailing, .bottom], 16)
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ArticleView(article: testArticle3)
            }
            .preferredColorScheme(.light)
            .environment(\.sizeCategory, .accessibilityMedium)
            .previewDevice("iPhone SE (2nd generation)")
            
            NavigationView {
                ArticleView(article: testArticle2)
            }
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .extraLarge)
            .previewDevice("iPhone 11 Pro Max")
        }
    }
}
