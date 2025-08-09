#!/bin/bash

echo "🔐 Setting up OAuth for Lumina"
echo "=============================="
echo ""

echo "Opening OAuth setup pages..."
echo ""

echo "📱 GitHub OAuth Setup:"
echo "1. Creating GitHub OAuth App..."
open "https://github.com/settings/applications/new"
echo "   ✓ Use these settings:"
echo "     - Application name: Lumina (Development)"
echo "     - Homepage URL: http://localhost:3000"  
echo "     - Authorization callback URL: http://localhost:3000/api/auth/callback/github"
echo ""

echo "🔍 Google OAuth Setup:"
echo "1. Creating Google Cloud Project & OAuth..."
open "https://console.cloud.google.com/apis/credentials"
echo "   ✓ Follow these steps:"
echo "     - Create new project (if needed)"
echo "     - Go to OAuth consent screen first"
echo "     - Then create OAuth 2.0 Client ID"
echo "     - Web application type"
echo "     - Authorized redirect URI: http://localhost:3000/api/auth/callback/google"
echo ""

echo "📝 After creating both OAuth apps:"
echo "1. Copy your GitHub Client ID and Secret"
echo "2. Copy your Google Client ID and Secret"  
echo "3. Update your .env file with the real credentials"
echo "4. Restart the server: npm run dev"
echo ""

echo "💡 Need help? Check OAUTH_SETUP.md for detailed instructions!"
echo ""