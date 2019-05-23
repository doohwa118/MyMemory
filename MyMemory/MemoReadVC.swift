//
//  MemoReadVC.swift
//  MyMemory
//
//  Created by 케이넷츠 on 23/05/2019.
//  Copyright © 2019 케이넷츠. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {
    // 콘텐츠 데이터를 저장하는 변수
    var param: MemoData?
    
    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var img: UIImageView!
    
    override func viewDidLoad() {
        // ① 제목과 내용, 이미지를 출력
        self.subject.text = param?.title
        self.contents.text = param?.contents
        self.img.image = param?.image
        
        // ② 날짜 포맷 변환
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        let dataString = formatter.string(from: (param?.regdate)!)
        
        // ③ 내비게이션 타이틀에 날짜를 표시
        self.navigationItem.title = dataString
    }
    
}
