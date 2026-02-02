Contributing to EHA-Enhanced Encryption System

Thank you for your interest in contributing to the EHA-Enhanced Encryption System!

Code of Conduct

This project adheres to the Contributor Covenant Code of Conduct. By participating, you are expected to uphold this code.

How to Contribute

Reporting Bugs

1. Check if the bug has already been reported in Issues
2. If not, create a new issue using the Bug Report template
3. Include:
   - Clear description of the bug
   - Steps to reproduce
   - Expected behavior
   - Actual behavior
   - Your environment (OS, Python version, etc.)

Requesting Features

1. Check if the feature has been requested
2. Create a new issue using the Feature Request template
3. Include:
   - Clear description of the feature
   - Use case and motivation
   - Possible implementation approach

Submitting Code Changes

1. Fork the repository
2. Create a feature branch: git checkout -b feature/your-feature-name
3. Make your changes
4. Test your changes locally
5. Commit with clear messages: git commit -m "Add feature description"
6. Push to your fork: git push origin feature/your-feature-name
7. Create a Pull Request

Pull Request Process

1. Update documentation if needed
2. Ensure tests pass locally
3. Follow the PR template
4. Request review from @erictsawyer
5. Address review comments
6. Wait for approval before merging

Development Setup

```bash
Clone the repository
git clone https://github.com/erictsawyer/eha-encryption.git
cd eha-encryption

Install dependencies
pip install -r requirements.txt

Install development dependencies
pip install pytest black flake8 isort

Run tests
pytest tests/

Check code quality
flake8 eha_encryption.py
black --check eha_encryption.py
isort --check-only eha_encryption.py
```

Code Style

- Follow PEP 8
- Use Black for formatting: black eha_encryption.py
- Use isort for imports: isort eha_encryption.py
- Use flake8 for linting: flake8 eha_encryption.py

Testing

- Write tests for new features
- Ensure all tests pass: pytest tests/
- Aim for > 80% coverage
- Test on Python 3.8, 3.9, 3.10, 3.11

Documentation

- Update README.md if changing functionality
- Add docstrings to functions
- Include examples in docstrings
- Update relevant guide files

Security

For security vulnerabilities:
- Do NOT open a public issue
- Email security details privately
- Use the Security Issue template
- Allow time for patches

Commit Messages

Use clear, descriptive commit messages:
- Feature: "Add ChaCha20 mode support"
- Bug fix: "Fix key derivation issue"
- Docs: "Update README with examples"
- Tests: "Add encryption tests"

Branching Strategy

- main: Stable, production-ready code
- develop: Development branch for features
- feature/: Feature branches from develop
- bugfix/: Bug fix branches from develop
- hotfix/: Hotfixes from main

Questions?

- Check documentation files
- Read existing issues
- Review examples.py
- Create a discussion post

License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to EHA-Enhanced Encryption System!
