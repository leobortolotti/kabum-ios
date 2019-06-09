import Foundation

struct Banner: Codable {
    let id: Int?
    let img: String?
    let link: String?
    let bgcolor: String?
}

extension Banner {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Banner.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
}
