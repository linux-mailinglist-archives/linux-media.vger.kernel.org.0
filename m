Return-Path: <linux-media+bounces-17198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8234996579A
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A75111C22FE4
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 06:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497F415444F;
	Fri, 30 Aug 2024 06:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D/FEWTyQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C2A1531D8;
	Fri, 30 Aug 2024 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724999216; cv=none; b=Enk7LuvSOVp+R5tbEBC6gh8UONiLzOKwhGi7DVW7ptlSzQGLlSlZnz/+Fn1g53rtqRchZ3oO3zZAKsG02scuf2TbNK3DKInMt6AssZY++NfO6UzHXEY+bHW6hamE48yb1MmNbPkrAD84Lu9soVris22gA+7RZ1O6YietbiMNZ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724999216; c=relaxed/simple;
	bh=KrmCeTP12r9wV4YfM9G7UEEksIRa/MhfrsGri4+ztg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cV1XIye3P+pqsid4zFC268b4QYbKv7El7GY8dwt8GuSh7ViNa0/hxWe0ZXxw1bVTKTpYEEI9fFFf6RogdNurA/mp74th00wkQZBsLc4MjBaYF5y6d6PzBYdLcNgy4VGr9I66SnRY0avLp8VCUc4v4mGg6sAumS9ivmvSNdSj6ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D/FEWTyQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEF14844;
	Fri, 30 Aug 2024 08:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724999144;
	bh=KrmCeTP12r9wV4YfM9G7UEEksIRa/MhfrsGri4+ztg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D/FEWTyQZg30Z79QQcUJLhgb0iHLyaGtVP6FLVqAjJT3Uw9ihrlBljja6o2dAk1Aj
	 GY+cBd3LBTU4EWPP9kJhXS99NAfkR6CkRFfujKKeWOMunTiZ75ai/ei3Kw4I757ne0
	 TLjI4deGw+ofCIqHoJBs1VJSB9t96nXyDIOi3LRE=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [PATCH v2 2/2] media: imx335: Support vertical flip
Date: Fri, 30 Aug 2024 11:56:39 +0530
Message-ID: <20240830062639.72947-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240830062639.72947-1-umang.jain@ideasonboard.com>
References: <20240830062639.72947-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 drivers/media/i2c/imx335.c | 71 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 5a4519957f9d..79b6d60bf6af 100644
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
@@ -584,6 +640,10 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		ret = imx335_update_exp_gain(imx335, exposure, analog_gain);
 
+		break;
+	case V4L2_CID_VFLIP:
+		ret = imx335_update_vertical_flip(imx335, ctrl->val);
+
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = imx335_update_test_pattern(imx335, ctrl->val);
@@ -1166,7 +1226,7 @@ static int imx335_init_controls(struct imx335 *imx335)
 		return ret;
 
 	/* v4l2_fwnode_device_properties can add two more controls */
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
 	if (ret)
 		return ret;
 
@@ -1201,6 +1261,13 @@ static int imx335_init_controls(struct imx335 *imx335)
 
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
2.45.0


