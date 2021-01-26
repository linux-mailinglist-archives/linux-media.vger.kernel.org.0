Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5D3304CB7
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 23:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbhAZWyA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:54:00 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:45491 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390218AbhAZRl0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 12:41:26 -0500
X-Originating-IP: 78.199.60.242
Received: from localhost.localdomain (unknown [78.199.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8FCBE2000F;
        Tue, 26 Jan 2021 17:40:37 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-media@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 1/2] media: rc: add keymap for Xbox 360 Universal Media remote
Date:   Tue, 26 Jan 2021 18:40:33 +0100
Message-Id: <20210126174034.1349785-1-hadess@hadess.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Captured using a raw IR receiver. Manual linked in the remote definition
itself.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/media/rc/keymaps/Makefile      |  1 +
 drivers/media/rc/keymaps/rc-xbox-360.c | 83 ++++++++++++++++++++++++++
 include/media/rc-map.h                 |  1 +
 3 files changed, 85 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-xbox-360.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index b252a1d2ebd6..37ce3cbf0c0c 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -127,6 +127,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-winfast.o \
 			rc-winfast-usbii-deluxe.o \
 			rc-su3000.o \
+			rc-xbox-360.o \
 			rc-xbox-dvd.o \
 			rc-x96max.o \
 			rc-zx-irdec.o
diff --git a/drivers/media/rc/keymaps/rc-xbox-360.c b/drivers/media/rc/keymaps/rc-xbox-360.c
new file mode 100644
index 000000000000..231aa00514af
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-xbox-360.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Keytable for Xbox 360 Universal Media remote
+// Copyright (c) 2021 Bastien Nocera <hadess@hadess.net>
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+/*
+ * Manual for remote available at:
+ * http://download.microsoft.com/download/b/c/e/bce76f3f-db51-4c98-b79d-b3d21e90ccc1/universalmediaremote_na_0609.pdf
+ */
+static struct rc_map_table xbox_360[] = {
+	{KEY_EJECTCD, 0x800f7428},
+	{KEY_HOMEPAGE, 0x800f7464},
+	{KEY_POWER, 0x800f740c},
+	{KEY_STOP, 0x800f7419},
+	{KEY_PAUSE, 0x800f7418},
+	{KEY_REWIND, 0x800f7415},
+	{KEY_FASTFORWARD, 0x800f7414},
+	{KEY_PREVIOUS, 0x800f741b},
+	{KEY_NEXT, 0x800f741a},
+	{KEY_PLAY, 0x800f7416},
+	{KEY_PROPS, 0x800f744f}, /* "Display" */
+	{KEY_BACK, 0x800f7423},
+	{KEY_MEDIA_TOP_MENU, 0x800f7424}, /* "DVD Menu" */
+	{KEY_ROOT_MENU, 0x800f7451}, /* "Title" */
+	{KEY_INFO, 0x800f740f},
+	{KEY_UP, 0x800f741e},
+	{KEY_LEFT, 0x800f7420},
+	{KEY_RIGHT, 0x800f7421},
+	{KEY_DOWN, 0x800f741f},
+	{KEY_OK, 0x800f7422},
+	{KEY_YELLOW, 0x800f7426},
+	{KEY_BLUE, 0x800f7468},
+	{KEY_GREEN, 0x800f7466},
+	{KEY_RED, 0x800f7425},
+	{KEY_VOLUMEUP, 0x800f7410},
+	{KEY_VOLUMEDOWN, 0x800f7411},
+	/* TV key doesn't light the IR LED */
+	{KEY_MUTE, 0x800f740e},
+	{KEY_CHANNELUP, 0x800f746c},
+	{KEY_CHANNELDOWN, 0x800f746d},
+	{KEY_LEFTMETA, 0x800f740d},
+	{KEY_ENTER, 0x800f740b},
+	{KEY_RECORD, 0x800f7417},
+	{KEY_CLEAR, 0x800f740a},
+	{KEY_NUMERIC_1, 0x800f7401},
+	{KEY_NUMERIC_2, 0x800f7402},
+	{KEY_NUMERIC_3, 0x800f7403},
+	{KEY_NUMERIC_4, 0x800f7404},
+	{KEY_NUMERIC_5, 0x800f7405},
+	{KEY_NUMERIC_6, 0x800f7406},
+	{KEY_NUMERIC_7, 0x800f7407},
+	{KEY_NUMERIC_8, 0x800f7408},
+	{KEY_NUMERIC_9, 0x800f7409},
+	{KEY_NUMERIC_0, 0x800f7400},
+	{KEY_102ND, 0x800f741d}, /* "100" */
+	{KEY_CANCEL, 0x800f741c},
+};
+
+static struct rc_map_list xbox_360_map = {
+	.map = {
+		.scan     = xbox_360,
+		.size     = ARRAY_SIZE(xbox_360),
+		.rc_proto = RC_PROTO_RC6_MCE,
+		.name     = RC_MAP_XBOX_360,
+	}
+};
+
+static int __init init_rc_map(void)
+{
+	return rc_map_register(&xbox_360_map);
+}
+
+static void __exit exit_rc_map(void)
+{
+	rc_map_unregister(&xbox_360_map);
+}
+
+module_init(init_rc_map)
+module_exit(exit_rc_map)
+
+MODULE_LICENSE("GPL");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 999b750bc6b8..9b7608e58b52 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -331,6 +331,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_WINFAST                   "rc-winfast"
 #define RC_MAP_WINFAST_USBII_DELUXE      "rc-winfast-usbii-deluxe"
 #define RC_MAP_X96MAX                    "rc-x96max"
+#define RC_MAP_XBOX_360                  "rc-xbox-360"
 #define RC_MAP_XBOX_DVD                  "rc-xbox-dvd"
 #define RC_MAP_ZX_IRDEC                  "rc-zx-irdec"
 
-- 
2.29.2

