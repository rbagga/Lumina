# Lumina

A modern project management application with authentication and project creation capabilities.

## Features

- **Authentication System**: 
  - OAuth login with Google and GitHub
  - Email/password registration and login
  - Secure session management with NextAuth.js

- **Project Management**:
  - Create and manage projects
  - User-specific project isolation
  - Clean and intuitive dashboard

- **Modern Tech Stack**:
  - Next.js 14 with TypeScript
  - PostgreSQL database with Prisma ORM
  - Tailwind CSS for styling
  - Secure authentication with NextAuth.js

## Getting Started

### Prerequisites

- Node.js 18+ 
- PostgreSQL database
- Google OAuth credentials (optional)
- GitHub OAuth credentials (optional)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd Lumina
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   ```bash
   cp .env.example .env
   ```
   
   Edit the `.env` file and add your configuration:
   ```env
   # Database
   DATABASE_URL="postgresql://username:password@localhost:5432/lumina"

   # NextAuth
   NEXTAUTH_URL="http://localhost:3000"
   NEXTAUTH_SECRET="your-secret-key-here"

   # OAuth Providers (optional)
   GOOGLE_CLIENT_ID="your-google-client-id"
   GOOGLE_CLIENT_SECRET="your-google-client-secret"

   GITHUB_CLIENT_ID="your-github-client-id"  
   GITHUB_CLIENT_SECRET="your-github-client-secret"
   ```

4. **Set up the database**
   ```bash
   # Generate Prisma client
   npm run db:generate
   
   # Push schema to database
   npm run db:push
   ```

5. **Start the development server**
   ```bash
   npm run dev
   ```

   Open [http://localhost:3000](http://localhost:3000) in your browser.

### Setting up OAuth Providers

#### Google OAuth
1. Go to the [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable the Google+ API
4. Create OAuth 2.0 credentials
5. Add `http://localhost:3000/api/auth/callback/google` to authorized redirect URIs

#### GitHub OAuth  
1. Go to GitHub Settings > Developer settings > OAuth Apps
2. Create a new OAuth App
3. Set Authorization callback URL to `http://localhost:3000/api/auth/callback/github`

## Database Commands

```bash
# Generate Prisma client
npm run db:generate

# Push schema changes to database
npm run db:push

# Create and run migrations
npm run db:migrate

# Open Prisma Studio (database GUI)
npm run db:studio
```

## Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run start` - Start production server
- `npm run lint` - Run ESLint

## Architecture

### Backend
- **API Routes**: Next.js API routes handle authentication and CRUD operations
- **Database**: PostgreSQL with Prisma ORM for type-safe database operations
- **Authentication**: NextAuth.js with multiple providers and secure session management

### Frontend  
- **Framework**: Next.js 14 with App Router
- **Styling**: Tailwind CSS with custom components
- **Forms**: React Hook Form with Zod validation
- **State Management**: Built-in React state with NextAuth session management

### Security Features
- Password hashing with bcryptjs
- CSRF protection via NextAuth.js
- Input validation with Zod schemas
- SQL injection prevention via Prisma
- Secure session management

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source and available under the [MIT License](LICENSE).
