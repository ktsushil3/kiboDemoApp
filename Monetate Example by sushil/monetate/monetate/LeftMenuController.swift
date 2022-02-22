//
//  LeftMenuController.swift
//  monetate
//
//  Created by Sushil Tiwari on 18/10/21.
//

import UIKit
import LGSideMenuController

class LeftMenuController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    let options:[String] = ["Cart","Coordinate","ipaddress","screensize","Metadata","userAgent","custom variable","product Detail"]
  
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
            vc.screentitle = "coordinate"
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
        else if indexPath.row == 2
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VariousEventsVC") as! VariousEventsVC
            vc.eventType = .ipaddress
            vc.screentitle = "ipaddress"
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
        else if indexPath.row == 3
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VariousEventsVC") as! VariousEventsVC
            vc.eventType = .screensize
            vc.screentitle = "screensize"
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
        else if indexPath.row == 4
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VariousEventsVC") as! VariousEventsVC
            vc.eventType = .Metadata
            vc.screentitle = "Metadata"
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
        else if indexPath.row == 5
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VariousEventsVC") as! VariousEventsVC
            vc.eventType = .userAgent
            vc.screentitle = "userAgent"
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
        else if indexPath.row == 6
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VariousEventsVC") as! VariousEventsVC
            vc.eventType = .CustomVariable
            vc.screentitle = "Custom Variable"
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

        else if indexPath.row == 7
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VariousEventsVC") as! VariousEventsVC
            vc.eventType = .productDetailView
            vc.screentitle = "product Detail"
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
        
                self.sideMenuController?.hideLeftView()
     //   var rootViewController = self.navigationController?.viewControllers.first as! LGSideMenuController
       
    }
}
