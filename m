Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02F528EEF2
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 17:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733225AbfHOPAP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 11:00:15 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55831 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733212AbfHOPAN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 11:00:13 -0400
Received: by mail-wm1-f65.google.com with SMTP id f72so1526751wmf.5;
        Thu, 15 Aug 2019 08:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r+jzvQvthTNKSSPEA/jk2wsfbVmv5OmhIWCFXHNfwOg=;
        b=Yg1IFtVuJjSG3SFA9a8c2IxE5itAd+yHgpPX75BjzB02ymAJShqbqeguQn8I5FuBs6
         kegRFAWh3YSKrScpQ/X9bZ+9TH7Rqr4Q4HfTtH3/aH37Dy/vPv/7tvzOjJlZ+m1/N7/S
         dzl+UovjWE0kuBTZgityqz8/MtK2y4jfAH++TpOYaF3TUO3UffpniDFAh/VFvOV0ZuZ5
         G825GcEsqi/2r+t2fqmDJhHizCI8iLBu+E+F6UULQ5APoj3Gb2pyVBlI0t0FTWTS6Hsu
         kze5hNl0D7adHf8Auj8B2bD/eocQdgqXPdWRz20RXONmmiUVMdeu8j3pbuBoUQTxXA8X
         RCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r+jzvQvthTNKSSPEA/jk2wsfbVmv5OmhIWCFXHNfwOg=;
        b=Si5fKFmltFlPwm5m2TKQqaEfHPo3lihQgjBLGUX01+0qFRUCdDg4sM0FUU4dYZKdqq
         EtDhmJMN86P65XK9RK6tyFh4yE2Rzc47/Emb7lzFkLPX+APU8y1qKXykhcHX6JzaR13u
         NSaEfYkJTst5zuRmIxf77B0a9n07mdRrNpHTUnDSp73K8rNSK/76PCC+bIew0abFjfmw
         MAHptK6wUXFKax7+hfzn7lf2eZaIpPOXHPgAKwyXXO8DvG+FVTqQ/9V0Gao3pIhasCKz
         z4XzXAlHzPlBJTEYFpCkCzIl4maZmYW/pWhtKG4erIr2QPZo573Y+VTW+FPwJEpNs+Ir
         SF1g==
X-Gm-Message-State: APjAAAV526mivWlcm/7CjNcor9g8sXGKsiPIdZdLrGEvFifBJqnjMji1
        5IVuT/fWslYMIZZo7Wcr7IQ=
X-Google-Smtp-Source: APXvYqx+BwCsHw6G4GS9zXML3675MFAyPzQruVOtLjl23v6CWb81hpiV+mN2jcc++T//e+ayodLMaA==
X-Received: by 2002:a1c:a852:: with SMTP id r79mr3072300wme.36.1565881211028;
        Thu, 15 Aug 2019 08:00:11 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
        by smtp.gmail.com with ESMTPSA id e4sm5041054wrh.39.2019.08.15.08.00.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 08:00:10 -0700 (PDT)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 2/7] media: rc: add keymap for Khadas VIM/EDGE remote
Date:   Thu, 15 Aug 2019 18:59:12 +0400
Message-Id: <1565881157-14644-3-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
References: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Khadas VIM and Edge SBC devices use the same NEC remote device. The
remote includes a mouse button for Android use. This has been mapped
to KEY_MUTE.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/media/rc/keymaps/Makefile    |  1 +
 drivers/media/rc/keymaps/rc-khadas.c | 56 ++++++++++++++++++++++++++++++++++++
 include/media/rc-map.h               |  1 +
 3 files changed, 58 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-khadas.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index b88c4e7..39192b0 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-it913x-v1.o \
 			rc-it913x-v2.o \
 			rc-kaiomy.o \
+			rc-khadas.o \
 			rc-kworld-315u.o \
 			rc-kworld-pc150u.o \
 			rc-kworld-plus-tv-analog.o \
diff --git a/drivers/media/rc/keymaps/rc-khadas.c b/drivers/media/rc/keymaps/rc-khadas.c
new file mode 100644
index 0000000..bb183ed
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-khadas.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (C) 2019 Christian Hewitt <christianshewitt@gmail.com>
+
+/*
+ * Keytable for the Khadas VIM/EDGE SBC remote control
+ */
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+static struct rc_map_table khadas[] = {
+
+	{ 0x14, KEY_POWER },
+
+	{ 0x03, KEY_UP },
+	{ 0x02, KEY_DOWN },
+	{ 0x0e, KEY_LEFT },
+	{ 0x1a, KEY_RIGHT },
+	{ 0x07, KEY_OK },
+
+	{ 0x01, KEY_BACK },
+	{ 0x5b, KEY_MUTE }, // mouse
+	{ 0x13, KEY_MENU },
+
+	{ 0x58, KEY_VOLUMEDOWN },
+	{ 0x0b, KEY_VOLUMEUP },
+
+	{ 0x48, KEY_HOME },
+
+};
+
+static struct rc_map_list khadas_map = {
+	.map = {
+		.scan     = khadas,
+		.size     = ARRAY_SIZE(khadas),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = RC_MAP_KHADAS,
+	}
+};
+
+static int __init init_rc_map_khadas(void)
+{
+	return rc_map_register(&khadas_map);
+}
+
+static void __exit exit_rc_map_khadas(void)
+{
+	rc_map_unregister(&khadas_map);
+}
+
+module_init(init_rc_map_khadas)
+module_exit(exit_rc_map_khadas)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com>");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 1f61cb07..37508b0 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -224,6 +224,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_IT913X_V1                 "rc-it913x-v1"
 #define RC_MAP_IT913X_V2                 "rc-it913x-v2"
 #define RC_MAP_KAIOMY                    "rc-kaiomy"
+#define RC_MAP_KHADAS                    "rc-khadas"
 #define RC_MAP_KWORLD_315U               "rc-kworld-315u"
 #define RC_MAP_KWORLD_PC150U             "rc-kworld-pc150u"
 #define RC_MAP_KWORLD_PLUS_TV_ANALOG     "rc-kworld-plus-tv-analog"
-- 
2.7.4

