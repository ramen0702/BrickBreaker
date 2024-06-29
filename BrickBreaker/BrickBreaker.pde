// ブロックは4*5
Block[][] blocks = new Block[4][6];
Ball blackBall = new Ball(150,50,1,1,1);
Ball whiteBall = new Ball(450,50,-1,-1,0);

//プログラム開始時に一度だけ実行される関数
void setup(){
  size(800,450);  //画面の幅を800px, 高さを450pxに設定
  for(int i = 0; i < 4;i++){
    for(int j = 0; j < 6;j++){
      if(j < 3){
        blocks[i][j] = new Block(i,j,0);
      }else{
        blocks[i][j] = new Block(i,j,1);
      }
    }
  }
}

//setup()の後、毎秒６０回呼ばれる関数
void draw(){
  background(145);    //背景はグレー
  // 描画
  for(int i = 0; i < 4;i++){
    for(int j = 0; j < 6;j++){
      blocks[i][j].display();
    }
  }
  blackBall.display();
  whiteBall.display();
  
  // 移動
  blackBall.move();
  whiteBall.move();
  
  // 跳ね返りを判定
  // 壁の判定
  blackBall.wallHitCheck();
  whiteBall.wallHitCheck();
  // ブロックの判定
  for(int i = 0; i < 4;i++){
    for(int j = 0; j < 6;j++){
      // 黒玉の判定
      String hit = blocks[i][j].getHit(blackBall.x ,blackBall.y , blackBall.r , blackBall.state); 
      switch(hit){
        case "U":
          blackBall.hitY();
          break;
        case "D":
          blackBall.hitY();
          break;
        case "L":
          blackBall.hitX();
          break;
        case "R":
          blackBall.hitX();
          break;
      }
      // 白玉の判定
      hit = blocks[i][j].getHit(whiteBall.x ,whiteBall.y , whiteBall.r , whiteBall.state); 
      switch(hit){
        case "U":
          whiteBall.hitY();
          break;
        case "D":
          whiteBall.hitY();
          break;
        case "L":
          whiteBall.hitX();
          break;
        case "R":
          whiteBall.hitX();
          break;
      }
    }
  }
}
