Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FFC2B8CFD
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 09:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgKSIWY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 03:22:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgKSIWW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 03:22:22 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04774C0613CF;
        Thu, 19 Nov 2020 00:22:21 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 1so5897339wme.3;
        Thu, 19 Nov 2020 00:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WacJpfQKRB3BwL5o2ivrhIEnIpS2jg5Q0aCU51RK5eE=;
        b=EyS3pQs58yz3Uf73knHb1GNjtFMM9k2doALYiF0aGBerD5H1KblUV6Uz48pjeE4VZ5
         887hD2UwK4m+JoEx+dcmjHaBf4/XTDUwvJfcJnQaQhUFZLl1bUsN57XEEZew00ZazTSN
         aDkPcgGCus4MUJxMohKe0YFD97bJf1Z/JnaliqJwfYt/0h/J4U5m34B2XFaHNwEYinG+
         OJKpfq0t6odI3DU8geL2whUQ2rWTFqULxDHHW7XZCgWZl9V7Be8PVfOiHC9GVzdbOT/w
         Wv1UMh6Gz5aBPEvxRLFRKyd/OaZiUNCfZLf+oKB8X9URrsaKl8Mj/0YhlWy9jBJkSA0I
         DzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WacJpfQKRB3BwL5o2ivrhIEnIpS2jg5Q0aCU51RK5eE=;
        b=MivA2uNIiuI9+AsWxtApww8+ih60nT90MOMJFkXKNsWM+/Yoa1HFljNFKS9gIgzXf7
         qbijzGl0eayUApjL5Gnrl01Q3QOaYdrKf0AadfxnxUfVSdhoyi4rvQlolebAMA/gqm6W
         HkNGVeLZwlA8YKlc1sptozisx5mGTHFSOpVEuMVMMQpZ5mnkOepZ69q8voxg5F02BTjk
         5YnnKJ93+LMh+vNLMdF+uteAquS5kFTsKZnraxhvjlGpjI/AeiwOErHRNbkUC/AdqyZP
         kSngAk2kGa2MSeFYaeVfVE4ujq7tLe4HCJafESwEEzIX/kG5pmA66xXrlUq/ZwgQ0lE7
         rkCg==
X-Gm-Message-State: AOAM5307R2+gdUqjDGXMdEwg03tfs98X6S1lvZDbpdDFuyT0za4rrUgL
        GIuSTACE6/kbL9ea5e32jMY=
X-Google-Smtp-Source: ABdhPJymNK92TC6ViKAP45B84ih2DIwRAra5etXo/rqCdAe7AGBeve/9iYLYe19NXDUae9Gt7Z5zmw==
X-Received: by 2002:a1c:984f:: with SMTP id a76mr3120294wme.40.1605774139742;
        Thu, 19 Nov 2020 00:22:19 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id u6sm7989655wmj.40.2020.11.19.00.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 00:22:18 -0800 (PST)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] media: rc: add keymap for KHAMSIN remote
Date:   Thu, 19 Nov 2020 08:22:15 +0000
Message-Id: <20201119082215.12430-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This remote ships with the Amlogic SML-5442TW IPTV/VOD Set-tob Box [0]
used by O2.cz. This keymap adds support for the default IR controls.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/media/rc/keymaps/Makefile     |  1 +
 drivers/media/rc/keymaps/rc-khamsin.c | 75 +++++++++++++++++++++++++++
 include/media/rc-map.h                |  1 +
 3 files changed, 77 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-khamsin.c

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
index 000000000000..8a397590009a
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
+		.rc_proto = RC_PROTO_NEC,
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

