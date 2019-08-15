Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93F458EEDD
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 17:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733250AbfHOPAT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 11:00:19 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40588 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733212AbfHOPAT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 11:00:19 -0400
Received: by mail-wr1-f66.google.com with SMTP id c3so2480644wrd.7;
        Thu, 15 Aug 2019 08:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ClnZ/ifqhx3xp+ECOjK85PdZjR7vJXHB5OxiKa77zTo=;
        b=eghHCqIBiyryJx5chz0UoBCDd8FFw6vLdIvKAJE0vhxUNx7vdUXVqTAe0NeN3nBiR1
         pkDc8hLMmUd17zW8wpPItL1rPiXnaZwK0DfIA9pHX/Tb/49f5BWSu1E/K4B45jFS4aNt
         bRvHHmzSZNhKgHx32zkSGr1E56t+dXC/WL5yJMDSMV9JYfUKzF2taJGz77AsHFrZfiJi
         v00OInftZeBFxdq7/NO4guccBj19gsitRaD6KOustQGAAKzUcxdPPG+UCsnM82wOQ7xY
         j0IAUTNpKhNpakH6wjtbR5fYw6/xHNbS3OF3g+0fQPyX4NvyEI0lPBdOHQ9x4EUxIKEB
         f5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ClnZ/ifqhx3xp+ECOjK85PdZjR7vJXHB5OxiKa77zTo=;
        b=rVx4JZbpFGdpuZ/nP7g7fCk29XrdkPOF/KfseHuukzJLuO/fLg9d5t16QCmGAqT8Ku
         vuo6NzUZbaIU/wOOll3JgAJBQUVIQ+t4jzfItUoINJUNWoaFg8E8HFoJ3Rx/zRkmYUR/
         2abVrmwItEwLIZCHsqnCrGY1hLvJCSE4TUbgZjch6SqvrnK48d3I1Av8xeL3TIm0URxw
         NSA7zffXaMvYbw8NZ32WZrQVdzEK8abkp2E2W2SfyMWJ7QoOnAveGBdFcKScDHLkrq0w
         MAIgia8PUNg1kVyujmN7RJ8fOZmM6la6cwivja18dfM9t8FAG6GCFvuRmiKFYt2wtghp
         Uxbg==
X-Gm-Message-State: APjAAAUepMxtS9M4AXvrejBHc2QnhcjVZEYnc0RhHPFAdXnpMh3D4CUP
        zFZAIroNthhKWorJmF+Nz0U=
X-Google-Smtp-Source: APXvYqxfU2ylyuJ7Y1A3krXl7GBk8HZ2/6oP0qli4lbicIZFPhImxCvuS/CLFHKsYC7fa681QVg7fA==
X-Received: by 2002:a5d:4403:: with SMTP id z3mr6098513wrq.29.1565881217136;
        Thu, 15 Aug 2019 08:00:17 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
        by smtp.gmail.com with ESMTPSA id e4sm5041054wrh.39.2019.08.15.08.00.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 08:00:16 -0700 (PDT)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 5/7] media: rc: add keymap for WeTek Hub remote
Date:   Thu, 15 Aug 2019 18:59:15 +0400
Message-Id: <1565881157-14644-6-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
References: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The WeTek Hub Android STB ships with a simple NEC remote.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/media/rc/keymaps/Makefile       |  1 +
 drivers/media/rc/keymaps/rc-wetek-hub.c | 55 +++++++++++++++++++++++++++++++++
 include/media/rc-map.h                  |  1 +
 3 files changed, 57 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-wetek-hub.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index 85423cc..6d744ac 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -116,6 +116,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-videomate-m1f.o \
 			rc-videomate-s350.o \
 			rc-videomate-tv-pvr.o \
+			rc-wetek-hub.o \
 			rc-winfast.o \
 			rc-winfast-usbii-deluxe.o \
 			rc-su3000.o \
diff --git a/drivers/media/rc/keymaps/rc-wetek-hub.c b/drivers/media/rc/keymaps/rc-wetek-hub.c
new file mode 100644
index 0000000..8d114ae
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-wetek-hub.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2018 Christian Hewitt
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+/*
+ * This keymap is used with the WeTek Hub STB.
+ */
+
+static struct rc_map_table wetek_hub[] = {
+
+	{ 0x77f1, KEY_POWER },
+
+	{ 0x77f2, KEY_HOME },
+	{ 0x77f3, KEY_MUTE }, // mouse
+
+	{ 0x77f4, KEY_UP },
+	{ 0x77f5, KEY_DOWN },
+	{ 0x77f6, KEY_LEFT },
+	{ 0x77f7, KEY_RIGHT },
+	{ 0x77f8, KEY_OK },
+
+	{ 0x77f9, KEY_BACK },
+	{ 0x77fa, KEY_MENU },
+
+	{ 0x77fb, KEY_VOLUMEUP },
+	{ 0x77fc, KEY_VOLUMEDOWN },
+
+};
+
+static struct rc_map_list wetek_hub_map = {
+	.map = {
+		.scan     = wetek_hub,
+		.size     = ARRAY_SIZE(wetek_hub),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_WETEK_HUB,
+	}
+};
+
+static int __init init_rc_map_wetek_hub(void)
+{
+	return rc_map_register(&wetek_hub_map);
+}
+
+static void __exit exit_rc_map_wetek_hub(void)
+{
+	rc_map_unregister(&wetek_hub_map);
+}
+
+module_init(init_rc_map_wetek_hub)
+module_exit(exit_rc_map_wetek_hub)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com>");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index a7ed5aa..e7fee29 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -283,6 +283,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_VIDEOMATE_K100            "rc-videomate-k100"
 #define RC_MAP_VIDEOMATE_S350            "rc-videomate-s350"
 #define RC_MAP_VIDEOMATE_TV_PVR          "rc-videomate-tv-pvr"
+#define RC_MAP_WETEK_HUB                 "rc-wetek-hub"
 #define RC_MAP_WINFAST                   "rc-winfast"
 #define RC_MAP_WINFAST_USBII_DELUXE      "rc-winfast-usbii-deluxe"
 #define RC_MAP_SU3000                    "rc-su3000"
-- 
2.7.4

