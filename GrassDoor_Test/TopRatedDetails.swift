//
//  TopRatedDetails.swift
//  GrassDoor_Test
//
//  Created by Rameshwar Gupta on 16/07/22.
//

import SwiftUI

struct TopRatedDetails: View {
    
    @State var navigationTitle = ""
    
    var lblDesc = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    
    let targetSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height / 2.9)
    
    let youtubeId = "3jXy8RUVVZU"
    
    @State var comment: String = ""
    
    @State private var showText = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

        var backButton : some View {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack(spacing: 0) {
                    Image("back")
                        .font(.title2)
                    Text(navigationTitle)
                        .foregroundColor(.white)
                }
            }
        }
    
    
    var body: some View {
       // NavigationView {
            List() {
                VStack(alignment: .leading) {
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                        .frame(width: targetSize.width, height: targetSize.height, alignment: .center)
                        .background(Color.init(hex: "#FEF5E7"))
                    Text("Movie Title").font(.title)
                    Divider()
                    Text(lblDesc)
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                    Divider()
                    HStack {
                        Button("Watch Trailer") {
                            print("Button tapped!")
                            if let youtubeURL = URL(string: "youtube://\(youtubeId)"),
                               UIApplication.shared.canOpenURL(youtubeURL) {
                                // redirect to app
                                UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
                            } else if let youtubeURL = URL(string: "https://www.youtube.com/watch?v=\(youtubeId)") {
                                // redirect through safari
                                UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
                            }
                        }
                        .buttonStyle(GrowingButton())
                        .padding(.horizontal, 8).lineLimit(1).minimumScaleFactor(0.4)
                        
                        VStack {
                            Button("Add Comment") {
                                showText.toggle()
                            }
                            .buttonStyle(GrowingButton())
                            .padding(.horizontal, 8).lineLimit(1).minimumScaleFactor(0.4)
                        }
                    }
                    
                    
                    if showText {
                        TextField("Comment here", text: $comment, onEditingChanged: { (changed) in
                            print("Username onEditingChanged - \(comment)")
                        }) {
                            print("Username onCommit")
                        }
                        .padding()
                    }
                    
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)

    }
}

struct TopRatedDetails_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedDetails()
    }
}


struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

