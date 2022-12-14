Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB0B664D38E
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 00:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbiLNXin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 18:38:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiLNXij (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 18:38:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F2E31EF7;
        Wed, 14 Dec 2022 15:38:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D21D951E;
        Thu, 15 Dec 2022 00:38:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671061117;
        bh=/v9HemQTR7hsPv7MKDTE2msG85CGltEOfd5+eJucKBc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q+BU9mpgijf80Kxj+OK1f+N8oncCvlC7Pe75hbJbobmdNFkAaG73X32Pli8xuBmld
         FAbLU2DIBiHHCA4lfVwDr5cJNj9qYEMrvuBS31qDXV0L3CxYJIjrf3oj+ld8AJqmQ9
         uFQvwg+lMckZcuKnhHm2U9quEL1nssrDbWdLrG+E=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v3 05/12] media: i2c: max9286: Support manual framesync operation
Date:   Thu, 15 Dec 2022 01:38:18 +0200
Message-Id: <20221214233825.13050-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
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

The MAX9286 can generate a framesync signal to synchronize the cameras,
using an internal timer. Support this mode of operation and configure it
through the .s_frameinterval() operation. If the frame interval is not
0, framesync is switched to manual mode with the specified interval,
otherwise automatic mode is used.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
Changes since v1:

- Use pixel rate to calculate frame sync counter
---
 drivers/media/i2c/max9286.c | 84 +++++++++++++++++++++++++++++++++----
 1 file changed, 75 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index d79077939847..cb734a97afea 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -174,9 +174,11 @@ struct max9286_priv {
 	u32 gpio_poc[2];
 
 	struct v4l2_ctrl_handler ctrls;
-	struct v4l2_ctrl *pixelrate;
+	struct v4l2_ctrl *pixelrate_ctrl;
+	unsigned int pixelrate;
 
 	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
+	struct v4l2_fract interval;
 
 	/* Protects controls and fmt structures */
 	struct mutex mutex;
@@ -477,6 +479,40 @@ static int max9286_check_config_link(struct max9286_priv *priv,
 	return 0;
 }
 
+static void max9286_set_fsync_period(struct max9286_priv *priv)
+{
+	u32 fsync;
+
+	if (!priv->interval.numerator || !priv->interval.denominator) {
+		/*
+		 * Special case, a null interval enables automatic FRAMESYNC
+		 * mode. FRAMESYNC is taken from the slowest link.
+		 */
+		max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
+			      MAX9286_FSYNCMETH_AUTO);
+		return;
+	}
+
+	/*
+	 * Manual FRAMESYNC
+	 *
+	 * The FRAMESYNC generator is configured with a period expressed as a
+	 * number of PCLK periods.
+	 */
+	fsync = div_u64((u64)priv->pixelrate * priv->interval.numerator,
+			priv->interval.denominator);
+
+	dev_dbg(&priv->client->dev, "fsync period %u (pclk %u)\n", fsync,
+		priv->pixelrate);
+
+	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_OUT |
+		      MAX9286_FSYNCMETH_MANUAL);
+
+	max9286_write(priv, 0x06, (fsync >> 0) & 0xff);
+	max9286_write(priv, 0x07, (fsync >> 8) & 0xff);
+	max9286_write(priv, 0x08, (fsync >> 16) & 0xff);
+}
+
 /* -----------------------------------------------------------------------------
  * V4L2 Subdev
  */
@@ -515,11 +551,13 @@ static int max9286_set_pixelrate(struct max9286_priv *priv)
 		return -EINVAL;
 	}
 
+	priv->pixelrate = pixelrate;
+
 	/*
 	 * The CSI-2 transmitter pixel rate is the single source rate multiplied
 	 * by the number of available sources.
 	 */
-	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate,
+	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate_ctrl,
 				      pixelrate * priv->nsources);
 }
 
@@ -659,6 +697,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (enable) {
+		max9286_set_fsync_period(priv);
+
 		/*
 		 * The frame sync between cameras is transmitted across the
 		 * reverse channel as GPIO. We must open all channels while
@@ -718,6 +758,32 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	return 0;
 }
 
+static int max9286_g_frame_interval(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_frame_interval *interval)
+{
+	struct max9286_priv *priv = sd_to_max9286(sd);
+
+	if (interval->pad != MAX9286_SRC_PAD)
+		return -EINVAL;
+
+	interval->interval = priv->interval;
+
+	return 0;
+}
+
+static int max9286_s_frame_interval(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_frame_interval *interval)
+{
+	struct max9286_priv *priv = sd_to_max9286(sd);
+
+	if (interval->pad != MAX9286_SRC_PAD)
+		return -EINVAL;
+
+	priv->interval = interval->interval;
+
+	return 0;
+}
+
 static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
@@ -809,6 +875,8 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_video_ops max9286_video_ops = {
 	.s_stream	= max9286_s_stream,
+	.g_frame_interval = max9286_g_frame_interval,
+	.s_frame_interval = max9286_s_frame_interval,
 };
 
 static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
@@ -893,10 +961,10 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	v4l2_ctrl_handler_init(&priv->ctrls, 1);
-	priv->pixelrate = v4l2_ctrl_new_std(&priv->ctrls,
-					    &max9286_ctrl_ops,
-					    V4L2_CID_PIXEL_RATE,
-					    1, INT_MAX, 1, 50000000);
+	priv->pixelrate_ctrl = v4l2_ctrl_new_std(&priv->ctrls,
+						 &max9286_ctrl_ops,
+						 V4L2_CID_PIXEL_RATE,
+						 1, INT_MAX, 1, 50000000);
 
 	priv->sd.ctrl_handler = &priv->ctrls;
 	ret = priv->ctrls.error;
@@ -1006,9 +1074,7 @@ static int max9286_setup(struct max9286_priv *priv)
 		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
 		      MAX9286_DATATYPE_YUV422_8BIT);
 
-	/* Automatic: FRAMESYNC taken from the slowest Link. */
-	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
-		      MAX9286_FSYNCMETH_AUTO);
+	max9286_set_fsync_period(priv);
 
 	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
 	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
-- 
Regards,

Laurent Pinchart

