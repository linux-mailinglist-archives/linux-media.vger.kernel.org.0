Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64BAF30B1D4
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 22:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhBAVAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 16:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhBAVAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 16:00:37 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7AAC061573;
        Mon,  1 Feb 2021 12:59:56 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id a16so670635wmm.0;
        Mon, 01 Feb 2021 12:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=2V/28VzWHyvh+HY7OGmImro30pfLz2Wvu7X6nZgDwNM=;
        b=rwFl9CxoyA5tCMaE4vHRwQ3LUWNduEYts0jWOSH8jEdzscTRxtFHm5Jf4gKwpRRkIl
         JtZGcI/lEFyVKbZRuV+xYed1uCbOZD9cmntnspCJLudSYtwUabmnNYqg/pbFJDZmhiXf
         2lP5e5aGVmz5fLEujwKi05jU4d2ajSpr7u7ddnVL5Vonyot7HQUnxZpGhKwFg1dAM0UX
         DsqV3wqlx764dbxhuKHWplb4/WmCNLPHoiiT7BNbV1Aae1MfchyM+yDhZL1euOwrXqdP
         WLRTFUJd3g3Hq8YJVv1C1h5r1+2FElUlviwYY3dzV7Ozdxh5ISHvtAg8o+Xq9qMlKAW/
         9gfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2V/28VzWHyvh+HY7OGmImro30pfLz2Wvu7X6nZgDwNM=;
        b=S6+XqHvm06rtODgn1hOpCf4xqqA7lknmc1/KgruOxwIYP27t8rEB0VBlqM/e/RRiBA
         4GTNmfpvQ7695oFOtBfVH7gxLngzF/uzdN0yH+w5DtxDAcviGOdpqeqRf2SwVGAG408A
         HoO0dr6JmBuGMa63FoQzOJIUGOHNM/TE4sDjNhqi6eMHv7QcQpVT5LMRsSoiQHBNEsIi
         qnaKEOmJnhEhJZxxp3zZF950BDcXlQPjQeHulowDUcTOs7IP+ke5MfAcgdQeXtRMIjZF
         YNbtq6p4VSiIMdRFVVAWWXG2TL4TJyRzaOYRl2I5xRbzJAvbu7vLTh1NEEaI0axczBc3
         Ju7A==
X-Gm-Message-State: AOAM5333rT7vlwUg37Z/aLBublwrrDeejdX+MpqtB2knPzGv+Ylga4bg
        j3p/RHz17+NFP2VndFRi13o=
X-Google-Smtp-Source: ABdhPJzPsyWs4JsB7ODJD2GzaojvMrd81mXinjihlGqfup82NVVMV2KE0AZldyywJOQGGdkDMwV7Gw==
X-Received: by 2002:a1c:9ad5:: with SMTP id c204mr629117wme.65.1612213195419;
        Mon, 01 Feb 2021 12:59:55 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id d10sm3450617wrn.88.2021.02.01.12.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 12:59:54 -0800 (PST)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] media: rc: add keymap for minix-neo remote
Date:   Mon,  1 Feb 2021 20:59:51 +0000
Message-Id: <20210201205951.938-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a keymap and bindings for the simple IR (NEC) remote used with
Minix 'NEO' branded Android STB devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../devicetree/bindings/media/rc.yaml         |  1 +
 drivers/media/rc/keymaps/Makefile             |  1 +
 drivers/media/rc/keymaps/rc-minix-neo.c       | 55 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 4 files changed, 58 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-minix-neo.c

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index 946441b4e1a5..cbffdd6a470d 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -93,6 +93,7 @@ properties:
       - rc-medion-x10
       - rc-medion-x10-digitainer
       - rc-medion-x10-or2x
+      - rc-minix-neo
       - rc-msi-digivox-ii
       - rc-msi-digivox-iii
       - rc-msi-tvanywhere
diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index b252a1d2ebd6..b7f53f44c5c8 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-medion-x10.o \
 			rc-medion-x10-digitainer.o \
 			rc-medion-x10-or2x.o \
+			rc-minix-neo.o \
 			rc-msi-digivox-ii.o \
 			rc-msi-digivox-iii.o \
 			rc-msi-tvanywhere.o \
diff --git a/drivers/media/rc/keymaps/rc-minix-neo.c b/drivers/media/rc/keymaps/rc-minix-neo.c
new file mode 100644
index 000000000000..9165af548ff1
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-minix-neo.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (C) 2021 Christian Hewitt <christianshewitt@gmail.com>
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+//
+// Keytable for the Minix NEO remote control
+//
+
+static struct rc_map_table minix_neo[] = {
+
+	{ 0x118, KEY_POWER },
+
+	{ 0x146, KEY_UP },
+	{ 0x116, KEY_DOWN },
+	{ 0x147, KEY_LEFT },
+	{ 0x115, KEY_RIGHT },
+	{ 0x155, KEY_ENTER },
+
+	{ 0x110, KEY_VOLUMEDOWN },
+	{ 0x140, KEY_BACK },
+	{ 0x114, KEY_VOLUMEUP },
+
+	{ 0x10d, KEY_HOME },
+	{ 0x104, KEY_MENU },
+	{ 0x112, KEY_CONFIG },
+
+};
+
+static struct rc_map_list minix_neo_map = {
+	.map = {
+		.scan     = minix_neo,
+		.size     = ARRAY_SIZE(minix_neo),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_MINIX_NEO,
+	}
+};
+
+static int __init init_rc_map_minix_neo(void)
+{
+	return rc_map_register(&minix_neo_map);
+}
+
+static void __exit exit_rc_map_minix_neo(void)
+{
+	rc_map_unregister(&minix_neo_map);
+}
+
+module_init(init_rc_map_minix_neo)
+module_exit(exit_rc_map_minix_neo)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 999b750bc6b8..a6fca9cc761f 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -273,6 +273,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_MEDION_X10                "rc-medion-x10"
 #define RC_MAP_MEDION_X10_DIGITAINER     "rc-medion-x10-digitainer"
 #define RC_MAP_MEDION_X10_OR2X           "rc-medion-x10-or2x"
+#define RC_MAP_MINIX_NEO                 "rc-minix-neo"
 #define RC_MAP_MSI_DIGIVOX_II            "rc-msi-digivox-ii"
 #define RC_MAP_MSI_DIGIVOX_III           "rc-msi-digivox-iii"
 #define RC_MAP_MSI_TVANYWHERE            "rc-msi-tvanywhere"
-- 
2.17.1

