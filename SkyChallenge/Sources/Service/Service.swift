//
//  Service.swift
//  SkyChallenge
//
//  Created by emile on 09/07/2022.
//

import Foundation
import InjectionLib

public protocol ServiceProviding {
    func requestData() -> String
}

public struct ServiceProvider: ServiceProviding {
    static let text = "Service Data"
    
    public func requestData() -> String {
        return ServiceProvider.text
    }
}

public struct MockedServiceProvider: ServiceProviding {
    static let text = "Mock Data"
    
    public func requestData() -> String {
        return MockedServiceProvider.text
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
