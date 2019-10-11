Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3A22D489C
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 21:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbfJKTod (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 15:44:33 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40566 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728783AbfJKToc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 15:44:32 -0400
Received: by mail-wm1-f67.google.com with SMTP id b24so11253453wmj.5;
        Fri, 11 Oct 2019 12:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/3bS4G5Y0I+plz0u2dyxfCOEMTUK76uRvLiuR7/nWEY=;
        b=Db87KbZqbSS83AEg5Tr203MMM0ypVYmyWiVGOBPWn7qoDCRjtAqo2YLiRh14/52nXe
         XTlDtHdULRYmGVlWKml8XqGNheSQdP9CCLUJ+0TbgmDzzuvuRz5l8hlqy8gyk8uqQDK6
         E62S2KqftvNXPKz/SdsTNF5X4G4NCJx4W6HODlXem30zT10bmbBK2Y13HpxctwCNdB5/
         DQu1GItvLZ3dKMD3YiVsRBVRhAE89tjhEFopqzfmzZLMAEnmKzFZBVU+FQJfJIHBOnz9
         5tpgyED2GJ4zHEz/Lioy8hdEQH8+9Di2Kym7ZyP/Ywag7Ls/nbeUdiOqcrTLTwxegEau
         Lexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/3bS4G5Y0I+plz0u2dyxfCOEMTUK76uRvLiuR7/nWEY=;
        b=NhCvyp5pDWwbyZhYP0aVjK1uvW9AMWYSkySwVKQRjlhjTHxDgmTsWAwRcQb0pnlmvt
         cR4ElHjqtsJA0LZ6F+wvgNOzsBFq18yfIr0371F0DYzI4OX/do2gmK1qkPWykIQ1Zf+b
         sYPQwFKFEkLrtVaD2oVAmyMfQP1r+H6kf84AoMlqrVnMZriafHPFZ2l5FZvAP+ijEA8e
         yzluSdtktsqrTIAofkAGfzVxMTNq0bCbezZH5Z1pZflfICCwBNmQ0nKO3Gce5njKh7U/
         hc14PsyMbqrPBgcNncsUCufICZGMByZO8nOg/9//NC/xKNYLAGRsivqChQGXUhpWYyrO
         LHGA==
X-Gm-Message-State: APjAAAWST7khaUvHStWgjNVZ177ucaqj53VPZ1gDxbwQHV/jp/ymr285
        9cAM9JxZpfU3UwmnkJNbcA0MAnGrA1Q69w==
X-Google-Smtp-Source: APXvYqy8l56uvD7/O+QYIBhPcTuUWQfS5Wn3DR3JSEyPQBSwnYY198UknSBfplyXjTsqF60Ol688BA==
X-Received: by 2002:a7b:c8c5:: with SMTP id f5mr4427343wml.170.1570823070119;
        Fri, 11 Oct 2019 12:44:30 -0700 (PDT)
Received: from localhost.localdomain ([89.216.49.66])
        by smtp.gmail.com with ESMTPSA id x16sm6622451wrl.32.2019.10.11.12.44.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 11 Oct 2019 12:44:29 -0700 (PDT)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] media: rc: add keymap for Tronsmart Vega S95/S96 remote
Date:   Fri, 11 Oct 2019 23:43:42 +0400
Message-Id: <1570823022-3827-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a keymap for the Tronsmart Vega S95 and S96 Android (Amlogic S905/S912)
STB devices. Both use the same IR remote.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/media/rc/keymaps/Makefile      |  1 +
 drivers/media/rc/keymaps/rc-vega-s9x.c | 56 ++++++++++++++++++++++++++++++++++
 include/media/rc-map.h                 |  1 +
 3 files changed, 58 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-vega-s9x.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index a56fc63..4ab4af0 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -114,6 +114,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-tt-1500.o \
 			rc-twinhan-dtv-cab-ci.o \
 			rc-twinhan1027.o \
+			rc-vega-s9x.o \
 			rc-videomate-m1f.o \
 			rc-videomate-s350.o \
 			rc-videomate-tv-pvr.o \
diff --git a/drivers/media/rc/keymaps/rc-vega-s9x.c b/drivers/media/rc/keymaps/rc-vega-s9x.c
new file mode 100644
index 0000000..a573acc
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-vega-s9x.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (C) 2019 Christian Hewitt <christianshewitt@gmail.com>
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+//
+// Keytable for the Tronsmart Vega S9x remote control
+//
+
+static struct rc_map_table vega_s9x[] = {
+
+	{ 0x18, KEY_POWER },
+	{ 0x17, KEY_MUTE }, // mouse
+
+	{ 0x46, KEY_UP },
+	{ 0x47, KEY_LEFT },
+	{ 0x55, KEY_OK },
+	{ 0x15, KEY_RIGHT },
+	{ 0x16, KEY_DOWN },
+
+	{ 0x06, KEY_HOME },
+	{ 0x42, KEY_PLAYPAUSE},
+	{ 0x40, KEY_BACK },
+
+	{ 0x14, KEY_VOLUMEDOWN },
+	{ 0x04, KEY_MENU },
+	{ 0x10, KEY_VOLUMEUP },
+
+};
+
+static struct rc_map_list vega_s9x_map = {
+	.map = {
+		.scan     = vega_s9x,
+		.size     = ARRAY_SIZE(vega_s9x),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_VEGA_S9X,
+	}
+};
+
+static int __init init_rc_map_vega_s9x(void)
+{
+	return rc_map_register(&vega_s9x_map);
+}
+
+static void __exit exit_rc_map_vega_s9x(void)
+{
+	rc_map_unregister(&vega_s9x_map);
+}
+
+module_init(init_rc_map_vega_s9x)
+module_exit(exit_rc_map_vega_s9x)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index afd2ab3..04b5efc 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -268,6 +268,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_TT_1500                   "rc-tt-1500"
 #define RC_MAP_TWINHAN_DTV_CAB_CI        "rc-twinhan-dtv-cab-ci"
 #define RC_MAP_TWINHAN_VP1027_DVBS       "rc-twinhan1027"
+#define RC_MAP_VEGA_S9X                  "rc-vega-s9x"
 #define RC_MAP_VIDEOMATE_K100            "rc-videomate-k100"
 #define RC_MAP_VIDEOMATE_S350            "rc-videomate-s350"
 #define RC_MAP_VIDEOMATE_TV_PVR          "rc-videomate-tv-pvr"
-- 
2.7.4

