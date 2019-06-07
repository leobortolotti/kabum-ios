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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}
