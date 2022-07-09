//
//  ContentView.swift
//  SkyChallenge
//
//  Created by emile on 09/07/2022.
//

import SwiftUI
import InjectionLib

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .onAppear {
                viewModel.loadData()
                InjectedValues[\.serviceProvider] = MockedServiceProvider()
                viewModel.loadData()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
