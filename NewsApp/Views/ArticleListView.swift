
import SwiftUI

struct ArticleListView: View {
    
    let articles: [Article]
    
    var body: some View {
        List {
            ForEach(articles) { article in
                ArticleRowView(article: article)
            }
            .listRowInsets(.init(.init(top: 0, leading: 0, bottom: 0, trailing: 0)))
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(articles: Article.previewData)
    }
}