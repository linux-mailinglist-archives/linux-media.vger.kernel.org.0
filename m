Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED25397B4C
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 22:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234793AbhFAUgS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 16:36:18 -0400
Received: from forward105j.mail.yandex.net ([5.45.198.248]:60887 "EHLO
        forward105j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234671AbhFAUgS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Jun 2021 16:36:18 -0400
X-Greylist: delayed 370 seconds by postgrey-1.27 at vger.kernel.org; Tue, 01 Jun 2021 16:36:17 EDT
Received: from myt6-640abdf8240b.qloud-c.yandex.net (myt6-640abdf8240b.qloud-c.yandex.net [IPv6:2a02:6b8:c12:238c:0:640:640a:bdf8])
        by forward105j.mail.yandex.net (Yandex) with ESMTP id 22029B20562;
        Tue,  1 Jun 2021 23:28:18 +0300 (MSK)
Received: from myt6-efff10c3476a.qloud-c.yandex.net (myt6-efff10c3476a.qloud-c.yandex.net [2a02:6b8:c12:13a3:0:640:efff:10c3])
        by myt6-640abdf8240b.qloud-c.yandex.net (mxback/Yandex) with ESMTP id Odkf8wDvLA-SHJqaEG7;
        Tue, 01 Jun 2021 23:28:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1622579298;
        bh=VIm8SC8iGm6JjXeLW6aICVBlDZmmbjIXsRJVbWSSChI=;
        h=Date:Subject:To:From:Message-Id:Cc;
        b=kSk9pyfQrSb1dE5qWTwGCkndqsJBDUtfUAGQh8LdqX3VeSwIva0UMK4C5gEBiRKdS
         dUhLgLwwCzu9c3dljL2WMnKktHsYxfGVPtWx7I4AVOslJKqHrmuti6HCLo+RQ+8naF
         geV4m7NMNgdodvRJDwhFPgvquqcwH2pxiFUOecWs=
Authentication-Results: myt6-640abdf8240b.qloud-c.yandex.net; dkim=pass header.i=@ya.ru
Received: by myt6-efff10c3476a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id S5fBcGf33l-SHLWsSvi;
        Tue, 01 Jun 2021 23:28:17 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Alexander Voronov <avv.0@ya.ru>
Cc:     sean@mess.org, robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        avv.0@ya.ru
Subject: [PATCH] media: rc: add keymap for Toshiba CT-90405 remote
Date:   Tue,  1 Jun 2021 23:28:12 +0300
Message-Id: <20210601202812.97898-1-avv.0@ya.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an NEC remote control device shipped with some Toshiba TVs.

Signed-off-by: Alexander Voronov <avv.0@ya.ru>
---
 .../devicetree/bindings/media/rc.yaml         |  1 +
 drivers/media/rc/keymaps/Makefile             |  1 +
 drivers/media/rc/keymaps/rc-ct-90405.c        | 86 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 4 files changed, 89 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-ct-90405.c

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index e3cea8cd7..b9ee13838 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -45,6 +45,7 @@ properties:
       - rc-cec
       - rc-cinergy
       - rc-cinergy-1400
+      - rc-ct-90405
       - rc-d680-dmb
       - rc-delock-61959
       - rc-dib0700-nec
diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index ae7474a22..f93cf3298 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-cec.o \
 			rc-cinergy-1400.o \
 			rc-cinergy.o \
+			rc-ct-90405.o \
 			rc-d680-dmb.o \
 			rc-delock-61959.o \
 			rc-dib0700-nec.o \
diff --git a/drivers/media/rc/keymaps/rc-ct-90405.c b/drivers/media/rc/keymaps/rc-ct-90405.c
new file mode 100644
index 000000000..8914c83c9
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-ct-90405.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Toshiba CT-90405 remote controller keytable
+ *
+ * Copyright (C) 2021 Alexander Voronov <avv.0@ya.ru>
+ */
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+static struct rc_map_table ct_90405[] = {
+	{ 0x4014, KEY_SWITCHVIDEOMODE },
+	{ 0x4012, KEY_POWER },
+	{ 0x4044, KEY_TV },
+	{ 0x40be43, KEY_3D_MODE },
+	{ 0x400c, KEY_SUBTITLE },
+	{ 0x4001, KEY_NUMERIC_1 },
+	{ 0x4002, KEY_NUMERIC_2 },
+	{ 0x4003, KEY_NUMERIC_3 },
+	{ 0x4004, KEY_NUMERIC_4 },
+	{ 0x4005, KEY_NUMERIC_5 },
+	{ 0x4006, KEY_NUMERIC_6 },
+	{ 0x4007, KEY_NUMERIC_7 },
+	{ 0x4008, KEY_NUMERIC_8 },
+	{ 0x4009, KEY_NUMERIC_9 },
+	{ 0x4062, KEY_AUDIO_DESC },
+	{ 0x4000, KEY_NUMERIC_0 },
+	{ 0x401a, KEY_VOLUMEUP },
+	{ 0x401e, KEY_VOLUMEDOWN },
+	{ 0x4016, KEY_INFO },
+	{ 0x4010, KEY_MUTE },
+	{ 0x401b, KEY_CHANNELUP },
+	{ 0x401f, KEY_CHANNELDOWN },
+	{ 0x40da, KEY_VENDOR },
+	{ 0x4066, KEY_PLAYER },
+	{ 0x4017, KEY_TEXT },
+	{ 0x4047, KEY_LIST },
+	{ 0x4073, KEY_PAGEUP },
+	{ 0x4045, KEY_PROGRAM },
+	{ 0x4043, KEY_EXIT },
+	{ 0x4074, KEY_PAGEDOWN },
+	{ 0x4064, KEY_BACK },
+	{ 0x405b, KEY_MENU },
+	{ 0x4019, KEY_UP },
+	{ 0x4040, KEY_RIGHT },
+	{ 0x401d, KEY_DOWN },
+	{ 0x4042, KEY_LEFT },
+	{ 0x4021, KEY_OK },
+	{ 0x4053, KEY_REWIND },
+	{ 0x4067, KEY_PLAY },
+	{ 0x400d, KEY_FASTFORWARD },
+	{ 0x4054, KEY_PREVIOUS },
+	{ 0x4068, KEY_STOP },
+	{ 0x406a, KEY_PAUSE },
+	{ 0x4015, KEY_NEXT },
+	{ 0x4048, KEY_RED },
+	{ 0x4049, KEY_GREEN },
+	{ 0x404a, KEY_YELLOW },
+	{ 0x404b, KEY_BLUE },
+	{ 0x406f, KEY_RECORD }
+};
+
+static struct rc_map_list ct_90405_map = {
+	.map = {
+		.scan     = ct_90405,
+		.size     = ARRAY_SIZE(ct_90405),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_CT_90405,
+	}
+};
+
+static int __init init_rc_map_ct_90405(void)
+{
+	return rc_map_register(&ct_90405_map);
+}
+
+static void __exit exit_rc_map_ct_90405(void)
+{
+	rc_map_unregister(&ct_90405_map);
+}
+
+module_init(init_rc_map_ct_90405)
+module_exit(exit_rc_map_ct_90405)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alexander Voronov <avv.0@ya.ru>");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 7bb94278e..562bc9ea1 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -224,6 +224,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_CEC                       "rc-cec"
 #define RC_MAP_CINERGY                   "rc-cinergy"
 #define RC_MAP_CINERGY_1400              "rc-cinergy-1400"
+#define RC_MAP_CT_90405                  "rc-ct-90405"
 #define RC_MAP_D680_DMB                  "rc-d680-dmb"
 #define RC_MAP_DELOCK_61959              "rc-delock-61959"
 #define RC_MAP_DIB0700_NEC_TABLE         "rc-dib0700-nec"
-- 
2.31.1

