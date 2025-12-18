# Development Environment

Comprehensive development environment with BMAD framework, Docusaurus, and automation tools for modern software development.

## Quick Start

### One-Command Setup

Clone the repository and run the bootstrap script to set up everything automatically:

```bash
git clone https://github.com/assadsharif/Development-Environment.git
cd Development-Environment
./bootstrap.sh
```

This will:
- ✅ Check for required tools (Node.js, Python)
- ✅ Create Python virtual environment
- ✅ Install all dependencies
- ✅ Set up BMAD framework
- ✅ Configure Docusaurus
- ✅ Create `.env` template file

### Manual Setup

If you prefer to set up components individually:

#### 1. Install Dependencies Only

```bash
./install.sh
```

#### 2. Verify Your Setup

```bash
./check.sh
```

This will verify:
- Required tools (Node.js, npm, Python, Git)
- Environment variables
- Project structure
- Installed dependencies

### 3. Configure Environment

Update the `.env` file with your credentials:

```bash
nano .env  # or use your preferred editor
```

Required environment variables:
- `OPENAI_API_KEY` - Your OpenAI API key
- `QDRANT_API_KEY` - Qdrant Cloud API key
- `QDRANT_CLOUD_URL` - Qdrant Cloud cluster URL
- `NEON_CONNECTION_STRING` - Neon Postgres connection string
- `JWT_SECRET_KEY` - JWT secret for authentication
- `GITHUB_PAT` - GitHub Personal Access Token

## Setup Scripts

### `bootstrap.sh`
Complete environment setup script that:
- Checks for Node.js and Python installations
- Creates and activates Python virtual environment
- Installs all project dependencies
- Sets up BMAD framework
- Creates `.env` template file

### `install.sh`
Dependency installation script that:
- Installs Node.js dependencies
- Installs Python packages from requirements.txt
- Installs Docusaurus dependencies

### `check.sh`
Environment verification script that checks:
- Required tools (Node.js, npm, Python, Git, GitHub CLI)
- Environment variables configuration
- Project structure
- Installed dependencies

## External Services Setup

### Qdrant Cloud (Vector Database)
1. Create account at [cloud.qdrant.io](https://cloud.qdrant.io)
2. Create a new cluster (free tier available)
3. Copy the cluster URL and API key to `.env`

### Neon Postgres (Database)
1. Create account at [neon.tech](https://neon.tech)
2. Create a new project (free tier available)
3. Copy the connection string to `.env`

### OpenAI API
1. Get API key from [platform.openai.com](https://platform.openai.com)
2. Ensure you have access to required models
3. Copy the API key to `.env`

### GitHub Personal Access Token
1. Go to [github.com/settings/tokens](https://github.com/settings/tokens)
2. Generate new token with `repo` scope
3. Copy the token to `.env`

## Usage

### Start Docusaurus Development Server

```bash
cd my-docusaurus
npm start
```

### Activate Python Virtual Environment

```bash
source venv/bin/activate
```

### Run Python Scripts

```bash
source venv/bin/activate
python environment.py
```

## Project Structure

```
Development-Environment/
├── bootstrap.sh           # Complete environment setup
├── install.sh            # Dependency installation
├── check.sh              # Environment verification
├── environment.py        # Python environment utilities
├── config.json           # Project configuration
├── .env                  # Environment variables (not in git)
├── .gitignore            # Git ignore rules
├── my-docusaurus/        # Docusaurus documentation site
│   ├── docs/
│   ├── src/
│   └── package.json
├── my-project/           # Main project directory
│   └── _bmad/           # BMAD framework
│       ├── bmm/         # BMAD Method files
│       └── core/        # Core BMAD resources
└── venv/                # Python virtual environment (not in git)
```

## Features

### BMAD Framework
Build, Measure, Analyze, Deploy methodology for software development with comprehensive workflows and agent templates.

### Docusaurus Integration
Documentation site with modern UI and full-text search capabilities.

### Automated Setup
One-command installation and configuration for fast onboarding.

### Environment Management
Secure credential handling with `.env` file support.

## Prerequisites

- **Node.js** 16.x or higher
- **Python** 3.8 or higher
- **Git** 2.x or higher
- **npm** or **yarn**

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License.

## Support

For issues and questions:
- Open an issue on GitHub
- Check the documentation in `my-docusaurus/docs`
- Review BMAD framework guides in `my-project/_bmad/bmm/docs`
