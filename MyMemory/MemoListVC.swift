//
//  MemoListVC.swift
//  MyMemory
//
//  Created by 케이넷츠 on 23/05/2019.
//  Copyright © 2019 케이넷츠. All rights reserved.
//

import UIKit

class MemoListVC: UITableViewController {
    // 앱 델리케이트 객체의 참조 정보를 읽어온다.
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        /* 이 부분은 테스트를 위한 더미 데이터 코드입니다.
         실제 실습 진행시에는 관련 코드를 삭제하시기 바랍니다.*/
        
        let memo = MemoData()
        memo.title = "워크샵 준비 물품들"
        memo.contents = "라면, 양파, 감자, 파, 계란, 세제류, 생수, 탄산수, 워셔액, 비누, 치약, 칫솔, 수건, 라면, 양파, 감자, 파, 계란, 세제류, 생수, 탄산수, 워셔액, 비누, 치약, 칫솔, 수건"
        memo.regdate = Date()
        
        appDelegate.memolist.append(memo)
        
        let memo1 = MemoData()
        memo1.title = "워크샵 출발 전 챙겨야 할 것들"
        memo1.contents = "이동중 섭취물품들, 인원 체크 및 예약장소 재확인"
        memo1.regdate = Date(timeIntervalSinceNow: 3000)
        
        appDelegate.memolist.append(memo1)
        
        let memo2 = MemoData()
        memo2.title = "출발 전 체크 항목들"
        memo2.contents = "인원별 탑승 완료 여부 확인 및 각 이동 차량 점검"
        memo2.regdate = Date(timeIntervalSinceNow: 4000)
        
        appDelegate.memolist.append(memo2)
        
        let memo3 = MemoData()
        memo3.title = "워크샵 결과 정리"
        memo3.contents = "부족했던 점 : 워크샵 장소 이동 사이에 간격이 너무 길어 사람들의 주의가 분산됨"
        memo3.regdate = Date(timeIntervalSinceNow: 8000)
        
        appDelegate.memolist.append(memo3)
    }
    
    // 화면이 나타날 때마다 호출되는 메소드
    override func viewWillAppear(_ animated: Bool) {
        // 테이블 데이터를 다시 읽어들인다. 이에 따라 행을 구성하는 로직이 다시 실행될 것이다.
        self.tableView.reloadData()
    }
    
    // 테이블 행의 개수를 결정하는 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegate.memolist.count
        return count
    }
    
    // 테이블 행을 구성하는 메소드
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. memolist 배열 데이터에서 주어진 행에 맞는 데이터를 꺼낸다.
        let row = self.appDelegate.memolist[indexPath.row]
        
        // 2. 이미지 속성이 비어 있을 경우 "memoCell", 아니면 "memoCellWithImage"
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        
        // 3. 재사용 큐로부터 프로토타입 셀의 인스턴스를 전달받는다.
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
        
        // 4. memoCell의 내용을 구성한다.
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image
        
        // 5. Date 타입의 날짜를 yyyy-MM-dd HH:mm:ss 포맷에 맞게 변경한다.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.regdate?.text = formatter.string(from: row.regdate!)
        
        // 6. cell 객체를 리턴한다.
        return cell
    }
    
    // 테이블의 특정 행이 선택되었을 때 호출되는 메소드. 선택된 행의 정보는 indexPath에 담겨 전달된다.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // ① memolist 배열에서 선택된 행에 맞는 데이터를 꺼낸다.
        let row = self.appDelegate.memolist[indexPath.row]
 
        // ② 상세 화면의 인스턴스를 생성한다.
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else {
            return
        }
        
        // ③ 값을 전달한 다음, 상세 화면으로 이동한다.
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
