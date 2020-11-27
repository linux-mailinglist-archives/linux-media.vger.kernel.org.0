Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB642C5F5C
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 05:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404668AbgK0E4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 23:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731606AbgK0E4d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 23:56:33 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDAFC0613D1;
        Thu, 26 Nov 2020 20:56:32 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id t4so4214484wrr.12;
        Thu, 26 Nov 2020 20:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=6Cj/13aEZYs6bV9q9GcsmWru9cRPsDN5Amlb4LASu5I=;
        b=KMZEyp4fZQhpFWUe2Pw/21tRJa5WcrJQ+T6u7Bh2/JvXkV4l0Ovvd5EHY3Sm9pRZY9
         0EVcAfpw2cltJYhNmlcq9ksb0qO2ORJqRsVZwY41xPs4V2VAsX1E3cP6v+9qbhPXF0vZ
         UKdd6OInyn3k0ZN3I1N6tE2EUZTxONsXzq1I3aYy5+XLTcy4rhd/XwEJb7GrJaPQt1HS
         B0s9TFbY5O+WE09k8Jm8mEQBJUPdk1eeOwHsno/Ge1R5xC/mVFG2JaDczdzZB8RTUrNT
         iWJBElCKMls8fKhKOVFiXCtMBCzhugccNI3VvwxmKl6njKMVJbteBfeDycMl73/DPRoH
         hzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6Cj/13aEZYs6bV9q9GcsmWru9cRPsDN5Amlb4LASu5I=;
        b=dkpbRU02tBDILYuF1k0Fkv36H9Gjwm8JfNd+v7WmxII8P5PO4G/ex3MN5Va1lqT/TJ
         f2hwUDa88fy1MCZ8FCXciH/3xN4SCM5rpyAlogHGOAz71iqww7qJwLFoLHpAXi/l76tQ
         W4Jw0GN8kGutr8/GOxyWZsc9CDOMagKuiaYuvS57EMr/49aIYnH+rob3wzVKEFhg5ygr
         c+Q7pisAngZrbyUK/8D7UVjZ5YrubYdSOH20wi/cx8VgIH5poUhFipy+/TzTMx3Jz8r5
         V5rQwMVhgzMV9vJOU2/JBw1CSjU6ZJQn8YryugQiHWAlcmTYBMuftMUmpYvr7TyyCME8
         hm4g==
X-Gm-Message-State: AOAM531ENA7EEpyGC+iW8S+HNLoEm/kpN+PGNOpRaiRuczjVyw3zymmF
        PvCGXBgwweRT9cv8M17xnCE=
X-Google-Smtp-Source: ABdhPJyYxKDK/IzhE4SM9fqoP9FQdcEzJZ6qwWQ0Ehfii9mmW0tfHZagtsJ1dxEqFbBkSquqNfXs7w==
X-Received: by 2002:adf:f349:: with SMTP id e9mr7875941wrp.110.1606452991403;
        Thu, 26 Nov 2020 20:56:31 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id x13sm11023166wmi.20.2020.11.26.20.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 20:56:30 -0800 (PST)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3] media: rc: add keymap for pine64 remote
Date:   Fri, 27 Nov 2020 04:56:27 +0000
Message-Id: <20201127045627.12882-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonas Karlman <jonas@kwiboo.se>

Add a keymap for the pine64 IR remote [0]. The mouse key has been mapped to
KEY_EPG to provide a more useful remote.

[0] http://files.pine64.org/doc/Pine%20A64%20Schematic/remote-wit-logo.jpg

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Changes since v2:
- added missing rc-map.h change

Changes since v1 [1]:
- reorder code to match the physical layout
- assign KEY_EPG instead of KEY_CONTEXT_MENU

KEY_CONTEXT_MENU duplicates KEY_MENU, and while Seans suggestion of BTN_LEFT
visually matches the key, this duplicates KEY_OK in most GUI's designed for
remote naviagation, e.g. Kodi and Plex. I've chosen to map KEY_EPG as this
is a common tweak in user forums to extend IR remote functionality.

[1] https://patchwork.kernel.org/project/linux-media/patch/AM3PR03MB09661A45FEB90FFC3CB44508AC630@AM3PR03MB0966.eurprd03.prod.outlook.com/

 .../devicetree/bindings/media/rc.yaml         |  1 +
 drivers/media/rc/keymaps/Makefile             |  1 +
 drivers/media/rc/keymaps/rc-pine64.c          | 65 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 4 files changed, 68 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-pine64.c

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index 03cf40f91d6c..946441b4e1a5 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -103,6 +103,7 @@ properties:
       - rc-npgtech
       - rc-odroid
       - rc-pctv-sedna
+      - rc-pine64
       - rc-pinnacle-color
       - rc-pinnacle-grey
       - rc-pinnacle-pctv-hd
diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index 1c4d6bec0ae4..b252a1d2ebd6 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -80,6 +80,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-npgtech.o \
 			rc-odroid.o \
 			rc-pctv-sedna.o \
+			rc-pine64.o \
 			rc-pinnacle-color.o \
 			rc-pinnacle-grey.o \
 			rc-pinnacle-pctv-hd.o \
diff --git a/drivers/media/rc/keymaps/rc-pine64.c b/drivers/media/rc/keymaps/rc-pine64.c
new file mode 100644
index 000000000000..9b2bdbbce04e
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-pine64.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+// Keytable for the Pine64 IR Remote Controller
+// Copyright (c) 2017 Jonas Karlman
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+static struct rc_map_table pine64[] = {
+	{ 0x40404d, KEY_POWER },
+	{ 0x40401f, KEY_WWW },
+	{ 0x40400a, KEY_MUTE },
+
+	{ 0x404017, KEY_VOLUMEDOWN },
+	{ 0x404018, KEY_VOLUMEUP },
+
+	{ 0x404010, KEY_LEFT },
+	{ 0x404011, KEY_RIGHT },
+	{ 0x40400b, KEY_UP },
+	{ 0x40400e, KEY_DOWN },
+	{ 0x40400d, KEY_OK },
+
+	{ 0x40401d, KEY_MENU },
+	{ 0x40401a, KEY_HOME },
+
+	{ 0x404045, KEY_BACK },
+
+	{ 0x404001, KEY_NUMERIC_1 },
+	{ 0x404002, KEY_NUMERIC_2 },
+	{ 0x404003, KEY_NUMERIC_3 },
+	{ 0x404004, KEY_NUMERIC_4 },
+	{ 0x404005, KEY_NUMERIC_5 },
+	{ 0x404006, KEY_NUMERIC_6 },
+	{ 0x404007, KEY_NUMERIC_7 },
+	{ 0x404008, KEY_NUMERIC_8 },
+	{ 0x404009, KEY_NUMERIC_9 },
+	{ 0x40400c, KEY_BACKSPACE },
+	{ 0x404000, KEY_NUMERIC_0 },
+	{ 0x404047, KEY_EPG }, // mouse
+};
+
+static struct rc_map_list pine64_map = {
+	.map = {
+		.scan     = pine64,
+		.size     = ARRAY_SIZE(pine64),
+		.rc_proto = RC_PROTO_NECX,
+		.name     = RC_MAP_PINE64,
+	}
+};
+
+static int __init init_rc_map_pine64(void)
+{
+	return rc_map_register(&pine64_map);
+}
+
+static void __exit exit_rc_map_pine64(void)
+{
+	rc_map_unregister(&pine64_map);
+}
+
+module_init(init_rc_map_pine64)
+module_exit(exit_rc_map_pine64)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jonas Karlman");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index fa270f16a97b..999b750bc6b8 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -283,6 +283,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_NPGTECH                   "rc-npgtech"
 #define RC_MAP_ODROID                    "rc-odroid"
 #define RC_MAP_PCTV_SEDNA                "rc-pctv-sedna"
+#define RC_MAP_PINE64                    "rc-pine64"
 #define RC_MAP_PINNACLE_COLOR            "rc-pinnacle-color"
 #define RC_MAP_PINNACLE_GREY             "rc-pinnacle-grey"
 #define RC_MAP_PINNACLE_PCTV_HD          "rc-pinnacle-pctv-hd"
-- 
2.17.1

