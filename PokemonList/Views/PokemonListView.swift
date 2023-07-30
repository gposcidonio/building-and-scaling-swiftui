import SwiftUI

struct PokemonListView: View {
    @State var viewModel = PokemonListViewModel()

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

extension PokemonType {
    var color: Color {
        Color(red: rgb.red, green: rgb.green, blue: rgb.blue, opacity: rgb.opacity)
    }
}

#Preview {
    PokemonListView()
}
