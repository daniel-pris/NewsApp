
import SwiftUI

@main
struct NewsAppApp: App {
    
    @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(articleBookmarkVM)
            
        }
    }
}
