//
//  ViewController.swift
//  SwiftCalendar
//
//  Created by Angelos Staboulis on 3/11/23.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblTimeZone: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblNameDay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
   
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: 2000, height: 0)
    }

}
extension ViewController{
    func createView(){
        Task.init{
            lblDate.text = Helper.shared.getDate()
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                DispatchQueue.main.async {
                    self.lblTime.text = Helper.shared.getTime()

                }
            }.fire()
            lblTimeZone.text =  Helper.shared.getTimeZone()
            lblNameDay.text = await Helper.shared.getNameDay()
        }
  

    }
}
