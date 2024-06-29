// ブロックは4*5
Block[][] blocks = new Block[4][6];

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
  background(255);    //背景を真っ白に塗りつぶす
  for(int i = 0; i < 4;i++){
    for(int j = 0; j < 6;j++){
      blocks[i][j].display();
    }
  }
}
