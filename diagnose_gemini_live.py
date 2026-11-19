"""Tests ephemeral Gemini Live token creation without exposing the API key."""
import os,json,urllib.request,urllib.error
from datetime import datetime,timedelta,timezone
key=os.environ.get('GEMINI_API_KEY','').strip()
model=os.environ.get('GEMINI_LIVE_MODEL','gemini-3.1-flash-live-preview')
print('Checking short-lived Gemini Live token access for model:',model)
if not key:
    print('FAILED: GEMINI_API_KEY not provided.');raise SystemExit(2)
now=datetime.now(timezone.utc)
fmt=lambda d:(now+timedelta(seconds=d)).strftime('%Y-%m-%dT%H:%M:%SZ')
data=json.dumps({'uses':1,'newSessionExpireTime':fmt(60),'expireTime':fmt(1500)}).encode('utf8')
request=urllib.request.Request('https://generativelanguage.googleapis.com/v1beta/auth_tokens',data=data,headers={'x-goog-api-key':key,'Content-Type':'application/json'},method='POST')
try:
    with urllib.request.urlopen(request,timeout=25) as response:
        token=json.loads(response.read())
    if token.get('name'):
        print('SUCCESS: Gemini Live token API returned HTTP 200.')
        print('Your key can mint a short-lived session token.')
        print('Next step: start the Career Clinic and join a voice interview to test the Live model WebSocket.')
    else:
        print('WARNING: HTTP 200 but no session token returned.')
except urllib.error.HTTPError as error:
    data=error.read(10000).decode('utf8','replace')
    try: reason=json.loads(data).get('error',{}).get('message','')
    except Exception: reason='Non-JSON rejection (network or edge security restriction possible)'
    print('FAILED: Gemini Live token HTTP',error.code)
    print('Reason:',str(reason).replace(key,'[REDACTED]')[:400])
except Exception as e:
    print('FAILED: Connection error',type(e).__name__)
print('Your permanent API key has not been printed.')
