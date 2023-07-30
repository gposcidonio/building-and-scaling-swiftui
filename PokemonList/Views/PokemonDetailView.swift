import SwiftUI
import Charts

struct PokemonDetailView<ViewModel: PokemonDetailViewModelProtocol>: View {
    @State private var viewModel: ViewModel

    private var axisLabels: [String] {
        viewModel.stats.map(\.name)
    }

    init(viewModel: ViewModel) {
        _viewModel = State(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: viewModel.pokemon.sprites.normal)
                AsyncImage(url: viewModel.pokemon.sprites.shiny)
            }
            Chart {
                ForEach(viewModel.stats) { stat in
                    BarMark(x: .value(stat.name, stat.normalizedValue), y: .value(stat.name, stat.name), width: .ratio(0.6))
                        .annotation(position: .trailing, alignment: .leading, spacing: 0) {
                            Text(" \(stat.normalizedValue)")
                                .fontWeight(.bold)
                                .fontDesign(.monospaced)
                        }
                        .foregroundStyle(stat.color)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
            }
            .chartXScale(domain: [0, 255])
            .chartXAxis(.hidden)
            .chartYAxis {
                AxisMarks(values: axisLabels) { _ in
                    AxisValueLabel()
                        .font(.system(.headline, design: .monospaced))
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(viewModel.pokemon.name.capitalized)
    }
}

struct PokemonDetailViewStat: Identifiable {
    var id: String { name }
    let name: String
    let normalizedValue: Int
    let color: Color
}

protocol PokemonDetailViewModelProtocol {
    var pokemon: Pokemon { get }
    var stats: [PokemonDetailViewStat] { get }
}

@Observable
final class StubPokemonDetailViewModel: PokemonDetailViewModelProtocol {
    let pokemon: Pokemon = Pokemon.bulbasaur
    let stats: [PokemonDetailViewStat] = [
        .init(name: "HP", normalizedValue: 100, color: .green),
        .init(name: "ATK", normalizedValue: 25, color: .red),
        .init(name: "DEF", normalizedValue: 50, color: .orange),
        .init(name: "Sp. ATK", normalizedValue: 100, color: .green),
        .init(name: "Sp. DEF", normalizedValue: 125, color: .mint),
        .init(name: "SPD", normalizedValue: 200, color: .blue),
    ]
}

#Preview("Bulbasaur") {
    NavigationStack {
        PokemonDetailView(viewModel: StubPokemonDetailViewModel())
    }
}
