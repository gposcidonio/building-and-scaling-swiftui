import Observation
import Foundation

@Observable
final class PokemonListViewModel {
    var pokemonList: [Pokemon] = []

    func fetchPokemon() async {
        /*
         Initial response is of the form:

         [ { "name": "...", "url": "..." }, { "name": "...", "url": "..." } ]

         So we have to grab the URL then query for each Pokemon individually.
         */
        do {
            let decoder = JSONDecoder()
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://pokeapi.co/api/v2/pokemon")!)
            let response = try decoder.decode(PokeListResponse.self.self, from: data)

            var pokemon = [Pokemon]()
            for r in response.results {
                let (pokeData, _) = try await URLSession.shared.data(from: r.url)
                let p = try decoder.decode(Pokemon.self, from: pokeData)
                pokemon += [p]
            }
            pokemonList = pokemon
        } catch {
            print(error)
            pokemonList = []
        }
    }
}

struct PokeListResponse: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [Result]

    struct Result: Codable {
        let name: String
        let url: URL
    }
}
