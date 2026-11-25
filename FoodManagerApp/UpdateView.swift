import SwiftData
import SwiftUI

struct UpdateView : View {
    @Environment(\.modelContext) private var context
    @State var food: Food
    @State private var name: String = ""
    @State private var icon: String = ""
    @State private var quantity: Int = 0
    let range = 1...100
    let step = 1
    @State private var expiryDate: Date = Date()
    @State private var storageTemperature: Double = 23.0
    @State private var dishType: String = ""
    @State private var count: Int = 0
    @State private var navigateTo = false
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Food")) {
                    TextField(
                        "Nom",
                        text: $food.name
                    )
                    TextField(
                        "Emoji",
                        text: $food.icon
                    )
                    Stepper(
                        value: $food.quantity,
                        in: range,
                        step: step
                    ) {
                        Text("Quantité")
                        Text("\(food.quantity)")
                    }
                    Picker(
                        "Température de conservation", selection: $food.storageTemperature) {
                            Text("-20.0").tag(-20.0)
                            Text("4.0").tag(4.0)
                            Text("23.0").tag(23.0)
                        }
                    DatePicker(
                        "Date de péremption",
                        selection: $food.expiryDate,
                        displayedComponents: [.date]
                    )
                    TextField(
                        "Type de plat",
                        text: $food.dishType
                    )
                    Button("Update") {
                        try? context.save()
                        navigateTo.toggle()
                    }.buttonStyle(.glass)
                }
            }
            .navigationDestination(isPresented: $navigateTo){
                ContentView()
            }
        }
    }
}
