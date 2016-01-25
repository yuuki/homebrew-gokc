class Gokc < Formula
  gokc_version = '0.1.0'
  homepage 'https://github.com/yuuki1/gokc'
  version gokc_version

  if Hardware.is_64_bit?
    url "https://github.com/yuuki1/gokc/releases/download/v#{gokc_version}/gokc_darwin_amd64.zip"
    sha256 '4fb4fec5d5e3a32b40e5c5effd31bd67ec44e377f428a954159d52bb6681f395'
  else
    url "https://github.com/yuuki1/gokc/releases/download/v#{gokc_version}/gokc_darwin_386.zip"
    sha256 '43bf663bf4f6589d6c23ffb33d9b1daec064e0b6f79da9136f59408b951ae07e'
  end

  head do
    url 'https://github.com/yuuki1/gokc.git'
    depends_on 'go' => :build
    depends_on 'git' => :build
  end

  def install
    if build.head?
      ENV['GOPATH'] = buildpath/'.go'
      mkdir_p buildpath/'.go/src/github.com/yuuki1'
      ln_s buildpath, buildpath/'.go/src/github.com/yuuki1/gokc'
      system 'make', 'build'
    end
    bin.install 'gokc'
  end

  test do
    system 'gokc', '-v'
  end
end
