return{
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 24,
  height = 16,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 4,
  nextobjectid = 20,
  properties = {
    ["sw1"] = "546",
    ["sw2"] = "429",
    ["sw6"] = "418",
    ["sw5"] = "640",
    ["sw3"] = "504",
    ["sw4"] = "334",
    ["tag"] = "RW"
  },
  tilesets = {
    {
      name = "block",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 3,
      tilecount = 3,
      image = "../assets/block.png",
      imagewidth = 96,
      imageheight = 32,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32, 
        height = 32
      },
      properties = {
        ["embedded_png"] = "iVBORw0KGgoAAAANSUhEUgAAAGAAAAAgCAYAAADtwH1UAAAD7UlEQVR42uVaS44TMRDtSD4CZDkS\ni8wIFlwicADOC7nGAJPdzC5wBpp0pJquLtff7hAJS1k4ttvuV3bVe+Uu7z5+GYf/tLy5uxPbfj8/\nDx/2n8T20/Fp2O7uXf8/Hr6JcxXPYrjFRV5GGkOL9sL0hTz9p35cHxifLRL4mVKi4EN/ANQ7Fo/J\nAt86plfRwI8aprQc3wnQ6dfDCMOwOf/GznXt+YPD/dTPPB1/IpCja2IMEN39IqDjeaINemlU97if\ncfhzXu6max2fEtrOL4K8QwWeXp/m+HU8Xgw0uSl4HmDMeY3SehzBCPihHsAtX03BytTxcyXw8Vr1\nE2oXmIPGCC4IwzwlGjC5E0P/kya7lTIZZQKF25GtRtDiAJ3nYgC6iGhwjdA9/cX8/lTyz1wMmE9B\n7Y/td1yOqdnP3H5xOeY7aTGA+CvNp7vqwRLx8RwNhXZMMaE9QzuxD8fviIF+u9tdfD7e+UtDjEv3\nw2BU6K587UzBFOqv/t8BvnS8OUop+XhJA3w/HMTnYUN4jeIVWSHayWBUermXFHNShJEmoLi2iIjL\naggP2FfTATjAeo2gC7Glv5R26AxeXBdA8I3wGuzjt7sHc45aJzgNYEZ/xn/h/h7moLEj6vPf7/ck\nBoyL+uPhq8rzPTHEE5nwzrbmMHUDFwNadi7HnLIsKsrzqTvxjrdOgZSE4/w/tybVBUkxgIooCVgJ\n1N48OsLlb61whtKwK5w4gAFZLWAZrF8uSOP58bxMrzXROsaDbs7C+ScJuCiokf6ZXA8Oyt7xsVNj\n54Jgx7O6AfW/4HBup3gUzT/5M5nt/b25HYl6egMs1gHSrpSoKqd2wd3UIswZA6Lp5FaNwBmFqleb\ngspgSRyfAxXWR2Mg7odBtTg+GCFyYVMyrqVFM3h0QMSn+3VBMA3B7nR/DJh1g1MHVEYweH9lMEdu\nSEvKZfP/sLNtjp5XvLNBRnXN0A7jT08/TExLxF+pl9gvL02uK5v/9+qANYo1x/b+YZmMs3JBa/H3\nNXWBJ7dzi3qhWy6o537qfyc8ogTe57QOiNwB1/cF/8AAwHm1mACnIsrjs7mdKXeEy5Rrwrl8TQfM\nrCahCwQvAPS3dAMcTWK5HBwTwIVk73w16qm5KO1jKY4F0f8s3g8nAWKjdJXL5oK8Qip7Ee8VPp58\nUEsfSYhxWoDj9TJbCsYADjxpcRadzIO4qdyEJxGn6YBlylq+E5aFWGt+qTEGSACvwWrq73hG9T6g\nvi/gc0VtuiD2XZD9XVFDEO656+F5+AhHY8B0B8zlgrz1dYjcJueC1uDyWgwBY7bcz3p5/rU1wFXv\nhC2Fa33+3QrQ+uCuHwP+AlLlEmVXtBmYAAAAAElFTkSuQmCC"
      },
      terrains = {},
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 1,
      name = "tile",
      x = 0,
      y = 0,
      width = 24,
      height = 16,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483649, 2147483649, 2147483649, 2147483649, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                0, 0, 0, 0, 0, 2147483649, 2147483649, 2147483649, 2147483649, 2147483649, 2147483650, 2147483650, 2147483650, 2147483651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                2147483649, 2147483649, 2147483649, 2147483649, 0, 2, 2, 2, 2, 2, 2147483650, 2147483650, 2147483650, 2147483651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                2147483650, 2147483650, 2147483650, 2147483651, 0, 2, 2, 2, 2, 2, 2147483650, 2147483650, 2147483650, 2147483651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                2147483650, 2147483650, 2147483650, 2147483651, 0, 1, 1, 1, 1, 1, 1, 2147483649, 2147483649, 2147483649, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                2147483650, 2147483650, 2147483650, 2147483651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                2147483650, 2147483650, 2147483650, 2147483651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                2147483649, 2147483649, 2147483649, 2147483649, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,         
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0        
      }
    },
    {
      type = "objectgroup",
      id = 5,
      name = "solid",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties ={},
      objects = {
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320.0,
          y = 32.0,
          width = 128.0,
          height = 32.0,
          rotation = 0.0,
          visible = true,
          properties = {
            ["collidable"] = "true"
          },
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160.0,
          y = 64.0,
          width = 160.0,
          height = 32.0,
          rotation = 0.0,
          visible = true,
          properties = {
            ["collidable"] = "true"
          },
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160.0,
          y = 160.0,
          width = 288.0,
          height = 32.0,
          rotation = 0.0,
          visible = true,
          properties = {
            ["collidable"] = "true"
          },
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 416.0,
          y = 64.0,
          width = 32.0,
          height = 96.0,
          rotation = 0.0,
          visible = true,
          properties = {
            ["collidable"] = "true"
          },
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96.0,
          y = 128.0,
          width = 32.0,
          height = 128.0,
          rotation = 0.0,
          visible = true,
          properties = {
            ["collidable"] = "true"
          },
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0.0,
          y = 96.0,
          width = 128.0,
          height = 32.0,
          rotation = 0.0,
          visible = true,
          properties = {
            ["collidable"] = "true"
          },
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0.0,
          y = 256.0,
          width = 128.0,
          height = 32.0,
          rotation = 0.0,
          visible = true,
          properties = {
            ["collidable"] = "true"
          },
        },
      }
    },
    {
      type = "objectgroup",
      id = 6,
      name = "enty",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties ={},
      objects = {
        {
          id = 15,
          name = "",
          type = "player",
          shape = "rectangle",
          x = 39.0,
          y = 34.0,
          width = 18.0,
          height = 28.0,
          rotation = 0.0,
          visible = true,
          properties = {},
        },
        {
          id = 18,
          name = "",
          type = "portal",
          shape = "ellipse",
          x = 336.0,
          y = 80.0,
          width = 64.0,
          height = 64.0,
          rotation = 0.0,
          visible = true,
          properties = {},
        },
        {
          id = 19,
          name = "",
          type = "enemy",
          shape = "rectangle",
          x = 196.0,
          y = 0.0,
          width = 24.0,
          height = 32.0,
          rotation = 0.0,
          visible = true,
          properties = {},
        },
      }
    }
  }
}
