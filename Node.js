const fs = require("fs");
const config = JSON.parse(fs.readFileSync("./config.json", "utf8"));

console.log("OpenAI API Key:", config.openai.api_key);
console.log("Qdrant URL:", config.qdrant.cloud_url);
console.log("Neon DB:", config.neon.connection_string);
console.log("JWT Secret:", config.jwt.secret_key);
console.log("GitHub PAT:", config.github.personal_access_token);
