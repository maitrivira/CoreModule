//
//  File.swift
//  
//
//  Created by Maitri Vira on 29/05/22.
//

import SwiftUI
import RxSwift

public class FavouritePresenter<Request, Response, Interactor: UseCase>: ObservableObject where Interactor.Request == Request, Interactor.Response == Response{
   
    private let disposeBag = DisposeBag()
    private let _useCase: Interactor
   
    @Published public var list: Response?
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    @Published public var isSaved: Bool = false
    
    public init(useCase: Interactor) {
        _useCase = useCase
    }
    
    func updateFavorite(of data: Request?) {
        isLoading = true
        _useCase.execute(request: data)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.isSaved = result
            } onError: { _ in
                self.errorMessage = "Failed to save detail restaurant"
            } onCompleted: {
                self.isLoading = false
            }.disposed(by: disposeBag)
    }
    
}
