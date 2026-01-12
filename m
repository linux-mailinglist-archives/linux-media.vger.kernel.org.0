Return-Path: <linux-media+bounces-50404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB11D119FF
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D515A3038335
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 09:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6735F274B28;
	Mon, 12 Jan 2026 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DfRyDWpL"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B02626E6E4;
	Mon, 12 Jan 2026 09:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768211329; cv=none; b=ETOOpJmhKZa9VvZhWg0Ao2SwpvlGzV2NKh7EJcldULNQ4g5FssUOy9nCgzeX5Ck9z81uMM1vxHtXG7mditHgacamhNdh0Jg8HohzJ2SwVUeX6/+hxPrOko8gQwqkgJQ/CNiZTZT9Z34nilZpbLXyP+bT+ynqIPj0pn5Z6AKn7p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768211329; c=relaxed/simple;
	bh=YiQNziibqfVX5UzdBB/p4slTBqM5SGcKcMS8v7Z1gzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U+A83Vb1m9zft0TGuo5HQmnyDXc6UogZA6Vkv9wh2Vr2Qw91S32cdm7IHyveHhbSSsA/L1DvCHAV9k8kaWVrWsskV++SK5mxY1kk8M9a2rjJl96l+Do+Gs75aN7RiJz82SPNZrv/WbzQEOCJjczJRU0ce3zysHAxCeip+ZqbBT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DfRyDWpL; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=iE
	3m7dqPje4XqpRaHrX3PPy34azRWnfTmomcE37m9R0=; b=DfRyDWpLbcBqH6n/AX
	N4Y2Lx25GZNY3bXlyHCLRW1vpYVJnyAnG5IJohoJ6JHlkZEPYSSEIH2WRC5ni9O3
	L7soVhsJ9x4H1BSOGh2Cg9sx/2Y9xn2r4NbsaOzGDxR61XfEu6sxRL58IrAMqxYI
	wasS14MtaVWRczdpRsTs6MklM=
Received: from outlook.com (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAHbnZpw2RpgYhGFQ--.883S2;
	Mon, 12 Jan 2026 17:48:27 +0800 (CST)
From: Holden Hsu <holden_hsu@163.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	holden_hsu@163.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dib0700: split combined RC map into per-device maps
Date: Mon, 12 Jan 2026 01:48:20 -0800
Message-ID: <20260112094820.24482-1-holden_hsu@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHbnZpw2RpgYhGFQ--.883S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3XFy5Cw1DZF45CF1rWry7GFg_yoW7Zr18pw
	n5GF9Y9ay8WFsrZw4UJw4IkryYk3yrtrWYyr9Fgas09w18C34Ik3WkGFWayFyUJ3yrGry3
	twnIqr1fC3yDArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UbzVbUUUUU=
X-CM-SenderInfo: xkrovv5qbk23i6rwjhhfrp/xtbC+wt+UGlkw2sGRQAA34

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
 drivers/media/rc/keymaps/rc-dib0700-nec.c   | 63 +++++++++++++++++----
 drivers/media/usb/dvb-usb/dib0700_devices.c |  4 +-
 include/media/rc-map.h                      |  3 +
 3 files changed, 58 insertions(+), 12 deletions(-)

diff --git a/drivers/media/rc/keymaps/rc-dib0700-nec.c b/drivers/media/rc/keymaps/rc-dib0700-nec.c
index 0323049fd..1475560a2 100644
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
@@ -94,23 +98,62 @@ static struct rc_map_table dib0700_nec_table[] = {
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
+static struct rc_map_list evolutepc_map = {
+	.map = {
+		.scan     = evolutepc_table,
+		.size     = ARRAY_SIZE(evolutepc_table),
+		.rc_proto = RC_PROTO_NEC,
+		.name     = "RC_MAP_EVOLUTEPC",
+	}
+};
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


