//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by DaninMac on 14.10.21.
//

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
