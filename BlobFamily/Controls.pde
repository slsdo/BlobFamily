
void mousePressed () {
  // Get mouse position
  PVector m = new PVector(mouseX, mouseY);
  // Look for a particle the mouse is in
  int bnum = blobs.size();
  for (int i = 0; i < bnum; i++) {
    ParticleSystem b = (ParticleSystem) blobs.get(i);
    int pnum = b.blob.size();
    for (int j = 0; j < pnum; j++) {
      Particle p = (Particle) b.blob.get(j);
      // If the mouse is close to the particle
      if (dist2(p.pos, m) < sq(p.mass + 10)) {
        if (mouseButton == LEFT) p.drag = true;
        break; // Break out of the loop because we found our particle
      }
    }
  }
}

void mouseReleased() {
  // User is no-longer dragging
  int bnum = blobs.size();
  for (int i = 0; i < bnum; i++) {
    ParticleSystem b = (ParticleSystem) blobs.get(i);
    int pnum = b.blob.size();
    for (int j = 0; j < pnum; j++) {
      Particle p = (Particle) b.blob.get(j);
      if (p.drag) {
        p.drag = false;
        break;
      }
    }
  }
}

void keyPressed() {
         if (key == 'w' || (key == CODED && keyCode == UP)) keys[0] = true;
    else if (key == 'a' || (key == CODED && keyCode == LEFT)) keys[1] = true;
    else if (key == 's' || (key == CODED && keyCode == DOWN)) keys[2] = true;
    else if (key == 'd' || (key == CODED && keyCode == RIGHT)) keys[3] = true;

    if (key == ' ' && jump == 0) jump = 1;
    if (key == 'g') { enable_gravity = !enable_gravity; }
    if (key == 'l') { d_lock1 = !d_lock1; }
    if (key == 's') { STRUCT = !STRUCT; }
    if (key == 'd') { DEBUG = !DEBUG; }

    if (key == '1') {
      blobs = new ArrayList();
      addTest2P();
    }

    if (key == '2') {
      blobs = new ArrayList();
      addVerletBlob(20, width/2, height/2, 150, 200, 250, 10);
    }

    if (key == '3') {
      blobs = new ArrayList();
      addBracedBlob(20, width/2, height/2, 50, 80, 120, 10);
    }

    if (key == '4') {
      blobs = new ArrayList();
      addSkinnedBlob(20, width/2, height/2, 50, 65, 10, 50);
    }
}

void keyReleased() {
         if (key == 'w' || (key == CODED && keyCode == UP)) keys[0] = false;
    else if (key == 'a' || (key == CODED && keyCode == LEFT)) keys[1] = false;
    else if (key == 's' || (key == CODED && keyCode == DOWN)) keys[2] = false;
    else if (key == 'd' || (key == CODED && keyCode == RIGHT)) keys[3] = false;

    if (key == ' ' || jump == -1) jump = 0;
}

