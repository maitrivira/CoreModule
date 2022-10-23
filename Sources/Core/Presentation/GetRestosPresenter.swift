//
//  File.swift
//  
//
//  Created by Maitri Vira on 20/05/22.
//

import SwiftUI
import RxSwift

public class GetRestosPresenter<Request, Response, Interactor: UseCase>: ObservableObject where Interactor.Request == Request, Interactor.Response == [Response]{

    private let disposeBag = DisposeBag()
    private let _useCase: Interactor
    private let _keyStoreFavoriteResto: String = "FavoriteResto"
    @Published public var favoriteResto: [String] = []
    @Published public var listFavorite: Response?
    @Published public var list: [Response] = []
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    @Published public var isSaved: Bool = false

    public init(useCase: Interactor) {
        _useCase = useCase
        getFavoriteFromUD()
    }

    public func getList(request: Request?) {
        isLoading = true
        _useCase.execute(request: request)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.list = result
                filterFavorite()
            } onError: { error in
                self.errorMessage = error.localizedDescription
                self.isError = true
                self.isLoading = false
            } onCompleted: {
                self.isLoading = false
            }.disposed(by: disposeBag)
    }
    
    func filterFavorite() {
        for data in list {
            for id in favoriteResto {
                if data.id == id {
                    listFavorite.append(data)
                }
            }
        }
        print("data favorite", listFavorite)
    }
    
    public func getFavoriteFromUD() {
        favoriteResto = UserDefaults.standard.object(forKey: self._keyStoreFavoriteResto) as? [String] ?? [""]
    }

}
