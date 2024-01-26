//
//  LootView.swift
//  Looter
//
//  Created by Avinash CLAIN on 1/26/24.
//

import SwiftUI

struct LootView: View {
    
    @ObservedObject var inventory = Inventory()
    @State var showAddItemView = false
    var isOnboardingDone: Bool = false
    @State private var selectedFeature: LooterFeature = .loot
    @Environment(\.editMode) private var editMode
 
    var body: some View {
        
        NavigationStack {
            List {
                Button(action: {
                   
                }, label: {
                    Text("Ajouter")
                })
                
                ForEach(inventory.realLoot, id: \.self) { item in
                    NavigationLink {
                        LootDetailView(item: item) // On passe directement l'item à la vue
                    } label: {
                        HStack{
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(item.rarity.color)
                            Text(item.name + "\n")
                            Text("Quantité : " + String(item.quantity))
                            Text( item.type.rawValue)
                            
                                
                        }
                        .padding()
                    }
                    
                
                }
                .onDelete(perform: delete)
            }
           
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(inventory)
                })
            .navigationBarTitle("Loot") // Notre titre de page, choisissez le titre que vous voulez
                .toolbar(content: { // La barre d'outil de notre page
                    ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                        Button(action: {
                            showAddItemView.toggle() // L'action de notre bouton
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    }
                })
         
        }
    }
    
    func delete(at offsets: IndexSet) {
        inventory.realLoot.remove(atOffsets: offsets)
      }
}


#Preview {
    LootView()
}
