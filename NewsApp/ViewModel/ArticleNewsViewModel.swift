
import SwiftUI

enum DataFetchPhase<T> {
    
    case empty
    case success(T)
    case failrule(Error)
    
}

struct FetchTaskToken: Equatable {
    var category: Category
    var token: Date
}

@MainActor
class ArticleNewsViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<[Article]>.empty
    @Published var fetchTaskToken: FetchTaskToken
    private let newsAPI = NewsAPI.shared
    
    
    init(articles: [Article]? = nil, selectedCategory: Category = .general) {
        if let articles = articles {
            self.phase = .success(articles)
        } else {
            self.phase = .empty
        }
        self.fetchTaskToken = FetchTaskToken(category: selectedCategory, token: Date())
    }
    
    
    func loadArticles() async {
        
        if Task.isCancelled { return }
        phase = .success(Article.previewData)
//        phase = .empty
//        do {
//            let articles = try await newsAPI.fetch(from: fetchTaskToken.category)
//            if Task.isCancelled { return }
//            phase = .success(articles)
//        } catch {
//            if Task.isCancelled { return }
//            phase = .failrule(error)
//        }
        
    }
    
}
