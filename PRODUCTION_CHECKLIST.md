# Production checklist

- Configure Firebase for Android and Web; generate `firebase_options.dart`.
- Enable Phone Authentication, authorized domains, Android SHA fingerprints and abuse protection.
- Implement OTP send/verify/resend cooldown and recovery flows.
- Assign exactly two admin roles through a trusted server process, never client-side.
- Add server-side checks and audit logs for payment approval, tournament changes, room details and results.
- Reject duplicate Transaction IDs; keep submitted payments pending until checked.
- Use only bKash/Nagad numbers you are authorized to use and clearly disclose account ownership.
- Automatic verification requires official merchant/API access and server-side callbacks.
- Test security rules, duplicate joins, full slots, room access, admin roles and payment review.
- Deploy Web App over HTTPS; build and sign Android APK/AAB; test on physical devices.
