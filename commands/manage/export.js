const { SlashCommandBuilder, AttachmentBuilder } = require("discord.js");
const fs = require('fs');
module.exports = {
	data: new SlashCommandBuilder()
		.setName('export')
		.setDefaultMemberPermissions("8")
		.setDescription('Export the bot\'s data'),

	async run (interaction) {

		const client = interaction.client;
		const guild = interaction.guild.id;
		
		const filedata = client.db.guilds.get(`data.${guild}`);
		if (!filedata) {
			return interaction.editReply({
				content: "No data found for this guild to export."
			});
		}

        const filename = `export-${guild}.json`; // Make filename unique per guild

        try {
            // Convert the JavaScript object to a JSON string
			

            const jsonData = JSON.stringify(filedata, null, 2); // null, 2 for pretty printing
			fs.writeFileSync(filename, jsonData);

			const file = new AttachmentBuilder()
				.setFile(filename)
				.setName(filename);

			console.log(file);

            // Reply to the interaction with the file
            await interaction.editReply({
                files: [ file ],
				// Keep the reply visible only to the user who ran the command
            });

			fs.unlinkSync(filename);

        } catch (error) {
            console.error(`Error exporting data for guild ${guild}:`, error);
            await interaction.editReply({
                content: `There was an error exporting the data.`,
            });
        }
	}
}