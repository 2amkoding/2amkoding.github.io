# June Lee's Web Portfolio 🌟

A modern, responsive web portfolio showcasing my development journey and projects, built independently with Jekyll and deployed on GitHub Pages.

## 🎯 Project Overview

This is my **second web portfolio** - a significant step up from my first attempt. While my initial portfolio was built following a YouTube tutorial, I challenged myself to create this one **more independently**, relying on documentation, problem-solving, and hands-on experimentation to build a more sophisticated and personalized showcase.

### Why I Built This

- **Showcase Growth**: Demonstrate my progress as a developer beyond tutorial-following
- **Independent Learning**: Challenge myself to work with new technologies without step-by-step guidance  
- **Professional Presence**: Create a polished platform to present my skills, projects, and experience
- **Technical Exploration**: Dive deeper into static site generation, deployment pipelines, and modern web development practices

## 🛠️ Technologies & Tools

- **[Ruby](https://www.ruby-lang.org/)** - Programming language powering Jekyll
- **[Jekyll](https://jekyllrb.com/)** - Static site generator for building fast, maintainable websites
- **[Hydejack Theme](https://hydejack.com/)** - Professional Jekyll theme providing the visual foundation
- **[GitHub Pages](https://pages.github.com/)** - Free hosting and deployment platform
- **[GitHub Actions](https://github.com/features/actions)** - CI/CD pipeline for automated building and deployment

## ✨ Key Features

- **Responsive Design**: Seamlessly adapts to desktop, tablet, and mobile devices
- **Dark/Light Mode**: Automatic theme switching based on user preference
- **Professional About Page**: Detailed introduction with enhanced author imagery
- **Resume Integration**: Dynamic resume built from structured data
- **Blog Ready**: Built-in support for technical writing and project documentation
- **SEO Optimized**: Search engine friendly with proper meta tags and structured data
- **Fast Loading**: Optimized images and efficient Jekyll build process

## 🚀 Live Demo

Visit the live portfolio: **[2amkoding.github.io](https://2amkoding.github.io)**

## 🏗️ Architecture & Deployment

### Local Development
- Ruby 3.2.9 environment with Bundler for dependency management
- Jekyll development server with live reload
- Custom build scripts for cache management and rapid iteration

### Production Pipeline
- **GitHub Actions** workflow for automated building
- Ruby environment consistency between local and CI/CD
- Optimized asset processing and deployment to GitHub Pages
- Custom domain support ready

### Notable Technical Implementations
- **Enhanced Image Processing**: Custom brightness and contrast filters for optimal viewing
- **Responsive Author Images**: Multiple image sizes with proper srcset implementation  
- **Advanced Sass Configuration**: Custom styling with light/dark mode support
- **Liquid Templating**: Dynamic content generation from YAML data files

## 💡 Development Highlights

### Challenges Overcome
- **Jekyll Configuration**: Mastering complex YAML configurations and Liquid templating
- **GitHub Actions Issues**: Debugging Ruby version mismatches and deployment failures
- **Image Optimization**: Implementing responsive images with proper fallbacks
- **Theme Customization**: Deep customization of Hydejack theme while maintaining upgradability

### Independent Problem Solving
- Researched Jekyll best practices through official documentation
- Debugged GitHub Actions failures through log analysis and community resources  
- Implemented custom CSS solutions for image enhancement
- Configured complex deployment pipelines without tutorials

## 📁 Project Structure

```
├── _config.yml              # Jekyll configuration
├── _data/
│   ├── authors.yml          # Author information
│   └── resume.yml           # Resume data structure
├── _includes/               # Reusable template components
├── _posts/                  # Blog posts and project writeups
├── _sass/
│   └── my-inline.scss       # Custom styling
├── assets/img/              # Optimized images and graphics
├── .github/workflows/       # GitHub Actions CI/CD
└── README.md               # Project documentation
```

## 🎨 Design Philosophy

This portfolio balances **professionalism** with **personality**, featuring:
- Clean, modern aesthetic with subtle animations
- Intuitive navigation and user experience
- Content-focused design that highlights projects and skills
- Accessibility considerations and semantic HTML structure

## 🚀 Quick Start (For Developers)

### Prerequisites
- Ruby 3.2.9 or newer
- Bundler gem
- Git

### Local Setup
```bash
# Clone the repository
git clone https://github.com/2amkoding/2amkoding.github.io.git
cd 2amkoding.github.io

# Install dependencies
bundle install

# Start development server
bundle exec jekyll serve

# Visit http://localhost:4000
```

### Development Commands
```bash
# Load project-specific aliases
source ./setup-aliases.sh

# Full rebuild (clears cache)
rebuild

# Quick start
jstart

# Stop server
jstop
```

## 🔮 Future Enhancements

- [ ] Interactive project galleries with live demos
- [ ] Advanced blog functionality with tags and categories
- [ ] Performance analytics and visitor insights
- [ ] Multi-language support for broader accessibility
- [ ] Integration with professional APIs (LinkedIn, GitHub stats)

## 📞 Connect With Me

- **Portfolio**: [2amkoding.github.io](https://2amkoding.github.io)
- **GitHub**: [@2amkoding](https://github.com/2amkoding)
- **LinkedIn**: [2amkoding](https://linkedin.com/in/2amkoding)
- **Email**: 2amkoding@gmail.com

---

*Built with ❤️ by June Lee | Powered by Jekyll & GitHub Pages*
