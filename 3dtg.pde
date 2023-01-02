int cols, rows;
int scl = 20;
int w = 2300;
int h = 1500;
float flying = 0;

float[][] terrain;

void setup() {
  size(600, 600, P3D); 
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
}

void draw() {
  flying -= 0.2;

  float yOffset = flying;
  for (int y = 0; y < rows; y++) {
    float xOffset = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xOffset, yOffset), 0 , 1, -90, 90);
      xOffset += 0.23;
    }
    yOffset += 0.23;
  }

  background(0);
  stroke(255);
  noFill();

  translate(width / 2, height / 2 + 75);
  rotateX(PI/3);
  translate(-w / 2, -h / 2);
 for (int y = 0; y < rows - 1; y++) {
  beginShape(TRIANGLE_STRIP);
  for (int x = 0; x < cols; x++) {
    vertex(x * scl, y * scl, terrain[x][y]);
    vertex(x * scl, (y + 1) * scl, terrain[x][y + 1]);
    //rect(x * scl, y * scl, scl, scl);
  }
  endShape();
 }

}
