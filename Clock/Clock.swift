//
//  Clock.swift
//  Clock
//
//  Created by Francisco Soares on 07/06/19.
//  Copyright © 2019 Francisco Soares. All rights reserved.
//
#if !targetEnvironment(macCatalyst)
import SwiftUI
import Combine

public class Clock: ObservableObject {
    
    @Published var time: String = "00:00:00"
    
    private lazy var df: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "HH:mm:ss"
        return df
    }()
    
    public func start() {
        self.time = df.string(from: Date())
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (_) in
            self.time = self.df.string(from: Date())
        }
    }
}
#endif
