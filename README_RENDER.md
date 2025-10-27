# Supplier Gate — Render Deployment (Private + Sample DB)
**Non-technical friendly steps** to get your backend online with a private URL.

## What this folder is
A scaffold. You will: 
1) Put your backend **files** inside the `app/` folder (replace the placeholder).
2) Push everything to GitHub.
3) Click “Deploy” on Render (uses Docker automatically).

## Steps
1) Extract your ZIP locally. Open the extracted folder and **copy all files inside it** (do not copy the outer folder itself).
2) Paste those files into this scaffold's `app/` folder (replace the placeholder).
3) Create a new GitHub repo and upload the whole scaffold (including `app/`, `deploy/`, `Dockerfile`, `render.yaml`).
4) On Render:
   - New → Blueprint → connect your GitHub repo.
   - Set environment variables:
     - `BASIC_AUTH_USER` = choose a username
     - `BASIC_AUTH_PASS` = choose a strong password
   - Deploy.

Your URL will be like: `https://supplier-gate-backend.onrender.com`  
It will ask for the username/password you set.

## Testing an endpoint
```bash
curl -u USER:PASS -X POST "https://<your-service>.onrender.com/api/v2/getMainCategories"      -d "requestedAPI=getMainCategories"
```

## Sample DB
If any `.sql` file is present inside `app/`, it will be imported into a local MariaDB database on first start.
