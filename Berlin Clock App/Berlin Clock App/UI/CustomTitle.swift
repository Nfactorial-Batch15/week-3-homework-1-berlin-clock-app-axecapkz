//
//  CustomTitle.swift
//  Berlin Clock App
//
//  Created by Azamat Kenjebayev on 12/14/21.
//

import SwiftUI

struct CustomTitle: View {
    let text: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
        Text(text)
                .fontWeight(.regular)
            .font(.system(size: 17))
            .frame(maxWidth: .infinity)
            .foregroundColor(CustomColor.moonraker)
        }
    }
}

struct CustomText: View {
    let text: String
    
    var body: some View {
        
        VStack (alignment: .center, spacing: 0){
            Text(text)
                .font(.headline)
                .fontWeight(.semibold)
                .font(.system(size: 17))
            .frame(height: 22)
        }
    }
}

struct CustomTitle_Previews: PreviewProvider {
    static var previews: some View {
        CustomTitle(text: "Time is ")
    }
}
