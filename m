Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB128EEF1
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 17:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733237AbfHOPAR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 11:00:17 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42416 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733232AbfHOPAR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 11:00:17 -0400
Received: by mail-wr1-f66.google.com with SMTP id b16so2473231wrq.9;
        Thu, 15 Aug 2019 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yI1cybUo22+/tK9S4wCt4IsFL7qtdvsQOm2HojWPgQU=;
        b=jq/5Xz8v3S4/9neN4n7bvcEIVLiGOT6oIYNlLRXJ9em5IzPFy50qzxu4yQ0l6TNTGc
         +9vHYfHoHKCQPtQ2K/UbbxKdgY07u/nzB0DJf/JGaglY2cZ4IWqqrZ7KO3MXKdZsqigO
         r5o2HdHnZCnRqGYDY+4668vfbZJY/UNUwelJqtYnSw0R8BD2UaS2IzmYeCXcjweWI/x/
         rwrd1iFtTeRpGgXTYvJNG+m/NPmxegl/sEkRhq2oW8H04yJYJGsbO8h4BynyH3qiF0b9
         v1OoRZjaIOTkYu4mgHZCaXUG5LTTfRxn7bVIdw7Soy8awmB7Ck6v1xxVJmZGpZVyT2NV
         PdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yI1cybUo22+/tK9S4wCt4IsFL7qtdvsQOm2HojWPgQU=;
        b=MaWLWeVtj/leUsfvD9WtNz36/UsdtVfCOA9pV3z4cLKi2WUcvD1at9aQpGpVrVnx9o
         9BtbsWsiPDhg8cArnaDmeG1KU9inI/glTdJhnyba6m1ObELr8/UKas+naIpWYCv/sPVH
         9UCDB+ZfFGRdFFK7n5UcODI0EbO3LiLPafjd8gkEv7XwtSfZL9A/iUrK8eecybXWc5Y3
         fW6XSA3nfkl40WHca9OXCZyK4zpOguLLpKWzZ7Nk6Bsv6qz/tIR6s+7NiwbG7vgoKyWO
         3RNPWRTphYxX7CE82MAVjwqdO3LSn6aj6/x7OQlwUhz3IFn2aReaN4w6QBstN7Olrq4s
         QNTw==
X-Gm-Message-State: APjAAAUvBtfspv4Aaj++iBQrpBuPG7FHc3r6bYkvRx7/B3I2ynpnWf4R
        iwHd1CogHoU7cIMFjigSX2Y=
X-Google-Smtp-Source: APXvYqzhHT4bBc5MMj+md/aop3aAaAttN9AZE/1VDK2Fikiny0hOy1hdg/TG2OxzcdgF6gcLnktk3A==
X-Received: by 2002:adf:f481:: with SMTP id l1mr6061906wro.123.1565881215075;
        Thu, 15 Aug 2019 08:00:15 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
        by smtp.gmail.com with ESMTPSA id e4sm5041054wrh.39.2019.08.15.08.00.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 08:00:14 -0700 (PDT)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 4/7] media: rc: add keymap for Tanix TX5 max remote
Date:   Thu, 15 Aug 2019 18:59:14 +0400
Message-Id: <1565881157-14644-5-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
References: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Tanix TX5 max Android STB ships with a simple NEC remote.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/media/rc/keymaps/Makefile          |  1 +
 drivers/media/rc/keymaps/rc-tanix-tx5max.c | 71 ++++++++++++++++++++++++++++++
 include/media/rc-map.h                     |  1 +
 3 files changed, 73 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-tanix-tx5max.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index 31720d8..85423cc 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -96,6 +96,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-streamzap.o \
 			rc-tango.o \
 			rc-tanix-tx3mini.o \
+			rc-tanix-tx5max.o \
 			rc-tbs-nec.o \
 			rc-technisat-ts35.o \
 			rc-technisat-usb2.o \
diff --git a/drivers/media/rc/keymaps/rc-tanix-tx5max.c b/drivers/media/rc/keymaps/rc-tanix-tx5max.c
new file mode 100644
index 0000000..43f467f
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-tanix-tx5max.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2018 Christian Hewitt
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+/*
+ * Keymap for the Tanix TX5 max STB remote control
+ */
+
+static struct rc_map_table tanix_tx5max[] = {
+
+	{ 0x40404d, KEY_POWER },
+	{ 0x404043, KEY_MUTE },
+
+	{ 0x404017, KEY_VOLUMEDOWN },
+	{ 0x404018, KEY_VOLUMEUP },
+
+	{ 0x40400b, KEY_UP },
+	{ 0x404010, KEY_LEFT },
+	{ 0x404011, KEY_RIGHT },
+	{ 0x40400e, KEY_DOWN },
+	{ 0x40400d, KEY_OK },
+
+	{ 0x40401a, KEY_HOME },
+	{ 0x404045, KEY_MENU },
+	{ 0x404042, KEY_BACK },
+
+	{ 0x404001, KEY_1 },
+	{ 0x404002, KEY_2 },
+	{ 0x404003, KEY_3 },
+
+	{ 0x404004, KEY_4 },
+	{ 0x404005, KEY_5 },
+	{ 0x404006, KEY_6 },
+
+	{ 0x404007, KEY_7 },
+	{ 0x404008, KEY_8 },
+	{ 0x404009, KEY_9 },
+
+	{ 0x404047, KEY_SUBTITLE }, // mouse
+	{ 0x404000, KEY_0 },
+	{ 0x40400c, KEY_DELETE },
+
+};
+
+static struct rc_map_list tanix_tx5max_map = {
+	.map = {
+		.scan     = tanix_tx5max,
+		.size     = ARRAY_SIZE(tanix_tx5max),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_TANIX_TX5MAX,
+	}
+};
+
+static int __init init_rc_map_tanix_tx5max(void)
+{
+	return rc_map_register(&tanix_tx5max_map);
+}
+
+static void __exit exit_rc_map_tanix_tx5max(void)
+{
+	rc_map_unregister(&tanix_tx5max_map);
+}
+
+module_init(init_rc_map_tanix_tx5max)
+module_exit(exit_rc_map_tanix_tx5max)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com>");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 44e6458..a7ed5aa 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -263,6 +263,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_STREAMZAP                 "rc-streamzap"
 #define RC_MAP_TANGO                     "rc-tango"
 #define RC_MAP_TANIX_TX3MINI             "rc-tanix-tx3mini"
+#define RC_MAP_TANIX_TX5MAX              "rc-tanix-tx5max"
 #define RC_MAP_TBS_NEC                   "rc-tbs-nec"
 #define RC_MAP_TECHNISAT_TS35            "rc-technisat-ts35"
 #define RC_MAP_TECHNISAT_USB2            "rc-technisat-usb2"
-- 
2.7.4

