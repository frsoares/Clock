//
//  ContentView.swift
//  Clock
//
//  Created by Francisco Soares on 06/06/19.
//  Copyright © 2019 Francisco Soares. All rights reserved.
//
#if !targetEnvironment(macCatalyst)
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var clock: Clock
    
    var body: some View {
        Text(clock.time)
        .bold()
            .font(.largeTitle)
    }
}


struct ContentView_Preview : PreviewProvider {
    
    static var previews: some View {
        
        let timer = Clock()
        timer.start()
        return Group {
            #if os(tvOS)
            ContentView(clock: timer)
            #elseif os(iOS)
            ContentView(clock: timer)
                .environment(\.sizeCategory, .extraSmall)

            ContentView(clock:timer)
            
            ContentView(clock: timer)
                .environment(\.sizeCategory, .accessibilityExtraExtraLarge)

            #else
            ContentView(clock: timer)
            #endif
        }
    }
    
}


#endif
