
import Foundation

struct NewsAPI {
    
    
    static let shared = NewsAPI()
    private init() {}
    
    private let apiKey = "f58de38396244a6eb63b9890a6903170"
    private let session = URLSession.shared
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func fetch(from category: Category) async throws -> [Article] {
        try await fecthArticles(from: generateNewsURL(from: category))
    }
 
    func search(for query: String) async throws -> [Article] {
        try await fecthArticles(from: generateSearchURL(from: query))
    }
    
    private func fecthArticles(from url: URL) async throws -> [Article] {
        let (data, response) = try await session.data(from: url)
        
        
        guard let response = response as? HTTPURLResponse else {
            throw generateError(description: "Bad Response")
        }
        
        switch response.statusCode {
        case (200...299), (400...499):
            let apiResponse = try jsonDecoder.decode(NewsAPIResponse.self, from: data)
            if apiResponse.status == "ok" {
                return apiResponse.articles ?? []
            } else {
                throw generateError(description: apiResponse.message ?? "An error occured")
            }
        default:
            throw generateError(description: "A server error occured")
        }
    }
    
    private func generateError(code: Int = 1, description: String) -> Error {
        NSError(domain: "NesAPI", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }
    
    private func generateSearchURL(from query: String) -> URL {
        let precentEncodedString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        
        var url = "http://newsapi.org/v2/evegything?"
        url += "apiKey=\(apiKey)"
        url += "&language=en"
        url += "&q=\(precentEncodedString)"
        return URL(string: url)!
    }
    
    private func generateNewsURL(from category: Category) -> URL {
        var url = "http://newsapi.org/v2/top-headlines?"
        url += "apiKey=\(apiKey)"
        url += "&language=en"
        url += "&category=\(category.rawValue)"
        return URL(string: url)!
    }
    
}
