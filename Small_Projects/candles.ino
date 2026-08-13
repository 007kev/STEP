// Pin Definitions
const int BUTTON_PIN    = 27;
const int LED1_PIN      = 13;
const int LED2_PIN      = 12;
const int LED3_PIN      = 14;
const int BLOW_SENSOR   = 34;
const int HEAT_SENSOR   = 35;

// Sensor Thresholds
const int BLOW_THRESHOLD = 1000; // Trigger when reading goes ABOVE 1000
const int HEAT_THRESHOLD = 1590; // Trigger when reading drops BELOW 1750

// Track candle state
bool candleOn = false;

void setup() {
  Serial.begin(115200);

  pinMode(BUTTON_PIN, INPUT_PULLUP);
  pinMode(LED1_PIN, OUTPUT);
  pinMode(LED2_PIN, OUTPUT);
  pinMode(LED3_PIN, OUTPUT);
}

void loop() {
  // Read inputs
  int blowVal = analogRead(BLOW_SENSOR);
  int heatVal = analogRead(HEAT_SENSOR);
  // Serial.print("Heat Sensor Reading: ");
  // Serial.println(heatVal);
  bool buttonPressed = (digitalRead(BUTTON_PIN) == LOW);

  // 1. Turn ON if candle is OFF AND (button is pressed OR heat is detected)
  if (!candleOn && (buttonPressed || heatVal < HEAT_THRESHOLD)) {
    Serial.println("Candle Lit! 🕯️🔥");
    candleOn = true;
    delay(200); // Debounce / prevent rapid re-triggering
  }

  // 2. Turn OFF if candle is ON AND a blow is detected
  if (candleOn && blowVal > BLOW_THRESHOLD) {
    Serial.println("Blow detected! Extinguishing... 🌬️");
    candleOn = false;
    delay(200);
  }

  // 3. Update LED state
  if (candleOn) { 
    // Random PWM values create the flickering effect
    analogWrite(LED1_PIN, random(100, 256));
    analogWrite(LED2_PIN, random(100, 256));
    analogWrite(LED3_PIN, random(100, 256));
    delay(80); 
  } else {
    analogWrite(LED1_PIN, 0);
    analogWrite(LED2_PIN, 0);
    analogWrite(LED3_PIN, 0);
  }
}