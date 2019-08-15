Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78AC18EED9
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 17:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733209AbfHOPAL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 11:00:11 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39376 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730788AbfHOPAK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 11:00:10 -0400
Received: by mail-wr1-f67.google.com with SMTP id t16so2485933wra.6;
        Thu, 15 Aug 2019 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=udYciyXbqm5Zne+hkQd3wevHbOZso+c2f+w2KUkviok=;
        b=tF/RvXrRGyZVXFhyXBViXUyPZifX4vI2qn4i/TvKWRBMAdcJCExWMgR1OaBGojbN9i
         wXFVr9QLa/hGagYdgKSrN2xmTctv09D6Mya/rQe4997mFhAlS/o8kvI11i+0iNCv8eOZ
         SUaQ+UrwzL+ORo0NANbYJpy1Tgf2w34vfhmkpyd7+fnZky2aT20ymdWLVkTH8iX+tgvl
         chK2ilTSznAUICxtVzo3Lx1pwI2G2yej3TZeJIpFAAAvBzzFRB4yvPvo/FehXJSWr6s5
         bTttKl6xqxlKW3QbyngM2Tt72xP6/3J0iWMmniyOZ6xlHhgx/JwofCueWgjeEvAjVNHK
         2q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=udYciyXbqm5Zne+hkQd3wevHbOZso+c2f+w2KUkviok=;
        b=ASny+ZhAjqFBkyUkmV+md+wnFYfKOymz2ZvSfdYmQPWpnGRwS3L5hV5XGl2DpKAANW
         gQErzazAkcaklc5gjESnmxc3fmxhyjFk9j0HnIf2kNe554vmc7M2GAT4h0DLy8b22prj
         tdzAzijygZ9R+5kOk5BGI1Gtf54TYQcvNFOWJXNb9858Gy6SvfPmMDhjTUSvUHxW/318
         6owfH3dfJ6394Drc0HwTJ5dgSNtRbrJxc/8yGz5CbEwYgusQVwrzndRt52rTI1rMrsmb
         77iSnkCPsp0z6DOCeQQx85oSV/Q8OyrsH2G9ysoS6WsNtJzO0+fSGSpV+cXPbSvktPe8
         fJVQ==
X-Gm-Message-State: APjAAAVR5K4hqnVfIoqk8nfTSyTLiM0cXCr0dYFR4Q9aj2onBp971HCT
        5yn9aiM0fZnfdkVl0Fo+V/Y=
X-Google-Smtp-Source: APXvYqxruAOlO5/y1WGq3s4qRP6NlewaY1UXLrG2M+b7keWLT53iyPJucJS1AT3PXkyFMHMdr92sTQ==
X-Received: by 2002:a5d:470c:: with SMTP id y12mr5933559wrq.136.1565881208899;
        Thu, 15 Aug 2019 08:00:08 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
        by smtp.gmail.com with ESMTPSA id e4sm5041054wrh.39.2019.08.15.08.00.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 08:00:08 -0700 (PDT)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 1/7] media: rc: add keymap for Amediatech X96-MAX remote
Date:   Thu, 15 Aug 2019 18:59:11 +0400
Message-Id: <1565881157-14644-2-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
References: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The X96-Max Android STB ships with a simple NEC remote. It includes
a TV section with preset buttons for controlling a TV. These are not
configurable, but are noted to aid visual recognition of the device.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/media/rc/keymaps/Makefile    |  1 +
 drivers/media/rc/keymaps/rc-x96max.c | 85 ++++++++++++++++++++++++++++++++++++
 include/media/rc-map.h               |  1 +
 3 files changed, 87 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-x96max.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index 5b1399a..b88c4e7 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -117,4 +117,5 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-winfast-usbii-deluxe.o \
 			rc-su3000.o \
 			rc-xbox-dvd.o \
+			rc-x96max.o \
 			rc-zx-irdec.o
diff --git a/drivers/media/rc/keymaps/rc-x96max.c b/drivers/media/rc/keymaps/rc-x96max.c
new file mode 100644
index 0000000..d947e46
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-x96max.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (C) 2019 Christian Hewitt <christianshewitt@gmail.com>
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+//
+// Keytable for the X96-max STB remote control
+//
+
+static struct rc_map_table x96max[] = {
+
+	{ 0x140, KEY_POWER },
+
+	// ** TV CONTROL **
+	// SET
+	// AV/TV
+	// POWER
+	// VOLUME UP
+	// VOLUME DOWN
+
+	{ 0x118, KEY_VOLUMEUP },
+	{ 0x110, KEY_VOLUMEDOWN },
+
+	{ 0x143, KEY_MUTE }, // config
+
+	{ 0x100, KEY_EPG }, // mouse
+	{ 0x119, KEY_BACK },
+
+	{ 0x116, KEY_UP },
+	{ 0x151, KEY_LEFT },
+	{ 0x150, KEY_RIGHT },
+	{ 0x11a, KEY_DOWN },
+	{ 0x113, KEY_OK },
+
+	{ 0x111, KEY_HOME },
+	{ 0x14c, KEY_CONTEXT_MENU },
+
+	{ 0x159, KEY_PREVIOUS },
+	{ 0x15a, KEY_PLAYPAUSE },
+	{ 0x158, KEY_NEXT },
+
+	{ 0x147, KEY_MENU }, // @ key
+	{ 0x101, KEY_NUMERIC_0 },
+	{ 0x142, KEY_BACKSPACE },
+
+	{ 0x14e, KEY_NUMERIC_1 },
+	{ 0x10d, KEY_NUMERIC_2 },
+	{ 0x10c, KEY_NUMERIC_3 },
+
+	{ 0x14a, KEY_NUMERIC_4 },
+	{ 0x109, KEY_NUMERIC_5 },
+	{ 0x108, KEY_NUMERIC_6 },
+
+	{ 0x146, KEY_NUMERIC_7 },
+	{ 0x105, KEY_NUMERIC_8 },
+	{ 0x104, KEY_NUMERIC_9 },
+
+};
+
+static struct rc_map_list x96max_map = {
+	.map = {
+		.scan     = x96max,
+		.size     = ARRAY_SIZE(x96max),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_X96MAX,
+	}
+};
+
+static int __init init_rc_map_x96max(void)
+{
+	return rc_map_register(&x96max_map);
+}
+
+static void __exit exit_rc_map_x96max(void)
+{
+	rc_map_unregister(&x96max_map);
+}
+
+module_init(init_rc_map_x96max)
+module_exit(exit_rc_map_x96max)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index bebd3c4..1f61cb07 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -284,6 +284,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_WINFAST_USBII_DELUXE      "rc-winfast-usbii-deluxe"
 #define RC_MAP_SU3000                    "rc-su3000"
 #define RC_MAP_XBOX_DVD                  "rc-xbox-dvd"
+#define RC_MAP_X96MAX                    "rc-x96max"
 #define RC_MAP_ZX_IRDEC                  "rc-zx-irdec"
 
 /*
-- 
2.7.4

