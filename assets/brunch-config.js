#
  paths: {
    watched: ["static", "css", "js", "elm", "vendor"],

    public: "../priv/static"
  },

  plugins: {
    babel: {
      ignore: [/vendor/]
    },

    elmBrunch: {
      elmFolder: "elm",
      mainModules: ["Main.elm"],
      outputFolder: "../vendor"
    }
  },
#
