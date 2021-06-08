//
//  ScoreView.swift
//  Kuchi
//
//  Created by mtAdmin on 2021/6/4.
//

import SwiftUI

struct ScoreView: View {
    
    @Binding var answered: Int
    let questions: Int
    
    init(answered: Binding<Int>, of questions: Int) {
        self._answered = answered
        self.questions = questions
    }
    
    var body: some View {
        HStack {
            Text("\(answered)/\(questions)")
                .font(.caption)
                .padding(4)
            Spacer()
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    
    @State static var score = 45
    static var previews: some View {
        ScoreView(answered: $score, of: 300)
    }
}
