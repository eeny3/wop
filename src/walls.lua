function loadWalls()
    wall = world:newRectangleCollider(304, 1357, 316, 5)
    wall:setType('static')
    wall:setCollisionClass("wall")

    wall2 = world:newRectangleCollider(304, 1074, 150, 5)
    wall2:setType('static')
    wall2:setCollisionClass("wall")

    wall3 = world:newRectangleCollider(480, 1074, 142, 5)
    wall3:setType('static')
    wall3:setCollisionClass("wall")

    wall4 = world:newRectangleCollider(304, 1074, 5, 284)
    wall4:setType('static')
    wall4:setCollisionClass("wall")

    wall5 = world:newRectangleCollider(619, 1074, 5, 284)
    wall5:setType('static')
    wall5:setCollisionClass("wall")

    wall6 = world:newRectangleCollider(449, 989, 5, 83)
    wall6:setType('static')
    wall6:setCollisionClass("wall")

    wall7 = world:newRectangleCollider(479, 991, 5, 83)
    wall7:setType('static')
    wall7:setCollisionClass("wall")

    wall8 = world:newRectangleCollider(479, 989, 448, 5)
    wall8:setType('static')
    wall8:setCollisionClass("wall")

    wall9 = world:newRectangleCollider(305, 989, 144, 5)
    wall9:setType('static')
    wall9:setCollisionClass("wall")

    wall10 = world:newRectangleCollider(303, 701, 5, 288)
    wall10:setType('static')
    wall10:setCollisionClass("wall")

    wall11 = world:newRectangleCollider(305, 706, 150, 5)
    wall11:setType('static')
    wall11:setCollisionClass("wall")

    wall12 = world:newRectangleCollider(479, 706, 310, 5)
    wall12:setType('static')
    wall12:setCollisionClass("wall")

    wall13 = world:newRectangleCollider(479 + 32 + 320 - 16, 989 - 288 + 5, 128 - 16, 5)
    wall13:setType('static')
    wall13:setCollisionClass("wall")

    wall14 = world:newRectangleCollider(303 + 608 + 16, 701, 5, 128 - 16)
    wall14:setType('static')
    wall14:setCollisionClass("wall")

    wall15 = world:newRectangleCollider(303 + 608 + 16, 701 + 32 + 128, 5, 128)
    wall15:setType('static')
    wall15:setCollisionClass("wall")

    wall16 = world:newRectangleCollider(449, 989 - 384 + 16, 5, 83)
    wall16:setType('static')
    wall16:setCollisionClass("wall")

    wall17 = world:newRectangleCollider(449 + 32 - 3, 989 - 384 + 16, 5, 83)
    wall17:setType('static')
    wall17:setCollisionClass("wall")

    wall18 = world:newRectangleCollider(304, 1357 - 768 + 32, 150, 5)
    wall18:setType('static')
    wall18:setCollisionClass("wall")

    wall19 = world:newRectangleCollider(304, 1074 - 768 + 32 - 16, 150 + 64, 5)
    wall19:setType('static')
    wall19:setCollisionClass("wall")

    wall20 = world:newRectangleCollider(480, 1074 - 768 + 32 + 320 - 32 - 5, 142 - 16, 5)
    wall20:setType('static')
    wall20:setCollisionClass("wall")

    wall21 = world:newRectangleCollider(304, 1074 - 768 + 32 - 16, 5, 284 + 16)
    wall21:setType('static')
    wall21:setCollisionClass("wall")

    wall22 = world:newRectangleCollider(619 - 16, 1074 - 768 + 32 - 16, 5, 284 + 16)
    wall22:setType('static')
    wall22:setCollisionClass("wall")

    wall23 = world:newRectangleCollider(304 + 150 + 32 + 64 - 10, 1074 - 768 + 32 - 16, 64, 5)
    wall23:setType('static')
    wall23:setCollisionClass("wall")

    wall24 = world:newRectangleCollider(304 + 150 + 32 + 64 - 10, 1074 - 768 + 32 - 16 - 64 - 16 - 16, 5, 64 + 16 + 16)
    wall24:setType('static')
    wall24:setCollisionClass("wall")

    wall25 = world:newRectangleCollider(513, 226, 5, 96)
    wall25:setType('static')
    wall25:setCollisionClass("wall")

    wall26 = world:newRectangleCollider(545 - 5, 226 - 5, 80, 5)
    wall26:setType('static')
    wall26:setCollisionClass("wall")

    wall27 = world:newRectangleCollider(545 - 192 + 64, 226 - 5, 80 + 16 + 5, 5)
    wall27:setType('static')
    wall27:setCollisionClass("wall")

    wall28 = world:newRectangleCollider(545 - 192 + 64, 226 - 5 - 192, 80 + 16 + 112, 5)
    wall28:setType('static')
    wall28:setCollisionClass("wall")

    wall29 = world:newRectangleCollider(545 - 192 + 64, 226 - 5 - 192, 5, 80 + 112)
    wall29:setType('static')
    wall29:setCollisionClass("wall")

    wall30 = world:newRectangleCollider(545 - 192 + 64 + 208 - 5, 226 - 5 - 192, 5, 80 + 112)
    wall30:setType('static')
    wall30:setCollisionClass("wall")

    wall31 = world:newRectangleCollider(790 - 5, 644 - 48 - 5, 5, 64 + 48)
    wall31:setType('static')
    wall31:setCollisionClass("wall")

    wall32 = world:newRectangleCollider(790 + 32 - 5 - 3, 644 - 48 - 5, 5, 64 + 48)
    wall32:setType('static')
    wall32:setCollisionClass("wall")

    wall33 = world:newRectangleCollider(790 + 32 - 5 - 3, 644 - 48 - 5 - 2, 64 + 48 + 32 + 48, 5)
    wall33:setType('static')
    wall33:setCollisionClass("wall")

    wall34 = world:newRectangleCollider(790 + 32 - 5 - 3 - 80 + 3, 644 - 48 - 5 - 2,48 + 5, 5)
    wall34:setType('static')
    wall34:setCollisionClass("wall")

    wall35 = world:newRectangleCollider(790 - 48 - 5, 644 - 48 - 5 - 240, 5, 64 + 48 + 128)
    wall35:setType('static')
    wall35:setCollisionClass("wall")

    wall36 = world:newRectangleCollider(790 - 48 - 10 + 272, 644 - 48 - 5 - 240, 5, 64 + 48 + 128)
    wall36:setType('static')
    wall36:setCollisionClass("wall")

    wall37 = world:newRectangleCollider(790 - 48 - 5, 644 - 48 - 5 - 240, 64 + 48 + 128 + 32, 5)
    wall37:setType('static')
    wall37:setCollisionClass("wall")

    wall38 = world:newRectangleCollider(930, 813, 64 + 80 - 5, 5)
    wall38:setType('static')
    wall38:setCollisionClass("wall")

    wall39 = world:newRectangleCollider(930, 813 + 48, 64 + 80 - 5, 5)
    wall39:setType('static')
    wall39:setCollisionClass("wall")

    wall40 = world:newRectangleCollider(930 + 64 + 80 - 5, 813 + 48, 5, 416)
    wall40:setType('static')
    wall40:setCollisionClass("wall")

    wall41 = world:newRectangleCollider(930 + 64 + 80 - 5, 813 - 32, 5, 32)
    wall41:setType('static')
    wall41:setCollisionClass("wall")

    wall42 = world:newRectangleCollider(930 + 64 + 80 - 5, 813 - 32, 224, 5)
    wall42:setType('static')
    wall42:setCollisionClass("wall")

    wall43 = world:newRectangleCollider(930 + 64 + 80 - 5 + 224, 813 - 32, 5, 496)
    wall43:setType('static')
    wall43:setCollisionClass("wall")

    wall44 = world:newRectangleCollider(930 + 64 + 80 - 5, 813 + 48 + 416 - 16, 224, 5)
    wall44:setType('static')
    wall44:setCollisionClass("wall")
end