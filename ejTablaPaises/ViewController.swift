//
//  ViewController.swift
//  ejTablaPaises
//
//  Created by Javier Rodríguez Valentín on 27/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var europa = ["España","Suecia","Francia","Bélgica","Dinamarca","Noruega"]
    var europaBan = ["esp","sue","fra","bel","din","nor"]
    
    var america = ["EEUU","Perú","Argentina","Colombia","Brasil"]
    var americaBan = ["eeu","per","arg","col","bra"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        table.delegate = self
        
        table.tableFooterView = UIView()
        
        table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
}

//MARK: Extensión DataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return europa.count
        }else if section == 1{
            return america.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
            cell?.label.text = europa[indexPath.row]
            cell?.img.image = UIImage(named: europaBan[indexPath.row])
            return cell!
        }else if indexPath.section == 1{
            let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
            cell?.label.text = america[indexPath.row]
            cell?.img.image = UIImage(named: americaBan[indexPath.row])
            return cell!
        }else{
            let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
            cell?.label.text = "error"
            return cell!
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //MARK: Cabecera
    //título de la cabecera
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0{
            return "Europa"
        }else if section == 1{
            return "América"
        }else{
            return "error"
        }
        
        //en el mainStoryBoard al seleccionar la tabla en la parte del style podemos cambiarlo. con plain nos deja la cabecera de la sección mostrada encima de la tabla constantemente hasta que el último elemento de la tabla se haya sacado de la pantalla, en cuyo caso se pone la seccion siguiente
    }
    
    //altura de la cabecera
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

//MARK: Extensión delegate
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0{
            print("Has seleccionado: \(europa[indexPath.row])")
        }else if indexPath.section == 1{
            print("Has seleccionado: \(america[indexPath.row])")
        }else{
            print("error")
        }
    }
}
