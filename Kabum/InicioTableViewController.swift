//
//  InicioTableViewController.swift
//  Kabum
//
//  Created by Leonardo Bortolotti on 06/06/19.
//  Copyright © 2019 Kabum. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
import SwiftyJSON
import MXParallaxHeader

class InicioTableViewController: UITableViewController {
    
    var productsArray: [Produto] = []
    var page = 1
    var shouldShowLoading = 1
    let launchView = UINib(nibName: "LaunchView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! View

    override func viewDidLoad() {
        super.viewDidLoad()
        
        launchView.frame = self.view.frame
        self.tabBarController?.view.addSubview(launchView)

        let logoImageView = UIImageView(image: UIImage(named: "kabumLogo"))
        self.navigationItem.titleView = logoImageView
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.refreshControl?.bounds = CGRect(x: (self.refreshControl?.bounds.origin.x)!, y: (self.refreshControl?.bounds.origin.y)! + 250, width: (self.refreshControl?.bounds.size.width)!, height: (self.refreshControl?.bounds.size.height)!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        load()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // MARK: - Helper Methods
    
    @objc func refresh() {
        page = 1
        shouldShowLoading = 1
        productsArray.removeAll()
        self.tableView.reloadData()
        load()
    }
    
    func load() {
        loadBanner()
        loadProducts()
    }
    
    func loadBanner() {
        AF.request(Constants.kROOT_WEBSERVICE + "/banner/v1/banner", method: .get).responseJSON { response in
            self.launchView.removeFromSuperview()
            switch response.result {
            case let .success(value):
                print(value)
                let json = JSON(value)
                do {
                    let banner = try Banner(json["banner"].rawString()!)
                    let bannerImageView = ImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 250))
                    bannerImageView.kf.setImage(with: URL(string: banner.img!))
                    bannerImageView.contentMode = .scaleAspectFill
                    bannerImageView.clipsToBounds = true
                    self.tableView.parallaxHeader.view = bannerImageView
                    self.tableView.parallaxHeader.height = bannerImageView.bounds.size.height
                    self.tableView.parallaxHeader.minimumHeight = 0
                    self.tableView.parallaxHeader.mode = .center
                } catch {
                    print("JSON error:", error)
                }
                
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func loadProducts() {
        let parameters = ["app" : 1,
                          "limite" : 5,
                          "pagina" : page]
        
        AF.request(Constants.kROOT_WEBSERVICE + "/home/v1/home/produto", method: .get, parameters: parameters).responseJSON { response in
            self.launchView.removeFromSuperview()
            switch response.result {
            case let .success(value):
                print(value)
                let json = JSON(value)
                let jsonArray = json["produtos"]
                for (_, productJson):(String, JSON) in jsonArray {
                    do {
                        let produto = try Produto(productJson.rawString()!)
                        self.productsArray.append(produto)
                        self.tableView.beginUpdates()
                        self.tableView.insertRows(at: [IndexPath(row: self.productsArray.count - 1, section: 0)], with: .fade)
                        self.tableView.endUpdates()
                    } catch {
                        print("JSON error:", error)
                    }
                }
                
                if jsonArray.count == 0 && self.shouldShowLoading != 0 {
                    self.shouldShowLoading = 0
                    self.tableView.beginUpdates()
                    self.tableView.deleteRows(at: [IndexPath(row: self.productsArray.count, section: 0)], with: .fade)
                    self.tableView.endUpdates()
                }
                else if jsonArray.count > 0 {
                    self.shouldShowLoading = 1
                }

            case let .failure(error):
                print(error)
            }
            self.refreshControl?.endRefreshing()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count + shouldShowLoading
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < productsArray.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProdutoTableViewCell
            
            let produto = productsArray[indexPath.row]
            
            cell.fabricanteImage.kf.setImage(with: URL(string: produto.fabricante?.img ?? ""))
            cell.produtoImage.kf.setImage(with: URL(string: produto.img!))
            cell.produtoName.text = produto.nome
            
            var attributedString: NSMutableAttributedString!
            var precoStringToUse: String!
            let precoDesconto = Double(produto.precoDesconto!) ?? 0
            let precoDescontoPrime = Double(produto.precoDescontoPrime!) ?? 0
            if precoDescontoPrime < precoDesconto {
                precoStringToUse = produto.precoDescontoPrimeFormatado
                attributedString = NSMutableAttributedString(string: precoStringToUse + " à vista (Prime)")
            }
            else {
                precoStringToUse = produto.precoDescontoFormatado
                attributedString = NSMutableAttributedString(string: precoStringToUse + " à vista")
            }
            attributedString!.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 21), range: NSRange(location: 0, length: precoStringToUse.count))
            attributedString!.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 13), range: NSRange(location: precoStringToUse.count, length: attributedString!.length - precoStringToUse.count))
            cell.precoDesconto.attributedText = attributedString
            
            cell.precoParcelado.text = produto.precoFormatado! + " em até 12x"
            
            cell.rating.settings.updateOnTouch = false
            cell.rating.rating = Double(produto.avaliacaoNota!)
            cell.ratingCount.text = "\(produto.avaliacaoNumero ?? 0)"
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingTableViewCell
            cell.activityIndicator.startAnimating()
            if productsArray.count > 0 {
                cell.activityIndicator.isHidden = false
            }
            else {
                cell.activityIndicator.isHidden = true
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < productsArray.count {
            return 220
        }
        else {
            return 60
        }
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // UITableView only moves in one direction, y axis
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        // Change 10.0 to adjust the distance from bottom
        if maximumOffset - currentOffset <= 60.0 {
            page += 1
            self.loadProducts()
        }
    }
}
