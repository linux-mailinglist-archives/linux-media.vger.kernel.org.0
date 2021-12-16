Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B776D477AEB
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 18:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240443AbhLPRrW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 12:47:22 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:55579 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240435AbhLPRrV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 12:47:21 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 3B0F9100002;
        Thu, 16 Dec 2021 17:47:17 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 5/6] media: max9286: Move format to subdev state
Date:   Thu, 16 Dec 2021 18:47:45 +0100
Message-Id: <20211216174746.147233-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216174746.147233-1-jacopo+renesas@jmondi.org>
References: <20211216174746.147233-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move format handling to the v4l2_subdev state and store it per
(pad, stream) combination.

Now that the image format is stored in the subdev state, it can be
accessed through v4l2_subdev_get_fmt() instead of open-coding it.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 86 ++++++++++++-------------------------
 1 file changed, 27 insertions(+), 59 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 5d728fa23f01..aa7cb7c10fc0 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -174,8 +174,6 @@ struct max9286_priv {
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixelrate;
 
-	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
-
 	/* Protects controls and fmt structures */
 	struct mutex mutex;
 
@@ -828,28 +826,17 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static struct v4l2_mbus_framefmt *
-max9286_get_pad_format(struct max9286_priv *priv,
-		       struct v4l2_subdev_state *sd_state,
-		       unsigned int pad, u32 which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&priv->sd, sd_state, pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &priv->fmt[pad];
-	default:
-		return NULL;
-	}
-}
-
 static int max9286_set_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_state *state,
 			   struct v4l2_subdev_format *format)
 {
-	struct max9286_priv *priv = sd_to_max9286(sd);
-	struct v4l2_mbus_framefmt *cfg_fmt;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
 
+	/*
+	 * Refuse to set format on the multiplexed source pad.
+	 * Format is propagated from sinks streams to source streams.
+	 */
 	if (format->pad == MAX9286_SRC_PAD)
 		return -EINVAL;
 
@@ -865,44 +852,28 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 		break;
 	}
 
-	cfg_fmt = max9286_get_pad_format(priv, sd_state, format->pad,
-					 format->which);
-	if (!cfg_fmt)
-		return -EINVAL;
-
-	mutex_lock(&priv->mutex);
-	*cfg_fmt = format->format;
-	mutex_unlock(&priv->mutex);
-
-	return 0;
-}
-
-static int max9286_get_fmt(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *sd_state,
-			   struct v4l2_subdev_format *format)
-{
-	struct max9286_priv *priv = sd_to_max9286(sd);
-	struct v4l2_mbus_framefmt *cfg_fmt;
-	unsigned int pad = format->pad;
-
-	/*
-	 * Multiplexed Stream Support: Support link validation by returning the
-	 * format of the first bound link. All links must have the same format,
-	 * as we do not support mixing and matching of cameras connected to the
-	 * max9286.
-	 */
-	if (pad == MAX9286_SRC_PAD)
-		pad = __ffs(priv->bound_sources);
+	v4l2_subdev_lock_state(state);
+	fmt = v4l2_state_get_stream_format(state, format->pad,
+					   format->stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+	*fmt = format->format;
 
-	cfg_fmt = max9286_get_pad_format(priv, sd_state, pad, format->which);
-	if (!cfg_fmt)
-		return -EINVAL;
+	/* Propagate format to the other end of the route. */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+	*fmt = format->format;
 
-	mutex_lock(&priv->mutex);
-	format->format = *cfg_fmt;
-	mutex_unlock(&priv->mutex);
+out:
+	v4l2_subdev_unlock_state(state);
 
-	return 0;
+	return ret;
 }
 
 static int max9286_routing_validate(struct max9286_priv *priv,
@@ -1052,7 +1023,7 @@ static const struct v4l2_subdev_video_ops max9286_video_ops = {
 static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
 	.init_cfg	= max9286_init_cfg,
 	.enum_mbus_code = max9286_enum_mbus_code,
-	.get_fmt	= max9286_get_fmt,
+	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= max9286_set_fmt,
 	.set_routing	= max9286_set_routing,
 };
@@ -1092,9 +1063,6 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 
 	/* Configure V4L2 for the MAX9286 itself */
 
-	for (i = 0; i < MAX9286_N_SINKS; i++)
-		priv->fmt[i] = max9286_default_format;
-
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			  V4L2_SUBDEV_FL_MULTIPLEXED;
-- 
2.33.1

