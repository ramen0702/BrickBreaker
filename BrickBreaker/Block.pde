class Block {
  int x, y, w, h;
  int state; // 0なら白,1なら黒,-1なら壁

  Block(int i, int j,int state){
    this.x = j * 100;
    this.y = i * 25;
    w = 100; h = 25;    //現状は決め打ちで
    this.state = state;
  }

  //描画部をここに記述
  void display(){
    switch(state){
      case 0:
        fill(255,255,255); // 白
        break;
      case 1:
        fill(0,0,0); // 黒
        break;
      case -1:
        fill(255,127,0); // 壁
        break;
    }
    rect(x, y, w, h);  //xy座標にwhサイズの四角を描画
  }
}
