//
//  ViewController.swift
//  Weather
//
//  Created by techmaster on 1/5/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var btnTemprerature: UIButton!
    @IBOutlet weak var lblCOrF: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblProverb: UILabel!
    
    let backgroundImages: [String] = ["Blood.png", "Moon.png", "Sun.png"]
    let countries: [String] = ["Viet Nam", "Thai Lan", "Indonesia", "Dontimo", "China", "Malaysia"]
    let proverbs: [String] = ["Cuộc sống và lòng tin chỉ bị mất có một lần.", "Say là cái điên tự nguyện.", "Một đầu bếp giỏi thì tốt bằng bảy bác sĩ.", "Người khôn không thích kẻ ngu, người tỉnh không thích kẻ say.", "Ngày đi, tháng chạy, năm bay. Thời gian nước chảy, chẳng quay được về.", "Im lặng là câu trả lời tốt nhất mà bạn có thể dành cho kẻ ba hoa.", "Cái gì bạn không giữ được trong miệng thì cũng không giữ được ở trong nhà."]
    
    var isC: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnChangeCAndF(_ sender: UIButton) {
        isC = !isC
        let currentTemp = Double(btnTemprerature.title(for: UIControlState.normal)!)
        if isC {
            let currentTempC = (currentTemp! - 32) / 1.8
            btnTemprerature.setTitle(String(format: "%2.1F", currentTempC), for: UIControlState.normal)
            lblCOrF.text = "C"
        } else {
            let currentTempF = currentTemp! * 1.8 + 32
            btnTemprerature.setTitle(String(format: "%2.1F", currentTempF), for: UIControlState.normal)
            lblCOrF.text = "F"
        }
    }

    @IBAction func btnRefresh(_ sender: UIButton) {
        let imageIndex = Int(arc4random_uniform(UInt32(backgroundImages.count)))
        imgBackground.image = UIImage(named: backgroundImages[imageIndex])
        
        getTemperature()
        
        let countryIndex = Int(arc4random_uniform(UInt32(countries.count)))
        lblCountry.text = countries[countryIndex]
        
        let proverbIndex = Int(arc4random_uniform(UInt32(proverbs.count)))
        lblProverb.text = proverbs[proverbIndex]
    }
    
    func randomTemperature() -> Double {
        if isC {
            return Double(arc4random_uniform(21) + 15)
        } else {
            return Double(arc4random_uniform(37) + 59)
        }
    }
    
    func getTemperature() {
        let temp = randomTemperature() + Double(arc4random()) / Double(INT32_MAX)
        btnTemprerature.setTitle(String(format: "%2.1F", temp), for: UIControlState.normal)
    }
}

