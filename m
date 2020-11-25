Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C69AB2C3EBE
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 12:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbgKYLH3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 06:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbgKYLH2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 06:07:28 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C316C0613D4;
        Wed, 25 Nov 2020 03:07:27 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id p19so1302903wmg.0;
        Wed, 25 Nov 2020 03:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IQpZCTG2ajIafMLR32rrbFLdqRcGdjvNLEVVBXg2fLk=;
        b=QTY+q9ceZhy0sSRRIEXzXSqAN4hblN2GKVz9XC//RifdYmZNj+4zW3bJgN+ePN0G0p
         qrE0Axyl2MXXzCPSV7dY9LkWGH66NX7QLZvaTHEbOooljffN04MEWMfXPZ62CW9bBn/L
         /UmsxYgXz8XVHZ8SiCLQlDED8rB+nQGaaZqctsyZqPSbk4zqgR3rn3GUyR4pQl1Ns0BR
         vPUXIQqe/7kHTRxwJSJqaMXrhkSxKv1H8RiIwe9gb5+Bz8N8IPwqLKSs0IUlyS6U+KlC
         59kFqXgFC0ZzR2ht5UvW7vLayCTgBlwdrtyztHuzqgk/xCmJK8tdEXClNUZVh99hH/Zj
         w2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IQpZCTG2ajIafMLR32rrbFLdqRcGdjvNLEVVBXg2fLk=;
        b=AZQ4a96QoV8oMTFcA0iMDqPmRMxEKWMya8MAJGqN1wMxcpsI+xdasij1KE4G/Gz+nD
         P8N9FShBd1rOLHwoPT77ID+BF5feqh6fscsseMCHJlqeh/zhHe7esXjRJ9OamgnDCJdt
         jO3curth+FsGX/5nwSrkXX9F8ER6SCi8lDyyaofJtK105iY2gfSRAoTlfVrvOxu2r4v0
         qN1pLUeElQPKI9HonmGrKuTwUxmcuShGjacrrdsluB5l3nlUHyEdnWrHsdURvUsygXxh
         t0Eqfg31blyqrls0K9K7TGNTWQ/PbES5+byPptm6+M/GvjFYi+XRQbwx9F/W+CHzi0Jo
         kR1w==
X-Gm-Message-State: AOAM533W2qS3FBiWe5sSoGBOWhjbBIXACVg2rQUwqQZkiw7N7XYIt5Si
        f3A5BbsQ8hFVVC504+JbUKA=
X-Google-Smtp-Source: ABdhPJzQUT9KbvbLakQ8riMCF8kjC8hRzH5cktrCOjKC+4dUkrOWrlwKDci492zEk4WKvO+18nSmYQ==
X-Received: by 2002:a1c:9d08:: with SMTP id g8mr3273122wme.171.1606302445889;
        Wed, 25 Nov 2020 03:07:25 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id f23sm3884322wml.14.2020.11.25.03.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 03:07:24 -0800 (PST)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2] media: rc: add keymap for KHAMSIN remote
Date:   Wed, 25 Nov 2020 11:07:21 +0000
Message-Id: <20201125110721.600-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This remote ships with the Amlogic SML-5442TW IPTV/VOD Set-Top Box
used by O2.cz. This keymap adds support for the default IR controls.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---

v2 changes:
- added rc.yaml bindings
- fixed typos and removed stray URL reference

 .../devicetree/bindings/media/rc.yaml         |  1 +
 drivers/media/rc/keymaps/Makefile             |  1 +
 drivers/media/rc/keymaps/rc-khamsin.c         | 75 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 4 files changed, 78 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-khamsin.c

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index 8ad2cba5f61f..03cf40f91d6c 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -83,6 +83,7 @@ properties:
       - rc-it913x-v2
       - rc-kaiomy
       - rc-khadas
+      - rc-khamsin
       - rc-kworld-315u
       - rc-kworld-pc150u
       - rc-kworld-plus-tv-analog
diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index aaa1bf81d00d..1c4d6bec0ae4 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -60,6 +60,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-it913x-v2.o \
 			rc-kaiomy.o \
 			rc-khadas.o \
+			rc-khamsin.o \
 			rc-kworld-315u.o \
 			rc-kworld-pc150u.o \
 			rc-kworld-plus-tv-analog.o \
diff --git a/drivers/media/rc/keymaps/rc-khamsin.c b/drivers/media/rc/keymaps/rc-khamsin.c
new file mode 100644
index 000000000000..0c98c2faacff
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-khamsin.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2020 Christian Hewitt
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+/*
+ * KHAMSIN is an IR/Bluetooth RCU supplied with the SmartLabs
+ * SML-5442TW DVB-S/VOD box. The RCU has separate IR (TV) and
+ * BT (STB) modes. This keymap suppors the IR controls.
+ */
+
+static struct rc_map_table khamsin[] = {
+	{ 0x70702, KEY_POWER},
+
+	{ 0x70701, KEY_VIDEO}, // source
+
+	{ 0x7076c, KEY_RED},
+	{ 0x70714, KEY_GREEN},
+	{ 0x70715, KEY_YELLOW},
+	{ 0x70716, KEY_BLUE},
+
+	{ 0x7071a, KEY_MENU},
+	{ 0x7074f, KEY_EPG},
+
+	{ 0x70760, KEY_UP },
+	{ 0x70761, KEY_DOWN },
+	{ 0x70765, KEY_LEFT },
+	{ 0x70762, KEY_RIGHT },
+	{ 0x70768, KEY_ENTER },
+
+	{ 0x7072d, KEY_ESC }, // back
+
+	{ 0x70707, KEY_VOLUMEUP },
+	{ 0x7070b, KEY_VOLUMEDOWN },
+	{ 0x7070f, KEY_MUTE },
+	{ 0x70712, KEY_CHANNELUP },
+	{ 0x70710, KEY_CHANNELDOWN },
+
+	{ 0x70704, KEY_1 },
+	{ 0x70705, KEY_2 },
+	{ 0x70706, KEY_3 },
+	{ 0x70708, KEY_4 },
+	{ 0x70709, KEY_5 },
+	{ 0x7070a, KEY_6 },
+	{ 0x7070c, KEY_7 },
+	{ 0x7070d, KEY_8 },
+	{ 0x7070e, KEY_9 },
+	{ 0x70711, KEY_0 },
+};
+
+static struct rc_map_list khamsin_map = {
+	.map = {
+		.scan     = khamsin,
+		.size     = ARRAY_SIZE(khamsin),
+		.rc_proto = RC_PROTO_NECX,
+		.name     = RC_MAP_KHAMSIN,
+	}
+};
+
+static int __init init_rc_map_khamsin(void)
+{
+	return rc_map_register(&khamsin_map);
+}
+
+static void __exit exit_rc_map_khamsin(void)
+{
+	rc_map_unregister(&khamsin_map);
+}
+
+module_init(init_rc_map_khamsin)
+module_exit(exit_rc_map_khamsin)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com>");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 7dbb91c601a7..fa270f16a97b 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -263,6 +263,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_IT913X_V2                 "rc-it913x-v2"
 #define RC_MAP_KAIOMY                    "rc-kaiomy"
 #define RC_MAP_KHADAS                    "rc-khadas"
+#define RC_MAP_KHAMSIN                   "rc-khamsin"
 #define RC_MAP_KWORLD_315U               "rc-kworld-315u"
 #define RC_MAP_KWORLD_PC150U             "rc-kworld-pc150u"
 #define RC_MAP_KWORLD_PLUS_TV_ANALOG     "rc-kworld-plus-tv-analog"
-- 
2.17.1

