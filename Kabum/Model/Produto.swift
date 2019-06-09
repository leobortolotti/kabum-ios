// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let produto = try Produto(json)

// Gerado utilizando o site https://app.quicktype.io/ e adaptado por Leonardo Bortolotti

import Foundation

// MARK: - Produto
struct Produto: Codable {
    let codigo: Int?
    let img: String?
    let nome: String?
    let alt: Int?
    let linkDescricao, preco, precoPrime, precoDesconto: String?
    let precoDescontoPrime, precoFormatado, precoPrimeFormatado, precoDescontoFormatado: String?
    let precoDescontoPrimeFormatado: String?
    let avaliacaoNumero, avaliacaoNota: Int?
    let fabricante: Fabricante?
    let menu: String?
    let disponibilidade: Bool?
    let oferta: Oferta?

    enum CodingKeys: String, CodingKey {
        case codigo, img, nome, alt
        case linkDescricao = "link_descricao"
        case preco
        case precoPrime = "preco_prime"
        case precoDesconto = "preco_desconto"
        case precoDescontoPrime = "preco_desconto_prime"
        case precoFormatado = "preco_formatado"
        case precoPrimeFormatado = "preco_prime_formatado"
        case precoDescontoFormatado = "preco_desconto_formatado"
        case precoDescontoPrimeFormatado = "preco_desconto_prime_formatado"
        case avaliacaoNumero = "avaliacao_numero"
        case avaliacaoNota = "avaliacao_nota"
        case fabricante, menu, disponibilidade, oferta
    }
}

// MARK: Produto convenience initializers and mutators

extension Produto {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Produto.self, from: data)
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
        img: String?? = nil,
        nome: String?? = nil,
        alt: Int?? = nil,
        linkDescricao: String?? = nil,
        preco: String?? = nil,
        precoPrime: String?? = nil,
        precoDesconto: String?? = nil,
        precoDescontoPrime: String?? = nil,
        precoFormatado: String?? = nil,
        precoPrimeFormatado: String?? = nil,
        precoDescontoFormatado: String?? = nil,
        precoDescontoPrimeFormatado: String?? = nil,
        avaliacaoNumero: Int?? = nil,
        avaliacaoNota: Int?? = nil,
        fabricante: Fabricante?? = nil,
        menu: String?? = nil,
        disponibilidade: Bool?? = nil,
        oferta: Oferta?? = nil
    ) -> Produto {
        return Produto(
            codigo: codigo ?? self.codigo,
            img: img ?? self.img,
            nome: nome ?? self.nome,
            alt: alt ?? self.alt,
            linkDescricao: linkDescricao ?? self.linkDescricao,
            preco: preco ?? self.preco,
            precoPrime: precoPrime ?? self.precoPrime,
            precoDesconto: precoDesconto ?? self.precoDesconto,
            precoDescontoPrime: precoDescontoPrime ?? self.precoDescontoPrime,
            precoFormatado: precoFormatado ?? self.precoFormatado,
            precoPrimeFormatado: precoPrimeFormatado ?? self.precoPrimeFormatado,
            precoDescontoFormatado: precoDescontoFormatado ?? self.precoDescontoFormatado,
            precoDescontoPrimeFormatado: precoDescontoPrimeFormatado ?? self.precoDescontoPrimeFormatado,
            avaliacaoNumero: avaliacaoNumero ?? self.avaliacaoNumero,
            avaliacaoNota: avaliacaoNota ?? self.avaliacaoNota,
            fabricante: fabricante ?? self.fabricante,
            menu: menu ?? self.menu,
            disponibilidade: disponibilidade ?? self.disponibilidade,
            oferta: oferta ?? self.oferta
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
