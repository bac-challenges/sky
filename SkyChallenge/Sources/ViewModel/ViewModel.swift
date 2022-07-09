//
//  ViewModel.swift
//  SkyChallenge
//
//  Created by emile on 09/07/2022.
//

import Foundation
import InjectionLib

final class ViewModel: ObservableObject {
    
    @Injected(\.serviceProvider)
    public var serviceProvider: ServiceProviding
    
    @Published var text = "Init"
    
    func loadData() {
        text += " | \(serviceProvider.requestData())"
    }
}
