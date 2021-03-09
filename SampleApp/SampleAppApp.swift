//  Created by yulz on 3/9/21.
//

import SwiftUI

@main
struct SampleAppApp: App {
    @StateObject var network = Network()
    
    var body: some Scene {
        WindowGroup {
            ArticleList()
                .environmentObject(network)
                .onAppear {
                    self.network.getAllArticles()
                }
        }
    }
}
