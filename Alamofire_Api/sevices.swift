//
//  sevices.swift
//  Alamofire_Api
//
//  Created by MAC on 12/12/20.
//

import Foundation
import Alamofire

class services {
    //https://restcountries.eu/rest/v2
    fileprivate var baseurl = ""
    typealias countriesCallBack = (_ countries:[Country]?, _ status: Bool, _ message:String) -> Void
      var callBack:countriesCallBack?
    init(basUrl:String) {
        self.baseurl = basUrl
    }
    
    
    //MARK - GetAllCountryNameFrom
    func GetAllCountryNameFrom(endpoint: String) {
        AF.request(self.baseurl + endpoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data =  responseData.data else {
                self.callBack?(nil, false, "")
                return}
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                print("countries ==>\(countries)")
                self.callBack?(countries, true,"")
            }catch{
                self.callBack?(nil, false , error.localizedDescription)
            }
        }
      
    }
    func complitionHandler(callBack: @escaping countriesCallBack){
        self.callBack = callBack
    }
   
}
