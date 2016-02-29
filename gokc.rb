class Gokc < Formula
  gokc_version = '0.3.1'
  homepage 'https://github.com/yuuki1/gokc'
  version gokc_version

  if Hardware.is_64_bit?
    url "https://github.com/yuuki1/gokc/releases/download/v#{gokc_version}/gokc_darwin_amd64.zip"
    sha256 '4050c9d24f820133c03a7dd1bbdbea771a7dc8eb482accdd865314aa6f4cf4e0'
  else
    url "https://github.com/yuuki1/gokc/releases/download/v#{gokc_version}/gokc_darwin_386.zip"
    sha256 '608a2b7da47c6e6d33cd5dbe6f0c17d80659d563c97cfd86d91efd46365bc16b'
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
