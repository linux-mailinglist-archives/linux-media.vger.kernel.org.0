Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A21E557C65D
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 10:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbiGUIf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 04:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiGUIf5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 04:35:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08A41180F
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 01:35:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 235AF8D0;
        Thu, 21 Jul 2022 10:35:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658392555;
        bh=xJsDGop13gyf9z073jpTZe4BXJchx/hX8x9CSsIpqKY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ucipxD3qhMRZObZoY0pbLBxkBVIdjN7CUkOdc791FywyDtG3W0udcWSDp9Er5vJrD
         7PaS3w0CG8jFCSwee4eQw3LMlBGTwvy/zpHKvpiRMy0fjUHOpFRlkwxjjjo7wopkt8
         Eb9Hxgq3I/IVOFSHq9qe5IJIiJ8ndywgoLbQWpRY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 09/19] media: i2c: imx290: Simplify error handling when writing registers
Date:   Thu, 21 Jul 2022 11:35:30 +0300
Message-Id: <20220721083540.1525-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Error handling for register writes requires checking the error status of
every single write. This makes the code complex, or incorrect when the
checks are omitted. Simplify this by passing a pointer to an error code
to the imx290_write_reg() function, which allows writing multiple
registers in a row and only checking for errors at the end.

While at it, rename imx290_write_reg() to imx290_write() as there's
nothing else than registers to write, and rename imx290_read_reg()
accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 86 ++++++++++++++------------------------
 1 file changed, 32 insertions(+), 54 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 3f67c4d2417f..5b7f9027b50f 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -367,7 +367,7 @@ static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
 	return container_of(_sd, struct imx290, sd);
 }
 
-static int __always_unused imx290_read_reg(struct imx290 *imx290, u32 addr, u32 *value)
+static int __always_unused imx290_read(struct imx290 *imx290, u32 addr, u32 *value)
 {
 	u8 data[3] = { 0, 0, 0 };
 	int ret;
@@ -385,17 +385,23 @@ static int __always_unused imx290_read_reg(struct imx290 *imx290, u32 addr, u32
 	return 0;
 }
 
-static int imx290_write_reg(struct imx290 *imx290, u32 addr, u32 value)
+static int imx290_write(struct imx290 *imx290, u32 addr, u32 value, int *err)
 {
 	u8 data[3] = { value & 0xff, (value >> 8) & 0xff, value >> 16 };
 	int ret;
 
+	if (err && *err)
+		return *err;
+
 	ret = regmap_raw_write(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
 			       data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(imx290->dev, "%u-bit write to 0x%04x failed: %d\n",
 			 ((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
 			 addr & IMX290_REG_ADDR_MASK, ret);
+		if (err)
+			*err = ret;
+	}
 
 	return ret;
 }
@@ -408,7 +414,7 @@ static int imx290_set_register_array(struct imx290 *imx290,
 	int ret;
 
 	for (i = 0; i < num_settings; ++i, ++settings) {
-		ret = imx290_write_reg(imx290, settings->reg, settings->val);
+		ret = imx290_write(imx290, settings->reg, settings->val, NULL);
 		if (ret < 0)
 			return ret;
 	}
@@ -419,29 +425,16 @@ static int imx290_set_register_array(struct imx290 *imx290,
 	return 0;
 }
 
-static int imx290_set_gain(struct imx290 *imx290, u32 value)
-{
-	int ret;
-
-	ret = imx290_write_reg(imx290, IMX290_GAIN, value);
-	if (ret)
-		dev_err(imx290->dev, "Unable to write gain\n");
-
-	return ret;
-}
-
 /* Stop streaming */
 static int imx290_stop_streaming(struct imx290 *imx290)
 {
-	int ret;
+	int ret = 0;
 
-	ret = imx290_write_reg(imx290, IMX290_STANDBY, 0x01);
-	if (ret < 0)
-		return ret;
+	imx290_write(imx290, IMX290_STANDBY, 0x01, &ret);
 
 	msleep(30);
 
-	return imx290_write_reg(imx290, IMX290_XMSTA, 0x01);
+	return imx290_write(imx290, IMX290_XMSTA, 0x01, &ret);
 }
 
 static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
@@ -456,25 +449,25 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_GAIN:
-		ret = imx290_set_gain(imx290, ctrl->val);
+		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		if (ctrl->val) {
-			imx290_write_reg(imx290, IMX290_BLKLEVEL, 0);
+			imx290_write(imx290, IMX290_BLKLEVEL, 0, &ret);
 			usleep_range(10000, 11000);
-			imx290_write_reg(imx290, IMX290_PGCTRL,
-					 (u8)(IMX290_PGCTRL_REGEN |
-					 IMX290_PGCTRL_THRU |
-					 IMX290_PGCTRL_MODE(ctrl->val)));
+			imx290_write(imx290, IMX290_PGCTRL,
+				     (u8)(IMX290_PGCTRL_REGEN |
+				     IMX290_PGCTRL_THRU |
+				     IMX290_PGCTRL_MODE(ctrl->val)), &ret);
 		} else {
-			imx290_write_reg(imx290, IMX290_PGCTRL, 0x00);
+			imx290_write(imx290, IMX290_PGCTRL, 0x00, &ret);
 			usleep_range(10000, 11000);
 			if (imx290->bpp == 10)
-				imx290_write_reg(imx290, IMX290_BLKLEVEL,
-						 0x3c);
+				imx290_write(imx290, IMX290_BLKLEVEL, 0x3c,
+					     &ret);
 			else /* 12 bits per pixel */
-				imx290_write_reg(imx290, IMX290_BLKLEVEL,
-						 0xf0);
+				imx290_write(imx290, IMX290_BLKLEVEL, 0xf0,
+					     &ret);
 		}
 		break;
 	default:
@@ -695,7 +688,8 @@ static int imx290_start_streaming(struct imx290 *imx290)
 		return ret;
 	}
 
-	ret = imx290_write_reg(imx290, IMX290_HMAX, imx290->current_mode->hmax);
+	ret = imx290_write(imx290, IMX290_HMAX, imx290->current_mode->hmax,
+			   NULL);
 	if (ret)
 		return ret;
 
@@ -706,14 +700,12 @@ static int imx290_start_streaming(struct imx290 *imx290)
 		return ret;
 	}
 
-	ret = imx290_write_reg(imx290, IMX290_STANDBY, 0x00);
-	if (ret < 0)
-		return ret;
+	imx290_write(imx290, IMX290_STANDBY, 0x00, &ret);
 
 	msleep(30);
 
 	/* Start streaming */
-	return imx290_write_reg(imx290, IMX290_XMSTA, 0x00);
+	return imx290_write(imx290, IMX290_XMSTA, 0x00, &ret);
 }
 
 static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
@@ -772,27 +764,13 @@ static int imx290_set_data_lanes(struct imx290 *imx290)
 		 * validated in probe itself
 		 */
 		dev_err(imx290->dev, "Lane configuration not supported\n");
-		ret = -EINVAL;
-		goto exit;
+		return -EINVAL;
 	}
 
-	ret = imx290_write_reg(imx290, IMX290_PHY_LANE_NUM, laneval);
-	if (ret) {
-		dev_err(imx290->dev, "Error setting Physical Lane number register\n");
-		goto exit;
-	}
-
-	ret = imx290_write_reg(imx290, IMX290_CSI_LANE_MODE, laneval);
-	if (ret) {
-		dev_err(imx290->dev, "Error setting CSI Lane mode register\n");
-		goto exit;
-	}
-
-	ret = imx290_write_reg(imx290, IMX290_FR_FDG_SEL, frsel);
-	if (ret)
-		dev_err(imx290->dev, "Error setting FR/FDG SEL register\n");
+	imx290_write(imx290, IMX290_PHY_LANE_NUM, laneval, &ret);
+	imx290_write(imx290, IMX290_CSI_LANE_MODE, laneval, &ret);
+	imx290_write(imx290, IMX290_FR_FDG_SEL, frsel, &ret);
 
-exit:
 	return ret;
 }
 
-- 
Regards,

Laurent Pinchart

