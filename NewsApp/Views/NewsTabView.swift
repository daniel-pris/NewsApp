
import SwiftUI

struct NewsTabView: View {
    
    @StateObject var articleNewsVM = ArticleNewsViewModel()
    
    var body: some View {
        NavigationView {
            ArticleListView(articles: articles)
                .overlay(overlayView)
                .task(id: articleNewsVM.fetchTaskToken, LoadTask)
                .refreshable(action: refreshTask)
                .navigationTitle(articleNewsVM.fetchTaskToken.category.text)
                .navigationBarItems(trailing: menu)
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        
        switch articleNewsVM.phase {
        case .empty: ProgressView()
        case .success(let articles) where articles.isEmpty:
            EmptyPlaceholderView(text: "No Articles", image: nil)
        case .failrule(let error): RetryView(text: error.localizedDescription, retryAction: refreshTask)
            
        default: EmptyView()
        }
    }
    
    private var articles: [Article] {
        if case let .success(articles) = articleNewsVM.phase {
            return articles
        } else {
            return []
        }
    }
    
    @Sendable
    private func LoadTask() async {
            await articleNewsVM.loadArticles()
    }
    
    @Sendable
    private func refreshTask() {
        articleNewsVM.fetchTaskToken = FetchTaskToken(category: articleNewsVM.fetchTaskToken.category, token: Date())
    }
    
    private var menu: some View {
        Menu {
            Picker("Category", selection: $articleNewsVM.fetchTaskToken.category) {
                ForEach(Category.allCases) {
                    Text($0.text).tag($0)
                }
            }
        } label: {
            Image(systemName: "fiberchannel")
                .imageScale(.large)
        }
    }
}


struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView(articleNewsVM: ArticleNewsViewModel(articles: Article.previewData))
    }
}
