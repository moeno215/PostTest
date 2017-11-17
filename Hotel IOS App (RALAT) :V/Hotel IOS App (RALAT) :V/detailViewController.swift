//
//  detailViewController.swift
//  Hotel IOS App (RALAT) :V
//
//  Created by Maulana Hasbi on 11/17/17.
//  Copyright © 2017 SMK IDN. All rights reserved.
//

import UIKit
class detailViewController: UIViewController {

  @IBOutlet weak var labelNama: UILabel!
  @IBOutlet weak var labelalamat: UILabel!
  @IBOutlet weak var labelrate: UILabel!
  @IBOutlet weak var labelfasilitas: UILabel!
  @IBOutlet weak var labellokasi: UILabel!

var passNama:String?
var passalamat:String?
var passrate:String?
var passfasilitas:String?
var passlokasi:String?

override func viewDidLoad() {
    
    labelNama.text = passNama!
    labelalamat.text = passalamat!
    labelrate.text = passrate!
    labelfasilitas.text = passfasilitas!
    labellokasi.text = passlokasi!
    
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
