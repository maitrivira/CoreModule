//
//  File.swift
//  
//
//  Created by Maitri Vira on 18/09/22.
//

import SwiftUI
import RxSwift

public class DetailPresenter<DetailRestoUseCase: UseCase, FavUseCase: UseCase>: ObservableObject
where
    DetailRestoUseCase.Request == String,
    DetailRestoUseCase.Response == DetailRestaurantDomainModel,
    FavUseCase.Request == Any,
    FavUseCase.Response == [RestaurantDomainModel]
{
    
    private let disposeBag = DisposeBag()
    
    private let _detailUseCase: DetailRestoUseCase
    private let _favUseCase: FavUseCase
    
    @Published public var list: Response?
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    @Published public var isSaved: Bool = false
    
    public init(detailUseCase: DetailRestoUseCase, favUseCase: FavUseCase) {
        _detailUseCase = detailUseCase
        _favUseCase = favUseCase
    }
}
