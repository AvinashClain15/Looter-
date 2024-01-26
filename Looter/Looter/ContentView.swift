import SwiftUI



class Inventory: ObservableObject {
    @Published var loot = ["Epée", "Bouclier", "Armure","Baguette magique","Mandragore"]

    @Published var realLoot: [LootItem] = [
        LootItem(quantity: 1, name: "Magic Potion", type: ItemType.magic, rarity: Rarity.legendary, attackStrenght: 10, game: availableGames[0]),
        
        LootItem(quantity: 2, name: "Baguette", type: ItemType.magic, rarity: Rarity.epic, attackStrenght: 10, game: availableGames[1]),
        
        LootItem(quantity: 2, name: "Mandragore", type: ItemType.wind, rarity: Rarity.legendary, attackStrenght: 10, game: availableGames[2]),
        
        LootItem(quantity: 2, name: "Dragon lore", type: ItemType.ring, rarity: Rarity.common, attackStrenght: 10, game: availableGames[3]),
        
        LootItem(quantity: 2, name: "Lame secrète", type: ItemType.dagger, rarity: Rarity.uncommon, attackStrenght: 10, game: availableGames[4]),
    ]
    
    func addItem(item:  LootItem) {
        realLoot.append(LootItem(quantity: item.quantity, name: item.name, type: item.type, rarity: item.rarity, attackStrenght: item.attackStrenght, game: item.game))
    }

}

enum LooterFeature {
    case loot
    case wishList
    case profile
}

struct ContentView: View {
    @ObservedObject var inventory = Inventory()
    @State var showAddItemView = false
    var isOnboardingDone: Bool = false
    @State private var selectedFeature: LooterFeature = .loot

    var body: some View {
        
        TabView(selection: $selectedFeature) {
                    LootView()
                        .tabItem {
                            Label("Loot", systemImage: "bag.fill")
                        }
                        .tag(LooterFeature.loot)
                    WishListView()
                        .tabItem {
                            Label("Wishlist", systemImage: "heart.fill")
                        }
                        .tag(LooterFeature.wishList)
                    ProfileView()
                        .tabItem {
                            Label("Profil", systemImage: "person.fill")
                        }
                        .tag(LooterFeature.profile)
                }
    }
}

#Preview {
    ContentView()
    
}
