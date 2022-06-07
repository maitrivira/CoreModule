//
//  File.swift
//  
//
//  Created by Maitri Vira on 23/05/22.
//

import SwiftUI
import RxSwift

public class GetSearchPresenter<Response, Interactor: UseCase>: ObservableObject where Interactor.Request == String, Interactor.Response == Response{
    
    private let disposeBag = DisposeBag()
    private let _useCase: Interactor
    
    @Published public var list: Response?
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    
    public var keyword = ""
    
    public init(useCase: Interactor) {
        _useCase = useCase
    }
    
    public func getSearch() {
        isLoading = true
        _useCase.execute(request: keyword)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.list = result
            } onError: { error in
                self.errorMessage = error.localizedDescription
                self.isError = true
                self.isLoading = false
            } onCompleted: {
                self.isLoading = false
            }.disposed(by: disposeBag)
    }
    
}
