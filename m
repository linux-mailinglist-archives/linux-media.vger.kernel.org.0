Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A208C34D375
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 17:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhC2PMu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 11:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbhC2PMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 11:12:31 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18F5C061574;
        Mon, 29 Mar 2021 08:12:30 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id v11so13212487wro.7;
        Mon, 29 Mar 2021 08:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bJi1eseWXU0tmC7peycqL8Me3pFVaa4OTbRnIiXuxHQ=;
        b=cp1thgt7FV6wEnyvgPA6l/IWvmL78kvwVWPteN8fRyJgr18MFYcy3pE4utwOY4uyIZ
         UT29N7brLahGa6YV/i6p4PEYQD4bK+mrpsM7VMZWl4KbmbOk6tCgd+lcdk1E8695E3Wo
         qfOeErNwAjZn0CuQ+yCZmLS0bfgV4/owNn7dr2PIZqofwoaGDMTK4gXJqWm9r9RZ/acK
         QZ5I1W8O0XSnRPFtDbzjX/l0tQ9oNBQ8VBazCG8AKBX27GsLriOKG0MEr21dTvjGZXP3
         iTAR1QFr34XuqZRqFClh4aXNhBxDAYzZPfDyDQBcpPrxrsivIJ+Slg4J2TxdcPedMVWa
         WOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bJi1eseWXU0tmC7peycqL8Me3pFVaa4OTbRnIiXuxHQ=;
        b=d2XeB6Z0tzUz3gBAgskyhTuDzlt8934L74C+2NFlPPFMEIwgUpp8Lit1m05I7dj+3/
         IEw9MA7YT01h7TvJfjfmYkB6MdZVJNKcfG+MBfc/R67rw8PrBeiohZPB42E4QCyrPsfz
         odtviwJD2qcOtorzztstiO5bAFfj0xNzGiWh6FKxPF9l8F/iJCgpil5qZkDF1EHm7HpD
         Ia5lg9IJw/R6umNcKnRmIztuvUmGD71orn7ePQbBvKf6+0TNxGRMcArqC4QEb6pQQv85
         RfsXaQVj/YFqp4KVzEPVqNxjqUXtWcUB4XDDezLDc3e7zD9N7wD0iwiQZAKKZgotfN92
         K5pw==
X-Gm-Message-State: AOAM532JUHi7SC1Mj2IiSJTMhdol2N+DavgoIlbueQ9K4G7qU9t/3bCf
        x2cb3EGktqFbPHeYQw3EclXQG019DTc=
X-Google-Smtp-Source: ABdhPJys6G69Hg9CKZLCEtBJHb7t5HR2yy7mVTTS+yCJC1Hommbeek8aqJ2KJHBvTYwydj+9blnQOw==
X-Received: by 2002:adf:e603:: with SMTP id p3mr29233423wrm.360.1617030749434;
        Mon, 29 Mar 2021 08:12:29 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 13sm25148343wmw.5.2021.03.29.08.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 08:12:29 -0700 (PDT)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] media: rc: add keymaps for mecool-kii-pro/kiii-pro remotes
Date:   Mon, 29 Mar 2021 15:12:26 +0000
Message-Id: <20210329151226.29301-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add keymaps and bindings for the simple IR (NEC) remotes used with
the MeCool KII-Pro and MeCool KIII-Pro Android STB devices.

Tested-by: Drazen Spio <drazsp@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../devicetree/bindings/media/rc.yaml         |  2 +
 drivers/media/rc/keymaps/Makefile             |  2 +
 drivers/media/rc/keymaps/rc-mecool-kii-pro.c  | 93 +++++++++++++++++++
 drivers/media/rc/keymaps/rc-mecool-kiii-pro.c | 90 ++++++++++++++++++
 include/media/rc-map.h                        |  2 +
 5 files changed, 189 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-mecool-kii-pro.c
 create mode 100644 drivers/media/rc/keymaps/rc-mecool-kiii-pro.c

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index 946441b4e1a5..365ccd5512b2 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -90,6 +90,8 @@ properties:
       - rc-leadtek-y04g0051
       - rc-lme2510
       - rc-manli
+      - rc-mecool-kii-pro
+      - rc-mecool-kiii-pro
       - rc-medion-x10
       - rc-medion-x10-digitainer
       - rc-medion-x10-or2x
diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index b252a1d2ebd6..642e577701e1 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -67,6 +67,8 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-leadtek-y04g0051.o \
 			rc-lme2510.o \
 			rc-manli.o \
+			rc-mecool-kii-pro.o \
+			rc-mecool-kiii-pro.o \
 			rc-medion-x10.o \
 			rc-medion-x10-digitainer.o \
 			rc-medion-x10-or2x.o \
diff --git a/drivers/media/rc/keymaps/rc-mecool-kii-pro.c b/drivers/media/rc/keymaps/rc-mecool-kii-pro.c
new file mode 100644
index 000000000000..08ffdd1352ce
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-mecool-kii-pro.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (C) 2021 Christian Hewitt <christianshewitt@gmail.com>
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+//
+// Keytable for the Mecool Kii Pro remote control
+//
+
+static struct rc_map_table mecool_kii_pro[] = {
+
+	{ 0x59, KEY_POWER },
+	{ 0x19, KEY_MUTE },
+
+	{ 0x42, KEY_RED },
+	{ 0x40, KEY_GREEN },
+	{ 0x00, KEY_YELLOW},
+	{ 0x03, KEY_BLUE },
+
+	{ 0x4a, KEY_REWIND },
+	{ 0x48, KEY_FORWARD },
+	{ 0x08, KEY_PREVIOUSSONG},
+	{ 0x0b, KEY_NEXTSONG},
+
+	{ 0x46, KEY_PLAYPAUSE },
+	{ 0x44, KEY_STOP },
+	{ 0x1f, KEY_FAVORITES},
+	{ 0x04, KEY_PVR },
+
+	{ 0x4d, KEY_EPG },
+	{ 0x02, KEY_INFO },
+	{ 0x09, KEY_SUBTITLE },
+	{ 0x01, KEY_LANGUAGE }, // AUDIO
+
+	{ 0x0d, KEY_HOME },
+	{ 0x11, KEY_TV },
+	{ 0x45, KEY_MENU },
+	{ 0x05, KEY_EXIT },
+
+	{ 0x5a, KEY_LEFT },
+	{ 0x1b, KEY_RIGHT },
+	{ 0x06, KEY_UP },
+	{ 0x16, KEY_DOWN },
+	{ 0x1a, KEY_OK },
+
+	{ 0x13, KEY_VOLUMEUP },
+	{ 0x17, KEY_VOLUMEDOWN },
+	{ 0x58, KEY_APPSELECT }, // APPS
+	{ 0x12, KEY_CONTEXT_MENU }, // MOUSE
+	{ 0x55, KEY_CHANNELUP }, // PAGE_UP
+	{ 0x15, KEY_CHANNELDOWN }, // PAGE_DOWN
+
+	{ 0x52, KEY_1 },
+	{ 0x50, KEY_2 },
+	{ 0x10, KEY_3 },
+	{ 0x56, KEY_4 },
+	{ 0x54, KEY_5 },
+	{ 0x14, KEY_6 },
+	{ 0x4e, KEY_7 },
+	{ 0x4c, KEY_8 },
+	{ 0x0c, KEY_9 },
+	{ 0x18, KEY_WWW },
+	{ 0x0f, KEY_0 },
+	{ 0x51, KEY_DELETE },
+
+};
+
+static struct rc_map_list mecool_kii_pro_map = {
+	.map = {
+		.scan     = mecool_kii_pro,
+		.size     = ARRAY_SIZE(mecool_kii_pro),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_MECOOL_KII_PRO,
+	}
+};
+
+static int __init init_rc_map_mecool_kii_pro(void)
+{
+	return rc_map_register(&mecool_kii_pro_map);
+}
+
+static void __exit exit_rc_map_mecool_kii_pro(void)
+{
+	rc_map_unregister(&mecool_kii_pro_map);
+}
+
+module_init(init_rc_map_mecool_kii_pro)
+module_exit(exit_rc_map_mecool_kii_pro)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
diff --git a/drivers/media/rc/keymaps/rc-mecool-kiii-pro.c b/drivers/media/rc/keymaps/rc-mecool-kiii-pro.c
new file mode 100644
index 000000000000..6a2a9c35ba3d
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-mecool-kiii-pro.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (C) 2021 Christian Hewitt <christianshewitt@gmail.com>
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+//
+// Keytable for the Mecool Kiii Pro remote control
+//
+
+static struct rc_map_table mecool_kiii_pro[] = {
+
+	{ 0x59, KEY_POWER },
+
+	{ 0x52, KEY_1 },
+	{ 0x50, KEY_2 },
+	{ 0x10, KEY_3 },
+	{ 0x56, KEY_4 },
+	{ 0x54, KEY_5 },
+	{ 0x14, KEY_6 },
+	{ 0x4e, KEY_7 },
+	{ 0x4c, KEY_8 },
+	{ 0x0c, KEY_9 },
+	{ 0x02, KEY_INFO },
+	{ 0x0f, KEY_0 },
+	{ 0x51, KEY_DELETE },
+	{ 0x1f, KEY_FAVORITES},
+	{ 0x09, KEY_SUBTITLE },
+	{ 0x01, KEY_LANGUAGE }, // AUDIO
+
+	{ 0x42, KEY_RED },
+	{ 0x40, KEY_GREEN },
+	{ 0x00, KEY_YELLOW},
+	{ 0x03, KEY_BLUE }, // RADIO
+
+	{ 0x0d, KEY_HOME },
+	{ 0x4d, KEY_EPG },
+	{ 0x45, KEY_MENU },
+	{ 0x05, KEY_EXIT },
+
+	{ 0x5a, KEY_LEFT },
+	{ 0x1b, KEY_RIGHT },
+	{ 0x06, KEY_UP },
+	{ 0x16, KEY_DOWN },
+	{ 0x1a, KEY_OK },
+
+	{ 0x13, KEY_VOLUMEUP },
+	{ 0x17, KEY_VOLUMEDOWN },
+	{ 0x19, KEY_MUTE },
+	{ 0x12, KEY_CONTEXT_MENU }, // MOUSE
+	{ 0x55, KEY_CHANNELUP }, // PAGE_UP
+	{ 0x15, KEY_CHANNELDOWN }, // PAGE_DOWN
+
+	{ 0x4a, KEY_REWIND },
+	{ 0x48, KEY_FORWARD },
+	{ 0x46, KEY_PLAYPAUSE },
+	{ 0x44, KEY_STOP },
+
+	{ 0x08, KEY_PREVIOUSSONG},
+	{ 0x0b, KEY_NEXTSONG},
+	{ 0x04, KEY_PVR },
+	{ 0x64, KEY_RECORD },
+
+};
+
+static struct rc_map_list mecool_kiii_pro_map = {
+	.map = {
+		.scan     = mecool_kiii_pro,
+		.size     = ARRAY_SIZE(mecool_kiii_pro),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_MECOOL_KIII_PRO,
+	}
+};
+
+static int __init init_rc_map_mecool_kiii_pro(void)
+{
+	return rc_map_register(&mecool_kiii_pro_map);
+}
+
+static void __exit exit_rc_map_mecool_kiii_pro(void)
+{
+	rc_map_unregister(&mecool_kiii_pro_map);
+}
+
+module_init(init_rc_map_mecool_kiii_pro)
+module_exit(exit_rc_map_mecool_kiii_pro)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 999b750bc6b8..ba3d71655ab3 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -270,6 +270,8 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_LEADTEK_Y04G0051          "rc-leadtek-y04g0051"
 #define RC_MAP_LME2510                   "rc-lme2510"
 #define RC_MAP_MANLI                     "rc-manli"
+#define RC_MAP_MECOOL_KII_PRO            "rc-mecool-kii-pro"
+#define RC_MAP_MECOOL_KIII_PRO           "rc-mecool-kiii-pro"
 #define RC_MAP_MEDION_X10                "rc-medion-x10"
 #define RC_MAP_MEDION_X10_DIGITAINER     "rc-medion-x10-digitainer"
 #define RC_MAP_MEDION_X10_OR2X           "rc-medion-x10-or2x"
-- 
2.17.1

