//
//  OnboardingView.swift
//  Looter
//
//  Created by Avinash CLAIN on 1/26/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage: Int = 0
    var body: some View {
        TabView(selection: $currentPage) {
            OnboardingPageView(currentPage:$currentPage,index:1,title: "Gérer ses loots", description: "Ajouter facilement vos trouvailles et vos achats à votre collection personnelle",image:"gym.bag.fill",color: Color.blue ).tag(1)
            OnboardingPageView(currentPage:$currentPage,index:2,title: "Votre wishlist", description: "Créer une liste de souhait pour garder une trace des articles que vous souhaitez aquérir",image: "wand.and.stars",color: Color.purple ).tag(2)
            OnboardingPageView(currentPage:$currentPage,index:3,title: "En un coup d'oeil", description: "Accéder rapidement à vos fonctionnalité clés depuis l'écran d'acceuil de votre appareil",image: "iphone.rear.camera",color: Color.yellow ).tag(3)
           
        }
        .tabViewStyle(.page)
        
        
    }
}

#Preview {
    OnboardingView()
}
