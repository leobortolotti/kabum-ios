// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let banner = try Banner(json)

// Gerado utilizando o site https://app.quicktype.io/ e adaptado por Leonardo Bortolotti

import Foundation

// MARK: - Banner
struct Banner: Codable {
    let id: Int?
    let img: String?
    let link: String?
    let bgcolor: String?
}

// MARK: Banner convenience initializers and mutators

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

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        img: String?? = nil,
        link: String?? = nil,
        bgcolor: String?? = nil
    ) -> Banner {
        return Banner(
            id: id ?? self.id,
            img: img ?? self.img,
            link: link ?? self.link,
            bgcolor: bgcolor ?? self.bgcolor
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
