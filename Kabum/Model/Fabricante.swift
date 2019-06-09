// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fabricante = try Fabricante(json)

// Gerado utilizando o site https://app.quicktype.io/ e adaptado por Leonardo Bortolotti

import Foundation

// MARK: - Fabricante
struct Fabricante: Codable {
    let codigo: Int?
    let nome: String?
    let img: String?
}

// MARK: Fabricante convenience initializers and mutators

extension Fabricante {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Fabricante.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        codigo: Int?? = nil,
        nome: String?? = nil,
        img: String?? = nil
    ) -> Fabricante {
        return Fabricante(
            codigo: codigo ?? self.codigo,
            nome: nome ?? self.nome,
            img: img ?? self.img
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
