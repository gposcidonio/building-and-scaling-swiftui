//
//  PokemonListApp.swift
//  PokemonList
//
//  Created by jolteon on 7/11/23.
//

import SwiftUI

@main
struct PokemonListApp: App {
    var body: some Scene {
        WindowGroup {
            PokemonList(viewModel: PokemonListViewModel())
        }
    }
}
