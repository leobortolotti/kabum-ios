//
//  ProdutoTableViewCell.swift
//  Kabum
//
//  Created by Leonardo Bortolotti on 07/06/19.
//  Copyright © 2019 Kabum. All rights reserved.
//

import UIKit
import Cosmos

class ProdutoTableViewCell: UITableViewCell {

    @IBOutlet var fabricanteImage: UIImageView!
    @IBOutlet var produtoImage: UIImageView!
    @IBOutlet var produtoName: UILabel!
    @IBOutlet var rating: CosmosView!
    @IBOutlet var ratingCount: UILabel!
    @IBOutlet var precoDesconto: UILabel!
    @IBOutlet var precoParcelado: UILabel!

}
