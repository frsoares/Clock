//
//  ServiceProvider.swift
//  ClockTopShelf
//
//  Created by Francisco Soares on 15/08/18.
//  Copyright © 2018 Francisco Soares. All rights reserved.
//

import Foundation
import TVServices

class ServiceProvider: NSObject, TVTopShelfProvider {

    override init() {
        super.init()
    }

    // MARK: - TVTopShelfProvider protocol

    var topShelfStyle: TVTopShelfContentStyle {
        // Return desired Top Shelf style.
        return .sectioned
    }

    var topShelfItems: [TVContentItem] {
        // Create an array of TVContentItems.
        
        let wrapperID = TVContentIdentifier(identifier: "wrapper", container: nil)
        let wrapperItem = TVContentItem(contentIdentifier: wrapperID!)
        
        
        
        
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "HH'h'mm"
        let stringDate = df.string(from: date)
        let tvcItem = TVContentItem(contentIdentifier: TVContentIdentifier(identifier: "Teste", container: wrapperID)!)
        tvcItem?.title = stringDate
        tvcItem?.imageShape = .square
        tvcItem?.setImageURL(nil, forTraits: .screenScale1x)
        
        wrapperItem?.title = stringDate//"Wrapper Item"
        wrapperItem?.topShelfItems = [tvcItem!]
        
        
        return [wrapperItem!]
    }

}

