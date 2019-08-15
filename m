Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F33788EEE0
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 17:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733267AbfHOPAX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 11:00:23 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35754 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733212AbfHOPAW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 11:00:22 -0400
Received: by mail-wm1-f65.google.com with SMTP id l2so1516773wmg.0;
        Thu, 15 Aug 2019 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yhYg9hn/63+6B9t0MZk6qflb+4wVUlf/t544dzGkgaA=;
        b=PtfoiYD59tzuZbU3w4AxfNa6ImyVyhMXzzVBxk0FEpIV0WlK4/3Fy8GEcsZBVNVX57
         XlCsbZriIBoDiBmWt2y/m7M0QF8A6joO1mYsxx2uRsViRo8nmdi1uhrCBE2PP0yRGxqz
         vR7Q8dJsbzneqNv89cCy9d/6vbmgTQO2dg0gZGmcAFp3zZVgXZn8kcHiLwB2FNifO2w7
         xARrKHMHY1HrDYq704EpD9JjZ+KnM00Kz+xt02Zd4UYZvMhCu/EbojHyLDmQyIJdmhhX
         GsK0fbn/tFC4Kej54gDxUECyYXohdYttMMtMBi3uwazxk4/XALZPH98bu2Z4vf800vqn
         7LaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yhYg9hn/63+6B9t0MZk6qflb+4wVUlf/t544dzGkgaA=;
        b=NIXJ/xWHrlV1qICCQ19R/JImQ/kokmtHoZF9Xy+BEIjYjoePDigUA4lACRN8WiRBs4
         3aYplrr0Rx/C+VioV/9/HNfdHSAIbKMETcKdkhVnWwnns47GoA3KKB2PJWcqSrU+e18E
         0m2sg2qDlnBfxV5aXOkEeSy9GITOGbJfVufZ6tyipXX+7xZbmw9UVX6eDnpiFy+dwIBN
         jjPdS8giusqMi/gOoSjDruictlKiiz/ngItDj3CTGS6z0808LCS07oZ3J3FAkeN0yLlF
         UqisUU7BL+IXhoBHnDqbdVrif4mBCpkk1LbOZ7+UpLeG4NbxCuJKVtwmsJQsMVc0rV6s
         V3FA==
X-Gm-Message-State: APjAAAU/bD99R4S6Nf3cVAyZmd02g971iHLOS4mdhFRwPrAeWa1vpjzL
        Ey/cQ93l+5fj4kAxWrzZgzKg04X8FEcBOQ==
X-Google-Smtp-Source: APXvYqyLJ6yceWHs66JcZt6cbgoW6wH/5jnTiFO3GO0ClapT0Cwq473NgraXZg42/+aOcbCdajNqaw==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr3254460wml.169.1565881221114;
        Thu, 15 Aug 2019 08:00:21 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
        by smtp.gmail.com with ESMTPSA id e4sm5041054wrh.39.2019.08.15.08.00.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 08:00:20 -0700 (PDT)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 7/7] media: rc: add keymap for HardKernel ODROID remote
Date:   Thu, 15 Aug 2019 18:59:17 +0400
Message-Id: <1565881157-14644-8-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
References: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a simple NEC remote control device shipped with the HardKernel
ODROID range of SBC devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/media/rc/keymaps/Makefile    |  1 +
 drivers/media/rc/keymaps/rc-odroid.c | 51 ++++++++++++++++++++++++++++++++++++
 include/media/rc-map.h               |  1 +
 3 files changed, 53 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-odroid.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index d316a99..a56fc63 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -76,6 +76,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-nec-terratec-cinergy-xs.o \
 			rc-norwood.o \
 			rc-npgtech.o \
+			rc-odroid.o \
 			rc-pctv-sedna.o \
 			rc-pinnacle-color.o \
 			rc-pinnacle-grey.o \
diff --git a/drivers/media/rc/keymaps/rc-odroid.c b/drivers/media/rc/keymaps/rc-odroid.c
new file mode 100644
index 0000000..e95aab6
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-odroid.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (C) 2019 Christian Hewitt <christianshewitt@gmail.com>
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+//
+// Keytable for the HardKernel ODROID remote control
+//
+
+static struct rc_map_table odroid[] = {
+
+	{ 0xb2dc, KEY_POWER },
+
+	{ 0xb288, KEY_MUTE },
+	{ 0xb282, KEY_HOME },
+
+	{ 0xb2ca, KEY_UP },
+	{ 0xb299, KEY_LEFT },
+	{ 0xb2ce, KEY_OK },
+	{ 0xb2c1, KEY_RIGHT },
+	{ 0xb2d2, KEY_DOWN },
+
+	{ 0xb2c5, KEY_MENU },
+	{ 0xb29a, KEY_BACK },
+
+	{ 0xb281, KEY_VOLUMEDOWN },
+	{ 0xb280, KEY_VOLUMEUP },
+};
+
+static struct rc_map_list odroid_map = {
+	.map = {
+		.scan     = odroid,
+		.size     = ARRAY_SIZE(odroid),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_ODROID,
+	}
+};
+
+static int __init init_rc_map_odroid(void)
+{
+	return rc_map_register(&odroid_map);
+}
+
+static void __exit exit_rc_map_odroid(void)
+{
+	rc_map_unregister(&odroid_map);
+}
+
+module_init(init_rc_map_odroid)
+module_exit(exit_rc_map_odroid)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 1a357fb..ead4567 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -242,6 +242,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_NEC_TERRATEC_CINERGY_XS   "rc-nec-terratec-cinergy-xs"
 #define RC_MAP_NORWOOD                   "rc-norwood"
 #define RC_MAP_NPGTECH                   "rc-npgtech"
+#define RC_MAP_ODROID                    "rc-odroid"
 #define RC_MAP_PCTV_SEDNA                "rc-pctv-sedna"
 #define RC_MAP_PINNACLE_COLOR            "rc-pinnacle-color"
 #define RC_MAP_PINNACLE_GREY             "rc-pinnacle-grey"
-- 
2.7.4

