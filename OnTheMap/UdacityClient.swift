//
//  OnTheMapClient.swift
//  OnTheMap
//
//  Created by Angel Caro on 5/3/16.
//  Copyright © 2016 AngelCaro. All rights reserved.
//

import Foundation

class UdacityClient: NSObject {
    
    var session = NSURLSession.sharedSession()
    typealias UdacityCompletionHandler = (data: [String: AnyObject]?, errorString: NSError) -> Void
    
    func login(email: String, password: String, completionHandler: UdacityCompletionHandler) {
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://www.udacity.com/api/session")!)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = "{\"udacity\": {\"username\": \"\(email)\", \"password\": \"\(password)\"}}".dataUsingEncoding(NSUTF8StringEncoding)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { data, response, error in
            
            guard (error == nil) else {
                completionHandler(data: nil, errorString: error!)
                print(error)
                return
            }
            
            guard let data = data else {
                completionHandler(data: nil, errorString: error!)
                print(error)
                return
            }
            
            print("ok")
            
           /* if let data = data {
                let newData = data.subdataWithRange(NSMakeRange(5, data.length - 5))
                print("success")
            } else {
                completionHandler(data: nil, errorString: error!)
            }*/
    }
    task.resume()
    }
}