Return-Path: <linux-media+bounces-50502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55799D16BF5
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 06:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A026B301EC5B
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 05:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C637A363C64;
	Tue, 13 Jan 2026 05:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IPZnfcwC"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DCA1E9B1C;
	Tue, 13 Jan 2026 05:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768283598; cv=none; b=N2C+Yn0JOoNT1v9IjrFNhXuIo4bSaXTdebhvOJ2yKb7Anny4tj/jOvjaS8h6mm0WIms5VfCeRGuPPFcayFdfwjkJH0DB28d3BcNYDcYkXv8in303RH3B6aBIa7jXksWU2qmq8irCXmkfP3L5IRm9+nJirWbW1OgS8OLdWkNyy0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768283598; c=relaxed/simple;
	bh=RHyVS/gxjZVBhgxLkqPx6EQ6CS7M9USYOVgPg6L+F7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eMzIDTUEI2vVnaYWahRkmQUYWLELZc3NCTTM/4AxpTJGndMahAAdPUwV7GBQoyad1uYz44rPOQ6wSRhWRa8WSGgivuglWp9d/YhK2JdDZNaMMhGWg5B1O5TXJcgwkarW07SxtPsmh0Ptn/hybx86JR4jNUbX3ASdY68J7lkO4pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IPZnfcwC; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=rI
	4V8wVLMjSTiXixCVUXrmMD+MWCSKgAcc8tkAITH9k=; b=IPZnfcwCoo/QtCaLo1
	bxOErRzzi0IvBUXQ7bDlowXQPXY6KunSH9SKkU+zdQS8Viwy7m0AoTjAYrcRTYbm
	ZTlxDEMYrdoRpuNC1DAtRI0Kbb/J75aoynFIgWfqiHcyFCHmWFPZ4rLp8GstxBHI
	EUwRbK5QCQ1FXm9iKBuqkCmpg=
Received: from qiyehwzi.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCnEGCa3WVp2mXiLA--.207S2;
	Tue, 13 Jan 2026 13:52:45 +0800 (CST)
From: Holden Hsu <holden_hsu@163.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	holden_hsu@163.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: dib0700: split combined RC map into per-device maps
Date: Mon, 12 Jan 2026 21:52:24 -0800
Message-ID: <20260113055224.11644-1-holden_hsu@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgCnEGCa3WVp2mXiLA--.207S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3XFy5Cw1DZF45AFyfCFWruFg_yoW7ZFW7pw
	n5GF9Y9ay8WFsrZw4UJa1IkryYk3yrKrWYyr9Fgas093W8C34Ik3WkGFWayF17J3yrGry3
	twnIqr1fC3yDArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR5KsnUUUUU=
X-CM-SenderInfo: xkrovv5qbk23i6rwjhhfrp/xtbC4A1WKGll3a0+9AAA3l

The TODO in the code mentioned that the unified table was a "real
mess" because it combined keymaps for multiple different devices.

This commit splits the RC_MAP_DIB0700_NEC_TABLE into three distinct
maps:
- rc-pixelview: for Prolink Pixelview SBTVD
- rc-evolutepc: for EvolutePC TVWay+
- rc-elgato: for Elgato EyeTV Diversity

The drivers/media/usb/dvb-usb/dib0700_devices.c is updated to use
these new specific map names for each hardware entry. This cleanup
allows for better maintenance and protocol handling in the future.

Also,
include/media/rc-map.h and
drivers/media/usb/dvb-usb/dib0700_devices.c
are modified to adapt to this TODO modification.

Signed-off-by: Holden Hsu <holden_hsu@163.com>
---
v2:
Fix checkpatch warnings:
added missing blank lines after struct declarations.

 drivers/media/rc/keymaps/rc-dib0700-nec.c   | 65 +++++++++++++++++----
 drivers/media/usb/dvb-usb/dib0700_devices.c |  4 +-
 include/media/rc-map.h                      |  3 +
 3 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/media/rc/keymaps/rc-dib0700-nec.c b/drivers/media/rc/keymaps/rc-dib0700-nec.c
index 0323049fd..d91d37fd5 100644
--- a/drivers/media/rc/keymaps/rc-dib0700-nec.c
+++ b/drivers/media/rc/keymaps/rc-dib0700-nec.c
@@ -13,8 +13,8 @@
 #include <media/rc-map.h>
 #include <linux/module.h>
 
-static struct rc_map_table dib0700_nec_table[] = {
-	/* Key codes for the Pixelview SBTVD remote */
+/* Key codes for the Pixelview SBTVD remote */
+static struct rc_map_table pixelview_table[] = {
 	{ 0x866b13, KEY_MUTE },
 	{ 0x866b12, KEY_POWER },
 	{ 0x866b01, KEY_NUMERIC_1 },
@@ -44,8 +44,10 @@ static struct rc_map_table dib0700_nec_table[] = {
 
 	{ 0x866b18, KEY_RECORD },
 	{ 0x866b1a, KEY_STOP },
+};
 
-	/* Key codes for the EvolutePC TVWay+ remote */
+/* Key codes for the EvolutePC TVWay+ remote */
+static struct rc_map_table evolutepc_table[] = {
 	{ 0x7a00, KEY_MENU },
 	{ 0x7a01, KEY_RECORD },
 	{ 0x7a02, KEY_PLAY },
@@ -56,8 +58,10 @@ static struct rc_map_table dib0700_nec_table[] = {
 	{ 0x7a13, KEY_VOLUMEDOWN },
 	{ 0x7a40, KEY_POWER },
 	{ 0x7a41, KEY_MUTE },
+};
 
-	/* Key codes for the Elgato EyeTV Diversity silver remote */
+/* Key codes for the Elgato EyeTV Diversity silver remote */
+static struct rc_map_table elgato_table[] = {
 	{ 0x4501, KEY_POWER },
 	{ 0x4502, KEY_MUTE },
 	{ 0x4503, KEY_NUMERIC_1 },
@@ -94,23 +98,64 @@ static struct rc_map_table dib0700_nec_table[] = {
 	{ 0x4542, KEY_SELECT }, /* Select video input, 'Select' for Teletext */
 };
 
-static struct rc_map_list dib0700_nec_map = {
+static struct rc_map_list pixelview_map = {
+	.map = {
+		.scan     = pixelview_table,
+		.size     = ARRAY_SIZE(pixelview_table),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = "RC_MAP_PIXELVIEW",
+	}
+};
+
+static struct rc_map_list evolutepc_map = {
+	.map = {
+		.scan     = evolutepc_table,
+		.size     = ARRAY_SIZE(evolutepc_table),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = "RC_MAP_EVOLUTEPC",
+	}
+};
+
+static struct rc_map_list elgato_map = {
 	.map = {
-		.scan     = dib0700_nec_table,
-		.size     = ARRAY_SIZE(dib0700_nec_table),
+		.scan     = elgato_table,
+		.size     = ARRAY_SIZE(elgato_table),
 		.rc_proto = RC_PROTO_NEC,
-		.name     = RC_MAP_DIB0700_NEC_TABLE,
+		.name     = "RC_MAP_ELGATO",
 	}
 };
 
 static int __init init_rc_map(void)
 {
-	return rc_map_register(&dib0700_nec_map);
+	int ret;
+
+	ret = rc_map_register(&pixelview_map);
+	if (ret)
+		return ret;
+
+	ret = rc_map_register(&evolutepc_map);
+	if (ret)
+		goto unregister_pixelview;
+
+	ret = rc_map_register(&elgato_map);
+	if (ret)
+		goto unregister_evolutepc;
+
+	return 0;
+
+unregister_evolutepc:
+	rc_map_unregister(&evolutepc_map);
+unregister_pixelview:
+	rc_map_unregister(&pixelview_map);
+
+	return ret;
 }
 
 static void __exit exit_rc_map(void)
 {
-	rc_map_unregister(&dib0700_nec_map);
+	rc_map_unregister(&elgato_map);
+	rc_map_unregister(&evolutepc_map);
+	rc_map_unregister(&pixelview_map);
 }
 
 module_init(init_rc_map)
diff --git a/drivers/media/usb/dvb-usb/dib0700_devices.c b/drivers/media/usb/dvb-usb/dib0700_devices.c
index 6ddc20513..75941844c 100644
--- a/drivers/media/usb/dvb-usb/dib0700_devices.c
+++ b/drivers/media/usb/dvb-usb/dib0700_devices.c
@@ -4537,7 +4537,7 @@ struct dvb_usb_device_properties dib0700_devices[] = {
 
 		.rc.core = {
 			.rc_interval      = DEFAULT_RC_INTERVAL,
-			.rc_codes         = RC_MAP_DIB0700_NEC_TABLE,
+			.rc_codes         = RC_MAP_ELGATO,
 			.module_name	  = "dib0700",
 			.rc_query         = dib0700_rc_query_old_firmware,
 			.allowed_protos   = RC_PROTO_BIT_RC5 |
@@ -4766,7 +4766,7 @@ struct dvb_usb_device_properties dib0700_devices[] = {
 
 		.rc.core = {
 			.rc_interval      = DEFAULT_RC_INTERVAL,
-			.rc_codes         = RC_MAP_DIB0700_NEC_TABLE,
+			.rc_codes         = RC_MAP_EVOLUTEPC,
 			.module_name	  = "dib0700",
 			.rc_query         = dib0700_rc_query_old_firmware,
 			.allowed_protos   = RC_PROTO_BIT_RC5 |
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index d90e4611b..9e7414049 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -236,6 +236,9 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_D680_DMB                  "rc-d680-dmb"
 #define RC_MAP_DELOCK_61959              "rc-delock-61959"
 #define RC_MAP_DIB0700_NEC_TABLE         "rc-dib0700-nec"
+#define RC_MAP_PIXELVIEW		"rc-pixelview"
+#define RC_MAP_EVOLUTEPC		"rc-evolutepc"
+#define RC_MAP_ELGATO			"rc-elgato"
 #define RC_MAP_DIB0700_RC5_TABLE         "rc-dib0700-rc5"
 #define RC_MAP_DIGITALNOW_TINYTWIN       "rc-digitalnow-tinytwin"
 #define RC_MAP_DIGITTRADE                "rc-digittrade"
-- 
2.43.0


