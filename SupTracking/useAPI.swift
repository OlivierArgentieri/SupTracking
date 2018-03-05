//
//  useAPI.swift
//  SupTracking
//
//  Created by Nunutte on 03/03/2018.
//  Copyright © 2018 Nunutte. All rights reserved.
//

import Foundation

class useAPI {
    // Used to make an Asynchronous return
    typealias StringCompletion = (_ success: Bool, _ returnType: [String:Any]) -> Void
    // URL used to contact API
    static let firstUrl:String = "http://supinfo.steve-colinet.fr/suptracking/"
    
    /*
     * To check an user use the “userLogin” action
     */
    static func userLogin(login:String, password:String, completion: @escaping StringCompletion) {
        // Vars
        let requestBody = "action=login&login=\(login)&password=\(password)"
        var responseBody:[String: Any] = [:]
        let url = firstUrl
        
        // APICALL
        let initRequest = NSMutableURLRequest(url: URL(string: url)!)
        initRequest.httpMethod = "POST"
        initRequest.httpBody = requestBody.data(using: String.Encoding.utf8)
        
        let request = URLSession.shared.dataTask(with: initRequest as URLRequest) {data, response, error in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            // Check Http Status, return [success: false, httpStatus : httpStatus.statusCode]
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {
                responseBody["success"] = false
                responseBody["httpStatus"] = httpStatus.statusCode
                completion(true, responseBody)
            }
            do {
                let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
                if (json!!["success"] != nil) {
                    responseBody = json!!
                    completion(true, responseBody)
                } else {
                    completion(false, responseBody)
                }
            } catch {
                completion(false, responseBody)
            }
        }
        request.resume()
    }
    
    /*
     * To send a GPS position use the “updatePosition” action
     */
    static func updatePosition(login:String, password:String, latitude: String, longitude: String, completion: @escaping StringCompletion) {
        // Vars
        let requestBody = "action=updatePosition&login=\(login)&password=\(password)&latitude=\(latitude)&longitude=\(longitude)"
        var responseBody:[String: Any] = [:]
        let url = firstUrl
        
        // APICALL
        let initRequest = NSMutableURLRequest(url: URL(string: url)!)
        initRequest.httpMethod = "POST"
        initRequest.httpBody = requestBody.data(using: String.Encoding.utf8)
        
        let request = URLSession.shared.dataTask(with: initRequest as URLRequest) {data, response, error in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            // Check Http Status, return [success: false, httpStatus : httpStatus.statusCode]
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {
                responseBody["success"] = false
                responseBody["httpStatus"] = httpStatus.statusCode
                completion(true, responseBody)
            }
            do {
                let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
                if (json!!["success"] != nil) {
                    responseBody = json!!
                    completion(true, responseBody)
                } else {
                    completion(false, responseBody)
                }
            } catch {
                completion(false, responseBody)
            }
        }
        request.resume()
    }
    
    /*
     * To get the car's position use the “getCarPosition” action
     */
    static func getCarPosition(login:String, password:String, completion: @escaping StringCompletion){
        // Vars
        let requestBody = "action=getCarPosition&login=\(login)&password=\(password)"
        var responseBody:[String: Any] = [:]
        let url = firstUrl
        
        // APICALL
        let initRequest = NSMutableURLRequest(url: URL(string: url)!)
        initRequest.httpMethod = "POST"
        initRequest.httpBody = requestBody.data(using: String.Encoding.utf8)
        
        let request = URLSession.shared.dataTask(with: initRequest as URLRequest) {data, response, error in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            // Check Http Status, return [success: false, httpStatus : httpStatus.statusCode]
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {
                responseBody["success"] = false
                responseBody["httpStatus"] = httpStatus.statusCode
                completion(true, responseBody)
            }
            do {
                let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
                if (json!!["success"] != nil) {
                    responseBody = json!!
                    completion(true, responseBody)
                } else {
                    completion(false, responseBody)
                }
            } catch {
                completion(false, responseBody)
            }
        }
        request.resume()
    }
}
