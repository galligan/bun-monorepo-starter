# Bun Monorepo Starter

A modern, opinionated TypeScript monorepo starter template featuring Bun, Turbo, and best practices for scalable development.

## 🚀 Quick Start

1. **Use this template** by clicking the "Use this template" button on GitHub
2. **Clone your new repository**
3. **Install dependencies**: `bun install`
4. **Start developing**: `bun run dev`

## 🛠️ What's Included

### Core Technologies

- **[Bun](https://bun.sh/)** - Fast runtime, package manager, bundler, and test runner
- **[Turbo](https://turbo.build/)** - High-performance build system for monorepos
- **[TypeScript](https://www.typescriptlang.org/)** - Strict type safety with modern features
- **[Ultracite](https://github.com/jcbhmr/ultracite)** - Zero-config linting and formatting

### Developer Experience

- **[Lefthook](https://github.com/evilmartians/lefthook)** - Git hooks for quality gates
- **[Commitlint](https://commitlint.js.org/)** - Conventional commit message enforcement
- **[Biome](https://biomejs.dev/)** - Fast formatter and linter (via Ultracite)

## 📁 Project Structure

```text
├── apps/           # Applications (Next.js, Node.js servers, etc.)
├── packages/       # Shared libraries and utilities
├── biome.jsonc     # Biome configuration
├── turbo.json      # Turbo pipeline configuration
├── tsconfig.json   # TypeScript configuration
└── lefthook.yml    # Git hooks configuration
```

## 🔧 Available Scripts

- `bun run dev` - Start development servers
- `bun run build` - Build all packages and apps
- `bun run test` - Run all tests
- `bun run lint` - Lint all code
- `bun run lint:fix` - Lint and auto-fix issues
- `bun run typecheck` - Type check all packages
- `bun run ci:full` - Run full CI pipeline locally

## 📦 Adding Packages/Apps

### Add a new package:

```bash
mkdir packages/your-package
cd packages/your-package
# Create package.json, index.ts, etc.
```

### Add a new app:

```bash
mkdir apps/your-app
cd apps/your-app
# Create package.json, src/, etc.
```

## 🔗 Internal Package References

Use the `@/*` path mapping to reference internal packages:

```typescript
// In your app or package
import { someUtil } from '@/utils';
import { Component } from '@/ui';
```

Update `tsconfig.json` paths as needed for your package names.

## ✅ Quality Gates

This template includes several quality gates:

- **Pre-commit**: Lint, format, and type check changed files
- **Pre-push**: Run tests on changed packages
- **Conventional commits**: Enforced commit message format
- **Strict TypeScript**: Zero tolerance for type errors

## 🎯 Recommended Patterns

### Package Naming

- `@your-org/package-name` for published packages
- Simple names for internal packages (e.g., `ui`, `utils`, `config`)

### Import Organization

- External dependencies first
- Internal packages (`@/*`) second
- Relative imports last

### Commit Messages

```text
feat(ui): add new button component
fix(api): resolve authentication timeout
docs: update installation instructions
```

## 🚀 Deployment

This template is deployment-agnostic. Popular options:

- **Vercel**: Excellent for Next.js apps with zero config
- **Cloudflare Pages**: Fast edge deployment
- **Railway**: Simple full-stack deployments
- **Docker**: Use included configurations

## 🤝 Contributing

1. Fork this template repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes and test thoroughly
4. Commit using conventional commits: `git commit -m 'feat: add amazing feature'`
5. Push and create a Pull Request

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

Built with inspiration from:

- [Turbo Examples](https://github.com/vercel/turbo/tree/main/examples)
- [Modern TypeScript practices](https://www.typescriptlang.org/docs/)
- [Bun documentation](https://bun.sh/docs)

---

**Happy coding!** 🎉

For questions or issues, please [open an issue](https://github.com/galligan/bun-monorepo-starter/issues).
