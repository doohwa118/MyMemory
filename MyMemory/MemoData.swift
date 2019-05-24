//
//  MemoData.swift
//  MyMemory
//
//  Created by 케이넷츠 on 23/05/2019.
//  Copyright © 2019 케이넷츠. All rights reserved.
//

import UIKit
import CoreData // 추가 코드

class MemoData {
    var memoIdx: Int? // 데이터 식별값
    var title: String? // 메모 제목
    var contents: String? // 메모 내용
    var image: UIImage? // 이미지
    var regdate: Date? // 작성일
    
    // 추가 코드) 원본 MemoMO 객체를 참조하기 위한 속성
    var objectID: NSManagedObjectID?
}
