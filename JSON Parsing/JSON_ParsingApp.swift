import SwiftUI

@main
struct JSON_ParsingApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environmentObject(RecipeModel())
        }
    }
}
