//
//  OnboardingPageView.swift
//  Looter
//
//  Created by Avinash CLAIN on 1/26/24.
//

import SwiftUI
struct OnboardingPageView: View {
    @Binding var currentPage:Int
    let index: Int
    var title: String = "titre"
    var description: String = "desciption"
    var image: String
    var color: Color

    
    var body: some View {
      
        VStack(alignment: .center) {
        
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding()
            ZStack{
                
                Circle()
                    .frame(width: 170,height: 170)
                    .foregroundColor(color)
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding()
                    .foregroundColor(Color.white)
         
            }
           
            Text(description)
                .multilineTextAlignment(.center)
                .padding()
           if(title == "En un coup d'oeil")
            {
               Button("Commencer") {
                                 withAnimation {
                                     UserDefaults.standard.set(false, forKey: "isOnboardingViewPresented")
                                 }
                   if index < 3 {
                       currentPage += 1
                   }
                   LooterApp().isOnboardingDone = true
                   UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: ContentView())
                             }
                             .buttonStyle(.borderedProminent)
                             .padding()
        
           }else
            {
               Button("Suivant") {
                                 // Fermer l'onboarding
                                 withAnimation {
                                     UserDefaults.standard.set(false, forKey: "isOnboardingViewPresented")
                                 }
                   if index < 3 {
                       currentPage += 1
                   }
                 
                  
                
                             }
                             .buttonStyle(.borderedProminent)
                             .padding()
        
           }
            
        }
    }
}

