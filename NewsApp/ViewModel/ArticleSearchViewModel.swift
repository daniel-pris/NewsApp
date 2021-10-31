
import SwiftUI

@MainActor
class ArticleSearchViewModel: ObservableObject {
    
    @Published var phase: DataFetchPhase<[Article]> = .empty
    @Published var searchQuery = ""
    @Published var history = [String]()
    
    private let historyDataStore = PlsitDataStore<[String]>(filename: "histories")
    
    private let historyMaxLimits = 10
    
    private let newsAPI = NewsAPI.shared
    
    static let shared = ArticleSearchViewModel()
    
    private init() {
        load()
    }
    
    func addHistory(_ text: String) {
        if let index = history.firstIndex(where: { text.lowercased() == $0.lowercased() }) {
            history.remove(at: index)
        } else if history.count == historyMaxLimits {
            history.remove(at: 0)
        }
        
        history.insert(text, at: 0)
        historiesUpdated()
    }
    
    func removeHistory(_ text: String) {
        guard let index = history.firstIndex(where: { text.lowercased() == $0.lowercased() })
        else { return }
        history.remove(at: index)
        historiesUpdated()
    }
    
    func removeAllHistory() {
        history.removeAll()
        historiesUpdated()
    }
    
    func searchArticle() async {
        if Task.isCancelled { return }
        
        let searchQuary = self.searchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        phase = .empty
        
        if searchQuary.isEmpty {
            return
        }
        
        do {
            let articles = try await newsAPI.search(for: searchQuery)
            if Task.isCancelled { return }
            if searchQuary != self.searchQuery {
                return
            }
            phase = .success(articles)
            
        } catch {
            if Task.isCancelled { return }
            if searchQuary != self.searchQuery {
                return
            }
            phase = .failrule(error)
        }
    }
    
    private func load() {
        Task {
            self.history = await historyDataStore.load() ?? []
        }
    }
 
    private func historiesUpdated() {
        let history = self.history
        Task {
            await historyDataStore.save(history)
        }
        
    }
    
}
