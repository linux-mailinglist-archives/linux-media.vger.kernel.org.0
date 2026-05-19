Return-Path: <linux-media+bounces-62122-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBXwKRVCDGq4bwUAu9opvQ
	(envelope-from <linux-media+bounces-62122-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:57:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1871657CFF4
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8191531EE7EF
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 10:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620E54D2EF2;
	Tue, 19 May 2026 10:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="FfW6j5HX"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED12370ADE;
	Tue, 19 May 2026 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187297; cv=none; b=ZifyM+64kpbrdUjUtOyrxal/NYR32w1VjM8t6GH99iA2nw/AhJibt+DH3zu9ROitM2dr/4fzyP2AuGnn3tWUz3i0PGjKQDjyOpxE/gUtRupOb3okt1PC+vGhscCiRb/im9QwUHMRsf21OXYmuGmWS1THLzbSo0vdRH2G0f7oaYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187297; c=relaxed/simple;
	bh=y3VePLgsOhuw/LXwzvT2rJZbyWhWw80V+DuQzaBFVsg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fSCo+RHH1FmyAOqDpfIDzi1hjXFfRomlgp+dAAi/8WqxGP3NXJ3PtdbHH+2r/hG6DnGXxcKelY50B4YfzSr2aYgUQM6XfJbU0rViwa6cHzuLDUhnnCXw2K6ZaOZ2YramDpCi6a2TkDDzPqLZVmYQoF60JMLYMJjKlo4WnrGZj2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=FfW6j5HX; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779187296; x=1810723296;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y3VePLgsOhuw/LXwzvT2rJZbyWhWw80V+DuQzaBFVsg=;
  b=FfW6j5HXd5Dg2ngvlu5TvDj/2nQok3kBHTDhVZrVXILhh4vCmNgN6lNm
   86Mr0/o0eiQHuSQrTnITPC4sDY0nKbyrpD4Kvpb2tMsJobzKpsNvk4PCS
   jUxF22E1z3aq/wpMjtwHBlP8/QcbpjrUZcR2Q2em+iCi1VdSVC8vKR7VX
   Me4JiH+JNK3HzyPgLgIBWEJvf9vB+/QdFGPuApPGSsuk2sBBKtyCf7lus
   HIMRPOaReOpRna3kC+iNxCHfaGa1mkrvFMemSJ2r0SL0TL7D7ZHm4UJfz
   513E+6ky4wW/719DiaTmL5BWqyv9hnk3D3KFY/jGCVaGBvfb3/fnbK7ct
   g==;
X-CSE-ConnectionGUID: MPT9Y7FdTPeC2ngnrRfatw==
X-CSE-MsgGUID: 92vY5iRvQ8aNlgTv2Wt8fg==
X-IronPort-AV: E=Sophos;i="6.23,243,1770620400"; 
   d="scan'208";a="66492389"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:41:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 19 May 2026 03:41:34 -0700
Received: from hyd-ld-i35088a.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 19 May 2026 03:41:32 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<conor.dooley@microchip.com>, <valentina.fernandezalanis@microchip.com>,
	<praveen.kumar@microchip.com>, <shravan.chippa@microchip.com>
Subject: [PATCH] media: i2c: imx334: add new link frequency configuration
Date: Tue, 19 May 2026 16:11:29 +0530
Message-ID: <20260519104129.2001018-1-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[shravan.chippa@microchip.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62122-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+]
X-Rspamd-Queue-Id: 1871657CFF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Shravan Chippa <shravan.chippa@microchip.com>

Add support for a new 222 MHz link frequency configuration to the
IMX334 driver and dynamically generate the supported modes array
based on the link frequencies specified in the DTS. When multiple
link frequencies support the same resolution, the driver selects
the first matching entry; therefore, the link frequency must be
explicitly defined in the DTS to avoid resolution conflicts.
The link frequency is a read‑only parameter and is automatically
set based on the selected resolution and DTS configuration.

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/media/i2c/imx334.c | 112 +++++++++++++++++++++++++++++++++++--
 1 file changed, 106 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 9654f9268056..336de9cd8ff2 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -109,6 +109,7 @@
 /* CSI2 HW configuration */
 #define IMX334_LINK_FREQ_891M		891000000
 #define IMX334_LINK_FREQ_445M		445500000
+#define IMX334_LINK_FREQ_222M		222500000
 #define IMX334_NUM_DATA_LANES		4
 
 #define IMX334_REG_MIN			0x00
@@ -209,6 +210,8 @@ struct imx334 {
 	};
 	u32 vblank;
 	const struct imx334_mode *cur_mode;
+	const struct imx334_mode *new_supported_modes;
+	int new_modes_size;
 	unsigned long link_freq_bitmap;
 	u32 cur_code;
 };
@@ -216,6 +219,7 @@ struct imx334 {
 static const s64 link_freq[] = {
 	IMX334_LINK_FREQ_891M,
 	IMX334_LINK_FREQ_445M,
+	IMX334_LINK_FREQ_222M,
 };
 
 /* Sensor common mode registers values */
@@ -486,6 +490,45 @@ static const struct imx334_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_640x480_regs),
 			.regs = mode_640x480_regs,
 		},
+	}, {
+		.width = 1920,
+		.height = 1080,
+		.hblank = 2480,
+		.vblank = 1170,
+		.vblank_min = 45,
+		.vblank_max = 132840,
+		.pclk = 297000000,
+		.link_freq_idx = 2,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
+			.regs = mode_1920x1080_regs,
+		},
+	}, {
+		.width = 1280,
+		.height = 720,
+		.hblank = 2480,
+		.vblank = 1170,
+		.vblank_min = 45,
+		.vblank_max = 132840,
+		.pclk = 297000000,
+		.link_freq_idx = 2,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
+			.regs = mode_1280x720_regs,
+		},
+	}, {
+		.width = 640,
+		.height = 480,
+		.hblank = 2480,
+		.vblank = 1170,
+		.vblank_min = 45,
+		.vblank_max = 132840,
+		.pclk = 297000000,
+		.link_freq_idx = 2,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_640x480_regs),
+			.regs = mode_640x480_regs,
+		},
 	},
 };
 
@@ -713,7 +756,7 @@ static int imx334_enum_frame_size(struct v4l2_subdev *sd,
 	struct imx334 *imx334 = to_imx334(sd);
 	u32 code;
 
-	if (fsize->index >= ARRAY_SIZE(supported_modes))
+	if (fsize->index >= imx334->new_modes_size)
 		return -EINVAL;
 
 	code = imx334_get_format_code(imx334, fsize->code);
@@ -721,9 +764,9 @@ static int imx334_enum_frame_size(struct v4l2_subdev *sd,
 	if (fsize->code != code)
 		return -EINVAL;
 
-	fsize->min_width = supported_modes[fsize->index].width;
+	fsize->min_width = imx334->new_supported_modes[fsize->index].width;
 	fsize->max_width = fsize->min_width;
-	fsize->min_height = supported_modes[fsize->index].height;
+	fsize->min_height = imx334->new_supported_modes[fsize->index].height;
 	fsize->max_height = fsize->min_height;
 
 	return 0;
@@ -792,8 +835,8 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx334_mode *mode;
 	int ret = 0;
 
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes),
+	mode = v4l2_find_nearest_size(imx334->new_supported_modes,
+				      imx334->new_modes_size,
 				      width, height,
 				      fmt->format.width, fmt->format.height);
 
@@ -914,6 +957,9 @@ static int imx334_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	if (link_freq[imx334->cur_mode->link_freq_idx] == IMX334_LINK_FREQ_222M)
+		cci_write(imx334->cci, IMX334_REG_INCKSEL2, 0x0a, NULL);
+
 	/* Start streaming */
 	ret = cci_write(imx334->cci, IMX334_REG_MODE_SELECT,
 			IMX334_MODE_STREAMING, NULL);
@@ -979,6 +1025,55 @@ static int imx334_detect(struct imx334 *imx334)
 	return 0;
 }
 
+/**
+ * imx334_update_supported_mode_array() - Search for the supported
+ *                                        modes add them in the new list
+ * @imx334: pointer to imx334 device
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int imx334_update_supported_mode_array(struct imx334 *imx334)
+{
+	int i, j, size = 0;
+	struct imx334_mode *temp_ptr;
+
+	for (i = 0; i < ARRAY_SIZE(link_freq); i++) {
+		if (imx334->link_freq_bitmap & (1 << i)) {
+			for (j = 0; j < ARRAY_SIZE(supported_modes); j++) {
+				if (supported_modes[j].link_freq_idx == i)
+					size++;
+			}
+		}
+	}
+
+	if (!size)
+		return -EINVAL;
+
+	imx334->new_modes_size = size;
+
+	size = 0;
+
+	temp_ptr = devm_kmalloc(imx334->dev, imx334->new_modes_size * sizeof(struct imx334_mode),
+				GFP_KERNEL);
+	if (!temp_ptr)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(link_freq); i++) {
+		if (imx334->link_freq_bitmap & (1 << i)) {
+			for (j = 0; j < ARRAY_SIZE(supported_modes); j++) {
+				if (supported_modes[j].link_freq_idx == i) {
+					temp_ptr[size] = supported_modes[j];
+					size++;
+				}
+			}
+		}
+	}
+
+	imx334->new_supported_modes = temp_ptr;
+
+	return 0;
+}
+
 /**
  * imx334_parse_hw_config() - Parse HW configuration and check if supported
  * @imx334: pointer to imx334 device
@@ -1038,6 +1133,11 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 				       link_freq, ARRAY_SIZE(link_freq),
 				       &imx334->link_freq_bitmap);
 
+	if (ret)
+		goto done_endpoint_free;
+
+	ret = imx334_update_supported_mode_array(imx334);
+
 done_endpoint_free:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
 
@@ -1251,7 +1351,7 @@ static int imx334_probe(struct i2c_client *client)
 	}
 
 	/* Set default mode to max resolution */
-	imx334->cur_mode = &supported_modes[__ffs(imx334->link_freq_bitmap)];
+	imx334->cur_mode = &imx334->new_supported_modes[__ffs(imx334->link_freq_bitmap)];
 	imx334->cur_code = imx334_mbus_codes[0];
 	imx334->vblank = imx334->cur_mode->vblank;
 
-- 
2.34.1


