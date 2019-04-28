//
//  TableViewController.swift
//  TableView-Navigation-Study
//
//  Created by 김광준 on 28/04/2019.
//  Copyright © 2019 VincentGeranium. All rights reserved.
//

import UIKit

var items = ["짱구","도라에몽","BMC"]
var itemsImgFile = ["짱구.png","도라에몽.png","BMC.jpeg"]

class TableViewController: UITableViewController {
    
    
    @IBOutlet var tvListView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // Edit 버튼 구현 leftBarButtonItem -> rightBarButtonItem 으로 만들면 Edit가 오른쪽으로 감
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData() // 테이블 뷰의 로우를 다시 로드하는 메소드
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = UIImage(named: itemsImgFile[indexPath.row])

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    /*
    // 인덱스 페스 로우를 스와이프 했을때 delete가 나오는데 그것을 "삭제" 라는 한글로 바꾸는 메소드
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    */
    
    // Override to support editing the table view.
    // 스와이프로 목록 삭제 기능 구현
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            itemsImgFile.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    // 목록(로우)의 순서를 바꾸는 메소드
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let itemToMove = items[fromIndexPath.row]
        let itemImgToMove = itemsImgFile[fromIndexPath.row]
        items.remove(at: fromIndexPath.row)
        itemsImgFile.remove(at: fromIndexPath.row)
        items.insert(itemToMove, at: to.row)
        itemsImgFile.insert(itemImgToMove, at: to.row)
        
    }
    

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
