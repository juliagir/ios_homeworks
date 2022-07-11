//
//  PhotosArray.swift
//  Navigation
//
//  Created by Julia Ghirnic on 08.07.2022.
//

import UIKit

var photosArray:[UIImage] = []

func createPhotosArray() {
    photosArray = (0...19).compactMap { UIImage(named: "image\($0)")?.resizeWithWidth(width: 300) }
}
