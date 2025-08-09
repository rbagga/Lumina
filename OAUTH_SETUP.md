# OAuth Setup Guide

This guide shows how to set up OAuth providers (Google and GitHub) for your Lumina application.

## Prerequisites

- A running Lumina application at `http://localhost:3000`
- Google and/or GitHub accounts

## GitHub OAuth Setup

### Step 1: Create GitHub OAuth App

1. Go to [GitHub Developer Settings](https://github.com/settings/developers)
2. Click **"OAuth Apps"** in the left sidebar
3. Click **"New OAuth App"**
4. Fill in the application details:
   - **Application name**: `Lumina (Development)`
   - **Homepage URL**: `http://localhost:3000`
   - **Application description**: `Lumina project management app`
   - **Authorization callback URL**: `http://localhost:3000/api/auth/callback/github`
5. Click **"Register application"**

### Step 2: Get GitHub Credentials

After creating the app:
1. Copy the **Client ID**
2. Click **"Generate a new client secret"**
3. Copy the **Client secret** (save it immediately - you won't see it again!)

### Step 3: Add GitHub Credentials to .env

Update your `.env` file:
```bash
GITHUB_CLIENT_ID="your-github-client-id-here"
GITHUB_CLIENT_SECRET="your-github-client-secret-here"
```

## Google OAuth Setup

### Step 1: Create Google Cloud Project

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Create a new project or select an existing one
3. Enable the Google+ API (or Google Identity API)

### Step 2: Configure OAuth Consent Screen

1. Go to **APIs & Services > OAuth consent screen**
2. Choose **External** user type
3. Fill in the required fields:
   - **App name**: `Lumina`
   - **User support email**: Your email
   - **Developer contact information**: Your email
4. Add test users (your email) in the Test users section
5. Save and continue through all steps

### Step 3: Create OAuth Client ID

1. Go to **APIs & Services > Credentials**
2. Click **"Create Credentials" > "OAuth client ID"**
3. Choose **"Web application"**
4. Configure the client:
   - **Name**: `Lumina Web Client`
   - **Authorized JavaScript origins**: `http://localhost:3000`
   - **Authorized redirect URIs**: `http://localhost:3000/api/auth/callback/google`
5. Click **"Create"**

### Step 4: Get Google Credentials

After creation:
1. Copy the **Client ID**
2. Copy the **Client secret**

### Step 5: Add Google Credentials to .env

Update your `.env` file:
```bash
GOOGLE_CLIENT_ID="your-google-client-id-here"
GOOGLE_CLIENT_SECRET="your-google-client-secret-here"
```

## Testing OAuth

After adding credentials:
1. Restart your development server: `npm run dev`
2. Go to `http://localhost:3000/auth/signin`
3. You should see OAuth buttons for the providers you've configured
4. Test the OAuth flow by clicking the provider buttons

## Production Setup

For production deployment:

### Update URLs
Replace `http://localhost:3000` with your production domain in:
- GitHub OAuth App settings
- Google OAuth Client settings
- Environment variables (`NEXTAUTH_URL`)

### Security Notes
- Never commit real OAuth credentials to version control
- Use environment variables for all sensitive data
- Rotate client secrets regularly
- Review OAuth app permissions and user data access

## Troubleshooting

### Common Issues

1. **"redirect_uri_mismatch"** error:
   - Check that callback URLs match exactly in OAuth app settings
   - Ensure no trailing slashes in URLs

2. **"client_id is required"** error:
   - Check that environment variables are set correctly
   - Restart the development server after adding credentials

3. **OAuth consent screen issues**:
   - Ensure consent screen is properly configured
   - Add your email as a test user during development

4. **"This app isn't verified"** (Google):
   - Expected during development
   - Click "Advanced" and "Go to Lumina (unsafe)" to continue
   - Submit for verification before production launch

## Environment Variables Summary

Your `.env` file should look like this:
```bash
# Database
DATABASE_URL="postgresql://rishu@localhost:5432/lumina"

# NextAuth
NEXTAUTH_URL="http://localhost:3000"
NEXTAUTH_SECRET="your-development-secret-key-change-in-production"

# OAuth Providers
GOOGLE_CLIENT_ID="your-google-client-id"
GOOGLE_CLIENT_SECRET="your-google-client-secret"

GITHUB_CLIENT_ID="your-github-client-id"
GITHUB_CLIENT_SECRET="your-github-client-secret"
```

After updating `.env`, restart the server and test OAuth authentication!