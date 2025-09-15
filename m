Return-Path: <linux-media+bounces-42513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E90B57079
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 08:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20B953BEB4D
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 06:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DD42877D4;
	Mon, 15 Sep 2025 06:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qm5w/V+L"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83918280308;
	Mon, 15 Sep 2025 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757918383; cv=none; b=q7OfMTOx2YYjPIXM2+6wCWXyhwWZRqI6Q4f0nCPR3FDk7/kirsIClRF31eyz0fBOkqHOZKYhAUya6MHt3jFPPIfbVLnIcqOXKHBAc9Ji9Bc78kGW46ysvArJj8y+8RIt9QaxPHDifrwFu0zsf+R8rtinstGqOWqxLNWfxXT5LWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757918383; c=relaxed/simple;
	bh=vIMdOR/aTmSbXFty+Gnb3QGoox1gNusEysAjzBF+Bj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oHsE4Z+5ypmQmpfqJnXgKP3Sngy9cSH2+NFGXsZytQ6IRByiwq/7VsML/R5QiU2xI7hi6+t6xX8wiLSVHZS9/Ff1teb4BeHMzZUJsGoKB3hAhUfjmULva7AkHVyk3SARDesWIk9/EBRoyPyO0xqdr5/3Zm+EiDgJFuCJbFl1npg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qm5w/V+L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:2dbc:e233:e1b4:15e7:45cd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E3FD14B0;
	Mon, 15 Sep 2025 08:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757918302;
	bh=vIMdOR/aTmSbXFty+Gnb3QGoox1gNusEysAjzBF+Bj8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qm5w/V+LBzb2x23Qu6rWCxKD+iKfovcOofK8I1lP3yaCMfs7UB0UpgeKF59KelERI
	 zj6W6vhCyIiMND+WGxKmGNl08erZnoco0CJsQyCSLYBQLABo2w8fMIyjqbMTW1TI9P
	 xhCtnF8B6FNxSnvmQD22GOu+7myXy4xrxLAPYBOg=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Sep 2025 12:09:08 +0530
Subject: [PATCH v3 2/8] media: imx335: Support vertical flip
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-imx335_binning-v3-2-16ecabf2090d@ideasonboard.com>
References: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
In-Reply-To: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5962;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=liLNKWlzDyJ/CykjOqCqXzd/MzDVMhJvSzuAgSgGt+Q=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBox7SR/PC8H4H14jn0/xB3tNab8MPjn5LfTRARP
 T5r3BPECNaJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMe0kQAKCRBD3pH5JJpx
 RVXmEACH3FbbV5T+hXkAZYn/ZLD7fugqVkCkERU54EpFeO1NrN1G4Lggp5laai4eVp24n51dNT1
 xreROdur/NMqS5l+piEiIwf31nciuf3sbyvNgBBQE3QPRQSZHy84dhWyTe44GPUnEpFEnw5qMJ3
 mghlbiaDLZdUMfd9Lw6icljaQhlIUxuehtGFkVxOwU8UkMyBa8rdTK4aoK4urgxdoyoeerU5IwS
 QzbU86u6jdsDweAUkFmLtFhJoYn14TCgYI+uV6MGK7q8lAMaKpCj2RxGPLMfS9SyNVvn3+9vdri
 fLr69kNMydYGBJPPWy40+2GYwQxb7urKA3n/5Itsq2IO6Fq75emj/klKa2gdrDjTkJHjPi8kRzh
 urZupEKtnkdR7SbtgfUj1uVkCsxbBOa2MBp5LtJT6BPOE1ka6tCSkF3rFEJSb3N2atQBtUzQJYD
 NyyzYDHjn1zmxyvutkKWaNFxbVeDFxJGIJ8Nigk9S8R/vppMPtiJMFgWBFz1yHOEEqPpgt/V+iP
 atKKhKEdlGW85FXayoy6wHZtSlNzUMW5c7SUDWxaplUarZ8JMTXnskN7kTyEwK6KWs6CJSi2lVD
 jEBS84mEhUu/OYpkvYtZLh41oKdt5yxrg5dm9vANvec6Eee3TDuT9Twi2sEHY/RYIjOzAMZj4gD
 7obwW5cspuomngA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Umang Jain <umang.jain@ideasonboard.com>

Support vertical flip by setting REG_VREVERSE.
Additional registers also needs to be set per mode, according
to the readout direction (normal/inverted) as mentioned in the
data sheet.

Since the register IMX335_REG_AREA3_ST_ADR_1 is based on the
flip (and is set via vflip related registers), it has been
moved out of the 2592x1944 mode regs.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 71 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 213cfb7276611f522db0643186f25a8fef3c39db..27baf6c9b426a324632db7e393514463611a5ae7 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -56,6 +56,9 @@
 #define IMX335_AGAIN_STEP		1
 #define IMX335_AGAIN_DEFAULT		0
 
+/* Vertical flip */
+#define IMX335_REG_VREVERSE		CCI_REG8(0x304f)
+
 #define IMX335_REG_TPG_TESTCLKEN	CCI_REG8(0x3148)
 
 #define IMX335_REG_INCLKSEL1		CCI_REG16_LE(0x314c)
@@ -155,6 +158,8 @@ static const char * const imx335_supply_name[] = {
  * @vblank_max: Maximum vertical blanking in lines
  * @pclk: Sensor pixel clock
  * @reg_list: Register list for sensor mode
+ * @vflip_normal: Register list vflip (normal readout)
+ * @vflip_inverted: Register list vflip (inverted readout)
  */
 struct imx335_mode {
 	u32 width;
@@ -166,6 +171,8 @@ struct imx335_mode {
 	u32 vblank_max;
 	u64 pclk;
 	struct imx335_reg_list reg_list;
+	struct imx335_reg_list vflip_normal;
+	struct imx335_reg_list vflip_inverted;
 };
 
 /**
@@ -183,6 +190,7 @@ struct imx335_mode {
  * @pclk_ctrl: Pointer to pixel clock control
  * @hblank_ctrl: Pointer to horizontal blanking control
  * @vblank_ctrl: Pointer to vertical blanking control
+ * @vflip: Pointer to vertical flip control
  * @exp_ctrl: Pointer to exposure control
  * @again_ctrl: Pointer to analog gain control
  * @vblank: Vertical blanking in lines
@@ -207,6 +215,7 @@ struct imx335 {
 	struct v4l2_ctrl *pclk_ctrl;
 	struct v4l2_ctrl *hblank_ctrl;
 	struct v4l2_ctrl *vblank_ctrl;
+	struct v4l2_ctrl *vflip;
 	struct {
 		struct v4l2_ctrl *exp_ctrl;
 		struct v4l2_ctrl *again_ctrl;
@@ -259,7 +268,6 @@ static const struct cci_reg_sequence mode_2592x1944_regs[] = {
 	{ IMX335_REG_HTRIMMING_START, 48 },
 	{ IMX335_REG_HNUM, 2592 },
 	{ IMX335_REG_Y_OUT_SIZE, 1944 },
-	{ IMX335_REG_AREA3_ST_ADR_1, 176 },
 	{ IMX335_REG_AREA3_WIDTH_1, 3928 },
 	{ IMX335_REG_OPB_SIZE_V, 0 },
 	{ IMX335_REG_XVS_XHS_DRV, 0x00 },
@@ -333,6 +341,26 @@ static const struct cci_reg_sequence mode_2592x1944_regs[] = {
 	{ CCI_REG8(0x3a00), 0x00 },
 };
 
+static const struct cci_reg_sequence mode_2592x1944_vflip_normal[] = {
+	{ IMX335_REG_AREA3_ST_ADR_1, 176 },
+
+	/* Undocumented V-Flip related registers on Page 55 of datasheet. */
+	{ CCI_REG8(0x3081), 0x02, },
+	{ CCI_REG8(0x3083), 0x02, },
+	{ CCI_REG16_LE(0x30b6), 0x00 },
+	{ CCI_REG16_LE(0x3116), 0x08 },
+};
+
+static const struct cci_reg_sequence mode_2592x1944_vflip_inverted[] = {
+	{ IMX335_REG_AREA3_ST_ADR_1, 4112 },
+
+	/* Undocumented V-Flip related registers on Page 55 of datasheet. */
+	{ CCI_REG8(0x3081), 0xfe, },
+	{ CCI_REG8(0x3083), 0xfe, },
+	{ CCI_REG16_LE(0x30b6), 0x1fa },
+	{ CCI_REG16_LE(0x3116), 0x002 },
+};
+
 static const struct cci_reg_sequence raw10_framefmt_regs[] = {
 	{ IMX335_REG_ADBIT, 0x00 },
 	{ IMX335_REG_MDBIT, 0x00 },
@@ -419,6 +447,14 @@ static const struct imx335_mode supported_mode = {
 		.num_of_regs = ARRAY_SIZE(mode_2592x1944_regs),
 		.regs = mode_2592x1944_regs,
 	},
+	.vflip_normal = {
+		.num_of_regs = ARRAY_SIZE(mode_2592x1944_vflip_normal),
+		.regs = mode_2592x1944_vflip_normal,
+	},
+	.vflip_inverted = {
+		.num_of_regs = ARRAY_SIZE(mode_2592x1944_vflip_inverted),
+		.regs = mode_2592x1944_vflip_inverted,
+	},
 };
 
 /**
@@ -492,6 +528,26 @@ static int imx335_update_exp_gain(struct imx335 *imx335, u32 exposure, u32 gain)
 	return ret;
 }
 
+static int imx335_update_vertical_flip(struct imx335 *imx335, u32 vflip)
+{
+	int ret = 0;
+
+	if (vflip)
+		cci_multi_reg_write(imx335->cci,
+				    imx335->cur_mode->vflip_inverted.regs,
+				    imx335->cur_mode->vflip_inverted.num_of_regs,
+				    &ret);
+	else
+		cci_multi_reg_write(imx335->cci,
+				    imx335->cur_mode->vflip_normal.regs,
+				    imx335->cur_mode->vflip_normal.num_of_regs,
+				    &ret);
+	if (ret)
+		return ret;
+
+	return cci_write(imx335->cci, IMX335_REG_VREVERSE, vflip, NULL);
+}
+
 static int imx335_update_test_pattern(struct imx335 *imx335, u32 pattern_index)
 {
 	int ret = 0;
@@ -593,6 +649,10 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		ret = imx335_update_exp_gain(imx335, exposure, analog_gain);
 
+		break;
+	case V4L2_CID_VFLIP:
+		ret = imx335_update_vertical_flip(imx335, ctrl->val);
+
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = imx335_update_test_pattern(imx335, ctrl->val);
@@ -1175,7 +1235,7 @@ static int imx335_init_controls(struct imx335 *imx335)
 		return ret;
 
 	/* v4l2_fwnode_device_properties can add two more controls */
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
 	if (ret)
 		return ret;
 
@@ -1210,6 +1270,13 @@ static int imx335_init_controls(struct imx335 *imx335)
 
 	v4l2_ctrl_cluster(2, &imx335->exp_ctrl);
 
+	imx335->vflip = v4l2_ctrl_new_std(ctrl_hdlr,
+					  &imx335_ctrl_ops,
+					  V4L2_CID_VFLIP,
+					  0, 1, 1, 0);
+	if (imx335->vflip)
+		imx335->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
 	imx335->vblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
 						&imx335_ctrl_ops,
 						V4L2_CID_VBLANK,

-- 
2.51.0


