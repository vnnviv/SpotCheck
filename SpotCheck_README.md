# SpotCheck — iOS Skin Condition Classifier

> An on-device machine learning iOS application for personalized skin condition analysis and product recommendations, built with demographic-adjusted predictions for diverse skin tones.

![Swift](https://img.shields.io/badge/Swift-5.0-orange?logo=swift)
![iOS](https://img.shields.io/badge/iOS-16.0+-blue?logo=apple)
![CoreML](https://img.shields.io/badge/CoreML-PediaVision-green)
![Firebase](https://img.shields.io/badge/Firebase-Auth%20%2B%20Firestore-yellow?logo=firebase)

---

## Overview

SpotCheck is a capstone iOS application developed by **Vivian Chan, Mikayla Chia, and Emily Zhao** at Glen A. Wilson High School. The app combines computer vision, on-device machine learning, and a curated treatment database to provide personalized skincare analysis — with a specific focus on demographic-adjusted predictions for East and Southeast Asian skin tones underserved by mainstream beauty algorithms.

---

## Features

- **AI Skin Analysis** — On-device CoreML model (PediaVision, EfficientNet-B3) classifies skin conditions from camera or photo library input
- **Demographic-Adjusted Predictions** — ML outputs calibrated for diverse skin tones to reduce algorithmic bias in dermatological recommendations
- **Real-Time Dashboard** — Live insights from scan history with trend tracking across multiple sessions
- **Product Recommendation Engine** — Personalized skincare and treatment recommendations pulled from a structured CSV product dataset
- **Secure User Authentication** — Firebase Auth with full registration, login, and profile management
- **Scan History Manager** — Persistent scan logs with detailed result views and follow-up tracking
- **Questionnaire Flow** — Multi-step onboarding questionnaire to personalize skin analysis outputs
- **Privacy-First Architecture** — On-device inference via CoreML; no images are uploaded to external servers

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Language | Swift 5.0 |
| UI Framework | SwiftUI |
| ML Framework | CoreML + Vision |
| ML Model | PediaVision (EfficientNet-B3, 82.5% accuracy) |
| Authentication | Firebase Auth |
| Database | Firebase Firestore |
| Image Handling | PhotosUI + AVFoundation |
| Data | Structured CSV product dataset |

---

## ML Model — PediaVision

The CoreML model integrated into SpotCheck is PediaVision, a custom-trained EfficientNet-B3 classifier:

- **Architecture:** EfficientNet-B3
- **Accuracy:** 82.52% on validation set
- **Training Data:** 8,012 samples from HAM10000 (skin lesions) + ACNE04 (acne severity)
- **Validation Data:** 2,003 samples
- **Classes:** Actinic Keratoses, Basal Cell Carcinoma, Benign Keratosis, Dermatofibroma, Melanocytic Nevi, Melanoma, Vascular Lesions

> Full ML training pipeline and model weights: [PediaVision Repository](link-to-pediavision-repo)

---

## App Architecture

```
SpotCheck/
├── SpotCheckApp.swift          # App entry point
├── ContentView.swift           # Root navigation
├── AuthManager.swift           # Firebase auth state management
├── UserProfileManager.swift    # User profile persistence
├── ScanHistoryManager.swift    # Scan session persistence
├── SkinAnalysisManger.swift    # CoreML inference engine
├── ScanModels.swift            # Data models for scan results
├── Views/
│   ├── loginPage.swift         # Authentication flow
│   ├── registrationPage.swift  # User registration
│   ├── DashboardView.swift     # Main dashboard with scan access
│   ├── cameraView.swift        # Camera capture interface
│   ├── SelectedImageView.swift # Image preview + analysis trigger
│   ├── Analysisresultsview.swift # Scan results display
│   ├── Insightspage.swift      # Historical trends + insights
│   ├── Questionnaireview.swift # Personalization questionnaire
│   ├── ScanHistoryDetailView.swift # Detailed past scan view
│   ├── ProfileView.swift       # User profile management
│   ├── commentsPage.swift      # Community/comments feature
│   └── FollowUp.swift          # Follow-up recommendations
├── UIImage+Extensions.swift    # Image utility extensions
└── Assets.xcassets/            # App icons, colors, logo assets
```

---

## Setup Instructions

### Prerequisites
- Xcode 15.0+
- iOS 16.0+ device or simulator
- Firebase project with Auth and Firestore enabled

### Installation

```bash
git clone https://github.com/vnnviv/SpotCheck.git
cd SpotCheck
```

1. Open `SpotCheck.xcodeproj` in Xcode
2. Add your own `GoogleService-Info.plist` from your Firebase console to the project root
3. Select your development team in Signing & Capabilities
4. Build and run on simulator or physical device

> **Note:** `GoogleService-Info.plist` is excluded from this repository for security. You must provide your own Firebase configuration file.

---

## Screenshots

*Demo video available in the repository — see ScreenRecording files*

---

## Research Context

SpotCheck was developed as part of a broader research project investigating algorithmic bias in AI systems serving underrepresented communities. The demographic-adjusted prediction approach directly addresses the gap identified in mainstream beauty and health AI tools that underperform on East and Southeast Asian skin tones.

Related research: **"Stock Price Prediction Using Synthetic Data Augmentation"** — SSRN working paper, presented at SCCUR 2025

---

## Authors

- **Vivian Chan** — ML integration, CoreML pipeline, skin analysis engine, product recommendation system
- Mikayla Chia — Co-developer
- Emily Zhao — Co-developer

---

## License

This project was developed for educational purposes as a high school capstone project.
