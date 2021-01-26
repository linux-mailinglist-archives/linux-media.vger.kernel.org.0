Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F48304CB5
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 23:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730669AbhAZWxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:53:37 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:60681 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390581AbhAZRl0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 12:41:26 -0500
X-Originating-IP: 78.199.60.242
Received: from localhost.localdomain (unknown [78.199.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1FE9320014;
        Tue, 26 Jan 2021 17:40:37 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-media@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 2/2] media: rc: add keymap for Dell RC 260 remote
Date:   Tue, 26 Jan 2021 18:40:34 +0100
Message-Id: <20210126174034.1349785-2-hadess@hadess.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126174034.1349785-1-hadess@hadess.net>
References: <20210126174034.1349785-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Apparently used in the Dell Inspiron Zino HD 410 desktop:
http://web.archive.org/web/20180805000711/http://www.dell.com/ba/p/desktops/inspiron-zino-hd-410/pd

Captured using a raw IR receiver. Manual linked in the remote definition
itself.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/media/rc/keymaps/Makefile        |  1 +
 drivers/media/rc/keymaps/rc-dell-rc260.c | 79 ++++++++++++++++++++++++
 include/media/rc-map.h                   |  1 +
 3 files changed, 81 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-dell-rc260.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index 37ce3cbf0c0c..84eca88ffb55 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-cinergy-1400.o \
 			rc-cinergy.o \
 			rc-d680-dmb.o \
+			rc-dell-rc260.o \
 			rc-delock-61959.o \
 			rc-dib0700-nec.o \
 			rc-dib0700-rc5.o \
diff --git a/drivers/media/rc/keymaps/rc-dell-rc260.c b/drivers/media/rc/keymaps/rc-dell-rc260.c
new file mode 100644
index 000000000000..2ca69daca990
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-dell-rc260.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Keytable for Dell RC 260 remote
+// Copyright (c) 2021 Bastien Nocera <hadess@hadess.net>
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+/* Manual available at:
+ * https://archive.org/details/manualsonline-id-b1c9aa7c-e060-40b0-816a-918536a02fac/
+ */
+static struct rc_map_table dell_rc260[] = {
+	{KEY_HOMEPAGE, 0x803404a9},
+	{KEY_POWER, 0x8034040c},
+	{KEY_RECORD, 0x80340437},
+	{KEY_PAUSE, 0x80340430},
+	{KEY_STOP, 0x80340431},
+	{KEY_REWIND, 0x80340429},
+	{KEY_PLAY, 0x8034042c},
+	{KEY_FASTFORWARD, 0x80340428},
+	{KEY_PREVIOUS, 0x80340421},
+	{KEY_NEXT, 0x80340420},
+	{KEY_BACK, 0x80340483},
+	{KEY_INFO, 0x803404cb},
+	{KEY_LEFTMETA, 0x8034045d},
+	{KEY_UP, 0x80340458},
+	{KEY_LEFT, 0x8034045a},
+	{KEY_RIGHT, 0x8034045b},
+	{KEY_DOWN, 0x80340459},
+	{KEY_OK, 0x8034045c},
+	{KEY_VOLUMEUP, 0x80340410},
+	{KEY_VOLUMEDOWN, 0x80340411},
+	{KEY_CHANNELUP, 0x8034041e},
+	{KEY_CHANNELDOWN, 0x8034041f},
+	{KEY_MUTE, 0x8034040d},
+	{KEY_NUMERIC_1, 0x80340401},
+	{KEY_NUMERIC_2, 0x80340402},
+	{KEY_NUMERIC_3, 0x80340403},
+	{KEY_NUMERIC_4, 0x80340404},
+	{KEY_NUMERIC_5, 0x80340405},
+	{KEY_NUMERIC_6, 0x80340406},
+	{KEY_NUMERIC_7, 0x80340407},
+	{KEY_NUMERIC_8, 0x80340408},
+	{KEY_NUMERIC_9, 0x80340409},
+	{KEY_NUMERIC_0, 0x80340400},
+	{KEY_NUMERIC_STAR, 0x80340433},
+	{KEY_NUMERIC_POUND, 0x80340432},
+	{KEY_CLEAR, 0x8034043a},
+	/* Teletext key doesn't light the IR LED */
+	{KEY_EPG, 0x8034043e},
+	{KEY_ENTER, 0x80340434},
+	{KEY_RED, 0x8034046d},
+	{KEY_GREEN, 0x8034046e},
+	{KEY_YELLOW, 0x8034046f},
+	{KEY_BLUE, 0x80340470}
+};
+
+static struct rc_map_list dell_rc260_map = {
+	.map = {
+		.scan     = dell_rc260,
+		.size     = ARRAY_SIZE(dell_rc260),
+		.rc_proto = RC_PROTO_RC6_6A_24,
+		.name     = RC_MAP_DELL_RC260,
+	}
+};
+
+static int __init init_rc_map(void)
+{
+	return rc_map_register(&dell_rc260_map);
+}
+
+static void __exit exit_rc_map(void)
+{
+	rc_map_unregister(&dell_rc260_map);
+}
+
+module_init(init_rc_map)
+module_exit(exit_rc_map)
+
+MODULE_LICENSE("GPL");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 9b7608e58b52..7385903be3cc 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -225,6 +225,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_CINERGY                   "rc-cinergy"
 #define RC_MAP_CINERGY_1400              "rc-cinergy-1400"
 #define RC_MAP_D680_DMB                  "rc-d680-dmb"
+#define RC_MAP_DELL_RC260                "rc-dell-rc260"
 #define RC_MAP_DELOCK_61959              "rc-delock-61959"
 #define RC_MAP_DIB0700_NEC_TABLE         "rc-dib0700-nec"
 #define RC_MAP_DIB0700_RC5_TABLE         "rc-dib0700-rc5"
-- 
2.29.2

