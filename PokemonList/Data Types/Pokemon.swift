import SwiftUI

struct Pokemon: Identifiable, Codable {
    let id: UInt
    let name: String
    let types: [PokemonType]
}

struct PokemonType: Identifiable, Codable {
    struct Detail: Codable, ExpressibleByStringLiteral {
        let name: String

        init(stringLiteral value: String) {
            self.name = value
        }
    }

    var id: Int { slot }
    let slot: Int
    let type: Detail

    var rgb: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
        switch type.name {
            case "normal":
                (red: 0.631, green: 0.635, blue: 0.631, opacity: 1.000)
            case "fighting":
                (red: 1.000, green: 0.506, blue: 0.000, opacity: 1.000)
            case "flying":
                (red: 0.510, green: 0.733, blue: 0.941, opacity: 1.000)
            case "poison":
                (red: 0.569, green: 0.243, blue: 0.804, opacity: 1.000)
            case "ground":
                (red: 0.573, green: 0.314, blue: 0.110, opacity: 1.000)
            case "rock":
                (red: 0.690, green: 0.671, blue: 0.510, opacity: 1.000)
            case "bug":
                (red: 0.573, green: 0.639, blue: 0.071, opacity: 1.000)
            case "ghost":
                (red: 0.443, green: 0.247, blue: 0.443, opacity: 1.000)
            case "steel":
                (red: 0.373, green: 0.639, blue: 0.729, opacity: 1.000)
            case "fire":
                (red: 0.906, green: 0.133, blue: 0.141, opacity: 1.000)
            case "water":
                (red: 0.149, green: 0.506, blue: 0.941, opacity: 1.000)
            case "grass":
                (red: 0.251, green: 0.635, blue: 0.145, opacity: 1.000)
            case "electric":
                (red: 0.980, green: 0.761, blue: 0.000, opacity: 1.000)
            case "psychic":
                (red: 0.941, green: 0.247, blue: 0.478, opacity: 1.000)
            case "ice":
                (red: 0.239, green: 0.851, blue: 1.000, opacity: 1.000)
            case "dragon":
                (red: 0.306, green: 0.380, blue: 0.886, opacity: 1.000)
            case "dark":
                (red: 0.310, green: 0.243, blue: 0.239, opacity: 1.000)
            case "fairy":
                (red: 0.945, green: 0.443, blue: 0.945, opacity: 1.000)
            default:
                (red: 0, green: 0, blue: 0, opacity: 1)
        }
    }
}
