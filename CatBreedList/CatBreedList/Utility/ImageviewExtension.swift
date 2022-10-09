//
//  ImageviewExtension.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 08/10/22.
//

import Foundation
import UIKit


extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}

extension UIImageView {
//    func load(url: String, placeholder: UIImage?, cache: URLCache? = nil) {
//        let cache = cache ?? URLCache.shared
//        if let url = URL(string: url) {
//            let request = URLRequest(url: url)
//            if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
//                DispatchQueue.main.async {
//                    self.image = image
//                }
//            } else {
//                self.image = placeholder
//                URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
//                    if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
//                        let cachedData = CachedURLResponse(response: response, data: data)
//                        cache.storeCachedResponse(cachedData, for: request)
//                        DispatchQueue.main.async {
//                            self.image = image
//                        }
//                    }
//                }).resume()
//            }
//        }
//    }
    
    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
