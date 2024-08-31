Pod::Spec.new do |spec|

    spec.name         = "MKL-UnicornModule"
    spec.version      = "0.1.0"
    spec.summary      = "UnicornModule framework."
    spec.description  = "It is a Framework to control network and local connections in order to get the data."
    spec.homepage     = "https://github.com/njm181/MKL-UnicornModule"
    spec.license      = { :type => "MIT", :file => "LICENSE" }
    spec.author       = "Nicolas Molina"
    spec.source       = { :git => "https://github.com/njm181/MKL-UnicornModule.git", :tag => "0.1.0" }
    spec.source_files = "MKL-UnicornModule/**/*.{h,m,swift}"
    spec.swift_versions = "5.0"
    spec.platform     = :ios, "13.0"
    spec.dependency "FirebaseFirestore"
    spec.dependency "FirebaseAuth"
    spec.dependency "MKL-NifflersModule", "~> 0.1.5"
  end