Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E958FFB7F
	for <lists+linux-media@lfdr.de>; Sun, 17 Nov 2019 20:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbfKQTk3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Nov 2019 14:40:29 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40877 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbfKQTk2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Nov 2019 14:40:28 -0500
Received: by mail-wm1-f68.google.com with SMTP id f3so16398740wmc.5
        for <linux-media@vger.kernel.org>; Sun, 17 Nov 2019 11:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lq9ZvQHp7lkFLKt/dDRyxfBj8TO9AGwHDxF/zDocuhg=;
        b=crT/3Fzd5DvnwLC2DwtCT04BdvPldgN4iXX1DwTUTwKo3Zq9IXVui8KkvUvDAXQGSQ
         xtQkZ4nWD+PTl89HjpQWo6Z5I9u3V9GS+mbppOY86RR+9Z7PPFGa7zLFmTpAuRsBPqak
         Lbfl7kRxDRz0tQ/7t/Jb/MhXwSTZrozyRCsZ7qalGYpJPDUgumFvzMpxw8Qf8p+bOZ+/
         pCvWj1J2UaOdk0GG/MM2HigEoyCErCehr6bB22sCQlZGTsHdejYIm41+08rIiG3yVOVV
         r8rs6kmBWyyAM6JTFzbSlA1TCd8sjseM6RS2ho4Fj93hsmYzGtU0dc7eZE6fPY975zpa
         kj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lq9ZvQHp7lkFLKt/dDRyxfBj8TO9AGwHDxF/zDocuhg=;
        b=JZv6U3Sk9uo+uM/j02KpGYFM/FmJmocztQ83lFqrmMiU8u9UqVWqeFIYMttujTiRkI
         HpzWLvpIBJX2ScGMggL7zMJW98cijK4eLUGDZF3GJULzykiitVCwm7RQ4MkgUgveUMLr
         xT89Vj6y6whBFOQupZbH6B8RGFS7wzxfCTm4H7ZD4Ruyrp3DUaqGH3f+g6aKI0PUnh93
         I5VM0WjhaxikOa95jB+ylD0OWZvD6+6ajoLpk1jjfakE9ahBY+CTQhHo+9aTf8aqgJ5T
         3NA26dQWP6XDZHIG9IVXgS588YZrF+h1itabK1ZLIJeIRQnlYenFhPOvTWVcUo+eQdaM
         e5kA==
X-Gm-Message-State: APjAAAXgS/AzULYonzXE2xgxJYZHSWn+b8aCqjY9EMAUeEW+2CaPjhj5
        OEvKiNjaiYyyPUkw2qXaPY9sparQer3flw==
X-Google-Smtp-Source: APXvYqxIuO7CYVTUKDHqLl+q8eZ2iXGBgGwBrgQD1o3p2I107ciqIGiSbwQ+hzNTw085kwz/zE7/jA==
X-Received: by 2002:a1c:64d4:: with SMTP id y203mr25582941wmb.27.1574019626211;
        Sun, 17 Nov 2019 11:40:26 -0800 (PST)
Received: from localhost ([37.238.189.38])
        by smtp.gmail.com with ESMTPSA id m1sm20717620wrv.37.2019.11.17.11.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 11:40:25 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: [PATCH]  media: rc: add keymap for Videostrong KII Pro
Date:   Sun, 17 Nov 2019 22:40:20 +0300
Message-Id: <20191117194020.31056-1-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an NEC remote control device shipped with the Videostrong KII Pro tv box as well as other devices from videostrong.

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 drivers/media/rc/keymaps/Makefile             |  1 +
 .../media/rc/keymaps/rc-videostrong-kii-pro.c | 85 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 3 files changed, 87 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index a56fc634d2d6..ea91a9afa6a0 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -117,6 +117,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-videomate-m1f.o \
 			rc-videomate-s350.o \
 			rc-videomate-tv-pvr.o \
+			rc-videostrong-kii-pro.o \
 			rc-wetek-hub.o \
 			rc-wetek-play2.o \
 			rc-winfast.o \
diff --git a/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
new file mode 100644
index 000000000000..7b5808526d16
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (C) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+//
+// Keytable for the Videostrong KII Pro STB remote control
+//
+
+static struct rc_map_table kii_pro[] = {
+	{ 0x59, KEY_POWER },
+	{ 0x19, KEY_MUTE },
+	{ 0x42, KEY_RED },
+	{ 0x40, KEY_GREEN },
+	{ 0x00, KEY_YELLOW },
+	{ 0x03, KEY_BLUE },
+	{ 0x4a, KEY_BACK },
+	{ 0x48, KEY_FORWARD },
+	{ 0x08, KEY_PREVIOUSSONG},
+	{ 0x0b, KEY_NEXTSONG},
+	{ 0x46, KEY_PLAYPAUSE },
+	{ 0x44, KEY_STOP },
+	{ 0x1f,KEY_FAVORITES},//KEY_F5?
+	{ 0x04,KEY_RECORD},
+	{ 0x4d,KEY_EPG},
+	{ 0x02,KEY_INFO},
+	{ 0x09,KEY_SUBTITLE},
+	{ 0x01,KEY_AUDIO},
+	{ 0x0d,KEY_HOMEPAGE},
+	{ 0x11,KEY_G},// DTV ?
+	{ 0x06,KEY_UP},
+	{ 0x5a,KEY_LEFT},
+	{ 0x1a,KEY_ENTER},// KEY_OK ?
+	{ 0x1b,KEY_RIGHT},
+	{ 0x16,KEY_DOWN},
+	
+	{ 0x45,KEY_MENU},
+	{ 0x05,KEY_ESC},
+	{ 0x13, KEY_VOLUMEUP },
+	{ 0x17, KEY_VOLUMEDOWN },
+	{ 0x58,KEY_F6},
+	{ 0x12,KEY_KATAKANA}, // mouse?
+	{ 0x55,KEY_PAGEUP}, // KEY_CHANNELUP ?
+	{ 0x15,KEY_PAGEDOWN}, //KEY_CHANNELDOWN ?
+	{ 0x52,KEY_1},
+	{ 0x50,KEY_2},
+	{ 0x10,KEY_3},
+	{ 0x56,KEY_4},
+	{ 0x54,KEY_5},
+	{ 0x14,KEY_6},
+	{ 0x4e,KEY_7},
+	{ 0x4c,KEY_8},
+	{ 0x0c,KEY_9},
+	{ 0x18,KEY_F7},
+	{ 0x0f,KEY_0},
+	{ 0x51,KEY_BACKSPACE},
+
+};
+
+static struct rc_map_list kii_pro_map = {
+	.map = {
+		.scan     = kii_pro,
+		.size     = ARRAY_SIZE(kii_pro),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_KII_PRO,
+	}
+};
+
+static int __init init_rc_map_kii_pro(void)
+{
+	return rc_map_register(&kii_pro_map);
+}
+
+static void __exit exit_rc_map_kii_pro(void)
+{
+	rc_map_unregister(&kii_pro_map);
+}
+
+module_init(init_rc_map_kii_pro)
+module_exit(exit_rc_map_kii_pro)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mohammad Rasim <mohammad.rasim96@gmail.com>");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index afd2ab31bdf2..b4e70d22a9d5 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -271,6 +271,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_VIDEOMATE_K100            "rc-videomate-k100"
 #define RC_MAP_VIDEOMATE_S350            "rc-videomate-s350"
 #define RC_MAP_VIDEOMATE_TV_PVR          "rc-videomate-tv-pvr"
+#define RC_MAP_KII_PRO                     "rc-videostrong-kii-pro"
 #define RC_MAP_WETEK_HUB                 "rc-wetek-hub"
 #define RC_MAP_WETEK_PLAY2               "rc-wetek-play2"
 #define RC_MAP_WINFAST                   "rc-winfast"
-- 
2.23.0

