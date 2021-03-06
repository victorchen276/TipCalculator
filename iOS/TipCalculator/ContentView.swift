//
//  ContentView.swift
//  TipCalculator
//
//  Created by Chen Yue on 23/11/19.
//  Copyright © 2019 Mt. Zendo. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject private var tipViewModel = TipViewModel()
//    @State private var index = 0
    var body: some View {

        VStack{
            TextField("Enter amount: ", text: $tipViewModel.amount)
            .padding()
            Picker(selection: $tipViewModel.tipPrecentage, label: Text("Tip Choices")) {
                ForEach(tipViewModel.tipChoices, id:\.self) { choice in
                    Text("\(choice)").tag(choice)

                }
            }.pickerStyle(SegmentedPickerStyle())
//            .onTapGesture {
//              self.tipViewModel.calculateTip()
//            }
              .padding()
            Text(tipViewModel.tip == nil ? "Tip amount will be displayed here!" : "\(tipViewModel.tip!)")


        }
    }
//
//    @State private var selectedIndex = 0
//    var body: some View {
//       VStack {
//        Picker(selection: $selectedIndex, label: Text("Please choose")) {
//            ForEach(tipViewModel.tipChoices, id:\.self) { choice in
//                Text("\(choice)").tag(choice)
//
//            }
//          }
////        .onTapGesture {
////////                            self.tipViewModel.calculateTip()
////        }
//        Text("You selected: \(selectedIndex)")
//       }.pickerStyle(SegmentedPickerStyle())
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
