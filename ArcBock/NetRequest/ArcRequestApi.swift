//
//  ArcRequestApi.swift
//  ArcBock
//
//  Created by baiyi on 2024/12/6.
//

import Foundation
import Alamofire

class ArcRequestApi {
    static let shared = ArcRequestApi()

    func getRequestData<Value: Decodable>(
        url: String,
        type: Value.Type = Value.self,
        onSuccess: @escaping (Blogs, Bool) -> Void,
        onFailed: @escaping (NSError) -> Void
    ) {
        AF.request(url)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: type) { response in
//                debugPrint(response)
                switch response.result
                {
                case .success(let data):
                    onSuccess(data as! Blogs, true)
                case .failure(let error):
                    onFailed(error as NSError)
                }
            }
    }
}
