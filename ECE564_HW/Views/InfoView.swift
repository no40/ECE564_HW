//
//  InfoView.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 5/25/20.
//  Copyright © 2020 ECE564. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    
    @ObservedObject var dukePerson : DukePerson
        
    @Binding var canEdit : Bool
    
    var body: some View {
        Form {
            
            Section(header: BasicInfoHeader()) {
                HStack {
                    Text("First Name:").frame(alignment: .leading)
                    Spacer()
                 TextField("Enter first name", text: $dukePerson.firstName)
                    .frame(width: 180, alignment: .trailing)
                    .foregroundColor((!canEdit ? .gray : .black))
                    .font(.callout)
                    .disabled(!canEdit)
                }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
                
                HStack {
                    Text("Last Name:").frame(alignment: .leading)
                    Spacer()
                 TextField("Enter last name", text: $dukePerson.lastName)
                    .frame(width: 180, alignment: .trailing)
                    .foregroundColor((!canEdit ? .gray : .black))
                    .font(.callout)
                    .disabled(!canEdit)
                }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
                
                HStack(spacing: 16) {
                    Text("Hometown:").frame(alignment: .leading)
                    Spacer()
                 TextField("Enter hometown", text: $dukePerson.whereFrom)
                    .frame(width: 180, alignment: .trailing)
                        .foregroundColor((!canEdit ? .gray : .black))
                        .font(.callout)
                        .disabled(!canEdit)
                    }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
                
                HStack(spacing: 16) {
                    Text("Gender:").frame(alignment: .leading)
                    Spacer()
                 TextField("Enter gender", text: $dukePerson.gender)
                    .frame(width: 180, alignment: .trailing)
                        .foregroundColor((!canEdit ? .gray : .black))
                        .font(.callout)
                        .disabled(!canEdit)
                    }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
            }
            Section(header: DukeInfoHeader()) {
                HStack(spacing: 16) {
                    Picker(selection: $dukePerson.role, label: Text("Role")) {
                        ForEach(DukePerson.DukeRole.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .foregroundColor((!canEdit ? .gray : .black))
                        .font(.callout)
                        .disabled(!canEdit)
                    }.padding(.init(top: 2, leading: 0, bottom: 2, trailing: 0))
                
                HStack {
                    Picker(selection: $dukePerson.program, label: Text("Program")) {
                        ForEach(DukePerson.DukeProgram.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .foregroundColor((!canEdit ? .gray : .black))
                        .font(.callout)
                        .disabled(!canEdit)
                    }.padding(.init(top: 2, leading: 0, bottom: 2, trailing: 0))
            }
            Section(header: PersonalInfoHeader()) {
                HStack {
                    Text("Languages:").frame(alignment: .leading)
                    Spacer()
                 TextField("Enter CS Languages", text: $dukePerson.languages)
                    .frame(width: 180, alignment: .trailing)
                        .foregroundColor((!canEdit ? .gray : .black))
                        .font(.callout)
                        .disabled(!canEdit)
                    }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
                
                HStack(spacing: 16) {
                    Text("Hobbies:").frame(alignment: .leading)
                    Spacer()
                 TextField("Enter Hobbies", text: $dukePerson.hobbies)
                    .frame(width: 180, alignment: .trailing)
                        .foregroundColor((!canEdit ? .gray : .black))
                        .font(.callout)
                        .disabled(!canEdit)
                    }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
            }
        }
    }
}

struct BasicInfoHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
            Text("Basic Info")
        }
    }
}

struct DukeInfoHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "briefcase.fill")
            Text("Duke Info")
        }
    }
}

struct PersonalInfoHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "star.circle.fill")
            Text("Personal Info")
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
