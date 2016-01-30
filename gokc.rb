class Gokc < Formula
  gokc_version = '0.3.0'
  homepage 'https://github.com/yuuki1/gokc'
  version gokc_version

  if Hardware.is_64_bit?
    url "https://github.com/yuuki1/gokc/releases/download/v#{gokc_version}/gokc_darwin_amd64.zip"
    sha256 '5679fb318134e6c27fd726955f2d15bf9be21ca9a98110b13b64b1552eb55240'
  else
    url "https://github.com/yuuki1/gokc/releases/download/v#{gokc_version}/gokc_darwin_386.zip"
    sha256 'd263d5dde6d2e466611f73f0ea9855a742d2db9ed4adca9882f368b62b65b786'
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
