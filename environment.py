import json

with open("config.json", "r") as f:
    config = json.load(f)

print("OpenAI API Key:", config["openai"]["api_key"])
print("Qdrant URL:", config["qdrant"]["cloud_url"])
print("Neon DB:", config["neon"]["connection_string"])
print("JWT Secret:", config["jwt"]["secret_key"])
print("GitHub PAT:", config["github"]["personal_access_token"])
