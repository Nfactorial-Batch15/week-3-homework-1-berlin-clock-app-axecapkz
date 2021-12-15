//
//  TimePickerFrame.swift
//  Berlin Clock App
//
//  Created by Azamat Kenjebayev on 12/14/21.
//

import SwiftUI

struct TimePickerFrame: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(CustomColor.bgFrameOriginal)
                .frame(height: 54)
                .padding()
        }
    }
}

struct TimePickerFrame_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerFrame()
    }
}
