class Block {
  int x, y, w, h;
  int state; // 0なら白,1なら黒

  Block(int i, int j,int state){
    this.x = j * 100;
    this.y = i * 25;
    this.state = state;
    w = 100; h = 25;
  }

  // 描画部をここに記述
  void display(){
    switch(state){
      case 0:
        // 白
        fill(255,255,255); 
        break;
      case 1:
        // 黒
        fill(0,0,0); 
        break;
    }
    noStroke();
    rect(x, y, w, h);  // xy座標にwhサイズの四角を描画
  }
  
  // stateを反転させるメソッド
  void changeState(){
    if(state == 0){
      state = 1;
    }else{
      state = 0;
    }
  }
  
  // ブロックに衝突している場所と状態を文字列で返す
  // 上下左右をUDLRとして文字列で管理
  // 例：左のブロックに衝突している場合は"L"
  String getHit(int ballX, int ballY , int ballR ,int ballState){
    // stateがballと違う = 同じ陣営なので早期リターン
    if(state != ballState) return "";
    
    int L = ballX - ballR;
    int R = ballX + ballR;
    int U = ballY - ballR;
    int D = ballY + ballR;
    
    // ボールの左チェック
    if((x <= L && L <= x + w) && (y <= ballY && ballY <= y + h)){
      changeState();
      return "L";
    }
    // ボールの右チェック
    if((x <= R && R <= x + w) && (y <= ballY && ballY <= y + h)){
      changeState();
      return "R";
    }
    // ボールの上チェック
    if((x <= ballX && ballX <= x + w) && (y <= U && U <= y + h)){
      changeState();
      return "U";
    }
    // ボールの下チェック
    if((x <= ballX && ballX <= x + w) && (y <= D && D <= y + h)){
      changeState();
      return "D";
    }
    return "";
  }
}
