# 🌱 Smart Farm Control (Flutter + Firebase)

Smart Farm Control เป็นแอปพลิเคชันสำหรับควบคุมระบบฟาร์มอัจฉริยะผ่านสมาร์ตโฟน พัฒนาด้วย **Flutter** และเชื่อมต่อกับ **Firebase Realtime Database** เพื่อควบคุมอุปกรณ์ต่าง ๆ ภายในระบบปลูกผัก เช่น ปั๊มน้ำ พัดลม ไฟ และปั๊มปุ๋ย

โปรเจกต์นี้เป็นส่วนหนึ่งของระบบ **Smart Farm / IoT Agriculture System**

---

# 📱 Features

* 🔄 เปลี่ยนโหมดการทำงาน

  * AUTO (ทำงานอัตโนมัติ)
  * MANUAL (ควบคุมเอง)

* 🌿 เลือกโปรไฟล์พืช

  * คะน้า (Kale)
  * กรีนคอส (Green Cos)

* ⚙️ ควบคุมอุปกรณ์ในฟาร์ม

  * Water Pump
  * Fan
  * Light
  * Mix Pump
  * Fertilizer A Pump
  * Fertilizer B Pump
  * Acid Pump
  * Base Pump

* ☁️ เชื่อมต่อกับ Firebase Realtime Database เพื่อควบคุมอุปกรณ์แบบ Real-time

---

# 🧰 Technologies Used

* Flutter
* Dart
* Firebase Core
* Firebase Realtime Database
* IoT System

---

# 📂 Project Structure

```
lib/
 └── main.dart
```

ไฟล์ `main.dart` ทำหน้าที่

* เชื่อมต่อ Firebase
* สร้าง User Interface สำหรับควบคุมอุปกรณ์
* ส่งค่าการควบคุมไปยัง Firebase Database

---

# 🔥 Firebase Database Structure

ตัวอย่างโครงสร้างของ Firebase Realtime Database

```
mode: auto

profile: kale

pump
 ├─ water: true
 ├─ fan: false
 ├─ light: true
 ├─ mix: false
 ├─ fertA: false
 ├─ fertB: false
 ├─ acid: false
 └─ base: false
```

---

# 🚀 Getting Started

### 1. Clone Project

```
git clone https://github.com/yourusername/smart-farm-control.git
```

### 2. Install Dependencies

```
flutter pub get
```

### 3. Setup Firebase

ดาวน์โหลดไฟล์

```
google-services.json
```

แล้วนำไปไว้ในโฟลเดอร์

```
android/app
```

จากนั้นตั้งค่า Firebase ให้เรียบร้อย

---

### 4. Run Application

```
flutter run
```

---

# 🖥️ Example UI

แอปจะแสดงหน้าควบคุมสำหรับ

* เปลี่ยนโหมด AUTO / MANUAL
* เลือกชนิดพืช
* เปิด/ปิดอุปกรณ์ในฟาร์ม

---

# 👨‍💻 Developer

**Name:** Chatrat
**Major:** Computer Engineering
**University:** Rajamangala University of Technology Lanna

Project: **Smart Farm System**

---

# 📌 Note

โปรเจกต์นี้ถูกพัฒนาขึ้นเพื่อใช้ในการศึกษาและพัฒนาระบบ **Smart Agriculture / IoT Farming**
