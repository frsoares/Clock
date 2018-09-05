//
//  ServiceProvider.swift
//  ClockTopShelf
//
//  Created by Francisco Soares on 15/08/18.
//  Copyright © 2018 Francisco Soares. All rights reserved.
//

import UIKit
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
        
        // creating the item's image
        let view = makeView(from: stringDate)
        let image = loadImageFrom(view: view)
        let imageUrl = save(image: image)
        
        tvcItem?.setImageURL(imageUrl, forTraits: .screenScale1x)
        
        wrapperItem?.title = stringDate//"Wrapper Item"
        wrapperItem?.topShelfItems = [tvcItem!]
        
        return [wrapperItem!]
    }

}

func loadImageFrom(view: UIView) -> UIImage {
    let size = view.bounds.size
    UIGraphicsBeginImageContext(size)
    let ctx = UIGraphicsGetCurrentContext()!
    view.layer.render(in: ctx)
    let img = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return img
}

func save(image: UIImage) -> URL? {
    
    let url = URL(fileURLWithPath: NSTemporaryDirectory())
        .appendingPathComponent(UUID().uuidString)
        .appendingPathExtension("png")
    
    if let data = UIImagePNGRepresentation(image) {
        try? data.write(to: url)
    }
    
    return url
}

func makeView(from string: String) -> UIView {
    let view = UIView(frame: CGRect(x:0, y: 0, width: 608, height: 608))
    view.backgroundColor = .white
    
    let lb = UILabel(frame: CGRect(x: 18, y: 304-200, width: 590, height: 400))
    
    lb.font = UIFont.boldSystemFont(ofSize: 150)
    lb.text = string
    lb.textColor = .black
    lb.backgroundColor = .clear
    
    view.addSubview(lb)
    return view
}




