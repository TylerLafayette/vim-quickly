const snippet = (args) => {
  return `
${args
  .slice(1)
  .map(
    (item) =>
      `private readonly I${item}\n\t_${
        item.charAt(0).toLowerCase() + item.slice(1)
      };`
  )
  .join("\n\n")}


public ${args[0]}(
${args
  .slice(1)
  .map(
    (item) => `\tI${item}\n\t\t${item.charAt(0).toLowerCase() + item.slice(1)},`
  )
  .join("\n")}
) {
${args
  .slice(1)
  .map(
    (item) =>
      `\t_${item.charAt(0).toLowerCase() + item.slice(1)} = ${
        item.charAt(0).toLowerCase() + item.slice(1)
      };`
  )
  .join("\n")}
}
	`;
};

process.stdout.write(snippet(process.argv.slice(2)));
