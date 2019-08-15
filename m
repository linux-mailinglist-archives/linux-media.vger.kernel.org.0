Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9A88EEF4
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 17:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732190AbfHOPAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 11:00:49 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55835 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730788AbfHOPAP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 11:00:15 -0400
Received: by mail-wm1-f65.google.com with SMTP id f72so1526854wmf.5;
        Thu, 15 Aug 2019 08:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=175hmWTJX0mZg1homV3MfEoJFn7/G0Qp9jA5/mRZmFs=;
        b=lnGY4+drKoBUw9kXu4I/QoyWhyFUNQyWblYexphY1jQAhqWcJgqVn4Gbu7yDbNtcT/
         G2k5WY8HIrhJke1yNhkd5E+zOuNk6zWjWGOob8HOLfYY51t7ZTduWgnrQLwXEeb+a9B5
         7JlbAWDeQGRZEZblvA6DUV5Vzjs1jKaymdKBkQDmsP/vLrYQfjKUY8QzqE2UlDmssO5L
         voIPWSDrtIARFVH8eWMtbkLWWQf3UlJq0Xmo6VNVYW+blpr6oMC3BZW3BL8FlM1C9aFg
         6tlnWZFuiW0mqBT04ihbpwisUxp4ygHCDiJdrhqJJY4nPtkaLjWMyThjtoCeWlz3OWK6
         jhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=175hmWTJX0mZg1homV3MfEoJFn7/G0Qp9jA5/mRZmFs=;
        b=T6/b0+tLzeauWa9vZ4Vt5PeVqKdJs1bnj4X0TrQgh1NAwYRyh176ZZZHvTEmp495VO
         eFQvUc1YX9rmdPxiyPGhuQre+xObsmnHUGS8cPje+tXrTWj/nYQOfhE3rMAKCLb2kIks
         PHWLV9cxyKYxuiScJXwah8eOpePYWKerukLXLH6c6mqS75bFFID+TrI4d240YsRAnz15
         KAG2v98hx+Wav0e3tJ91QDMXpw0uCHQfQsw5s0EUXnXdcJX0YdPDW4oPklvLM9tWZjM+
         FR3mdgi8l35l1UNbcqE3DP4Mc7Jdw3HIOg+JYWru4OdNa0T0ZjRzjY+ypopsKplXB1Cx
         ysSQ==
X-Gm-Message-State: APjAAAWZ/PO9Q3dm7lI3Cp4hzYxDnrvifYz+dHUp3keZc+k71jS6QxnP
        l8djG+Rk9S3SVuCUqftY2w4=
X-Google-Smtp-Source: APXvYqxtD4h22YDO0EJkRcYmHTbUrk17SD1r8OUdyf4itj+hZIvbRQalGx03WQBSGFFBrH9LVWhyDQ==
X-Received: by 2002:a7b:c76d:: with SMTP id x13mr3064501wmk.110.1565881213007;
        Thu, 15 Aug 2019 08:00:13 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
        by smtp.gmail.com with ESMTPSA id e4sm5041054wrh.39.2019.08.15.08.00.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 08:00:12 -0700 (PDT)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 3/7] media: rc: add keymap for Tanix TX3 mini remote
Date:   Thu, 15 Aug 2019 18:59:13 +0400
Message-Id: <1565881157-14644-4-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
References: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Tanix TX3 mini Android STB ships with a simple NEC remote.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/media/rc/keymaps/Makefile           |  1 +
 drivers/media/rc/keymaps/rc-tanix-tx3mini.c | 79 +++++++++++++++++++++++++++++
 include/media/rc-map.h                      |  1 +
 3 files changed, 81 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-tanix-tx3mini.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index 39192b0..31720d8 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -95,6 +95,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-snapstream-firefly.o \
 			rc-streamzap.o \
 			rc-tango.o \
+			rc-tanix-tx3mini.o \
 			rc-tbs-nec.o \
 			rc-technisat-ts35.o \
 			rc-technisat-usb2.o \
diff --git a/drivers/media/rc/keymaps/rc-tanix-tx3mini.c b/drivers/media/rc/keymaps/rc-tanix-tx3mini.c
new file mode 100644
index 0000000..e501398
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-tanix-tx3mini.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2018 Christian Hewitt
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+/*
+ * Keymap for the Tanix TX3 mini STB remote control
+ */
+
+static struct rc_map_table tanix_tx3mini[] = {
+
+	{ 0x8051, KEY_POWER },
+	{ 0x804d, KEY_MUTE },
+
+	{ 0x8009, KEY_RED },
+	{ 0x8011, KEY_GREEN },
+	{ 0x8054, KEY_YELLOW },
+	{ 0x804f, KEY_BLUE },
+
+	{ 0x8056, KEY_VOLUMEDOWN },
+	{ 0x80bd, KEY_PREVIOUS },
+	{ 0x80bb, KEY_NEXT },
+	{ 0x804e, KEY_VOLUMEUP },
+
+	{ 0x8053, KEY_HOME },
+	{ 0x801b, KEY_BACK },
+
+	{ 0x8026, KEY_UP },
+	{ 0x8028, KEY_DOWN },
+	{ 0x8025, KEY_LEFT },
+	{ 0x8027, KEY_RIGHT },
+	{ 0x800d, KEY_OK },
+
+	{ 0x8049, KEY_MENU },
+	{ 0x8052, KEY_EPG }, // mouse
+
+	{ 0x8031, KEY_1 },
+	{ 0x8032, KEY_2 },
+	{ 0x8033, KEY_3 },
+
+	{ 0x8034, KEY_4 },
+	{ 0x8035, KEY_5 },
+	{ 0x8036, KEY_6 },
+
+	{ 0x8037, KEY_7 },
+	{ 0x8038, KEY_8 },
+	{ 0x8039, KEY_9 },
+
+	{ 0x8058, KEY_SUBTITLE }, // 1/a
+	{ 0x8030, KEY_0 },
+	{ 0x8044, KEY_DELETE },
+};
+
+static struct rc_map_list tanix_tx3mini_map = {
+	.map = {
+		.scan     = tanix_tx3mini,
+		.size     = ARRAY_SIZE(tanix_tx3mini),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_TANIX_TX3MINI,
+	}
+};
+
+static int __init init_rc_map_tanix_tx3mini(void)
+{
+	return rc_map_register(&tanix_tx3mini_map);
+}
+
+static void __exit exit_rc_map_tanix_tx3mini(void)
+{
+	rc_map_unregister(&tanix_tx3mini_map);
+}
+
+module_init(init_rc_map_tanix_tx3mini)
+module_exit(exit_rc_map_tanix_tx3mini)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com>");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 37508b0..44e6458 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -262,6 +262,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_SNAPSTREAM_FIREFLY        "rc-snapstream-firefly"
 #define RC_MAP_STREAMZAP                 "rc-streamzap"
 #define RC_MAP_TANGO                     "rc-tango"
+#define RC_MAP_TANIX_TX3MINI             "rc-tanix-tx3mini"
 #define RC_MAP_TBS_NEC                   "rc-tbs-nec"
 #define RC_MAP_TECHNISAT_TS35            "rc-technisat-ts35"
 #define RC_MAP_TECHNISAT_USB2            "rc-technisat-usb2"
-- 
2.7.4

