// MARK: IMPORTANT🚨
/* For easy of copy/pastability, all code is in one bug chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

/* Idealy, you would NOT be using pre-defined constants in this way, so keep that in mind.*/

import SwiftUI

/* Defining all constants used in the view.*/
fileprivate var defaultRadius:              CGFloat = 24
fileprivate var basePadding:                CGFloat = 16

fileprivate let lightShadowColor                    = Color(.displayP3, red: 0.95, green: 0.95, blue: 1, opacity: 1.0)
fileprivate let darkShadowColor                     = Color(.displayP3, red: 0.1803, green: 0.0470, blue: 0.4627, opacity: 1.0)
fileprivate let pinkAccentColor                     = Color(.displayP3, red: 1, green: 0.04, blue: 0.56, opacity: 1.0)
fileprivate let purpleAccentColor                   = Color(.displayP3, red: 0.39, green: 0.1, blue: 0.9, opacity: 1.0)
fileprivate let yellowAccentColor                   = Color(.displayP3, red: 1, green: 0.7843, blue: 0, opacity: 1.0)

fileprivate let titleFont                           = Font.system(size: 24, weight: .bold, design: .rounded)
fileprivate let detailFont                          = Font.system(size: 18, weight: .semibold, design: .rounded)
fileprivate let subtitleFont                        = Font.system(size: 16, weight: .medium, design: .rounded)

struct CardWithImage: View {
    
    /*
     Environtment is used just to make it easier to preview light and dark look in one view setup.
     You should create a new semantic color in the assets and use it that way 👌
     */
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        let shadowColor     = colorScheme == .dark ? darkShadowColor : lightShadowColor
        let backgroundColor = colorScheme == .dark ? purpleAccentColor : Color.white
        let accent          = colorScheme == .dark ? yellowAccentColor : pinkAccentColor
        let textColor       = colorScheme == .dark ? Color.white : Color.black
        
        ZStack {
            RoundedRectangle(cornerRadius: defaultRadius, style: .continuous)
                .foregroundColor(backgroundColor)
                .shadow(color: shadowColor, radius: defaultRadius)
            
            VStack {
                Text("title")
                    .font(titleFont)
                    .foregroundColor(accent)
                    .padding(.top, basePadding)
                
                Image(systemName: "photo.fill.on.rectangle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(accent)
                    .padding(basePadding)
                
                // MARK: Name and Category ------------------
                Text("detail")
                    .font(detailFont)
                    .foregroundColor(textColor)
                Text("subtitle")
                    .font(subtitleFont)
                    .foregroundColor(textColor)
                    .padding(.bottom, basePadding)
            }
        }
        .frame(width: 160, height: 180)
    }
}

struct CardWithImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardWithImage()
                .padding(100)
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.light)
            CardWithImage()
                .padding(100)
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

/*
 Awesome Sauce!
 Thank you for getting one of my views, hope you are happy with it 👌
 Consider helping this train rollin 🚂 on my Patreon -> https://www.patreon.com/swiftui
 
 If you have any suggestions for improvements,
 feel free to reach me at undead.pix3l@gmail.com
 */
