Return-Path: <linux-media+bounces-42258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C37AB52B53
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F1E5580873
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951032DFF18;
	Thu, 11 Sep 2025 08:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JjaTZJR1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C32E2DF13A;
	Thu, 11 Sep 2025 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757578508; cv=none; b=W/ijnRdeo82dHj4owNBQSysaS6ksfnQo86BEDIXqHEN2hkpQwXfnweH/7ontQKJbL5VeYBVfaXzjo0sRhvGqWLfzsQ9qpctVAnS69uLqb6cVpqADrUu9cnOPX74xJc6N3t93944+elzb+99sDpDGqmGe9KH50BlLn3WSg7Elvjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757578508; c=relaxed/simple;
	bh=vIMdOR/aTmSbXFty+Gnb3QGoox1gNusEysAjzBF+Bj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fJO8X61uMrZFv/JXKmzg6K2+dF/KMLsNUodX94cmjx9cKbaw0NYcWuivUgEyNKJjTHJk+DYEvWAdubR8hHGxV3ITJyTx3IeX/p+UQBr4enR9GY7fSqhOXS7SBfTvPBk88fSr86j05el4TjtSZAsk+S3/jOhXOoX9SBvvvnCzBzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JjaTZJR1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:c9e9:75f9:f434:33cd:e4fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F154F4A4;
	Thu, 11 Sep 2025 10:13:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757578430;
	bh=vIMdOR/aTmSbXFty+Gnb3QGoox1gNusEysAjzBF+Bj8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JjaTZJR150MAQT7zw4ql6oKsIfRxuYczfx8DRYfLseOL1FWM3o3NO9EQ+JLDBkIXF
	 FUPZ85Oxh29jUa5rYtcwYpM/Y+O0dVhwsiA/zW6rBFx21Brkja/wbfXzlhKJ+jQxpG
	 ufv0dYF2OOuPs6FTzwCPTTplmWtgy+6cvz7w5ueI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 11 Sep 2025 13:44:18 +0530
Subject: [PATCH v2 2/8] media: imx335: Support vertical flip
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-imx335_binning-v2-2-30a28df74df6@ideasonboard.com>
References: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
In-Reply-To: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5962;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=liLNKWlzDyJ/CykjOqCqXzd/MzDVMhJvSzuAgSgGt+Q=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBowoTtX3RqopXRIvE1ToDe3QkUdp4OOP3r60Rdk
 KHBTCNClA6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMKE7QAKCRBD3pH5JJpx
 RUJaD/4tWcTFzyyocHeGwnOPs+l2Vl0w3AVo7zCU3grHmFE7KL+jMtL65057IeaxlFNBxNHgQCc
 MO9Bf8rrfxrU24HiLoGHMoHa8NQGpNekH9aOT+57v0JEfFOo2P+mVLyxVvEAVfQK4yLvJElex4h
 M49eYtMhIbpPLuUHeU7oOLgdsjxdoe8mDCcmkMXeXmKf+oEtq+w3BC6SUuoV6qIRx5akyHJA3RC
 CT7mEgVi1GBgjKUiuArFZj3CUjJnAbzq8i00eK2sFQ3fDY5jGx0gAu4CQjLxKpDmAr6pG1iTWy2
 VAAlNHoIrASeLO7Pznb0q+g6/wBRvdnQ7MO/pozs4DUl2PCjn7XjWA9WtZ5fvLdEW9r6jFAVtIh
 gvC57/IzfozdRoYbhM9bUokq8Q3Fa4iVj1qaHfg/NT7C0YaZlSYMW5YLRdgoQR1/nCdS4wUvxgv
 pqLb1K69xPZ4LSU7PrS5xX0eRrbdgUM2wjbwiyhpd+VKD5INTc/keDKTi8e7h8K9sCqOwQachcb
 9raNHJW6JrR2nCk2d1PMwq/8RZ4+KVLqM09QEXVTsZvDEt41U4/xHh/RRzdSbpJGwriWir/52kV
 Ukalgpb8Ohl643ZZfWJZMwvv8+mkcGTArUQgFrpMGmgkw8awrHJkJ2JhN37L+SqrT4ULvr/A8M4
 HHi4jLQirlRWnDw==
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


