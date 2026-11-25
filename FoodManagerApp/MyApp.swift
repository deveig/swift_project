import SwiftData
import SwiftUI

@main
struct FoodManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: Food.self, inMemory: true)
        }
    }
}
