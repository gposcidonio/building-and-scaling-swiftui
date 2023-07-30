import SwiftUI

@Observable
final class PokemonDetailViewModel: PokemonDetailViewModelProtocol {
    let pokemon: Pokemon

    var stats: [PokemonDetailViewStat] {
        if _stats.isEmpty {
            _stats = computeDetailViewStats(for: pokemon)
        }
        return _stats
    }
    private var _stats: [PokemonDetailViewStat] = []

    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }

    private func computeDetailViewStats(for pokemon: Pokemon) -> [PokemonDetailViewStat] {
        pokemon.stats.map { stat in
            PokemonDetailViewStat(
                name: computeStatNameForDisplay(stat.statDescription.name),
                normalizedValue: stat.baseStat,
                color: computeColor(for: stat.baseStat)
            )
        }
    }

    private func computeStatNameForDisplay(_ statName: String) -> String {
        switch statName.lowercased() {
            case "hp": "HP"
            case "attack": "ATK"
            case "defense": "DEF"
            case "special-attack": "Sp. ATK"
            case "special-defense": "Sp. DEF"
            case "speed": "SPD"
            default: "???"
        }
    }

    private func computeColor(for stat: Int) -> Color {
        switch stat {
            case 1..<25: .red
            case 25..<70: .orange
            case 70..<90: .yellow
            case 90..<110: .green
            case 110..<125: .mint
            case 125...255: .blue
            default: .gray
        }
    }

}
