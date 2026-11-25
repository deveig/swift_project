import SwiftData
import SwiftUI

struct FormView : View {
    @Environment(\.modelContext) private var context
    //let context = container.mainContext
    @State private var name: String = ""
    @State private var icon: String = ""
    @State private var quantity: Int = 1
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
                        text: $name
                    )
                    TextField(
                        "Emoji",
                        text: $icon
                    )
                    Stepper(
                        value: $quantity,
                        in: range,
                        step: step
                    ) {
                        Text("Quantité")
                        Text("\(quantity)")
                    }
                    Picker(
                        "Température de conservation", selection: $storageTemperature) {
                            Text("-20.0").tag(-20.0)
                            Text("4.0").tag(4.0)
                            Text("23.0").tag(23.0)
                        }
                    DatePicker(
                        "Date de péremption",
                        selection: $expiryDate,
                        displayedComponents: [.date]
                    )
                    TextField(
                        "Type de plat",
                        text: $dishType
                    )
                    Button("Add Food") {
                        context.insert(Food(name: name, icon: icon, quantity: quantity, expiryDate: expiryDate, storageTemperature: storageTemperature, dishType: dishType))
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
