//
//  ViewController.swift
//  ExMyTest
//
//  Created by 김종권 on 2022/07/30.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let bookInfo = BookInfo.with {
      $0.id = 1234
      $0.title = "This is title"
      $0.author = "Jake"
    }
    
    do {
      // 직렬화 (Data 포멧으로)
      let binaryData = try bookInfo.serializedData()
      
      // 역직렬화 (BookInfo 타입으로)
      let decoededInfo = try BookInfo(serializedData: binaryData)
      
      // 직렬화 (json 형태인 Data 포멧으로)
      let jsonData = try bookInfo.jsonUTF8Data()
      
      // 역직렬화 (BookInfo 타입으로)
      let receivedFromJson = try BookInfo(jsonUTF8Data: jsonData)
      
    } catch {
      print(error)
    }
    
  }
}
