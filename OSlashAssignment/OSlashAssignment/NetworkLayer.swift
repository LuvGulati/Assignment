//
//  NetworKLayer.swift
//  OSlashAssignment
//
//  Created by Luv on 31/10/22.
//

import Foundation
import UIKit

class NetworkLayer: NSObject{
    
    
    static  let shared = NetworkLayer()
    
    let cache = NSCache<NSString , UIImage>()
    
    override private init() {
        
    }
    
    var urlSession = URLSession.shared
    
    func downLoadImageFromURL(index : Int ,completion: @escaping (UIImage?) -> Void){
        
        if let image = cache.object(forKey: NSString(string: "\(index)")){
            completion(image)
            return
        }else{
            let url = URL(string: "https://source.unsplash.com/random")!
            
            let urlRequest = URLRequest(url: url)
            
            urlSession.dataTask(with: urlRequest) { data, response, error in
                if error == nil{
                    if let imageData = data as? Data{
                        if let image = UIImage(data: imageData) as? UIImage{
                            if self.cache.object(forKey: NSString(string: "\(index)")) == nil{
                                self.cache.setObject(image, forKey: NSString(string: "\(index)"))
                                completion(image)
                            }
                        }
                    }
                }
            }.resume()
        }
    }

}
