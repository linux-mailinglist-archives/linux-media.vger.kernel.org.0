Return-Path: <linux-media+bounces-42264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B48B52B6B
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 638241C23703
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEC92E5B3D;
	Thu, 11 Sep 2025 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k04AlcJB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D602DECA1;
	Thu, 11 Sep 2025 08:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757578549; cv=none; b=NLyc5VfmmcU7WQpPT/Nm6oKYgYU2Ex/OCRvwjKSkO0g594odZJoSdMHQ7iqKwF/0pEcgWcd1vhzjor0/h0xppI6zLKBHAVqw3Rm4alnUzDlBK3YMHKD0hQM7ngYWy6eBU+OA0CCCgepelqJQkToOLTVRaftWHfGg9viN5xD0z58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757578549; c=relaxed/simple;
	bh=ZTldZJg3fSukQrYzsfoKKMopLHDHUG6BHoXEM47d4Dg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dTDuufA0qVhJs/84l00ca1FoQOk7Aw3ktJlFafLTHPwqBHEpz0dGNAmPrY55tRYU7l9/tyk5xhl7vUIG99namoYq+gt+trvF8VqVN7F+XHY+iAJUzTkUSXyOTBOtPZH37xEFOW3Y+0N7td+36++bFLuywM613xmXmZpd0FPH2Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k04AlcJB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:c9e9:75f9:f434:33cd:e4fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD37A4A4;
	Thu, 11 Sep 2025 10:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757578471;
	bh=ZTldZJg3fSukQrYzsfoKKMopLHDHUG6BHoXEM47d4Dg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k04AlcJBc0pZH5GV8y4wvAJT9mghTY7WmhFOyiG5BPdzOHpX/9qKhOnyqE5cyxaNQ
	 Bcc0MwePX/Gt8lLNtTqvUtW0DRS5CssO69BjXXlVA2WCNWdWJxmWjkAIpMPRFEc4zP
	 I1MPiudpyIaEZ+6ZCzD/yeqexEzOmJxh7/NOzbWk=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 11 Sep 2025 13:44:23 +0530
Subject: [PATCH v2 7/8] media: imx335: Support 2x2 binning
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-imx335_binning-v2-7-30a28df74df6@ideasonboard.com>
References: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
In-Reply-To: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15617;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=ZTldZJg3fSukQrYzsfoKKMopLHDHUG6BHoXEM47d4Dg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBowoTyXIoHsXINfi8MkIQlnN2zLt/IZ5VMOZ9Qm
 IGTOkbLzSOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMKE8gAKCRBD3pH5JJpx
 RXuQD/93xwdCe18R+zBHXaTa1Hby5Rie00SXTUhD+5NnLDyLulOdm3iJUEC9X9vefRkovfG7lIh
 o6Q+B1VI0YbfLVWhp41i/kZ006IoF3vKgmEXJEFc47yJhPFHpgM8mkwjUcddDlb9dVRh00BZbUu
 E9u4Q/vzwKTI1UfpBgkK/el5gc99IcRWrPtpdzVBt0UzgyFR+xQ09bpz7EspWhqZq3BB/Qo3yRw
 TTK3y3LAxoP+5Czm0e5KR6TiGD6cur9YYSUxiiSSqEDOnqmWg0vUW702EI3thowhfmDbow/osWF
 bdNR92RulxzqyuJBdJEARnvd8g0ofICMPOv7p2kznWb/xWSLneoXDPvsiwIHuF/7QsF8Ue3jOp8
 V32hojtKXl+P9KZjLQLd3XuZdEsqJM2BNXZ4x3Wkn9TRDbm9/2HeRQdLjRX0fpu0qNPEYTpKSZ7
 xkoEgnG6cfd/95xz/rx36aADuuDOOVD2va+ocYa9fQF+23Pq3B4mKLYiueIJePW7TC46ykDua3m
 EWRgJVmw8YF3Exqne9LtiKghpZJpRaHO+pAyrh6JQeOIChwdSCVSedLzXNahpyqWxwOZwAFMB2k
 r+YdfymzLb/W9qqxLjBqV7q0jJIQaSiwokdjixXiPPvB18LCYLZt23YN2JCtjY2MZnBBJFnnOr+
 1H/rNSk92KpZJLw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Introduce 2x2 binning mode (1312x972@60fps). Since there are multiple
modes now, use v4l2_find_nearest_size() to select the appropriate mode
in .set_fmt().

For 2x2 binning the minimum shutter value supported is 17 instead of 9.
This effects the maximum allowed exposure time, and if not enforced then
the sensor produces very dark frames when the minimum shutter limit is
violated.

Lastly, update the crop size reported to the userspace. When trying 2x2
binning with the datasheet suggested pixel array size (i.e. 2592 / 2 =>
1296), on some platforms (Raspberry Pi 5) artefacts are introduced on
the right edge of the output image. Instead, using a higher width of
1312 works fine on all platforms.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 275 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 217 insertions(+), 58 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 9b9bbe6473d545bc5618c0fe8191df0b18037cd8..c985edab7e2a965ccd9427b013cbb3fa8778de2b 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -35,6 +35,7 @@
 
 /* Lines per frame */
 #define IMX335_REG_VMAX			CCI_REG24_LE(0x3030)
+#define IMX335_REG_HMAX			CCI_REG16_LE(0x3034)
 
 #define IMX335_REG_OPB_SIZE_V		CCI_REG8(0x304c)
 #define IMX335_REG_ADBIT		CCI_REG8(0x3050)
@@ -42,10 +43,13 @@
 
 #define IMX335_REG_SHUTTER		CCI_REG24_LE(0x3058)
 #define IMX335_EXPOSURE_MIN		1
-#define IMX335_EXPOSURE_OFFSET		9
+#define IMX335_SHUTTER_MIN		9
+#define IMX335_SHUTTER_MIN_BINNED	17
 #define IMX335_EXPOSURE_STEP		1
 #define IMX335_EXPOSURE_DEFAULT		0x0648
 
+#define IMX335_REG_AREA2_WIDTH_1	CCI_REG16_LE(0x3072)
+
 #define IMX335_REG_AREA3_ST_ADR_1	CCI_REG16_LE(0x3074)
 #define IMX335_REG_AREA3_WIDTH_1	CCI_REG16_LE(0x3076)
 
@@ -133,12 +137,11 @@ static const struct v4l2_rect imx335_native_area = {
 
 static const struct v4l2_rect imx335_active_area = {
 	.top = 50,
-	.left = 52,
-	.width = 2592,
+	.left = 36,
+	.width = 2624,
 	.height = 1944,
 };
 
-
 /**
  * struct imx335_reg_list - imx335 sensor register list
  * @num_of_regs: Number of registers in the list
@@ -155,8 +158,14 @@ static const char * const imx335_supply_name[] = {
 	"dvdd", /* Digital Core (1.2V) supply */
 };
 
+enum imx335_scan_mode {
+	IMX335_ALL_PIXEL,
+	IMX335_2_2_BINNING,
+};
+
 /**
  * struct imx335_mode - imx335 sensor mode structure
+ * @scan_mode: Configuration scan mode (All pixel / 2x2Binning)
  * @width: Frame width
  * @height: Frame height
  * @code: Format code
@@ -170,6 +179,7 @@ static const char * const imx335_supply_name[] = {
  * @vflip_inverted: Register list vflip (inverted readout)
  */
 struct imx335_mode {
+	enum imx335_scan_mode scan_mode;
 	u32 width;
 	u32 height;
 	u32 code;
@@ -271,12 +281,33 @@ static const struct cci_reg_sequence mode_2592x1944_regs[] = {
 	{ IMX335_REG_MODE_SELECT, IMX335_MODE_STANDBY },
 	{ IMX335_REG_MASTER_MODE, 0x00 },
 	{ IMX335_REG_WINMODE, 0x04 },
+	{ IMX335_REG_HMAX, 550 },
 	{ IMX335_REG_HTRIMMING_START, 48 },
 	{ IMX335_REG_HNUM, 2592 },
 	{ IMX335_REG_Y_OUT_SIZE, 1944 },
+	{ IMX335_REG_AREA2_WIDTH_1, 40 },
 	{ IMX335_REG_AREA3_WIDTH_1, 3928 },
 	{ IMX335_REG_OPB_SIZE_V, 0 },
 	{ IMX335_REG_XVS_XHS_DRV, 0x00 },
+};
+
+static const struct cci_reg_sequence mode_1312x972_regs[] = {
+	{ IMX335_REG_MODE_SELECT, IMX335_MODE_STANDBY },
+	{ IMX335_REG_MASTER_MODE, 0x00 },
+	{ IMX335_REG_WINMODE, 0x01 },
+	{ IMX335_REG_HMAX, 275 },
+	{ IMX335_REG_HTRIMMING_START, 48 },
+	{ IMX335_REG_HNUM, 2600 },
+	{ IMX335_REG_Y_OUT_SIZE, 972 },
+	{ IMX335_REG_AREA2_WIDTH_1, 48 },
+	{ IMX335_REG_AREA3_WIDTH_1, 3936 },
+	{ IMX335_REG_OPB_SIZE_V, 0 },
+	{ IMX335_REG_XVS_XHS_DRV, 0x00 },
+	{ CCI_REG8(0x3300), 1 }, /* TCYCLE */
+	{ CCI_REG8(0x3199), 0x30 }, /* HADD/VADD */
+};
+
+static const struct cci_reg_sequence imx335_common_regs[] = {
 	{ CCI_REG8(0x3288), 0x21 },
 	{ CCI_REG8(0x328a), 0x02 },
 	{ CCI_REG8(0x3414), 0x05 },
@@ -367,16 +398,72 @@ static const struct cci_reg_sequence mode_2592x1944_vflip_inverted[] = {
 	{ CCI_REG16_LE(0x3116), 0x002 },
 };
 
-static const struct cci_reg_sequence raw10_framefmt_regs[] = {
-	{ IMX335_REG_ADBIT, 0x00 },
-	{ IMX335_REG_MDBIT, 0x00 },
-	{ IMX335_REG_ADBIT1, 0x1ff },
+static const struct cci_reg_sequence mode_1312x972_vflip_normal[] = {
+	{ IMX335_REG_AREA3_ST_ADR_1, 176 },
+
+	/* Undocumented */
+	{ CCI_REG8(0x3078), 0x04 },
+	{ CCI_REG8(0x3079), 0xfd },
+	{ CCI_REG8(0x307a), 0x04 },
+	{ CCI_REG8(0x307b), 0xfe },
+	{ CCI_REG8(0x307c), 0x04 },
+	{ CCI_REG8(0x307d), 0xfb },
+	{ CCI_REG8(0x307e), 0x04 },
+	{ CCI_REG8(0x307f), 0x02 },
+	{ CCI_REG8(0x3080), 0x04, },
+	{ CCI_REG8(0x3081), 0xfd, },
+	{ CCI_REG8(0x3082), 0x04, },
+	{ CCI_REG8(0x3083), 0xfe, },
+	{ CCI_REG8(0x3084), 0x04, },
+	{ CCI_REG8(0x3085), 0xfb, },
+	{ CCI_REG8(0x3086), 0x04, },
+	{ CCI_REG8(0x3087), 0x02, },
+	{ CCI_REG8(0x30a4), 0x77, },
+	{ CCI_REG8(0x30a8), 0x20, },
+	{ CCI_REG8(0x30a9), 0x00, },
+	{ CCI_REG8(0x30ac), 0x08, },
+	{ CCI_REG8(0x30ad), 0x08, },
+	{ CCI_REG8(0x30b0), 0x20, },
+	{ CCI_REG8(0x30b1), 0x00, },
+	{ CCI_REG8(0x30b4), 0x10, },
+	{ CCI_REG8(0x30b5), 0x10, },
+	{ CCI_REG16_LE(0x30b6), 0x00 },
+	{ CCI_REG16_LE(0x3112), 0x10 },
+	{ CCI_REG16_LE(0x3116), 0x10 },
 };
 
-static const struct cci_reg_sequence raw12_framefmt_regs[] = {
-	{ IMX335_REG_ADBIT, 0x01 },
-	{ IMX335_REG_MDBIT, 0x01 },
-	{ IMX335_REG_ADBIT1, 0x47 },
+static const struct cci_reg_sequence mode_1312x972_vflip_inverted[] = {
+	{ IMX335_REG_AREA3_ST_ADR_1, 4112 },
+
+	/* Undocumented */
+	{ CCI_REG8(0x3078), 0x04 },
+	{ CCI_REG8(0x3079), 0xfd },
+	{ CCI_REG8(0x307a), 0x04 },
+	{ CCI_REG8(0x307b), 0xfe },
+	{ CCI_REG8(0x307c), 0x04 },
+	{ CCI_REG8(0x307d), 0xfb },
+	{ CCI_REG8(0x307e), 0x04 },
+	{ CCI_REG8(0x307f), 0x02 },
+	{ CCI_REG8(0x3080), 0xfc, },
+	{ CCI_REG8(0x3081), 0x05, },
+	{ CCI_REG8(0x3082), 0xfc, },
+	{ CCI_REG8(0x3083), 0x02, },
+	{ CCI_REG8(0x3084), 0xfc, },
+	{ CCI_REG8(0x3085), 0x03, },
+	{ CCI_REG8(0x3086), 0xfc, },
+	{ CCI_REG8(0x3087), 0xfe, },
+	{ CCI_REG8(0x30a4), 0x77, },
+	{ CCI_REG8(0x30a8), 0x20, },
+	{ CCI_REG8(0x30a9), 0x00, },
+	{ CCI_REG8(0x30ac), 0x08, },
+	{ CCI_REG8(0x30ad), 0x78, },
+	{ CCI_REG8(0x30b0), 0x20, },
+	{ CCI_REG8(0x30b1), 0x00, },
+	{ CCI_REG8(0x30b4), 0x10, },
+	{ CCI_REG8(0x30b5), 0x70, },
+	{ CCI_REG16_LE(0x30b6), 0x01f2 },
+	{ CCI_REG16_LE(0x3112), 0x10 },
+	{ CCI_REG16_LE(0x3116), 0x02 },
 };
 
 static const struct cci_reg_sequence mipi_data_rate_1188Mbps[] = {
@@ -441,25 +528,49 @@ static const u32 imx335_mbus_codes[] = {
 };
 
 /* Supported sensor mode configurations */
-static const struct imx335_mode supported_mode = {
-	.width = 2592,
-	.height = 1944,
-	.hblank = 342,
-	.vblank = 2556,
-	.vblank_min = 2556,
-	.vblank_max = 133060,
-	.pclk = 396000000,
-	.reg_list = {
-		.num_of_regs = ARRAY_SIZE(mode_2592x1944_regs),
-		.regs = mode_2592x1944_regs,
-	},
-	.vflip_normal = {
-		.num_of_regs = ARRAY_SIZE(mode_2592x1944_vflip_normal),
-		.regs = mode_2592x1944_vflip_normal,
-	},
-	.vflip_inverted = {
-		.num_of_regs = ARRAY_SIZE(mode_2592x1944_vflip_inverted),
-		.regs = mode_2592x1944_vflip_inverted,
+static const struct imx335_mode supported_modes[] = {
+	{
+		.scan_mode = IMX335_ALL_PIXEL,
+		.width = 2592,
+		.height = 1944,
+		.hblank = 342,
+		.vblank = 2556,
+		.vblank_min = 2556,
+		.vblank_max = 133060,
+		.pclk = 396000000,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_2592x1944_regs),
+			.regs = mode_2592x1944_regs,
+		},
+		.vflip_normal = {
+			.num_of_regs = ARRAY_SIZE(mode_2592x1944_vflip_normal),
+			.regs = mode_2592x1944_vflip_normal,
+		},
+		.vflip_inverted = {
+			.num_of_regs = ARRAY_SIZE(mode_2592x1944_vflip_inverted),
+			.regs = mode_2592x1944_vflip_inverted,
+		}
+	}, {
+		.scan_mode = IMX335_2_2_BINNING,
+		.width = 1312,
+		.height = 972,
+		.hblank = 155,
+		.vblank = 3528,
+		.vblank_min = 3528,
+		.vblank_max = 133060,
+		.pclk = 396000000,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1312x972_regs),
+			.regs = mode_1312x972_regs,
+		},
+		.vflip_normal = {
+			.num_of_regs = ARRAY_SIZE(mode_1312x972_vflip_normal),
+			.regs = mode_1312x972_vflip_normal,
+		},
+		.vflip_inverted = {
+			.num_of_regs = ARRAY_SIZE(mode_1312x972_vflip_inverted),
+			.regs = mode_1312x972_vflip_inverted,
+		},
 	},
 };
 
@@ -616,18 +727,22 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	/* Propagate change of current control to all related controls */
 	if (ctrl->id == V4L2_CID_VBLANK) {
+		u32 shutter_min = IMX335_SHUTTER_MIN;
+		u32 lpfr;
+
 		imx335->vblank = imx335->vblank_ctrl->val;
+		lpfr = imx335->vblank + imx335->cur_mode->height;
 
 		dev_dbg(imx335->dev, "Received vblank %u, new lpfr %u\n",
-			imx335->vblank,
-			imx335->vblank + imx335->cur_mode->height);
+			imx335->vblank, lpfr);
+
+		if (imx335->cur_mode->scan_mode == IMX335_2_2_BINNING)
+			shutter_min = IMX335_SHUTTER_MIN_BINNED;
 
 		ret = __v4l2_ctrl_modify_range(imx335->exp_ctrl,
 					       IMX335_EXPOSURE_MIN,
-					       imx335->vblank +
-					       imx335->cur_mode->height -
-					       IMX335_EXPOSURE_OFFSET,
-					       1, IMX335_EXPOSURE_DEFAULT);
+					       lpfr - shutter_min, 1,
+					       IMX335_EXPOSURE_DEFAULT);
 		if (ret)
 			return ret;
 	}
@@ -727,17 +842,16 @@ static int imx335_enum_frame_size(struct v4l2_subdev *sd,
 	struct imx335 *imx335 = to_imx335(sd);
 	u32 code;
 
-	/* Only a single supported_mode available. */
-	if (fsize->index > 0)
+	if (fsize->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
 	code = imx335_get_format_code(imx335, fsize->code);
 	if (fsize->code != code)
 		return -EINVAL;
 
-	fsize->min_width = supported_mode.width;
+	fsize->min_width = supported_modes[fsize->index].width;
 	fsize->max_width = fsize->min_width;
-	fsize->min_height = supported_mode.height;
+	fsize->min_height = supported_modes[fsize->index].height;
 	fsize->max_height = fsize->min_height;
 
 	return 0;
@@ -779,9 +893,13 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
 	struct imx335 *imx335 = to_imx335(sd);
 	struct v4l2_mbus_framefmt *format;
 	const struct imx335_mode *mode;
+	struct v4l2_rect *crop;
 	int i, ret = 0;
 
-	mode = &supported_mode;
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+				      width, height,
+				      fmt->format.width, fmt->format.height);
 
 	for (i = 0; i < ARRAY_SIZE(imx335_mbus_codes); i++) {
 		if (imx335_mbus_codes[i] == fmt->format.code)
@@ -793,6 +911,16 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 	*format = fmt->format;
 
+	crop = v4l2_subdev_state_get_crop(sd_state, fmt->pad);
+	crop->width = fmt->format.width;
+	crop->height = fmt->format.height;
+	if (mode->scan_mode == IMX335_2_2_BINNING) {
+		crop->width *= 2;
+		crop->height *= 2;
+	}
+	crop->left = (imx335_native_area.width - crop->width) / 2;
+	crop->top = (imx335_native_area.height - crop->height) / 2;
+
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		ret = imx335_update_controls(imx335, mode);
 		if (!ret)
@@ -816,7 +944,7 @@ static int imx335_init_state(struct v4l2_subdev *sd,
 	struct v4l2_subdev_format fmt = { 0 };
 
 	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
-	imx335_fill_pad_format(imx335, &supported_mode, &fmt);
+	imx335_fill_pad_format(imx335, &supported_modes[0], &fmt);
 
 	__v4l2_ctrl_modify_range(imx335->link_freq_ctrl, 0,
 				 __fls(imx335->link_freq_bitmap),
@@ -839,11 +967,15 @@ static int imx335_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_selection *sel)
 {
 	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_state_get_crop(sd_state, 0);
+
+		return 0;
+
 	case V4L2_SEL_TGT_NATIVE_SIZE:
 		sel->r = imx335_native_area;
 		return 0;
 
-	case V4L2_SEL_TGT_CROP:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		sel->r = imx335_active_area;
@@ -855,19 +987,35 @@ static int imx335_get_selection(struct v4l2_subdev *sd,
 
 static int imx335_set_framefmt(struct imx335 *imx335)
 {
-	switch (imx335->cur_mbus_code) {
-	case MEDIA_BUS_FMT_SRGGB10_1X10:
-		return cci_multi_reg_write(imx335->cci, raw10_framefmt_regs,
-					   ARRAY_SIZE(raw10_framefmt_regs),
-					   NULL);
-
-	case MEDIA_BUS_FMT_SRGGB12_1X12:
-		return cci_multi_reg_write(imx335->cci, raw12_framefmt_regs,
-					   ARRAY_SIZE(raw12_framefmt_regs),
-					   NULL);
+	/*
+	 * In the all-pixel scan mode the AD conversion shall match the output
+	 * bit width requested.
+	 *
+	 * However, when 2/2 binning is enabled, the AD conversion is always
+	 * 10-bit, so we ensure ADBIT is clear and ADBIT1 is assigned 0x1ff.
+	 * That's as much as the documentation gives us...
+	 */
+	int ret = 0;
+	u8 bpp = imx335->cur_mbus_code == MEDIA_BUS_FMT_SRGGB10_1X10 ? 10 : 12;
+	u8 ad_conv = bpp;
+
+	/* Start with the output mode */
+	cci_write(imx335->cci, IMX335_REG_MDBIT, bpp == 12, &ret);
+
+	/* Enforce 10 bit AD on binning modes */
+	if (imx335->cur_mode->scan_mode == IMX335_2_2_BINNING)
+		ad_conv = 10;
+
+	/* AD Conversion configuration */
+	if (ad_conv == 10) {
+		cci_write(imx335->cci, IMX335_REG_ADBIT, 0x00, &ret);
+		cci_write(imx335->cci, IMX335_REG_ADBIT1, 0x1ff, &ret);
+	} else { /* 12 bit AD Conversion */
+		cci_write(imx335->cci, IMX335_REG_ADBIT, 0x01, &ret);
+		cci_write(imx335->cci, IMX335_REG_ADBIT1, 0x47, &ret);
 	}
 
-	return -EINVAL;
+	return ret;
 }
 
 /**
@@ -903,6 +1051,14 @@ static int imx335_start_streaming(struct imx335 *imx335)
 		goto err_rpm_put;
 	}
 
+	/* Write sensor common registers */
+	ret = cci_multi_reg_write(imx335->cci, imx335_common_regs,
+				  ARRAY_SIZE(imx335_common_regs), NULL);
+	if (ret) {
+		dev_err(imx335->dev, "fail to write initial registers\n");
+		goto err_rpm_put;
+	}
+
 	ret = imx335_set_framefmt(imx335);
 	if (ret) {
 		dev_err(imx335->dev, "%s failed to set frame format: %d\n",
@@ -1184,7 +1340,7 @@ static int imx335_init_controls(struct imx335 *imx335)
 	struct v4l2_ctrl_handler *ctrl_hdlr = &imx335->ctrl_handler;
 	const struct imx335_mode *mode = imx335->cur_mode;
 	struct v4l2_fwnode_device_properties props;
-	u32 lpfr;
+	u32 lpfr, shutter_min;
 	int ret;
 
 	ret = v4l2_fwnode_device_parse(imx335->dev, &props);
@@ -1198,11 +1354,14 @@ static int imx335_init_controls(struct imx335 *imx335)
 
 	/* Initialize exposure and gain */
 	lpfr = mode->vblank + mode->height;
+	shutter_min = IMX335_SHUTTER_MIN;
+	if (mode->scan_mode == IMX335_2_2_BINNING)
+		shutter_min = IMX335_SHUTTER_MIN_BINNED;
 	imx335->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
 					     &imx335_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
 					     IMX335_EXPOSURE_MIN,
-					     lpfr - IMX335_EXPOSURE_OFFSET,
+					     lpfr - shutter_min,
 					     IMX335_EXPOSURE_STEP,
 					     IMX335_EXPOSURE_DEFAULT);
 
@@ -1329,7 +1488,7 @@ static int imx335_probe(struct i2c_client *client)
 	}
 
 	/* Set default mode to max resolution */
-	imx335->cur_mode = &supported_mode;
+	imx335->cur_mode = &supported_modes[0];
 	imx335->cur_mbus_code = imx335_mbus_codes[0];
 	imx335->vblank = imx335->cur_mode->vblank;
 

-- 
2.51.0


