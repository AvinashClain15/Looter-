//
//  LooterApp.swift
//  Looter
//
//  Created by Avinash CLAIN on 1/19/24.
//

import SwiftUI

@main
struct LooterApp: App {
    

    @AppStorage("isOnboardingView") var isOnboardingDone: Bool = false
    var body: some Scene {
        
        WindowGroup {
            if isOnboardingDone {
                ContentView()
                        } else {
                            OnboardingView()
                        }
          
        }
    }
}
