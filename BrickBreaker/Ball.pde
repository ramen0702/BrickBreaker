class Ball{
  int x,y,vecX,vecY; // 座標とベクトル
  int r; // 半径r
  int state; // 0なら白,1なら黒
  
  Ball(int x,int y,int vecX,int vecY,int state){
    this.x = x;
    this.y = y;
    this.vecX = vecX;
    this.vecY = vecY;
    this.state = state;
    r = 10;
  }
  
  //描画部をここに記述
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
    circle(x,y,r); // xy座標に半径rの正円を描画
  }
  
  // ボールの移動
  void move(){
    x += vecX;
    y += vecY;
  }
  
  // ボールの跳ね返り
  void hitX(){
    vecX *= -1;
  }
  void hitY(){
    vecY *= -1;
  }
  
  // 壁当たっているか判定し、当たって入れば跳ね返る
  void wallHitCheck(){
    if(x - r <= 0){
      hitX();
    }
    if(x + r >= 600){
      hitX();
    }
    if(y - r <= 0){
      hitY();
    }
    if(y + r >= 100){
      hitY();
    }
  }
}
