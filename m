Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8AD1038F4
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 12:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728636AbfKTLmA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 06:42:00 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36464 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbfKTLmA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 06:42:00 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so850454wru.3
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 03:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y2jkdqcywKKgjHMh1YbldCsDGIKnbTdhTN7oQhrMsGw=;
        b=eV+/m5ltv5LY6X6Tk+eLbSJQ4CbCNCiM3uKuYjcnTpWBycp1HUGBtbzez0llSSCRsq
         OA6aQe/3GD2yUQcL2tnu33amT4ENyfrgPhHR3Rq+EMprDG6Q4sYFQ8L/bMrIjTNAVq4m
         iog1EzJOffIPxECyISTkhp7mtg/B31BnhdTcaHN+K6Q/PfvW7jp1/ZZcoFX55LDmHDvV
         G3xzSJHBHMqi1YU9oqzJgKXB9uz1+eG31ZpokEo6f7ho8U8DXAm3rayqIGK8ie9FyQmR
         HWEsCozUMIeOo+Cl1VG3tokjHItnBbhPtHUttq7zjmkgqmcdKwspv9c9CnXeOQKB8qND
         e+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y2jkdqcywKKgjHMh1YbldCsDGIKnbTdhTN7oQhrMsGw=;
        b=FOnXNg9aQp+GIzOBqfFIOpggBQMCTIRQatCY/abvPA6qYxdrR2dYAy0KRLbdtO7Zxk
         4GAiBxKwjKwtOS+JJ6MjCSKRY7fcAV11hbMpkLggkeg+tqAArKncA1+7CWbjWKNM5QQH
         pZKkQ3UPrfwZn+yOaAleiUQhYTA9pU1qZd9VZ1uyQGTrLCC9W41DID77Mzh6u95vEN/8
         5FLS/tINWlYNbNeilNks9QUxJM5H8eLa9wrXKn1mGmy2FKIQoW9KLJPdd5T93WBSXNOm
         AGwvL5sVOjwqJlgCxnUF4OyJtLzTS0f9B2Rb8UdZFeSsD+yGG6NVHP/SQC4RXRCD8wO9
         0H2Q==
X-Gm-Message-State: APjAAAXWDsea3Ne4Dw0iW4UO4cscN1Eh1VABer+bmtFsOFopB0vUgDKw
        w4aTeFhLYEgnFOouCCYb40A5X005yfnFgQ==
X-Google-Smtp-Source: APXvYqxsp39ex3gajlpAVuEY8B6I/DQC7B0icEXRYx4SzpJ9R6ee5rU7cqZnR3Mgy+Qhu9vW5nbghA==
X-Received: by 2002:a5d:4142:: with SMTP id c2mr2766439wrq.60.1574250118321;
        Wed, 20 Nov 2019 03:41:58 -0800 (PST)
Received: from localhost ([37.238.189.2])
        by smtp.gmail.com with ESMTPSA id b17sm31367940wru.36.2019.11.20.03.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 03:41:57 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: [PATCH v2] media: rc: add keymap for Videostrong KII Pro
Date:   Wed, 20 Nov 2019 14:41:53 +0300
Message-Id: <20191120114153.17676-1-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v1:
- fix styling issues
Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 drivers/media/rc/keymaps/Makefile             |  1 +
 .../media/rc/keymaps/rc-videostrong-kii-pro.c | 84 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 3 files changed, 86 insertions(+)
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
index 000000000000..2b94c28ed5d7
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
@@ -0,0 +1,84 @@
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
+	{ 0x04, KEY_RECORD},
+	{ 0x4d, KEY_EPG},
+	{ 0x02, KEY_INFO},
+	{ 0x09, KEY_SUBTITLE},
+	{ 0x01, KEY_AUDIO},
+	{ 0x0d, KEY_HOMEPAGE},
+	{ 0x11, KEY_G},		// DTV ?
+	{ 0x06, KEY_UP},
+	{ 0x5a, KEY_LEFT},
+	{ 0x1a, KEY_ENTER},	// KEY_OK ?
+	{ 0x1b, KEY_RIGHT},
+	{ 0x16, KEY_DOWN},
+	{ 0x45, KEY_MENU},
+	{ 0x05, KEY_ESC},
+	{ 0x13, KEY_VOLUMEUP },
+	{ 0x17, KEY_VOLUMEDOWN },
+	{ 0x58, KEY_F6},
+	{ 0x12, KEY_KATAKANA},	// mouse
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
index afd2ab31bdf2..c2ef3906e1cd 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -271,6 +271,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_VIDEOMATE_K100            "rc-videomate-k100"
 #define RC_MAP_VIDEOMATE_S350            "rc-videomate-s350"
 #define RC_MAP_VIDEOMATE_TV_PVR          "rc-videomate-tv-pvr"
+#define RC_MAP_KII_PRO                   "rc-videostrong-kii-pro"
 #define RC_MAP_WETEK_HUB                 "rc-wetek-hub"
 #define RC_MAP_WETEK_PLAY2               "rc-wetek-play2"
 #define RC_MAP_WINFAST                   "rc-winfast"
-- 
2.24.0

