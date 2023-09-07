//
//  SPage.swift
//  MaskUtils
//
//  Created by Mikhail Belikov on 07.09.2023.
//

import Foundation
import SwiftUI

public struct SuccessPage: View {

    public init() {}

    public var body: some View {
        ZStack {
//            ColorsSdk.gray30
//            ColorsSdk.bgBlock

            GeometryReader { metrics in
                let iconSize = metrics.size.width * 0.60

                VStack {
                    Spacer().frame(height: metrics.size.height * 0.20)

                    Image("icPaySuccess")
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                            .padding(.bottom, 37)

                    Text("success")
//                            .textStyleH3()
                            .frame(alignment: .center)

                    Spacer()
                            .frame(height: metrics.size.height * 0.35)
                            .frame(width: metrics.size.width * 1.0)


                }
            }
        }
    }
}

