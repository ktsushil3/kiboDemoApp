//
//  LeftMenuController.swift
//  monetate
//
//  Created by Sushil Tiwari on 18/10/21.
//

import UIKit
import LGSideMenuController

class LeftMenuController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    let options:[String] = ["Cart","Coordinate"]
  
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = options[indexPath.row]
        return cell
    
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // CartViewController
        if indexPath.row == 0
        {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CartViewController") as! CartViewController
        let navCtr = UINavigationController(rootViewController: vc)
        
     //   Self.side
      //  self.present(navCtr, animated: true, completion: nil)
        if let parentVC = self.parent {
            if let parentVC = parentVC as? LGSideMenuController {
                // parentVC is someViewController
                parentVC.rootViewController = navCtr
            }
        }
        }
        else if  indexPath.row == 1
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VariousEventsVC") as! VariousEventsVC
            vc.eventType = .coordinate
            let navCtr = UINavigationController(rootViewController: vc)
            
         //   Self.side
          //  self.present(navCtr, animated: true, completion: nil)
            if let parentVC = self.parent {
                if let parentVC = parentVC as? LGSideMenuController {
                    // parentVC is someViewController
                    parentVC.rootViewController = navCtr
                }
            }
        }
     //   var rootViewController = self.navigationController?.viewControllers.first as! LGSideMenuController
       
    }
}
