Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B26A648282A
	for <lists+linux-media@lfdr.de>; Sat,  1 Jan 2022 19:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232657AbiAAS2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jan 2022 13:28:19 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41358 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbiAAS2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jan 2022 13:28:18 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BAF31C05;
        Sat,  1 Jan 2022 19:28:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641061697;
        bh=sOpCj9w9HvlAvFT8NODOVxRC+SFPiWORlRc+hiWvmM0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BK993IaH5gyuXDZk01ZNoiedE4lf5d5M6N+J0zIAM46IGeUKRFisZT9gi9NT6geJO
         wDewub9jesJwxVIvCrqlDgTh+T5vt0H16mlY8bdorBE76U11ql7tan4KOvRtmMEqG0
         R2IZ+WwJbiPyTEprCBz0VMyafz4zM/5qFdFfKm1Y=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v2 05/11] media: i2c: max9286: Support manual framesync operation
Date:   Sat,  1 Jan 2022 20:28:00 +0200
Message-Id: <20220101182806.19311-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX9286 can generate a framesync signal to synchronize the cameras,
using an internal timer. Support this mode of operation and configure it
through the .s_frameinterval() operation. If the frame interval is not
0, framesync is switched to manual mode with the specified interval,
otherwise automatic mode is used.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Use pixel rate to calculate frame sync counter
---
 drivers/media/i2c/max9286.c | 84 +++++++++++++++++++++++++++++++++----
 1 file changed, 75 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 15c80034e3a4..75374034724f 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -170,9 +170,11 @@ struct max9286_priv {
 	u32 rev_chan_mv;
 
 	struct v4l2_ctrl_handler ctrls;
-	struct v4l2_ctrl *pixelrate;
+	struct v4l2_ctrl *pixelrate_ctrl;
+	unsigned int pixelrate;
 
 	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
+	struct v4l2_fract interval;
 
 	/* Protects controls and fmt structures */
 	struct mutex mutex;
@@ -473,6 +475,40 @@ static int max9286_check_config_link(struct max9286_priv *priv,
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
@@ -511,11 +547,13 @@ static int max9286_set_pixelrate(struct max9286_priv *priv)
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
 
@@ -655,6 +693,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (enable) {
+		max9286_set_fsync_period(priv);
+
 		/*
 		 * The frame sync between cameras is transmitted across the
 		 * reverse channel as GPIO. We must open all channels while
@@ -714,6 +754,32 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
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
@@ -805,6 +871,8 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_video_ops max9286_video_ops = {
 	.s_stream	= max9286_s_stream,
+	.g_frame_interval = max9286_g_frame_interval,
+	.s_frame_interval = max9286_s_frame_interval,
 };
 
 static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
@@ -885,10 +953,10 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
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
@@ -997,9 +1065,7 @@ static int max9286_setup(struct max9286_priv *priv)
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

