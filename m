Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79D5A7DE1A2
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 14:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343889AbjKANON (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 09:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343771AbjKANOM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 09:14:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817BFF7;
        Wed,  1 Nov 2023 06:14:06 -0700 (PDT)
Received: from Monstersaurus.local (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F1AF8E1;
        Wed,  1 Nov 2023 14:13:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698844423;
        bh=qWTucJxCHRuWa+6BbfKBcBj1vMLwMG0gc1X5MvGAkQc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jEIA471t2cZUrlUs87x7Nq1GFjrx6AEsSHaPW1ddF+BgcWbmSGMCGtt3gjzwCvBtF
         yFciqRNI1VHXJA8BfoXQyQtK0L27PaJdQ2w2NJnaO5aX9/q0dN7fTUNefEriifOkZ/
         YPl0qkrdzB8tbVn7tpvSHqzm7vn0ssmFVA3ZgvO8=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/6] media: i2c: imx335: Fix logging line endings
Date:   Wed,  1 Nov 2023 13:13:50 +0000
Message-Id: <20231101131354.2333498-3-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101131354.2333498-1-kieran.bingham@ideasonboard.com>
References: <20231101131354.2333498-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The use of \n as a line ending throughout the driver is inconsistent.

While it is possible for logging messages to automatically have newlines
added by the kernel printk mechanisms, this is specifically to support
continued lines with PR_CONT and the lack of a new line character
indicates that the text is a fragment of a continuation line.

As each of these lines are whole and not fragments, explicitly define the
newline for consistency.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 42 +++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index ec729126274b..cbabef968e21 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -396,7 +396,7 @@ static int imx335_update_exp_gain(struct imx335 *imx335, u32 exposure, u32 gain)
 	lpfr = imx335->vblank + imx335->cur_mode->height;
 	shutter = lpfr - exposure;
 
-	dev_dbg(imx335->dev, "Set exp %u, analog gain %u, shutter %u, lpfr %u",
+	dev_dbg(imx335->dev, "Set exp %u, analog gain %u, shutter %u, lpfr %u\n",
 		exposure, gain, shutter, lpfr);
 
 	ret = imx335_write_reg(imx335, IMX335_REG_HOLD, 1, 1);
@@ -443,7 +443,7 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		imx335->vblank = imx335->vblank_ctrl->val;
 
-		dev_dbg(imx335->dev, "Received vblank %u, new lpfr %u",
+		dev_dbg(imx335->dev, "Received vblank %u, new lpfr %u\n",
 			imx335->vblank,
 			imx335->vblank + imx335->cur_mode->height);
 
@@ -462,7 +462,7 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
 		exposure = ctrl->val;
 		analog_gain = imx335->again_ctrl->val;
 
-		dev_dbg(imx335->dev, "Received exp %u, analog gain %u",
+		dev_dbg(imx335->dev, "Received exp %u, analog gain %u\n",
 			exposure, analog_gain);
 
 		ret = imx335_update_exp_gain(imx335, exposure, analog_gain);
@@ -471,7 +471,7 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		break;
 	default:
-		dev_err(imx335->dev, "Invalid control %d", ctrl->id);
+		dev_err(imx335->dev, "Invalid control %d\n", ctrl->id);
 		ret = -EINVAL;
 	}
 
@@ -652,14 +652,14 @@ static int imx335_start_streaming(struct imx335 *imx335)
 	ret = imx335_write_regs(imx335, reg_list->regs,
 				reg_list->num_of_regs);
 	if (ret) {
-		dev_err(imx335->dev, "fail to write initial registers");
+		dev_err(imx335->dev, "fail to write initial registers\n");
 		return ret;
 	}
 
 	/* Setup handler will write actual exposure and gain */
 	ret =  __v4l2_ctrl_handler_setup(imx335->sd.ctrl_handler);
 	if (ret) {
-		dev_err(imx335->dev, "fail to setup handler");
+		dev_err(imx335->dev, "fail to setup handler\n");
 		return ret;
 	}
 
@@ -667,7 +667,7 @@ static int imx335_start_streaming(struct imx335 *imx335)
 	ret = imx335_write_reg(imx335, IMX335_REG_MODE_SELECT,
 			       1, IMX335_MODE_STREAMING);
 	if (ret) {
-		dev_err(imx335->dev, "fail to start streaming");
+		dev_err(imx335->dev, "fail to start streaming\n");
 		return ret;
 	}
 
@@ -744,7 +744,7 @@ static int imx335_detect(struct imx335 *imx335)
 		return ret;
 
 	if (val != IMX335_ID) {
-		dev_err(imx335->dev, "chip id mismatch: %x!=%x",
+		dev_err(imx335->dev, "chip id mismatch: %x!=%x\n",
 			IMX335_ID, val);
 		return -ENXIO;
 	}
@@ -776,7 +776,7 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 	imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(imx335->reset_gpio)) {
-		dev_err(imx335->dev, "failed to get reset gpio %ld",
+		dev_err(imx335->dev, "failed to get reset gpio %ld\n",
 			PTR_ERR(imx335->reset_gpio));
 		return PTR_ERR(imx335->reset_gpio);
 	}
@@ -784,13 +784,13 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 	/* Get sensor input clock */
 	imx335->inclk = devm_clk_get(imx335->dev, NULL);
 	if (IS_ERR(imx335->inclk)) {
-		dev_err(imx335->dev, "could not get inclk");
+		dev_err(imx335->dev, "could not get inclk\n");
 		return PTR_ERR(imx335->inclk);
 	}
 
 	rate = clk_get_rate(imx335->inclk);
 	if (rate != IMX335_INCLK_RATE) {
-		dev_err(imx335->dev, "inclk frequency mismatch");
+		dev_err(imx335->dev, "inclk frequency mismatch\n");
 		return -EINVAL;
 	}
 
@@ -805,14 +805,14 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX335_NUM_DATA_LANES) {
 		dev_err(imx335->dev,
-			"number of CSI2 data lanes %d is not supported",
+			"number of CSI2 data lanes %d is not supported\n",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
 		ret = -EINVAL;
 		goto done_endpoint_free;
 	}
 
 	if (!bus_cfg.nr_of_link_frequencies) {
-		dev_err(imx335->dev, "no link frequencies defined");
+		dev_err(imx335->dev, "no link frequencies defined\n");
 		ret = -EINVAL;
 		goto done_endpoint_free;
 	}
@@ -863,7 +863,7 @@ static int imx335_power_on(struct device *dev)
 
 	ret = clk_prepare_enable(imx335->inclk);
 	if (ret) {
-		dev_err(imx335->dev, "fail to enable inclk");
+		dev_err(imx335->dev, "fail to enable inclk\n");
 		goto error_reset;
 	}
 
@@ -969,7 +969,7 @@ static int imx335_init_controls(struct imx335 *imx335)
 		imx335->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	if (ctrl_hdlr->error) {
-		dev_err(imx335->dev, "control init failed: %d",
+		dev_err(imx335->dev, "control init failed: %d\n",
 			ctrl_hdlr->error);
 		v4l2_ctrl_handler_free(ctrl_hdlr);
 		return ctrl_hdlr->error;
@@ -1002,7 +1002,7 @@ static int imx335_probe(struct i2c_client *client)
 
 	ret = imx335_parse_hw_config(imx335);
 	if (ret) {
-		dev_err(imx335->dev, "HW configuration is not supported");
+		dev_err(imx335->dev, "HW configuration is not supported\n");
 		return ret;
 	}
 
@@ -1010,14 +1010,14 @@ static int imx335_probe(struct i2c_client *client)
 
 	ret = imx335_power_on(imx335->dev);
 	if (ret) {
-		dev_err(imx335->dev, "failed to power-on the sensor");
+		dev_err(imx335->dev, "failed to power-on the sensor\n");
 		goto error_mutex_destroy;
 	}
 
 	/* Check module identity */
 	ret = imx335_detect(imx335);
 	if (ret) {
-		dev_err(imx335->dev, "failed to find sensor: %d", ret);
+		dev_err(imx335->dev, "failed to find sensor: %d\n", ret);
 		goto error_power_off;
 	}
 
@@ -1027,7 +1027,7 @@ static int imx335_probe(struct i2c_client *client)
 
 	ret = imx335_init_controls(imx335);
 	if (ret) {
-		dev_err(imx335->dev, "failed to init controls: %d", ret);
+		dev_err(imx335->dev, "failed to init controls: %d\n", ret);
 		goto error_power_off;
 	}
 
@@ -1039,14 +1039,14 @@ static int imx335_probe(struct i2c_client *client)
 	imx335->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&imx335->sd.entity, 1, &imx335->pad);
 	if (ret) {
-		dev_err(imx335->dev, "failed to init entity pads: %d", ret);
+		dev_err(imx335->dev, "failed to init entity pads: %d\n", ret);
 		goto error_handler_free;
 	}
 
 	ret = v4l2_async_register_subdev_sensor(&imx335->sd);
 	if (ret < 0) {
 		dev_err(imx335->dev,
-			"failed to register async subdev: %d", ret);
+			"failed to register async subdev: %d\n", ret);
 		goto error_media_entity;
 	}
 
-- 
2.34.1

