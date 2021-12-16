Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981A2477FE6
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 23:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241611AbhLPWJ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 17:09:58 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45468 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241421AbhLPWJ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 17:09:58 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D37CD1265;
        Thu, 16 Dec 2021 23:09:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639692596;
        bh=gJz8U5632ZU+fVSVsuBaOCiBZgyAUM/FAmhXYY3/A18=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oDJeRPp0ktHdhf+TsEJ4thcejt3r+4wT6+p28ZYGaUxD6YQsNVHxS9PY7/lECN+tT
         ddztm+Jy2RYyIgoi5a13OYR9hYU00RQtH/JQiXebYG2wHdEIYP1f4ehYyLaPhuOfBV
         GD28JH+fMBnp4m4LIyJbNpaKJ6y7j0dkvQdXmxzI=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 3/3] media: i2c: max9286: Support manual framesync operation
Date:   Fri, 17 Dec 2021 00:09:46 +0200
Message-Id: <20211216220946.20771-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216220946.20771-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20211216220946.20771-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The MAX9286 can generate a framesync signal to synchronize the cameras,
using an internal timer. Support this mode of operation and configure it
through the .s_frameinterval() operation. If the frame interval is not
0, framesync is switched to manual mode with the specified interval,
otherwise automatic mode is used.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 66 +++++++++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index fa2f6a823fe6..dce1146635d2 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -174,6 +174,7 @@ struct max9286_priv {
 	struct v4l2_ctrl *pixelrate;
 
 	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
+	struct v4l2_fract interval;
 
 	/* Protects controls and fmt structures */
 	struct mutex mutex;
@@ -474,6 +475,37 @@ static int max9286_check_config_link(struct max9286_priv *priv,
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
+	 * number of PCLK periods, which runs at 75MHz.
+	 */
+	fsync = div_u64(75000000ULL * priv->interval.numerator,
+			priv->interval.denominator);
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
@@ -656,6 +688,8 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (enable) {
+		max9286_set_fsync_period(priv);
+
 		/*
 		 * The frame sync between cameras is transmitted across the
 		 * reverse channel as GPIO. We must open all channels while
@@ -715,6 +749,32 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	return 0;
 }
 
+static int max9286_g_frame_interval(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_frame_interval *interval)
+{
+	struct max9286_priv *priv = sd_to_max9286(sd);
+
+	if (interval->pad == MAX9286_SRC_PAD)
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
+	if (interval->pad == MAX9286_SRC_PAD)
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
@@ -806,6 +866,8 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_video_ops max9286_video_ops = {
 	.s_stream	= max9286_s_stream,
+	.g_frame_interval = max9286_g_frame_interval,
+	.s_frame_interval = max9286_s_frame_interval,
 };
 
 static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
@@ -998,9 +1060,7 @@ static int max9286_setup(struct max9286_priv *priv)
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

