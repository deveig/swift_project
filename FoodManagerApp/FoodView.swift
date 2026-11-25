import SwiftData
import SwiftUI

struct FoodView : View {
    @Environment(\.modelContext) private var context
    @State var food: Food
    @State private var quantity: Int = 0
    let range = 0...100
    let step = 1
    @State private var navigateTo = false
    var body: some View {
        NavigationStack {
            Form {
                Text(food.name).fontWeight(.semibold)
                Text(food.icon)
                Text("Quantité\n"+"\(food.quantity)").fontWeight(.semibold)
                Text("Date de péremption\n"+food.expiryDate.formatted()).fontWeight(.semibold)
                Text("Conservation\n"+"\(food.storageTemperature)"+"°C").fontWeight(.semibold)
                Text("Type de préparation\n"+food.dishType).fontWeight(.semibold)
                    Button("Delete Food"){
                        context.delete(food)
                        navigateTo.toggle()
                    }.buttonStyle(.glass)
            }
            .navigationDestination(isPresented: $navigateTo){
                ContentView()
            }
            NavigationLink("Update") {
                //UpdateView(food: food)
            }
        }
    }
}
