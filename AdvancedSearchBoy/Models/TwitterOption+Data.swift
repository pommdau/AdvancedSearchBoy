//
//  TwitterOption+Data.swift
//  AdvancedSearchBoy
//
//  Created by HIROKI IKEUCHI on 2022/08/28.
//

import Foundation

extension TwitterOption {

    /// TwitterOptionの作成/編集時の受け渡し用のデータクラス
    struct Data {
        var title: String = ""
        var sortedType: TwitterOption.SortedType = .live
        var words: [String] = []
        var excludingWords: [String] = []
        var hashtags: [String] = []
        var mediaType: MediaType = .none
        var minFavorites: Double = 0
        var minRetweets: Double = 0
        var createdSince: Date?
        var createdUntil: Date?
    }

    /// QiitaOption -> QiitaOption.Data
    var data: Data {
        Data(title: title,
             sortedType: sortedType,
             words: words,
             excludingWords: excludingWords,
             hashtags: hashtags,
             mediaType: mediaType,
             minFavorites: Double(minFavorites),
             minRetweets: Double(minRetweets),
             createdSince: createdSince,
             createdUntil: createdUntil)
    }

    /// QiitaOption.Data -> QiitaOption
    init(data: Data) {
        self.init(title: data.title,
                  sortedType: data.sortedType,
                  words: data.words,
                  excludingWords: data.excludingWords,
                  hashtags: data.hashtags,
                  mediaType: data.mediaType,
                  minFavorites: Int(data.minFavorites), maxRetweets: Int(data.minRetweets),
                  createdSince: data.createdSince, createdUntil: data.createdUntil)
    }

    mutating func update(from data: Data) {
        self.title = data.title
        self.sortedType = data.sortedType
        self.words = data.words
        self.excludingWords = data.excludingWords
        self.hashtags = data.hashtags
        self.mediaType = data.mediaType
        self.minFavorites = Int(data.minFavorites)
        self.minRetweets = Int(data.minRetweets)
        self.createdSince = data.createdSince
        self.createdUntil = data.createdUntil
    }
}
