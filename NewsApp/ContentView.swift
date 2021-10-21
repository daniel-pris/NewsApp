//
//  NewsApp
//
//  Created by DaninMac on 14.10.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ArticleListView(articles: Article.previewData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
