
import SwiftUI

enum DataFetchPhase<T> {
    
    case empty
    case success(T)
    case failrule(Error)
    
}

@MainActor
class ArticleNewsViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<[Article]>.empty
    @Published var selectedCategory: Category
    private let newsAPI = NewsAPI.shared
    
    
    init(articles: [Article]? = nil, selectedCategory: Category = .general) {
        if let articles = articles {
            self.phase = .success(articles)
        } else {
            self.phase = .empty
        }
        self.selectedCategory = selectedCategory
    }
    
    
    func loadArticles() async {
        phase = .empty
        
        do {
            let articles = try await newsAPI.fetch(from: selectedCategory)
            phase = .success(articles)
        } catch {
            phase = .failrule(error)
        }
        
    }
    
    
}

