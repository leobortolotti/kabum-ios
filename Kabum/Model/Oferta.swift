import Foundation

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
}
