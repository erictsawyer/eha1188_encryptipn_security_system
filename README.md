EHA-Enhanced Encryption System
A professional-grade encryption framework with enterprise-level security features, multiple cipher support, and custom 1188-byte block optimization.
Features
Multiple Cipher Support
ChaCha20-Poly1305 (AEAD)
AES-256-GCM (AEAD)
Hybrid mode (combines both)
Advanced Key Derivation
PBKDF2-HMAC-SHA512 (500,000 iterations)
Scrypt (N=2^16, r=8, p=1)
Combined dual-stage derivation
Custom Block Optimization
1188-byte custom block size
Parallel block processing
Zlib compression support
Security Features
512-bit (64-byte) master keys
512-bit salt values
16-byte authentication tags
Chain-based verification
Multi-algorithm hash verification
Performance
Parallel encryption/decryption
Configurable worker threads
Block caching
Stream processing for large files
Installation
Requirements
Python 3.8+
cryptography >= 41.0.0
Setup
# Clone or download the repository
cd eha-encryption

# Install dependencies
pip install cryptography

# Or use the package
pip install -e .
Usage
Interactive Mode
python eha_encryption.py --interactive
This launches an interactive encryption/decryption wizard.
Command Line Encryption
python eha_encryption.py --encrypt "Your text here" --password "your-password"
With output file:
python eha_encryption.py --encrypt "Your text here" --password "your-password" --output encrypted.json
With mode selection:
python eha_encryption.py --encrypt "Your text here" --password "your-password" --mode hybrid
Available modes:
chacha20 - Fast ChaCha20-Poly1305
aes - Standard AES-256-GCM
hybrid - Combines both (default)
Command Line Decryption
python eha_encryption.py --decrypt encrypted.json --password "your-password"
With output file:
python eha_encryption.py --decrypt encrypted.json --password "your-password" --output decrypted.txt
System Information
python eha_encryption.py --info
Displays system configuration and verification status.
Architecture
SystemConfig
Core configuration dataclass:
Block size: 1188 bytes
Key length: 512 bits (64 bytes)
Salt length: 512 bits (64 bytes)
PBKDF2 iterations: 500,000
Max file size: 1GB
Session timeout: 4 hours
SystemVerification
Chain-based verification system:
Genesis block creation
Multi-hash verification (SHA512, SHA3-512, BLAKE2b)
Challenge-response authentication
Verification block chain
EHA1188EncryptionEngine
Main encryption engine:
Dual KDF key derivation
Block padding and splitting
Stream encryption/decryption
Compression support
Parallel processing
API Examples
Python API
from eha_encryption import EHAEncryptionSystem, SystemConfig

# Initialize system
system = EHAEncryptionSystem()

# Derive key
salt = system.engine.generate_kdf_salt()
system.engine.derive_master_key("your-password", salt)

# Encrypt
encrypted_blocks = system.engine.encrypt_stream(
    "Your secret text",
    context="example",
    mode=system.engine.EncryptionMode.HYBRID
)

# Print encrypted data
import json
output = {
    "salt": base64.b64encode(salt).decode(),
    "encrypted_blocks": encrypted_blocks
}
print(json.dumps(output, indent=2))

# Decrypt
plaintext = system.engine.decrypt_stream(encrypted_blocks)
print(plaintext)
Key Derivation
password = "your-secure-password"
salt = system.engine.generate_kdf_salt()

# Dual-stage key derivation
master_key = system.engine.derive_master_key(password, salt)
print(f"Key size: {len(master_key)} bytes")
Security Considerations
Key Derivation
PBKDF2 with 500,000 iterations (adjustable)
Scrypt with N=2^16 for resistance to GPU attacks
Combined results hashed with SHA3-512
Encryption
AEAD modes ensure authenticity and confidentiality
Random IVs generated per block
Additional Authenticated Data (AAD) includes context and timestamp
Authentication
16-byte authentication tags
HMAC-based verification
Chain verification for integrity
Configuration
Edit configuration in SystemConfig class:
@dataclass
class SystemConfig:
    version: str = "1.0.0"
    block_size: int = 1188
    key_length: int = 64
    iterations: int = 500000
    # ... more options
Logging
Logs are written to eha_encryption.log and console:
2024-02-02 10:30:45,123 - root - INFO - Initialized EHA-Enhanced Encryption System v1.0.0
2024-02-02 10:30:46,456 - root - DEBUG - Generated KDF salt: 64 bytes
2024-02-02 10:30:50,789 - root - INFO - Master key derived: 64 bytes
Performance
Benchmarks (approximate on modern hardware)
Key derivation: 2-3 seconds (adjustable)
ChaCha20 encryption: ~300MB/s
AES-256-GCM encryption: ~200MB/s
Block processing: Parallel with configurable workers
Block Structure
Encrypted Block Format
{
  "algorithm": "ChaCha20-Poly1305",
  "ciphertext": "base64-encoded-data",
  "tag": "base64-encoded-auth-tag",
  "iv": "base64-encoded-initialization-vector",
  "context": "application-context",
  "block_index": 0,
  "original_size": 1024,
  "padded_size": 1188,
  "timestamp": 1707123456.789
}
File Format
Encrypted files are JSON with structure:
{
  "system": "EHA-Enhanced Encryption System",
  "version": "1.0.0",
  "salt": "base64-encoded-salt",
  "encrypted_blocks": [
    { "encrypted block 1" },
    { "encrypted block 2" },
    ...
  ],
  "timestamp": 1707123456.789
}
Error Handling
The system handles:
Invalid passwords
Corrupted ciphertext
Authentication tag failures
File not found errors
Compression errors (graceful fallback)
Troubleshooting
"Master key not initialized"
Ensure you call derive_master_key() before encrypting/decrypting.
"Authentication tag verification failed"
Wrong password
Corrupted ciphertext
Modified encrypted blocks
Performance issues
Adjust max_workers in SystemConfig based on CPU cores.
License
MIT License - See LICENSE file
Support
For issues, suggestions, or contributions, please refer to the project repository.
EHA-Enhanced Encryption System v1.0.0
Professional-grade encryption with 1188-byte custom block optimization.
