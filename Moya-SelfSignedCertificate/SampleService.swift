//
//  SampleService.swift
//  Moya-SelfSignedCertificate
//
//  Created by mhlee on 2020/12/15.
//

import Foundation
import Moya
import Alamofire

enum SampleService {
  case someEndpoint
  
  static var provider: MoyaProvider<SampleService> {
    let session = Session(configuration: URLSessionConfiguration.default, serverTrustManager: CustomServerTrustManager())
    let provider = MoyaProvider<SampleService>(session: session)
    return provider
  }
}

extension SampleService: Moya.TargetType {
  var baseURL: URL { return URL(string: "https://your.host.com")! }
  
  var path: String {
    switch self {
    case .someEndpoint:
      return "/some/endpoint"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .someEndpoint:
      return .post
    }
  }
  
  var task: Moya.Task {
    switch self {
    case .someEndpoint:
      return .requestPlain
    }
  }
  
  var sampleData: Data {
    switch self {
    case .someEndpoint:
      return "{\"someKey\": \"someValue\"}".utf8Encoded
    }
  }
  
  var headers: [String: String]? {
    return ["Content-type": "application/x-www-form-urlencoded"]
  }
}

// MARK: - Helpers
private extension String {
  var urlEscaped: String {
    return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
  }
  
  var utf8Encoded: Data {
    return data(using: .utf8)!
  }
}

class CustomServerTrustManager : ServerTrustManager {
  override func serverTrustEvaluator(forHost host: String) throws -> ServerTrustEvaluating? {
    return DefaultTrustEvaluator(validateHost: false)
  }
  
  init() {
    super.init(evaluators: [:])
  }
}
