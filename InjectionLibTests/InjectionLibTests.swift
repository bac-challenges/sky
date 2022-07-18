//
//  InjectionLibTests.swift
//  InjectionLibTests
//
//  Created by emile on 09/07/2022.
//

import XCTest
@testable import SkyChallenge
@testable import InjectionLib

final class InjectionLibTests: XCTestCase {

    func testInjector() throws {
        
        @Injected(\.serviceProvider)
        var serviceProvider: ServiceProviding
        
        XCTAssertNotNil(serviceProvider)
        
        XCTAssertEqual(serviceProvider.requestData(),
                       ServiceProvider.text)
        
        InjectedValues[\.serviceProvider] = MockServiceProvider()
        
        XCTAssertEqual(serviceProvider.requestData(),
                       MockServiceProvider.text)
    }
}
