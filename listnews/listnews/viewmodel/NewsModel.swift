//
//  NewsModel.swift
//  listnews
//
//  Created by Albab on 27/04/21.
//

import Foundation
import Combine
import SwiftyJSON

class NewsModel:ObservableObject{
    @Published var data  = [News]()
    
    init() {
        let url = "http://newsapi.org/v2/top-headlines?country=id&category=technology&apiKey=41202e98441d48de960d508c146b9ea7"
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) {(data,_,err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            let json = try!JSON(data:data!)
            let items  = json["articles"].array!
            
            for i in items {
                let title = i["title"].stringValue
                let description = i["description"].stringValue
                let imurl = i["urlToImage"].stringValue
                
                DispatchQueue.main.async {
                    self.data.append(News(title:title,description: description,image: imurl))
                    
                }
            }
            
        }.resume()
        
    }
}
