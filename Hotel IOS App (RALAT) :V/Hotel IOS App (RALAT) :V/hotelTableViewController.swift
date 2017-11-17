//
//  hotelTableViewController.swift
//  Hotel IOS App (RALAT) :V
//
//  Created by Maulana Hasbi on 11/17/17.
//  Copyright © 2017 SMK IDN. All rights reserved.
//

import UIKit

class hotelTableViewController: UITableViewController {

    var data : [Hotel] = []
    
    var namaSelected:String?
    var alamatSelected:String?
    var rateSelected:String?
    var fasilitasSelected:String?
    var lokasiSelected:String?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellData", for: indexPath) as! hotelTableViewCell
        
        // Configure the cell...
        //deklarasi dataTask sebagai Index dari tasks
        let dataHotel = data[indexPath.row]
        //mengambildata dengan attribute name_Task
        if let myDataHotel = dataHotel.nama {
            //menampilkan data ke label
            cell.labelNama.text = myDataHotel
        }
        if let myDataHotel1 = dataHotel.alamat{
            cell.labelalamat.text = myDataHotel1
        }
        if let myDataHotel2 = dataHotel.rate{
            cell.labelrate.text = myDataHotel2
        }
        
       
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        //memanggil method getData
        getData()
        //memanggil reloadData
        tableView.reloadData()
    }
    
    //method getData
    func getData() {
        //mengecek apakah ada error atau tidak
        do{
            //kondisi kalau tidak ada error
            //maka akan request download data
            data = try context.fetch(Hotel.fetchRequest())
        }
        catch{
            //kondisi apabila error fetch data
            print("Fetching Failed")
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        //mengece menu swipe bila edit data
        if editingStyle == .delete {
            let task = data[indexPath.row]
            context.delete(task)
            //Delete data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
                //retrieve data
                data = try context.fetch(Hotel.fetchRequest())
            }
            catch{
                print("Fetching Failed")
            }
        }
        //load data lagi
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let task = data[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        namaSelected = task.nama
        alamatSelected = task.alamat
        rateSelected = task.rate
        fasilitasSelected = task.fasilitas
        lokasiSelected = task.lokasi
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "passData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "passData"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let kirimData = segue.destination as! detailViewController
            //mengirimkan data ke masing2 variable
            //mengirimkan nama wisata
            kirimData.passNama = namaSelected
            //mengirimkan data gambar wisata
            kirimData.passalamat = alamatSelected
            kirimData.passrate = rateSelected
            kirimData.passfasilitas = fasilitasSelected
            kirimData.passlokasi = lokasiSelected
            
            
            
            
            
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

