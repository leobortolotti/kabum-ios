//
//  InicioTableViewController.swift
//  Kabum
//
//  Created by Leonardo Bortolotti on 06/06/19.
//  Copyright © 2019 Kabum. All rights reserved.
//

import UIKit

class InicioTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let logoImageView = UIImageView(image: UIImage(named: "kabumLogo"))
        self.navigationItem.titleView = logoImageView
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
