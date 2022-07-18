//
//  Service.swift
//  SkyChallenge
//
//  Created by emile on 09/07/2022.
//

import Foundation
import InjectionLib

public protocol ServiceProviding {
    static var text: String {get}
    func requestData() -> String
}

public struct ServiceProvider: ServiceProviding {
    public static let text = "Service Data"
    
    public func requestData() -> String {
        return ServiceProvider.text
    }
}

public struct MockServiceProvider: ServiceProviding {
    public static let text = "Mock Data"
    
    public func requestData() -> String {
        return MockServiceProvider.text
    }
}

public extension InjectedValues {
    var serviceProvider: ServiceProviding {
        get { Self[ServiceProviderKey.self] }
        set { Self[ServiceProviderKey.self] = newValue }
    }
    
    private struct ServiceProviderKey: InjectionKey {
        static var currentValue: ServiceProviding = ServiceProvider()
    }
}
