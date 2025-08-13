Return-Path: <linux-media+bounces-39742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC925B2428B
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCB8C1647C6
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E732E06EC;
	Wed, 13 Aug 2025 07:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TRaS9ZUI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FA62D46B4;
	Wed, 13 Aug 2025 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069680; cv=none; b=r5kW76WEa2q3oQ04ak8MehEEif27T0UyFIl6MMQdf7kNOk5sLwJ1mfWRRdgSfGSsnABDWZz+l0BGhcGZlWlhUup/oN1hokab4JPfWKdUKi7gZZ+ZbueTVNx69MnGyVbM6Qi3tQHnEuMF5FFIKD+11Sp5zObilFjB8xrMVKKPMjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069680; c=relaxed/simple;
	bh=zgWVoLf44W7zpwzzoRCJmrq/d1DfwbqjVRtQYev9G7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLY7XrAJGCEIogkyNmBU76H1O+ICy+b5O35nKx22SvWmmTlpR+WiGD7QQINy3oXW6pFQWyRCU7TfYCcqzVoubZLaUhPHqWlkLfDBsRP3g5p9yXcZdgn/UAwDLMYTpiHKchIjCElIwJHcxFYl2byE8FHL47ARJ/TUDgLG/XdAD1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TRaS9ZUI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:bd1a:669e:3dcb:5a6b:a905])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E598351;
	Wed, 13 Aug 2025 09:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755069622;
	bh=zgWVoLf44W7zpwzzoRCJmrq/d1DfwbqjVRtQYev9G7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TRaS9ZUI1aaEJoRA9JjPsqC+2QcAdA/Vd7TKMj6++43KlQGcQjw1mJk6GCpFCU1kx
	 mFcrLXIOQuM11IBRj1ApefggAo6fbdZfl9bbrMv18UYRUMDhu++c5i1SATc86+lHAY
	 m/Reb4knTiJdiPcmKj907Da77dSDfxT5qaLrOTIw=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 13 Aug 2025 12:50:33 +0530
Subject: [PATCH 2/6] media: imx335: Support vertical flip
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-imx335_binning-v1-2-a42b687d8541@ideasonboard.com>
References: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com>
In-Reply-To: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5962;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=gnvxXU7y11ZFL8BNfuQYX0YjbopnxjR4gzoKloQMIn8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBonDzWBNCJxH7JAoOQy5gPtS4p1wtcJ4fkwTgWa
 uqc0pZX75KJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaJw81gAKCRBD3pH5JJpx
 RVKKEACEPqXX9eicrI5mlcYlvhrSgL5YsRwuD3SOtO/xyfbU9TM8F/KwoPO3ZIYEPEw8Ya5fREk
 zHQTEBIR9NQ2evSgcH4OE7L4i3jcZ/G/6wSFBeTc4gajxBpQYhkqqAIPqNDM3WdqSvMHI+u5bGT
 1N1DLt6Otv5+6P8tRMc2eQjWrS4kEiPgp/0IniqNoGY3pvxJe0p5XDTQssWIWxXXAvAg7b4Nlng
 VbVU6hRhrFmgKZ2GUrYihU+5ghN4WHI8zTbjpjqsMidFLfdKwntounES7+lWqjeeFsKIAM22IVs
 yVlpqh5u7t5G/rGicY2a6OlarBa8Hyse34d6Iyv5UE48gYVz8zAJG5CgU3I9UzzWD3+TUgvFTNh
 5FoZUT3hUDWweE89VGaQ8MjkVozPYErUov6PyJqrA/eVCf+AwFAe3WDmrVgWKO5TOf7RFc3V8Pn
 +tgl78pu5FTHGPHWDiNwgvkwejDLfmHAPEl/NPqlGCuslVwrWx2bF5cd1/dJs2/TrNrLBqvXVSZ
 fxe18vLWaHZmWgj0jB+wfKhqiLAxk99oAFgPtXPvLhNyuFQ932KxI+7KKpigKU54lnoJdY+Wvyt
 ChPn4QStEme6LEL7Y1ANwVpM2iUnmRc1C0qqGD1rgn88InkVD4cSg/7c/9Ac09JRwNp1wEtOcZB
 dGPZbI2zQo7299Q==
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
index 33f92a3062c14251498cc65f14cc34cff6179f78..6369bdbd2b09ba1f89c143cdf6be061820f2d051 100644
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
@@ -1176,7 +1236,7 @@ static int imx335_init_controls(struct imx335 *imx335)
 		return ret;
 
 	/* v4l2_fwnode_device_properties can add two more controls */
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
 	if (ret)
 		return ret;
 
@@ -1211,6 +1271,13 @@ static int imx335_init_controls(struct imx335 *imx335)
 
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
2.50.1


