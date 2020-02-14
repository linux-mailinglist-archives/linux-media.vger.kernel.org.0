Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08D2915D42E
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 09:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbgBNI6M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 03:58:12 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52530 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbgBNI6L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 03:58:11 -0500
Received: by mail-wm1-f66.google.com with SMTP id p9so9122878wmc.2
        for <linux-media@vger.kernel.org>; Fri, 14 Feb 2020 00:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JNHMsrFpW6UxmjPYn9L8QH02HyfSoGO3j/SqFO5X3Sg=;
        b=HuJK5ZmIt1gRK1Xh9dxdU0IkgGYYPnl6lf6LKs+/jKZE7iEOXRHH13u6ksUmfpduet
         7OnmusNgdjYuirXERXkdabhTwWzLanp6Af5vSr+5ebIu3FucjNa9KbpXZRtmQ9/hT9de
         8JzuZZ6s7IyFxL0RZm69jsoU99t5UDRon9cTcMLCgTwwP2mPrYHCPDV2Fcj3Yi+2jSTX
         Ua2qpkOlGR7FvMYS1bYb89L4HrDmPU8HxPeIbfVXuo524EK72TxEF8yCG2HTKEF94Wc/
         b0jnH6T1yfYKxMfymnVqwiSd5k/Ddl2nw6Jin5X/AsB7WUSWbmBhfQKr8zLRq1QjakVd
         bnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JNHMsrFpW6UxmjPYn9L8QH02HyfSoGO3j/SqFO5X3Sg=;
        b=cUAxuNvyja8sim/9/aQe6fK11uPZ1Wsy3QRg1ec9rly5RTK91PsE4faHSNgSCVNdj1
         Kd5Lj9gWufIXrxEtQTCoRROSynmFIYh7JRcZ854UYWbKc9tfCmIU9xkeQ2HIgGg67iWe
         C9WD0t1ErwKMHwHWJbdhjCAveShNcrlmyVEaNKo2B9an3/mkDMncmw2Xt0C1TUrzQ2E9
         1ZHmyVUHcRauMdZtvl9ljtq0Ch6bygWgup6ae+tcnbuAUo2ve50lTK30iM2cKwI+YB+9
         TMmKoCxDV+73/+asQNgMJKA/RZjVWljsACxjjecQfhjG6W96sucGTlI5G0G+/GvK85L5
         S2vw==
X-Gm-Message-State: APjAAAU7JjNzj/mNMCUWVlTFOfpD5ly+uxY9SBHS5OrG+Z/nTqhjw2yH
        WL/8UzN3jHjmHpFy6tH1qrXN1bua
X-Google-Smtp-Source: APXvYqwH46ZVwvqUpazhBp15QCAhXvH0sIB103vvSXT8bKEQ66FJzKLQeWXPMiqcSOaKoZWNAmmLOA==
X-Received: by 2002:a7b:cd14:: with SMTP id f20mr3384909wmj.43.1581670689597;
        Fri, 14 Feb 2020 00:58:09 -0800 (PST)
Received: from localhost ([37.237.208.38])
        by smtp.gmail.com with ESMTPSA id z19sm6206418wmi.43.2020.02.14.00.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 00:58:08 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: [PATCH v5 1/3] media: rc: add keymap for Videostrong KII Pro
Date:   Fri, 14 Feb 2020 11:58:00 +0300
Message-Id: <20200214085802.28742-2-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
References: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an NEC remote control device shipped with the Videostrong KII Pro tv box.

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
2.25.0

