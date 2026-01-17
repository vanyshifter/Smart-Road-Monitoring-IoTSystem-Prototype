#include <Arduino.h>
#include <WiFi.h>
#include <HTTPClient.h>

// --- 1. KONFIGURASI WIFI ---
const char* ssid = "pureblood";          
const char* password = "shifteddone8"; 

// --- 2. KONFIGURASI SERVER ---
// IP ini diambil dari screenshot ipconfig kamu (Wireless LAN adapter Wi-Fi)
const char* serverUrl = "http://192.168.0.200/parkir-iot/api.php"; 

// Pin sensor IR
const int sensorPin = 33;

// Variabel untuk melacak perubahan status
int lastStatus = -1; 
int currentStatus = 0;

// --- FUNGSI KIRIM DATA KE DATABASE ---
void sendDataToServer(int status) {
  // Cek koneksi WiFi
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("Error: WiFi putus! Tidak bisa kirim data.");
    return;
  }

  HTTPClient http;
  WiFiClient client; 

  Serial.println(">> Mengirim data ke Server...");
  Serial.print(">> URL: ");
  Serial.println(serverUrl);

  // Mulai koneksi
  http.begin(client, serverUrl);
  http.addHeader("Content-Type", "application/x-www-form-urlencoded");

  // Format data: slot_id=1 & status=(0 atau 1)
  String postData = "slot_id=1&status=" + String(status);

  // Kirim POST
  int httpResponseCode = http.POST(postData);

  // Cek Respon
  if (httpResponseCode > 0) {
    String response = http.getString();
    Serial.println("   Status Code: " + String(httpResponseCode));
    Serial.println("   Respon Server: " + response);
  } else {
    Serial.print("   Error mengirim POST: ");
    Serial.println(httpResponseCode);
  }

  http.end();
}

// --- SETUP ---
void setup() {
  Serial.begin(115200);
  delay(2000); // Jeda agar Serial Monitor siap

  Serial.println("\n\n--- MULAI SISTEM PARKIR IOT ---");

  // Setup Pin
  pinMode(sensorPin, INPUT);

  // Koneksi WiFi
  Serial.print("Menghubungkan ke WiFi: ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);

  // Tunggu koneksi (Timeout supaya tidak stuck selamanya)
  int retry = 0;
  while (WiFi.status() != WL_CONNECTED && retry < 20) {
    delay(500);
    Serial.print(".");
    retry++;
  }

  if (WiFi.status() == WL_CONNECTED) {
    Serial.println("\nWiFi Terhubung!");
    Serial.print("IP Address ESP32: ");
    Serial.println(WiFi.localIP());
    Serial.println("Server Target: " + String(serverUrl));
  } else {
    Serial.println("\nGAGAL KONEK WIFI! Cek nama/password.");
  }
}

// --- LOOP ---
void loop() {
  // Hanya jalan jika WiFi connect
  if (WiFi.status() == WL_CONNECTED) {
    
    // 1. Baca Sensor (LOW = Ada Mobil)
    int sensorValue = digitalRead(sensorPin);
    
    if (sensorValue == LOW) {
      currentStatus = 1; 
    } else {
      currentStatus = 0;
    }

    // 2. Jika Status Berubah, Kirim Data
    if (currentStatus != lastStatus) {
      Serial.println("\n===============================");
      Serial.print("Status Berubah: ");
      Serial.println(currentStatus == 1 ? "TERISI" : "KOSONG");

      sendDataToServer(currentStatus);
      lastStatus = currentStatus;
    }

  }
  
  delay(100); // Delay kecil untuk stabilitas
}