// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let oferta = try Oferta(json)

// Gerado utilizando o site https://app.quicktype.io/ e adaptado por Leonardo Bortolotti

import Foundation

// MARK: - Oferta
struct Oferta: Codable {
    let codigo: String?
    let eventoCodigo, dataInicio, dataFim, quantidade: Int?
    let evento: String?
    let logar: Int?

    enum CodingKeys: String, CodingKey {
        case codigo
        case eventoCodigo = "evento_codigo"
        case dataInicio = "data_inicio"
        case dataFim = "data_fim"
        case quantidade, evento, logar
    }
}

// MARK: Oferta convenience initializers and mutators

extension Oferta {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Oferta.self, from: data)
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
        codigo: String?? = nil,
        eventoCodigo: Int?? = nil,
        dataInicio: Int?? = nil,
        dataFim: Int?? = nil,
        quantidade: Int?? = nil,
        evento: String?? = nil,
        logar: Int?? = nil
    ) -> Oferta {
        return Oferta(
            codigo: codigo ?? self.codigo,
            eventoCodigo: eventoCodigo ?? self.eventoCodigo,
            dataInicio: dataInicio ?? self.dataInicio,
            dataFim: dataFim ?? self.dataFim,
            quantidade: quantidade ?? self.quantidade,
            evento: evento ?? self.evento,
            logar: logar ?? self.logar
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
