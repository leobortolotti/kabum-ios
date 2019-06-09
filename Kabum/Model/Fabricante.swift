import Foundation

struct Fabricante: Codable {
    let codigo: Int?
    let nome: String?
    let img: String?
}

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
}
