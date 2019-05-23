//
//  MemoCell.swift
//  MyMemory
//
//  Created by 케이넷츠 on 23/05/2019.
//  Copyright © 2019 케이넷츠. All rights reserved.
//

import UIKit

class MemoCell: UITableViewCell {
    
    @IBOutlet var subject: UILabel! // 메모 제목
    @IBOutlet var contents: UILabel! // 메모 내용
    @IBOutlet var regdate: UILabel! // 등록 일자
    @IBOutlet var img: UIImageView! // 이미지
}
