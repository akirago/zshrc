# zshrc
zshで気軽にaliasを使いこなせるようにするリポジトリ

## 前提
zshモードになっている\
.zshrcがない、または何も書かれていない（上書きされるので元々の設定は全部消えます）

## やり方

### 初期化
```chmod a+rx apply.sh init.sh```\
```./init.sh```

### 修正方法
```./apply.sh```

#### 参考: zshモード変更方法
```brew install zsh```\
```chsh -s /usr/local/bin/zsh```