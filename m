Return-Path: <linux-media+bounces-45986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBE2C1F09C
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 926B74E706A
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24C233A01D;
	Thu, 30 Oct 2025 08:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WYNGDs0b"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D37339710;
	Thu, 30 Oct 2025 08:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813804; cv=none; b=bLJMK/RARqQPNPsi7yCo6UDsgih8Fc1q48XwLVtnr9e8HloGv/PGk+NYRpeulhe3+MyxT1Fk8ycwvxkJog6hn/sB5BGZ4CO0zCo1ep98iCuBTEV4NMSPMcEqZ56YU89yWps8WOqvusSXta4VJoSu3Ih+ebh/3S488XeeImk201s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813804; c=relaxed/simple;
	bh=sd1KQ1+sgWDWcV767PO/vpaB3KRD7rWOEUgDjKTJ1e8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p3D4YugrjdXpYPSik+z+hhEKTHHCRLPM/XLPsxIqK5U47UDCCraxrc837qnrikP+2RBbCP1Eb3Q6XBq6N2HVmERo+v1fRy7uZWgTBIZjN7Ptzs7Ij8zrnBgOBUYL1txOY7n9P02r97rLYZwO30SBgvutCf97CRHcT9AW2sW2xtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WYNGDs0b; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B014EAE;
	Thu, 30 Oct 2025 09:41:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761813691;
	bh=sd1KQ1+sgWDWcV767PO/vpaB3KRD7rWOEUgDjKTJ1e8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WYNGDs0bNghI8nWLNrLhcR6ubWJdGBgHJHxD52NC0c4te/RDVa/y+4HlaUElGLm9d
	 Qfn9Ywnj0g2/sLstRurBr4/l4exrPQk2Cd6jBAZxIPhAd8KF3G2aH2/KlC0KZHTCDh
	 wCSmblfCg2ny96VGqCYCIb4vzvfYNP5g4/nT7FTU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Umang Jain <uajain@igalia.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v4 2/8] media: imx335: Support vertical flip
Date: Thu, 30 Oct 2025 14:12:55 +0530
Message-ID: <20251030-imx335_binning-v4-2-534f82415aa7@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
References: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

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
 drivers/media/i2c/imx335.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 213cfb7276611f522db0643186f25a8fef3c39db..770adc3106321769823f757d0d3277d1948a6bc2 100644
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
@@ -492,6 +528,19 @@ static int imx335_update_exp_gain(struct imx335 *imx335, u32 exposure, u32 gain)
 	return ret;
 }
 
+static int imx335_update_vertical_flip(struct imx335 *imx335, u32 vflip)
+{
+	const struct imx335_reg_list * const vflip_regs =
+		vflip ? &imx335->cur_mode->vflip_inverted :
+			&imx335->cur_mode->vflip_normal;
+	int ret = 0;
+
+	cci_multi_reg_write(imx335->cci, vflip_regs->regs,
+			    vflip_regs->num_of_regs, &ret);
+
+	return cci_write(imx335->cci, IMX335_REG_VREVERSE, vflip, &ret);
+}
+
 static int imx335_update_test_pattern(struct imx335 *imx335, u32 pattern_index)
 {
 	int ret = 0;
@@ -593,6 +642,10 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		ret = imx335_update_exp_gain(imx335, exposure, analog_gain);
 
+		break;
+	case V4L2_CID_VFLIP:
+		ret = imx335_update_vertical_flip(imx335, ctrl->val);
+
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = imx335_update_test_pattern(imx335, ctrl->val);
@@ -1175,7 +1228,7 @@ static int imx335_init_controls(struct imx335 *imx335)
 		return ret;
 
 	/* v4l2_fwnode_device_properties can add two more controls */
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
 	if (ret)
 		return ret;
 
@@ -1210,6 +1263,13 @@ static int imx335_init_controls(struct imx335 *imx335)
 
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

