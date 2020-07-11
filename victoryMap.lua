return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.3.4",
  orientation = "orthogonal",
  renderorder = "left-up",
  width = 12,
  height = 12,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 3,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "tileset",
      firstgid = 1,
      filename = "tilesetVic.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 32,
      image = "graphics/tileset.png",
      imagewidth = 512,
      imageheight = 512,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 1024,
      tiles = {
        {
          id = 40,
          animation = {
            {
              tileid = 40,
              duration = 100
            },
            {
              tileid = 41,
              duration = 100
            },
            {
              tileid = 42,
              duration = 100
            },
            {
              tileid = 43,
              duration = 100
            }
          }
        },
        {
          id = 463,
          animation = {
            {
              tileid = 463,
              duration = 300
            },
            {
              tileid = 464,
              duration = 300
            },
            {
              tileid = 465,
              duration = 300
            }
          }
        },
        {
          id = 495,
          animation = {
            {
              tileid = 495,
              duration = 300
            },
            {
              tileid = 496,
              duration = 300
            },
            {
              tileid = 497,
              duration = 300
            }
          }
        },
        {
          id = 562,
          animation = {
            {
              tileid = 562,
              duration = 300
            },
            {
              tileid = 563,
              duration = 300
            }
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 1,
      name = "floor",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 130, 130, 130, 130, 130, 130, 130, 130, 0, 0,
        0, 0, 130, 130, 130, 130, 130, 130, 130, 130, 0, 0,
        0, 0, 130, 130, 130, 130, 130, 130, 130, 130, 0, 0,
        0, 0, 130, 130, 130, 130, 130, 130, 130, 130, 0, 0,
        0, 0, 130, 130, 130, 130, 130, 130, 130, 130, 0, 0,
        0, 0, 130, 130, 130, 130, 130, 130, 130, 130, 0, 0,
        0, 0, 130, 130, 130, 130, 130, 130, 130, 130, 0, 0,
        0, 0, 130, 130, 130, 130, 130, 130, 130, 130, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      id = 2,
      name = "walls",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 419, 420, 0, 0, 0, 0, 0,
        0, 0, 227, 3, 450, 454, 455, 453, 3, 228, 0, 0,
        0, 0, 259, 66, 482, 486, 487, 485, 66, 260, 0, 0,
        0, 0, 258, 0, 0, 0, 0, 0, 0, 257, 0, 0,
        0, 0, 258, 0, 0, 531, 0, 0, 0, 257, 0, 0,
        0, 0, 258, 0, 0, 41, 0, 0, 0, 257, 0, 0,
        0, 0, 258, 563, 496, 0, 0, 496, 563, 257, 0, 0,
        0, 0, 258, 0, 563, 464, 464, 563, 0, 257, 0, 0,
        0, 0, 291, 3, 3, 3, 3, 3, 3, 292, 0, 0,
        0, 0, 323, 35, 35, 35, 35, 35, 35, 324, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
