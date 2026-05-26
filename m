Return-Path: <linux-media+bounces-62742-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLugImwkFWosTAcAu9opvQ
	(envelope-from <linux-media+bounces-62742-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 06:41:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F36545D0AE6
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 06:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11806301224A
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 04:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FBC3AC0CB;
	Tue, 26 May 2026 04:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="vVRTIPBk"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CE01A9F96;
	Tue, 26 May 2026 04:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779770460; cv=none; b=OGcJ4ZWVX98PEfabTsxsj/Wo0Bq0c0OmLXNfiPTmCDcCx5dzA58QKHXe4aCtqb0ApMJqs3egDSvnIugpmkIl1EAzF6D0KWJS16+6QP0C8gMACoa1aT2No3t4bpEII+BG+Tf03a7hfWwnFeZBhtZmNY3/wnFgydlbm10qa3b0K0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779770460; c=relaxed/simple;
	bh=19YxFUvjbynFD0kbEmDlr1CBpbZ5eSOKakhu6xo4ots=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WJ3cvQWZaZC8ADiKCQ6PimBmy2u2NGDEcpHlXwZRwWNZoe1moT0qqUWuPf3LIAqyIozVWaXZNFENhDkQ3JLZpPsC9WlWibxpjKdMxIm9fpH13WB8bV3Ua+ghp3heZM4kiPxQvcNIzFl9hPQe9AqDDsa5NXslekxDAqZdYv+epBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=vVRTIPBk; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779770459; x=1811306459;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=19YxFUvjbynFD0kbEmDlr1CBpbZ5eSOKakhu6xo4ots=;
  b=vVRTIPBkYaZQMZuplwxcOxmF3mbzvHkU0fNbS1H824rzTqOiT8UjuHmQ
   3JV6PjhqWUz2kmz02LDvGNCKnmLVF0qB35g2yLnPKWy7RymH3JknB+tSI
   6KVlf4md/WDsVd+7N8YhlblvRSHexZ2jzyjVWw82A28X4Zdmy/NCWMTNT
   arptWFMOhTQugkQoxaxbWnhXgrEVfybEmtq6BLXdhp/1/Y6VSjntSWVte
   hScFmQyNhqwbIu+cJd+FT8NlKmxBYsEgfh9iVuiKRKMjwbwsDxq46m8Zj
   fV22G5D/Ck15sYz1VfS+97qlxORdB5iYumWBlFTl9zq97CQ7F05pXXV33
   g==;
X-CSE-ConnectionGUID: V/mLiaJSRUqDqpDYC+It+g==
X-CSE-MsgGUID: z7N+YQaRQyytKkoXm7cnzA==
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="58040209"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 21:40:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Mon, 25 May 2026 21:40:56 -0700
Received: from hyd-ld-i35088a.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 May 2026 21:40:54 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<conor.dooley@microchip.com>, <valentina.fernandezalanis@microchip.com>,
	<praveen.kumar@microchip.com>, <shravan.chippa@microchip.com>
Subject: [PATCH V2] media: i2c: imx334: add new link frequency configuration
Date: Tue, 26 May 2026 10:10:51 +0530
Message-ID: <20260526044051.2946362-1-shravan.chippa@microchip.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62742-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[microchip.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shravan.chippa@microchip.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Queue-Id: F36545D0AE6
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

Changes from V1 -> V2

1. Fix: Default mode selection bug
   - Problem: Used __ffs(link_freq_bitmap) as index into the compacted
     active_modes array. This index corresponds to a bit position in the
     bitmap, not an array index in the filtered modes list.
   - Fix: Use index 0, which is always the first valid mode in the
     filtered array.

2. Fix: Rename fields for clarity
   - Renamed struct fields:
     * new_supported_modes -> active_modes
     * new_modes_size -> num_active_modes
   - Updated kernel-doc header for struct imx334 to document new fields.

3. Fix: INCKSEL2 register write - add error handling and switch-case
   - Location: imx334_enable_streams()
   - Problem: Original code only handled 222 MHz case with no error
     checking (passed NULL to cci_write).
   - Fix: Replaced with switch-case covering all three link frequencies:
     * 891 MHz -> INCKSEL2 = 0x02
     * 445 MHz -> INCKSEL2 = 0x06
     * 222 MHz -> INCKSEL2 = 0x0a
   - Added proper error handling using &ret accumulator pattern with
     dev_err and goto err_rpm_put on failure.

4. Fix: Use BIT() macro
   - Location: imx334_update_supported_mode_array()
   - Replaced (1 << i) with BIT(i) for kernel coding style compliance.

5. Fix: Use devm_kmalloc_array() for overflow-safe allocation
   - Location: imx334_update_supported_mode_array()
   - Replaced: devm_kmalloc(dev, n * sizeof(struct imx334_mode), GFP_KERNEL)
   - With: devm_kmalloc_array(dev, n, sizeof(*temp_ptr), GFP_KERNEL)
   - Provides overflow-safe multiplication and uses sizeof(*ptr) idiom.

6. Cleanup: Condensed copy loop
   - Location: imx334_update_supported_mode_array(), second loop
   - Simplified the struct copy with post-increment:
     temp_ptr[size++] = supported_modes[j];

7. Fix: Updated function kernel-doc comment
   - Location: imx334_update_supported_mode_array()
   - Reworded: "Search for the supported modes add them in the new list"
   - To: "Build filtered modes array based on DTS link frequencies"

8. IMX334_LINK_FREQ_222M changed from 222500000 to 222750000

---

 drivers/media/i2c/imx334.c | 128 +++++++++++++++++++++++++++++++++++--
 1 file changed, 121 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 9654f9268056..b6ef314ee717 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -109,6 +109,7 @@
 /* CSI2 HW configuration */
 #define IMX334_LINK_FREQ_891M		891000000
 #define IMX334_LINK_FREQ_445M		445500000
+#define IMX334_LINK_FREQ_222M		222750000
 #define IMX334_NUM_DATA_LANES		4
 
 #define IMX334_REG_MIN			0x00
@@ -187,6 +188,8 @@ struct imx334_mode {
  * @again_ctrl: Pointer to analog gain control
  * @vblank: Vertical blanking in lines
  * @cur_mode: Pointer to current selected sensor mode
+ * @active_modes: Pointer to modes filtered by DTS link frequencies
+ * @num_active_modes: Number of entries in active_modes array
  * @link_freq_bitmap: Menu bitmap for link_freq_ctrl
  * @cur_code: current selected format code
  */
@@ -209,6 +212,8 @@ struct imx334 {
 	};
 	u32 vblank;
 	const struct imx334_mode *cur_mode;
+	const struct imx334_mode *active_modes;
+	int num_active_modes;
 	unsigned long link_freq_bitmap;
 	u32 cur_code;
 };
@@ -216,6 +221,7 @@ struct imx334 {
 static const s64 link_freq[] = {
 	IMX334_LINK_FREQ_891M,
 	IMX334_LINK_FREQ_445M,
+	IMX334_LINK_FREQ_222M,
 };
 
 /* Sensor common mode registers values */
@@ -486,6 +492,45 @@ static const struct imx334_mode supported_modes[] = {
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
 
@@ -713,7 +758,7 @@ static int imx334_enum_frame_size(struct v4l2_subdev *sd,
 	struct imx334 *imx334 = to_imx334(sd);
 	u32 code;
 
-	if (fsize->index >= ARRAY_SIZE(supported_modes))
+	if (fsize->index >= imx334->num_active_modes)
 		return -EINVAL;
 
 	code = imx334_get_format_code(imx334, fsize->code);
@@ -721,9 +766,9 @@ static int imx334_enum_frame_size(struct v4l2_subdev *sd,
 	if (fsize->code != code)
 		return -EINVAL;
 
-	fsize->min_width = supported_modes[fsize->index].width;
+	fsize->min_width = imx334->active_modes[fsize->index].width;
 	fsize->max_width = fsize->min_width;
-	fsize->min_height = supported_modes[fsize->index].height;
+	fsize->min_height = imx334->active_modes[fsize->index].height;
 	fsize->max_height = fsize->min_height;
 
 	return 0;
@@ -792,8 +837,8 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx334_mode *mode;
 	int ret = 0;
 
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes),
+	mode = v4l2_find_nearest_size(imx334->active_modes,
+				      imx334->num_active_modes,
 				      width, height,
 				      fmt->format.width, fmt->format.height);
 
@@ -914,6 +959,23 @@ static int imx334_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	/* Override INCKSEL2 based on the active link frequency */
+	switch (link_freq[imx334->cur_mode->link_freq_idx]) {
+	case IMX334_LINK_FREQ_891M:
+		cci_write(imx334->cci, IMX334_REG_INCKSEL2, 0x02, &ret);
+		break;
+	case IMX334_LINK_FREQ_445M:
+		cci_write(imx334->cci, IMX334_REG_INCKSEL2, 0x06, &ret);
+		break;
+	case IMX334_LINK_FREQ_222M:
+		cci_write(imx334->cci, IMX334_REG_INCKSEL2, 0x0a, &ret);
+		break;
+	}
+	if (ret) {
+		dev_err(imx334->dev, "fail to set INCKSEL2\n");
+		goto err_rpm_put;
+	}
+
 	/* Start streaming */
 	ret = cci_write(imx334->cci, IMX334_REG_MODE_SELECT,
 			IMX334_MODE_STREAMING, NULL);
@@ -979,6 +1041,53 @@ static int imx334_detect(struct imx334 *imx334)
 	return 0;
 }
 
+/**
+ * imx334_update_supported_mode_array() - Build filtered modes array based on
+ *                                        DTS link frequencies
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
+		if (imx334->link_freq_bitmap & BIT(i)) {
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
+	imx334->num_active_modes = size;
+
+	size = 0;
+
+	temp_ptr = devm_kmalloc_array(imx334->dev, imx334->num_active_modes,
+				      sizeof(*temp_ptr), GFP_KERNEL);
+	if (!temp_ptr)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(link_freq); i++) {
+		if (imx334->link_freq_bitmap & BIT(i)) {
+			for (j = 0; j < ARRAY_SIZE(supported_modes); j++) {
+				if (supported_modes[j].link_freq_idx == i)
+					temp_ptr[size++] = supported_modes[j];
+			}
+		}
+	}
+
+	imx334->active_modes = temp_ptr;
+
+	return 0;
+}
+
 /**
  * imx334_parse_hw_config() - Parse HW configuration and check if supported
  * @imx334: pointer to imx334 device
@@ -1038,6 +1147,11 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 				       link_freq, ARRAY_SIZE(link_freq),
 				       &imx334->link_freq_bitmap);
 
+	if (ret)
+		goto done_endpoint_free;
+
+	ret = imx334_update_supported_mode_array(imx334);
+
 done_endpoint_free:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
 
@@ -1250,8 +1364,8 @@ static int imx334_probe(struct i2c_client *client)
 		goto error_power_off;
 	}
 
-	/* Set default mode to max resolution */
-	imx334->cur_mode = &supported_modes[__ffs(imx334->link_freq_bitmap)];
+	/* Set default mode to first entry in the filtered modes array */
+	imx334->cur_mode = &imx334->active_modes[0];
 	imx334->cur_code = imx334_mbus_codes[0];
 	imx334->vblank = imx334->cur_mode->vblank;
 
-- 
2.34.1


