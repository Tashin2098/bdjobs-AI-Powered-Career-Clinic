BDJOBS CAREER CLINIC — TRUE REAL-TIME AI VOICE INTERVIEW

IMPORTANT: This edition uses Google Gemini LIVE AUDIO over a persistent WebSocket, NOT the OpenRouter text model. It streams microphone audio directly to Gemini and receives streamed speech back. It does not use the browser SpeechRecognition or speechSynthesis APIs.

SETUP (WINDOWS)
1. Get a Gemini API key from https://aistudio.google.com/apikey
2. Extract ZIP and run START-WINDOWS.bat.
3. Enter your Gemini API key. Optional: also enter your OpenRouter API key if you use the separately existing AI roadmap generator.
4. Keep the black console open. Visit http://127.0.0.1:8768 (NOT ports 8765, 8766, 8767).
5. Open Career Report > My Action Plan > Enter real-time interview.
6. Click Join live call, then allow microphone access.
7. The recruiter speaks naturally, listens to your mic as an audio stream, acknowledges answers and asks FIVE questions, then concludes.

Direct room URL: http://127.0.0.1:8768/AI-Live-Interview.html

This is a real AI streaming-audio session. The voice model and microphone are connected continuously while the call is active, and you may interrupt. Use headphones to reduce feedback.

Access is subject to free-tier eligibility, model availability, quota, and network. The project cannot guarantee the Gemini Live API works with every key. Gemini 2.5 text model restrictions do NOT necessarily apply to Gemini Live, but test your own key.

Security: Keep the Windows server bound to localhost; never upload server keys or publicly expose the localhost token endpoint. Production requires authentication and hardened API proxy. No audio recordings are saved by this demo; the browser receives streaming audio and transcript text.

Troubleshooting: If Join fails, read the red message shown inside the room. The app explicitly differentiates token/key errors, failed WebSocket sessions and microphone permission. Press F12 > Console for technical detail but never disclose your API key/token.

This build preserves all other HTML sections, local application state, and the existing OpenRouter-backed roadmap route (optional key).

FIXED CONNECTION HANDSHAKE (November 2026)
- Corrected Gemini Live setup: generationConfig now wraps responseModalities and speechConfig.
- WebSocket HTTP 101 alone is not Live session acceptance. The app waits for setupComplete.
- If setupComplete never arrives, a 15-second timeout displays an actionable error; closes show their code/reason.
- This corrects a client setup bug but does not guarantee that Google permits the selected model or free-tier access for your key.
- Use Chrome or Edge at http://127.0.0.1:8768 and approve microphone access.
