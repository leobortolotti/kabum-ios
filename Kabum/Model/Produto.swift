import Foundation

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
}
