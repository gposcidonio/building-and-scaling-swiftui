import SwiftUI

struct PokemonList<ViewModel: PokemonListViewModelProtocol>: View {
    @State var viewModel: ViewModel

    init(viewModel: ViewModel) {
        _viewModel = State(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.pokemonList) { pokemon in
                    Row(pokemon: pokemon)
                }
            }
            .task {
                await viewModel.fetchPokemon()
            }
            .navigationTitle("Pokémon")
        }
    }

    struct Row: View {
        let pokemon: Pokemon

        var body: some View {
            HStack(alignment: .firstTextBaseline) {
                Text(pokemon.name.capitalized)
                Spacer()
                ForEach(pokemon.types.sorted(by: { $0.slot < $1.slot })) { type in
                    Text(type.type.name)
                        .font(.body.smallCaps())
                        .fontWeight(.semibold)
                        .fontWidth(.compressed)
                        .padding(.top, 2)
                        .padding(.bottom, 4)
                        .padding(.horizontal, 8)
                        .background(type.color)
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                }
            }
        }
    }
}

protocol PokemonListViewModelProtocol: Observable {
    var pokemonList: [Pokemon] { get }
    func fetchPokemon() async
}

extension PokemonListViewModel: PokemonListViewModelProtocol {}

extension PokemonType {
    var color: Color {
        Color(red: rgb.red, green: rgb.green, blue: rgb.blue, opacity: rgb.opacity)
    }
}

@Observable
final class StubPokemonListViewModel: PokemonListViewModelProtocol {
    let pokemonList: [Pokemon] = Pokemon.list
    func fetchPokemon() async { /* no op */ }
}

#Preview {
    PokemonList(viewModel: StubPokemonListViewModel())
}
