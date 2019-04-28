//
//  AddViewController.swift
//  TableView-Navigation-Study
//
//  Created by 김광준 on 28/04/2019.
//  Copyright © 2019 VincentGeranium. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    
    @IBOutlet weak var tfAddItem: UITextField!
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        
        items.append(tfAddItem.text!)
        itemsImgFile.append(randomImg())
//        itemsImgFile.append("짱구.png")
        tfAddItem.text = "" // 이걸 왜 해주는지 이해가 잘 안가네??
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tfAddItem.placeholder = "입력값을 넣어주세요"
        tfAddItem.textAlignment = .center
        tfAddItem.font = UIFont.systemFont(ofSize: 30)
    }
    
    // 새로운 로우 생성시 랜덤으로 이미지가 들어가게 하려고 만든, 랜덤으로 이미지를 뽑는 함수
    func randomImg () -> String {
        
        var randomNumber = arc4random_uniform(3)
        var randomImg: String = ""
        
        for i in 1...1 {
            var number = i * Int(randomNumber)
           randomImg = itemsImgFile[number]
        }
        return randomImg
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
