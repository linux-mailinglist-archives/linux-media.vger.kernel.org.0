Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA424E6544
	for <lists+linux-media@lfdr.de>; Sun, 27 Oct 2019 21:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727756AbfJ0UIS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Oct 2019 16:08:18 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46352 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbfJ0UIR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Oct 2019 16:08:17 -0400
Received: by mail-wr1-f65.google.com with SMTP id n15so7689278wrw.13;
        Sun, 27 Oct 2019 13:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JHjDVXlYQwiAoE4cglFinqNu/fI+itGzM4QPPTRFWo4=;
        b=cuMhl+y55PcWVBj2ZHyOxom1igexqesx9kTqIJhKtJmv3uuwRL+HpvzQaGaAi8NdzT
         gUlxVTVav/TtS6qSkYbA1Pwyx2sVGSTvKn9/1t5Rv7Z8jiwVld9zRt66ZFC51NOfiH18
         L+koAKB3f51wK4UTk3kp7qQx7vf2bL/jUQZhZAg9E+McoCydYu7Fo5fHxjRS5/ONOaZy
         6TUmAm5ffe/zM/mEmOpgmR6/h1aYadqzpTzPCVtfLG9kHzWocfxtnYRVDVTD1tA9jm3p
         drTBCo3NpRkrI/0Gne/+XEQXahJbKCPZ6OHsKD0cZkudAwft6NPiO84X645fxZuQFzBl
         tPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JHjDVXlYQwiAoE4cglFinqNu/fI+itGzM4QPPTRFWo4=;
        b=Wa1MG1Wscoky4mg1W829d/NRWvXHLHG5yX3pgPc54YqCDj1z3KQiZNEQsTgj8YGSUc
         Ylt17yBfpGdD5JIYDLwtAR9AUUe5pcWeOj4eypkYxoKqKqyP7sluBbaMdexkFmNcMI0i
         JECfLqsIW/KmGvV6dgBKGarBGO3DCkYtoqRtF0bXfVrcL7Oe9lvrDZGlvjqMZY11HX6N
         3C7gIEMElJJ6Ng6mATx+Trs8H5JJceEP6I1KMKkHFPoveeKRaswxzwVrwWsp8C5aWslB
         JlUX9BvbdFxuSeORFr/OGpLrso5F4jO6HqwjBw7iJXCAyxP0Zid+7Qv74u7o5IF68KuR
         zFcw==
X-Gm-Message-State: APjAAAWYYpE8mJauNtRxG7v/TQYNmV3BeG3wIZjuyR+fPri3OoKU0cqF
        1AlpsXonBvhZuyRg4rXN09w=
X-Google-Smtp-Source: APXvYqwgPBWIxa4P7QHII4JbTrHsXiMvgd3gfQ3jNcNJrOx2CLIPOBo3FeNpmRirLkIIvwu0LVnAaA==
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr11978115wrb.222.1572206893835;
        Sun, 27 Oct 2019 13:08:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id o11sm8539538wmh.28.2019.10.27.13.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2019 13:08:12 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>, Sean Young <sean@mess.org>,
        Christian Hewitt <christianshewitt@gmail.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 1/2] media: rc: add keymap for Beelink GS1 remote control
Date:   Sun, 27 Oct 2019 21:07:37 +0100
Message-Id: <20191027200738.24802-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Beelink GS1 Andoid TV Box ships with a simple NEC remote.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../devicetree/bindings/media/rc.yaml         |  1 +
 drivers/media/rc/keymaps/Makefile             |  1 +
 drivers/media/rc/keymaps/rc-beelink-gs1.c     | 84 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 4 files changed, 87 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-beelink-gs1.c

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index 3d5c154fd230..ceb283f7888a 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -39,6 +39,7 @@ properties:
           - rc-avermedia-rm-ks
           - rc-avertv-303
           - rc-azurewave-ad-tu700
+          - rc-beelink-gs1
           - rc-behold
           - rc-behold-columbus
           - rc-budget-ci-old
diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index 4ab4af062abf..63261ef6380a 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-avermedia-rm-ks.o \
 			rc-avertv-303.o \
 			rc-azurewave-ad-tu700.o \
+			rc-beelink-gs1.o \
 			rc-behold.o \
 			rc-behold-columbus.o \
 			rc-budget-ci-old.o \
diff --git a/drivers/media/rc/keymaps/rc-beelink-gs1.c b/drivers/media/rc/keymaps/rc-beelink-gs1.c
new file mode 100644
index 000000000000..cedbd5d20bc7
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-beelink-gs1.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2019 Clément Péron
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+/*
+ * Keymap for the Beelink GS1 remote control
+ */
+
+static struct rc_map_table beelink_gs1_table[] = {
+	/*
+	 * TV Keys (Power, Learn and Volume)
+	 * { 0x40400d, KEY_TV },
+	 * { 0x80f1, KEY_TV },
+	 * { 0x80f3, KEY_TV },
+	 * { 0x80f4, KEY_TV },
+	 */
+
+	{ 0x8051, KEY_POWER },
+	{ 0x804d, KEY_MUTE },
+	{ 0x8040, KEY_CONFIG },
+
+	{ 0x8026, KEY_UP },
+	{ 0x8028, KEY_DOWN },
+	{ 0x8025, KEY_LEFT },
+	{ 0x8027, KEY_RIGHT },
+	{ 0x800d, KEY_OK },
+
+	{ 0x8053, KEY_HOME },
+	{ 0x80bc, KEY_MEDIA },
+	{ 0x801b, KEY_BACK },
+	{ 0x8049, KEY_MENU },
+
+	{ 0x804e, KEY_VOLUMEUP },
+	{ 0x8056, KEY_VOLUMEDOWN },
+
+	{ 0x8054, KEY_SUBTITLE }, /* Web */
+	{ 0x8052, KEY_EPG }, /* Media */
+
+	{ 0x8041, KEY_CHANNELUP },
+	{ 0x8042, KEY_CHANNELDOWN },
+
+	{ 0x8031, KEY_1 },
+	{ 0x8032, KEY_2 },
+	{ 0x8033, KEY_3 },
+
+	{ 0x8034, KEY_4 },
+	{ 0x8035, KEY_5 },
+	{ 0x8036, KEY_6 },
+
+	{ 0x8037, KEY_7 },
+	{ 0x8038, KEY_8 },
+	{ 0x8039, KEY_9 },
+
+	{ 0x8044, KEY_DELETE },
+	{ 0x8030, KEY_0 },
+	{ 0x8058, KEY_MODE }, /* # Input Method */
+};
+
+static struct rc_map_list beelink_gs1_map = {
+	.map = {
+		.scan     = beelink_gs1_table,
+		.size     = ARRAY_SIZE(beelink_gs1_table),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_BEELINK_GS1,
+	}
+};
+
+static int __init init_rc_map_beelink_gs1(void)
+{
+	return rc_map_register(&beelink_gs1_map);
+}
+
+static void __exit exit_rc_map_beelink_gs1(void)
+{
+	rc_map_unregister(&beelink_gs1_map);
+}
+
+module_init(init_rc_map_beelink_gs1)
+module_exit(exit_rc_map_beelink_gs1)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Clément Péron <peron.clem@gmail.com>");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 0a8669daeaaa..f99575a0d29c 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -168,6 +168,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_AVERMEDIA_RM_KS           "rc-avermedia-rm-ks"
 #define RC_MAP_AVERTV_303                "rc-avertv-303"
 #define RC_MAP_AZUREWAVE_AD_TU700        "rc-azurewave-ad-tu700"
+#define RC_MAP_BEELINK_GS1               "rc-beelink-gs1"
 #define RC_MAP_BEHOLD                    "rc-behold"
 #define RC_MAP_BEHOLD_COLUMBUS           "rc-behold-columbus"
 #define RC_MAP_BUDGET_CI_OLD             "rc-budget-ci-old"
-- 
2.20.1

