//
//  UIElements.swift
//  AstroSwiftSampler (tvOS)
//
//  Created by rocketjeff on 5/16/22.
//

import SwiftUI
import AstroSwiftFoundation

struct Components: View {
    @State var toggleValue: Bool = true
    @State private var progressValue: Double = 3
    let progressTotal:Double = 5
    @State private var isShowingAlert = false
    
    var body: some View {
        HStack{
            // Left side, a form of Astro Components
            // An uncomfortable number of hard coded padding and spacing numbers here, to make it fit on one screen.
            // Revisit in tvOS 16, where focus and scrolling are improved.
            Form{
                Section("Astro Components"){
                    HStack{
                        Text("Status")
                        Spacer()
                        Status(AstroStatus.off)
                        Status(AstroStatus.standby)
                        Status(AstroStatus.normal)
                        Status(AstroStatus.caution)
                        Status(AstroStatus.serious)
                        Status(AstroStatus.critical)
                    }
                    
                    HStack{
                        Text("Status Tag")
                        Spacer()
                        VStack(spacing:10) {
                            Tag(text:AstroStatus.off.description,status: .off)
                            Tag(text:AstroStatus.standby.description,status: .standby)
                            Tag(text:AstroStatus.caution.description,status: .caution)
                        }
                        VStack(spacing:10){
                            Tag(text:AstroStatus.normal.description,status: .normal)
                            Tag(text:AstroStatus.serious.description,status: .serious)
                            Tag(text:AstroStatus.critical.description,status: .critical)
                        }
                    }.padding([.top,.bottom],4)

                    HStack{
                        Text("Tag")
                        Spacer()
                        Tag(text:"Hello")
                    }
                    
                    VStack(spacing:8){
                        HStack{
                            Text("Classification Banners")
                            Spacer()
                        }
                        ClassificationBanner(.unclassified)
                        ClassificationBanner(.cui)
                        ClassificationBanner(.confidential)
                        ClassificationBanner(.secret)
                        ClassificationBanner(.topSecret)
                        ClassificationBanner(.topSecretSCI)
                    }.padding([.top,.bottom],4)

                    HStack{
                        Text("Classification Markers")
                        Spacer()
                       VStack(spacing:10){
                            ClassificationMarker(.unclassified)
                            ClassificationMarker(.cui)
                            ClassificationMarker(.confidential)
                       }
                        VStack(spacing:10){
                            ClassificationMarker(.secret)
                            ClassificationMarker(.topSecret)
                            ClassificationMarker(.topSecretSCI)
                        }
                    }.padding([.top,.bottom],4)

                }
            }

            // Right Side, a form of system components
            Form{
                Section("System Components"){
                    // Toggle
                    Toggle(isOn: $toggleValue) {
                        Text("Toggle")
                    }
                    
                    // Two kinds of progress
                    ProgressView("Progress", value: progressValue, total: progressTotal)
                    ProgressView()
                    
                    // Link
                    Link("External Link", destination: URL(string: "https://www.youtube.com/watch?v=iaJNk8gDxwU")!)
                    
                    // Button and Alert
                    Button(LocalizedStringKey("Show Alert")) {
                        isShowingAlert = true
                    }
                }
            }
            .alert("Sample Alert", isPresented: $isShowingAlert) {
                Button("Continue", role: .cancel) {}
            } message: {
                Text("Hello")
            }
            
        }.navigationBarTitle("Form")
        .background(Color.astroUIBackground) // Set the background color for the whole page
        .tabItem {
            Image(systemName: "switch.2")
            Text("Components")
        }
    }
}

struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Components()
    }
}


