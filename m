Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B3E430B7C
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 20:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344343AbhJQS0j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 14:26:39 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:44199 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344139AbhJQS0i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 14:26:38 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8AAC4200005;
        Sun, 17 Oct 2021 18:24:26 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 10/13] media: rcar-csi2: Move format to subdev state
Date:   Sun, 17 Oct 2021 20:24:46 +0200
Message-Id: <20211017182449.64192-11-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
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
 drivers/media/platform/rcar-vin/rcar-csi2.c | 50 ++++++++++++---------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 451a6da26e03..b60845b1e563 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -722,34 +722,42 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *format)
 {
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+	int ret = 0;
 
 	if (!rcsi2_code_to_fmt(format->format.code))
 		format->format.code = rcar_csi2_formats[0].code;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		priv->mf = format->format;
-	} else {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
-		*framefmt = format->format;
-	}
+	/*
+	 * Format is propagated from sink streams to source streams, so
+	 * disallow setting format on the source pads.
+	 */
+	if (format->pad > RCAR_CSI2_SINK)
+		return -EINVAL;
 
-	return 0;
-}
+	state = v4l2_subdev_validate_and_lock_state(sd, sd_state);
+	fmt = v4l2_state_get_stream_format(state, format->pad,
+					   format->stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+	*fmt = format->format;
 
-static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *sd_state,
-				struct v4l2_subdev_format *format)
-{
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	/* Propagate format to the other end of the route. */
+	fmt = v4l2_state_get_opposite_stream_format(state, format->pad,
+						    format->stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+	*fmt = format->format;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		format->format = priv->mf;
-	else
-		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
+out:
+	v4l2_subdev_unlock_state(state);
 
-	return 0;
+	return ret;
 }
 
 static int _rcsi2_set_routing(struct v4l2_subdev *sd,
@@ -829,7 +837,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
 static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.init_cfg = rcsi2_init_cfg,
 	.set_fmt = rcsi2_set_pad_format,
-	.get_fmt = rcsi2_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_routing = rcsi2_set_routing,
 };
 
-- 
2.33.0

