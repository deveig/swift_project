import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var allFood: [Food]
    
    var body: some View {
        NavigationStack {
                List {
                    ForEach(allFood) { food in
                        NavigationLink(destination: FoodView(food: food)){
                            VStack {
                                HStack {
                                    Text("\(food.quantity)")
                                    Text(food.name)
                                    Spacer()
                                    food.expiryDate < Date.now.addingTimeInterval(86400*3) ? Text("⚠️") : Text("✅")
                                }
                            }
                            .padding(10)
                        }
                    }
                }
                .navigationTitle("My Food !")
            NavigationLink("+") {
                FormView()
            }.font(.system(size: 34))
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Food.self, configurations: config)
    
    return ContentView()
        .modelContainer(container)
}

