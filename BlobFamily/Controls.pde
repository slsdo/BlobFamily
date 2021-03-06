
void mousePressed() {
  // Get mouse position
  PVector m = new PVector(mouseX, mouseY);  
  // Look for a particle the mouse is in
  int bsize = blobs.size();
  for (int i = 0; i < bsize; i++) {
    ParticleSystem ps = (ParticleSystem) blobs.get(i);    
    int psize = ps.particles.size();
    for (int j = 0; j < psize; j++) {
      Particle p = (Particle) ps.particles.get(j);      
      // If the mouse is close to the particle
      if (dist2(p.pos, m) < sq(p.mass + 20)) {
        if (mouseButton == LEFT) p.drag = true;
        break; // Break out of the loop because we found our particle
      }
    }
  }
  // When mouse is pressed, blob will move toward the mouse
  if (!follow_m) follow_m = true;
}

void mouseReleased() {
  // User is no-longer dragging
  int bsize = blobs.size();
  for (int i = 0; i < bsize; i++) {
    ParticleSystem ps = (ParticleSystem) blobs.get(i);
    int psize = ps.particles.size();
    for (int j = 0; j < psize; j++) {
      Particle p = (Particle) ps.particles.get(j);
      if (p.drag) {
        p.drag = false;
        break;
      }
    }
  }
  follow_m = false;
}

void keyPressed() {
  // Movements
       if (key == CODED && keyCode == UP) keys[0] = true;
  else if (key == CODED && keyCode == LEFT) keys[1] = true;
  else if (key == CODED && keyCode == DOWN) keys[2] = true;
  else if (key == CODED && keyCode == RIGHT) keys[3] = true;
  
  if (key == CODED && enable_ai) enable_ai = !enable_ai; // User move overrides AI
  
  if (key == 'g') enable_gravity = !enable_gravity; // Enable gravity
  if (key == 'l') d_lock1 = !d_lock1; // Lock first particle
  if (key == 'd') DEBUG = !DEBUG; // Debug view
  if (key == 'm') enable_metaball = !enable_metaball; // Lock first particle
  if (key == 'a') for (int i = 0; i < blobs.size(); i++) { blobs.get(i).mb_size -= 10; }
  if (key == 's') for (int i = 0; i < blobs.size(); i++) { blobs.get(i).mb_size += 10; }
  if (key == 'z') for (int i = 0; i < blobs.size(); i++) { blobs.get(i).mb_thresh -= 10; }
  if (key == 'x') for (int i = 0; i < blobs.size(); i++) { blobs.get(i).mb_thresh += 10; }
  if (key == 'f') show_fps = !show_fps;
  if (key == 'q') enable_ai = !enable_ai;
  if (key == ' ') blobs = new ArrayList(); // Reset blobs
  
  if (key == '1') addVerletBlob(10, 10, 15, 20, 10, width/2, height/2, 1, 40, 300, 300); // Small verlet
  if (key == '2') addVerletBlob(10, 20, 30, 40, 10, width/2, height/2, 1, 140, 300, 300); // Big verlet
  if (key == '3') addBracedBlob(10, 10, 15, 18, 10, width/2, height/2, 1, 40, 300, 300); // Small braced
  if (key == '4') addBracedBlob(10, 20, 30, 35, 10, width/2, height/2, 1, 140, 300, 300); // Big braced
  if (key == '5') addTarBlob(10, 5, 20, 40, 10, width/2, height/2, 1, 60, 300, 300); // Small tar
  if (key == '6') addTarBlob(10, 10, 40, 80, 10, width/2, height/2, 1, 240, 300, 300); // Medium tar
  if (key == '7') { enable_metaball = false; addVerletBlob(30, 80, 120, 150, 10, width/2, height/2, 1, 40, 300, 300); } // BIG verlet
  if (key == '8') { enable_metaball = false; addBracedBlob(20, 80, 120, 150, 10, width/2, height/2, 1, 40, 300, 300); } // BIG braced
  if (key == '9') { enable_metaball = false; addSkinnedBlob(60, 100, 120, 10, 10, width/2, height/2, 1, 40, 300, 300); } // BIG skinned
  if (key == '0') { enable_metaball = false; addTarBlob(40, 20, 100, 300, 10, width/2, height/2, 1, 40, 300, 300); }
  //if (key == 'asd') addSkinnedBlob(40, 50, 60, 10, 100, width/2, height/2, 1, 40, 300, 300);
  //if (key == 'asd') addSkinnedBlob(40, 50, 65, 10, 10, width/2, height/2, 1, 40, 300, 300);
  //if (key == 'asd') addSkinnedBlob(40, 50, 65, 10, 20, width/2, height/2, 1, 40, 300, 300);
}

void keyReleased() {
       if (key == CODED && keyCode == UP) keys[0] = false;
  else if (key == CODED && keyCode == LEFT) keys[1] = false;
  else if (key == CODED && keyCode == DOWN) keys[2] = false;
  else if (key == CODED && keyCode == RIGHT) keys[3] = false;
}
