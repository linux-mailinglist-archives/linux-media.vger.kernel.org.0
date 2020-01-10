Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D728413737F
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 17:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbgAJQZu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 11:25:50 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44726 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728474AbgAJQZu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 11:25:50 -0500
Received: by mail-wr1-f66.google.com with SMTP id q10so2368262wrm.11
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2020 08:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G0AX1yfFRW6HDZGzDQ9EaHqKYHKiSmV5U3fr8wITPK4=;
        b=Xe4rE2oiwfkGxtemT+eVE0/VvU0pH8GE3HWNLdA2zas+3LBOjemkixkV95o8sqg/yg
         /H74kXPS1NNOPRRfKYXHptQsKQRiYzOcvfGX45JZEoZUOFm1MKvj5lic6Pf1VKRSTgXW
         LVCXCIU7IC6FrMCM/fBc9/mpRQ6CsfT1gBx7S2VupMiSudrC+dEYl/1kNmiLsTYWgKYn
         acNfrBuyXG+4xZyN+H6vyN2vrqSWLYfl4y7kSq+PQWbA7vCuPWejBi0l0P1YxrdqFyML
         6+wx+1AZbzjcU2HJ4dFnB7gG9AhLfFyigvh4vUvoYFmp9a9Ia8ivxwM6nUmx9YVL5010
         ICrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G0AX1yfFRW6HDZGzDQ9EaHqKYHKiSmV5U3fr8wITPK4=;
        b=DFfoK0Jfj8hrtan3t9dcB+JR7x8pwa/lVNP2fM14s/OBccX5ht9JUropSNZkI6vZQr
         +GvUJCTgCdW3i3s4jQwDhLHelUahXuv4Dz7Y4q27yxlQT7XligmoBv3PxSi5VbSBH43O
         p0zAqH3CYM6FR+/lN/NGpQbATIULtvqA4IG54TlfgdYLPjtH7fpfAq7EFSeyur1uCbMi
         8QWU0Jk2XMMATYWGEJ4A4t9XRg5ta3krX16K9K9AwywQB6Wa0dPwo127krNH62h0/QwP
         1DIiH4Ueo+ex1xfBNp7WmTcQdz8IuJ8wmj+U5uc57z41958HZ712/jensjcFydw6HQjE
         0ngA==
X-Gm-Message-State: APjAAAV2M3q4gggX0ySDxxrBz1gsKuM8I9KGlyDsuEcPlaqMopyAXl/z
        C7VmsGgaQO4iTnNwmPszIsslB1pD
X-Google-Smtp-Source: APXvYqxf9PRH793cV3gvy6+qwzRScXOXLCSeJzbNmLP2CfgfPcJ7We9/HiJW4pOutB+aCHs/FfAdFw==
X-Received: by 2002:adf:eb09:: with SMTP id s9mr4609417wrn.61.1578673548494;
        Fri, 10 Jan 2020 08:25:48 -0800 (PST)
Received: from localhost ([37.237.208.29])
        by smtp.gmail.com with ESMTPSA id z6sm2709834wrw.36.2020.01.10.08.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 08:25:47 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: [PATCH v3] media: rc: add keymap for Videostrong KII Pro
Date:   Fri, 10 Jan 2020 19:25:45 +0300
Message-Id: <20200110162545.4299-1-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an NEC remote control device shipped with the Videostrong KII Pro tv box as well as other devices from videostrong.

Changes since v1:
- fix styling issues

Changes since v2:
- use KEY_VENDOR for mouse key
- use KEY_PVR instead of KEY_RECORD
- use KEY_APPSELECT for the launcher
- use KEY_TV for the tv app key

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 drivers/media/rc/keymaps/Makefile             |  1 +
 .../media/rc/keymaps/rc-videostrong-kii-pro.c | 83 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 3 files changed, 85 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index 63261ef6380a..aaa1bf81d00d 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -119,6 +119,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-videomate-m1f.o \
 			rc-videomate-s350.o \
 			rc-videomate-tv-pvr.o \
+			rc-videostrong-kii-pro.o \
 			rc-wetek-hub.o \
 			rc-wetek-play2.o \
 			rc-winfast.o \
diff --git a/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
new file mode 100644
index 000000000000..74a278ffa3f1
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
@@ -0,0 +1,83 @@
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
+	{ 0x1f, KEY_FAVORITES},	//KEY_F5?
+	{ 0x04, KEY_PVR},
+	{ 0x4d, KEY_EPG},
+	{ 0x02, KEY_INFO},
+	{ 0x09, KEY_SUBTITLE},
+	{ 0x01, KEY_AUDIO},
+	{ 0x0d, KEY_HOMEPAGE},
+	{ 0x11, KEY_TV},		// DTV ?
+	{ 0x06, KEY_UP},
+	{ 0x5a, KEY_LEFT},
+	{ 0x1a, KEY_ENTER},	// KEY_OK ?
+	{ 0x1b, KEY_RIGHT},
+	{ 0x16, KEY_DOWN},
+	{ 0x45, KEY_MENU},
+	{ 0x05, KEY_ESC},
+	{ 0x13, KEY_VOLUMEUP },
+	{ 0x17, KEY_VOLUMEDOWN },
+	{ 0x58, KEY_APPSELECT},
+	{ 0x12, KEY_VENDOR},	// mouse
+	{ 0x55, KEY_PAGEUP},	// KEY_CHANNELUP ?
+	{ 0x15, KEY_PAGEDOWN},	//KEY_CHANNELDOWN ?
+	{ 0x52, KEY_1},
+	{ 0x50, KEY_2},
+	{ 0x10, KEY_3},
+	{ 0x56, KEY_4},
+	{ 0x54, KEY_5},
+	{ 0x14, KEY_6},
+	{ 0x4e, KEY_7},
+	{ 0x4c, KEY_8},
+	{ 0x0c, KEY_9},
+	{ 0x18, KEY_F7},
+	{ 0x0f, KEY_0},
+	{ 0x51, KEY_BACKSPACE},
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
index f99575a0d29c..d22810dcd85c 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -274,6 +274,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_VIDEOMATE_K100            "rc-videomate-k100"
 #define RC_MAP_VIDEOMATE_S350            "rc-videomate-s350"
 #define RC_MAP_VIDEOMATE_TV_PVR          "rc-videomate-tv-pvr"
+#define RC_MAP_KII_PRO                   "rc-videostrong-kii-pro"
 #define RC_MAP_WETEK_HUB                 "rc-wetek-hub"
 #define RC_MAP_WETEK_PLAY2               "rc-wetek-play2"
 #define RC_MAP_WINFAST                   "rc-winfast"
--
2.24.1

