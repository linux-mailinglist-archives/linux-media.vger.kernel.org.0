Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 894D28EEDF
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 17:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733263AbfHOPAW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 11:00:22 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35417 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733253AbfHOPAV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 11:00:21 -0400
Received: by mail-wr1-f65.google.com with SMTP id k2so2499811wrq.2;
        Thu, 15 Aug 2019 08:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UHkUgTVsY8cz+zOWGK7293CzmWQflIsAm9CwwafsuFM=;
        b=Opvs2mJyoL5Woi8Q1kUrH5crbP9W28g2uJZsnyGtcDaGtIozv96Neq39NbzV7P5mnE
         IZ0uLqBpK/IR/IXh27C3AJh3bPn2BUuMCCSxl+Zuxf+vnmDpLaQT4nM+sYWLJ1pN0xog
         ZbpEBAnDcZ4tXlwWBuQpfXDka/FpnuaIBQ3cY6G9yTU0plIhGNPo6F2F35VNxk0LO15r
         C8w5sNQ9IDw2kbZJmsEbsZokMSWeBCct81YyDv63A1llegxnvBTkakj8bMRoIPIJROG0
         4IUXnVaecfIFXTgARDoj1qM8MwmrFBPX8xZapf5IuHKDsbSHpSGu/c0Gx6L35RSaEIed
         bLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UHkUgTVsY8cz+zOWGK7293CzmWQflIsAm9CwwafsuFM=;
        b=lhChZ2oOi2sj5S7wyb2+Rx2FLuFz/XdFpQF8wGcZXm4eIUB+6lnbl9xsW6NcYOtgwx
         qM0dpPsbYeVKvrjnBOgQayiwkJKC/5x+9NPgbB/S42/AD+qfJ8pHKliXPrloKIEkis0m
         IilR+rGpvk3MJFUWP5dfM+VgbeYg/x8QWTse9MlR9fi2aaf5N4XUrNmSiiM218dwagI2
         a+FxgpR8MYsBHifLLCW/xQGjUeUcfjg7lf10TRDa66S+422+/rxSViFQsWN1GNjDVn3c
         cWiiFWzuMZF8xOe5i/Fs1yYGPhNpL7lBm1rt10KjLI6JyHVn/PbFFbZ2LR/dmorPQpv9
         cEHw==
X-Gm-Message-State: APjAAAVKd9df+HmYevmIeEyd3QmTegLJSy599GmZxKXHM5qCMU5uEfxW
        DJFgoltSpmOnGYUmUlmmT8lpvvjBTdx3bg==
X-Google-Smtp-Source: APXvYqzN6gSfm3zXWjnvZMJyrBJmo05tVe5qv2MsT+XK+eHaRNltiURJAJYDGKlckRSyO88q5M4TLw==
X-Received: by 2002:adf:f641:: with SMTP id x1mr6105400wrp.179.1565881219095;
        Thu, 15 Aug 2019 08:00:19 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
        by smtp.gmail.com with ESMTPSA id e4sm5041054wrh.39.2019.08.15.08.00.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 08:00:18 -0700 (PDT)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 6/7] media: rc: add keymap for WeTeK Play 2 remote
Date:   Thu, 15 Aug 2019 18:59:16 +0400
Message-Id: <1565881157-14644-7-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
References: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The WeTek Play 2 Android STB ships with an unusual remote where the
main up/down/left/right/enter controls are surrounded with an outer
ring of additional keys which are listed in clockwise order.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/media/rc/keymaps/Makefile         |  1 +
 drivers/media/rc/keymaps/rc-wetek-play2.c | 95 +++++++++++++++++++++++++++++++
 include/media/rc-map.h                    |  1 +
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-wetek-play2.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index 6d744ac..d316a99 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -117,6 +117,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-videomate-s350.o \
 			rc-videomate-tv-pvr.o \
 			rc-wetek-hub.o \
+			rc-wetek-play2.o \
 			rc-winfast.o \
 			rc-winfast-usbii-deluxe.o \
 			rc-su3000.o \
diff --git a/drivers/media/rc/keymaps/rc-wetek-play2.c b/drivers/media/rc/keymaps/rc-wetek-play2.c
new file mode 100644
index 0000000..77504f2
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-wetek-play2.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (C) 2019 Christian Hewitt <christianshewitt@gmail.com>
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+//
+// Keytable for the WeTek Play 2 STB remote control
+//
+
+static struct rc_map_table wetek_play2[] = {
+
+	{ 0x5e5f02, KEY_POWER },
+	{ 0x5e5f46, KEY_SLEEP }, // tv
+	{ 0x5e5f10, KEY_MUTE },
+
+	{ 0x5e5f22, KEY_1 },
+	{ 0x5e5f23, KEY_2 },
+	{ 0x5e5f24, KEY_3 },
+
+	{ 0x5e5f25, KEY_4 },
+	{ 0x5e5f26, KEY_5 },
+	{ 0x5e5f27, KEY_6 },
+
+	{ 0x5e5f28, KEY_7 },
+	{ 0x5e5f29, KEY_8 },
+	{ 0x5e5f30, KEY_9 },
+
+	{ 0x5e5f71, KEY_BACK },
+	{ 0x5e5f21, KEY_0 },
+	{ 0x5e5f72, KEY_CAPSLOCK },
+
+	// outer ring clockwide from top
+	{ 0x5e5f03, KEY_HOME },
+	{ 0x5e5f61, KEY_BACK },
+	{ 0x5e5f77, KEY_CONFIG }, // mouse
+	{ 0x5e5f83, KEY_EPG },
+	{ 0x5e5f84, KEY_SCREEN }, // square
+	{ 0x5e5f48, KEY_MENU },
+
+	// inner ring
+	{ 0x5e5f50, KEY_UP },
+	{ 0x5e5f4b, KEY_DOWN },
+	{ 0x5e5f4c, KEY_LEFT },
+	{ 0x5e5f4d, KEY_RIGHT },
+	{ 0x5e5f47, KEY_OK },
+
+	{ 0x5e5f44, KEY_VOLUMEUP },
+	{ 0x5e5f43, KEY_VOLUMEDOWN },
+	{ 0x5e5f4f, KEY_FAVORITES },
+	{ 0x5e5f82, KEY_SUBTITLE }, // txt
+	{ 0x5e5f41, KEY_PAGEUP },
+	{ 0x5e5f42, KEY_PAGEDOWN },
+
+	{ 0x5e5f73, KEY_RED },
+	{ 0x5e5f74, KEY_GREEN },
+	{ 0x5e5f75, KEY_YELLOW },
+	{ 0x5e5f76, KEY_BLUE },
+
+	{ 0x5e5f67, KEY_PREVIOUSSONG },
+	{ 0x5e5f79, KEY_REWIND },
+	{ 0x5e5f80, KEY_FASTFORWARD },
+	{ 0x5e5f81, KEY_NEXTSONG },
+
+	{ 0x5e5f04, KEY_RECORD },
+	{ 0x5e5f2c, KEY_PLAYPAUSE },
+	{ 0x5e5f2b, KEY_STOP },
+
+};
+
+static struct rc_map_list wetek_play2_map = {
+	.map = {
+		.scan     = wetek_play2,
+		.size     = ARRAY_SIZE(wetek_play2),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_WETEK_PLAY2,
+	}
+};
+
+static int __init init_rc_map_wetek_play2(void)
+{
+	return rc_map_register(&wetek_play2_map);
+}
+
+static void __exit exit_rc_map_wetek_play2(void)
+{
+	rc_map_unregister(&wetek_play2_map);
+}
+
+module_init(init_rc_map_wetek_play2)
+module_exit(exit_rc_map_wetek_play2)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index e7fee29..1a357fb 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -284,6 +284,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_VIDEOMATE_S350            "rc-videomate-s350"
 #define RC_MAP_VIDEOMATE_TV_PVR          "rc-videomate-tv-pvr"
 #define RC_MAP_WETEK_HUB                 "rc-wetek-hub"
+#define RC_MAP_WETEK_PLAY2               "rc-wetek-play2"
 #define RC_MAP_WINFAST                   "rc-winfast"
 #define RC_MAP_WINFAST_USBII_DELUXE      "rc-winfast-usbii-deluxe"
 #define RC_MAP_SU3000                    "rc-su3000"
-- 
2.7.4

