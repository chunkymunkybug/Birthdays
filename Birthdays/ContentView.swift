//
//  ContentView.swift
//  Birthdays
//
//  Created by Scholar on 8/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var friends: [Friend] = [
        Friend (name:"Maddy", birthday: .now),
        Friend (name:"Sally", birthday: .now)
    ]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    var body: some View {
        NavigationStack {//beginning of navStack

        List(friends, id: \.name) {friend in
            HStack {
                Text(friend.name)
                Spacer ()
                Text (friend.birthday, format:
                    .dateTime.month (.wide).day()
                    .year ())
                } //end of HStack
            } //end of list
            
        .navigationTitle("Birthdays")
        .safeAreaInset(edge: .bottom){
            VStack(alignment: .center, spacing: 20){
                Text ("New Birthday")
                    .font(.headline)
                DatePicker(selection:
                            $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                    TextField("Name", text:$newName)
                        .textFieldStyle(.roundedBorder)
                }//end of DatePicker
                Button ("Save"){
                    let newFriend =
                        Friend(name: newName, birthday: newBirthday)
                    friends.append (newFriend)
                    newName = ""
                    newBirthday = .now
                }
                
                }//end of VStack
            .padding ()
            .background(.bar)

            }//end of safeAreaInset
        }//end of NavStack
    }//end of var body: some View
} //end of struct content view

#Preview {
    ContentView()
}


