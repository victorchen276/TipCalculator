//
//  TipViewModel.swift
//  TipCalculator
//
//  Created by Chen Yue on 23/11/19.
//  Copyright © 2019 Mt. Zendo. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class TipViewModel: ObservableObject {
    var amount: String = ""
    var tipPrecentage: Int = 0 {
        didSet {
            self.calculateTip()
        }
    }
    var tip: Double?
    
    let tipChoices:[Int] = [10, 15, 20, 25]
    let objectWillChange = PassthroughSubject<TipViewModel, Never>()
//    let objectWillChange = ObservableObjectPublisher()
    
    func calculateTip()  {
        guard let amount = Double(amount) else {
            return
        }
        print(amount)
        print(tipPrecentage)
        self.tip = amount * (Double(tipPrecentage) / 100)
        self.objectWillChange.send(self)
//        self.objectWillChange.send()
    }
}
