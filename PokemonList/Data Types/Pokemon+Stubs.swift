import Foundation

extension Pokemon {
    static let list: [Pokemon] = [
        bulbasaur,
        ivysaur,
        venusaur,
        charmander,
        charmeleon,
        charizard,
        squirtle,
        wartortle,
        blastoise,
        caterpie,
        metapod,
        butterfree,
        weedle,
        kakuna,
        beedrill,
        pidgey,
        pidgeotto,
        pidgeot,
        rattata,
        raticate,
    ]

    static let bulbasaur = loadStub(fileName: "001-bulbasaur.json")
    static let ivysaur = loadStub(fileName: "002-ivysaur.json")
    static let venusaur = loadStub(fileName: "003-venusaur.json")
    static let charmander = loadStub(fileName: "004-charmander.json")
    static let charmeleon = loadStub(fileName: "005-charmeleon.json")
    static let charizard = loadStub(fileName: "006-charizard.json")
    static let squirtle = loadStub(fileName: "007-squirtle.json")
    static let wartortle = loadStub(fileName: "008-wartortle.json")
    static let blastoise = loadStub(fileName: "009-blastoise.json")
    static let caterpie = loadStub(fileName: "010-caterpie.json")
    static let metapod = loadStub(fileName: "011-metapod.json")
    static let butterfree = loadStub(fileName: "012-butterfree.json")
    static let weedle = loadStub(fileName: "013-weedle.json")
    static let kakuna = loadStub(fileName: "014-kakuna.json")
    static let beedrill = loadStub(fileName: "015-beedrill.json")
    static let pidgey = loadStub(fileName: "016-pidgey.json")
    static let pidgeotto = loadStub(fileName: "017-pidgeotto.json")
    static let pidgeot = loadStub(fileName: "018-pidgeot.json")
    static let rattata = loadStub(fileName: "019-rattata.json")
    static let raticate = loadStub(fileName: "020-raticate.json")

    private static func loadStub(fileName: String) -> Pokemon {
        let split = fileName.split(separator: ".")
        guard split.count == 2 else {
            fatalError()
        }
        let baseName = String(split[0])
        let ext = String(split[1])

        guard let filepath = Bundle.main.path(forResource: baseName, ofType: ext) else {
            fatalError("Could not load \(fileName)")
        }

        let data = try! String(contentsOfFile: filepath).data(using: .utf8)!
        return try! JSONDecoder().decode(Pokemon.self, from: data)
    }
}
