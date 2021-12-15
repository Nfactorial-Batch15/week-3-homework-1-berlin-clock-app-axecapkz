//
//  MainView.swift
//  Berlin Clock App
//
//  Created by Azamat Kenjebayev on 12/14/21.
//

import SwiftUI

struct MainView: View {
    @State private var timePicker = Date()
    @State var berlinDate: [String] = []
    @State var normalClock: String = ""
       
    let rowShape =  RoundedRectangle(cornerRadius: 16, style: .continuous)
    
    var body: some View {
        
        ZStack{
            CustomColor.bgColorOriginal
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 0){
                CustomTitle(text: "Time is \(timePicker.formatted(date: .omitted, time: .standard))")

//                CustomTitle(text: "Time is \($timePicker)")
                    .padding(.top, 70)
                ZStack{
                    MainFrame()
                    VStack{
                        if(berlinDate.count>0){
                            secondsRow
                            fiveHoursRow
                            fiveMinutesRow
                            oneHourRow
                            oneMinuteRow
                        }
                    }
                }
                Spacer()
                ZStack{
                    TimePickerFrame()
                    HStack{
                        CustomText(text: "Insert time")
                            .frame(width: 190, height: 24, alignment: .leading)
                            .padding(.leading, 32)
                        ZStack{
                            datePicker(timePicker: $timePicker)
                                .onChange(of: timePicker, perform: { newValue in
                                    showTime()
                                })
                                .environment(\.locale, Locale(identifier: "ru_RU"))
                                .padding(.trailing, 32)
                        }
                    }
                }
                .padding(.bottom, 300)            }
        }
        .onAppear {
            showTime()
        }
    }
    
    var secondsRow: some View {
        HStack{
            Circle()
                .fill(berlinDate[0] == "Y" ? CustomColor.yellowOn : CustomColor.yellowOff)
                .frame(width: 56, height: 56, alignment: .center)
            //            }
        }
    }
    
    var fiveHoursRow: some View {
        HStack{
            ForEach((1..<5)) {i in
                rowShape
                    .fill(berlinDate[i] == "R" ? CustomColor.redOn : CustomColor.redOff)
                    .frame(width: CustomShapes.hmRowWidth, height: CustomShapes.hmRowHeight)
            }
        }
    }
    
    var fiveMinutesRow: some View {
        HStack {
            ForEach((5..<9)) {i in
              rowShape
                    .fill(berlinDate[i] == "R" ? CustomColor.redOn : CustomColor.redOff)
                    .frame(width: CustomShapes.hmRowWidth, height: CustomShapes.hmRowHeight)
            }
        }
    }
    
    var oneHourRow: some View {
        HStack {
            Group {
                ForEach((9..<20)) {i in
                   rowShape
                        .fill(berlinDate[i] == "Y" ? CustomColor.yellowOn : (berlinDate[i] == "R" ? Color.red : CustomColor.yellowOff))
                        .frame(width: CustomShapes.minutesRowWidth, height: CustomShapes.minutesRowHeight)
                }
            }
        }
    }
    
    var oneMinuteRow: some View {
        HStack {
            ForEach((20..<24)) {i in
                rowShape
                    .fill(berlinDate[i] == "Y" ? CustomColor.yellowOn : CustomColor.yellowOff)
                    .frame(width: CustomShapes.hmRowWidth, height: CustomShapes.hmRowHeight)
            }
        }
    }
    
    func showTime(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
            let date = Date()
            let calendar = Calendar.current
            let seconds = calendar.component(.second, from: date)
            let minutes = calendar.component(.minute, from: date)
            let hours = calendar.component(.hour, from: date)
            let berlinClock = BerlinClock()
            normalClock = "\(hours):\(minutes):\(seconds)"
            berlinDate = berlinClock.berlinClock(hours: hours, minutes: minutes, seconds: seconds).map{String($0)}
        })
            .fire()
    }
}

struct datePicker: View {
    @Binding var timePicker: Date
    var body: some View {
        DatePicker("", selection: $timePicker, displayedComponents: .hourAndMinute)
    .environment(\.locale, Locale(identifier: "ru_RU"))
    .labelsHidden()
    .datePickerStyle(.compact)
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
