//
//  MainFrame.swift
//  Berlin Clock App
//
//  Created by Azamat Kenjebayev on 12/14/21.
//

import SwiftUI

struct MainFrame: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(CustomColor.bgFrameOriginal)
                .padding(.horizontal, 16)
                .padding(.vertical, 32)
            VStack(alignment: .center, spacing: 16){
                HStack {
//                    secondsRow
                }
////                fiveHoursRow
//                OneHourRow()
//                FiveMinutesRow()
//                OneMinuteRow()
//                
            }
        }
        //        .padding(.top, 10)
        .frame(height: 358)
    }
}

struct MainFrame_Previews: PreviewProvider {
    static var previews: some View {
        MainFrame()
    }
}
