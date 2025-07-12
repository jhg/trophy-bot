
# Contributing to Trophy Bot

Thank you for your interest in contributing!

## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/AntikoreDev/trophy-bot.git
   cd trophy-bot
   ```

2. Install the dependencies:

   ```bash
   npm install
   ```

3. Create a `.env` file with your Discord token:

   ```env
   DISCORD_TOKEN=your_token_here
   ```

4. Start the bot:

   ```bash
   node index.js
   ```

## Project Structure

- `index.js`: entry point, starts the bot and loads events.
- `commands/`: commands organized by type (bot, manage, users).
- `commons/`: utilities, models, and database access.
- `events/`: Discord event handlers.
- `locale/`: language files and translations.
- `windows/`: visual components for Discord.

## Good Practices

- Comment main functions and modules.
- Use clear names for variables and functions.
- Keep code style consistent.
- If you add dependencies, update `package.json`.
- If you create new commands, add them in the correct folder and document their use.

## Reporting Problems

Use GitHub Issues to report bugs or suggest improvements.
