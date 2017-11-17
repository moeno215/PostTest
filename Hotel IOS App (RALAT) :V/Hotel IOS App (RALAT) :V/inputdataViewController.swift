//
//  inputdataViewController.swift
//  Hotel IOS App (RALAT) :V
//
//  Created by Maulana Hasbi on 11/17/17.
//  Copyright © 2017 SMK IDN. All rights reserved.
//

import UIKit

class inputdataViewController: UIViewController{
    
  @IBOutlet weak var etlokasi: UITextField!
  @IBOutlet weak var etfasilitas: UITextField!
  @IBOutlet weak var etrate: UITextField!
  @IBOutlet weak var etalamat: UITextField!
  @IBOutlet weak var etNama: UITextField!

override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
}

  @IBAction func btnSave(_ sender: Any) {
    //deklarasi context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //deklarasi task
    let hotels = Hotel(context: context) //deklarasi nameTask sebagai konteks dari entiti Task\
    
    hotels.nama = etNama.text
    hotels.alamat = etalamat.text
    hotels.rate = etrate.text
    hotels.fasilitas = etfasilitas.text
    hotels.lokasi = etlokasi.text
    
    if etNama.text == "" {
        //kondisi ketika kosong
        //tampil alert dialog
        let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
        //menambahkan aksi ke button
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }else if etalamat.text == "" {
        //kondisi ketika kosong
        //tampil alert dialog
        let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
        //menambahkan aksi ke button
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }else if etrate.text == "" {
        //kondisi ketika kosong
        //tampil alert dialog
        let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
        //menambahkan aksi ke button
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }else if etfasilitas.text == "" {
        //kondisi ketika kosong
        //tampil alert dialog
        let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
        //menambahkan aksi ke button
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }else if etlokasi.text == "" {
        //kondisi ketika kosong
        //tampil alert dialog
        let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
        //menambahkan aksi ke button
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }else{
        //ketika kondisi tesk task nya tidak kosong
        //data di simpan ke core Data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
        //mencetak kalau data berhasil ditambahkan
        print("Data berhasil disimpan")
    }
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

