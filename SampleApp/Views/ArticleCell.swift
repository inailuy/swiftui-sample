//  Created by Yuliani Noriega on 8/16/20.
//

import SwiftUI

struct ArticleCell: View {
    var article: ArticleModel!

    var body: some View {
        NavigationLink(destination: ArticleView(article: article)) {
            HStack {
                if let imgURL = self.article.imageURL {
                    ImageWithURL(imgURL)
                        .frame(width: 75, height: 75, alignment: .center)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                Text(article.title)
                    //.font(.headline)
            }
        }
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Light Mode & Martian On
            ArticleCell(article: testArticle1)
            .padding()
                .previewLayout(.sizeThatFits)            
            // Dark Mode & Martian Off
            ArticleCell(article: testArticle2)
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        }
    }
}

