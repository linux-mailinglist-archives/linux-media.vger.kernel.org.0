Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEEE84B92E7
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 22:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234183AbiBPVEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 16:04:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233855AbiBPVEJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 16:04:09 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657872AFE9F;
        Wed, 16 Feb 2022 13:03:56 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id D37181BF205;
        Wed, 16 Feb 2022 21:03:53 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 07/10] media: rcar-csi2: Move format to subdev state
Date:   Wed, 16 Feb 2022 22:04:44 +0100
Message-Id: <20220216210447.481006-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220216210447.481006-1-jacopo+renesas@jmondi.org>
References: <20220216210447.481006-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move format handling to the v4l2_subdev state and store it per
(pad, stream) combination.

Now that the image format is stored in the subdev state, it can be
accessed through v4l2_subdev_get_fmt() instead of open-coding it.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 58 ++++++++++-----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e8a79a30cc49..a0642cafd70b 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -834,45 +834,45 @@ static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
 
-	mutex_lock(&priv->lock);
+	/*
+	 * Format is propagated from sink streams to source streams, so
+	 * disallow setting format on the source pads.
+	 */
+	if (format->pad > RCAR_CSI2_SINK)
+		return -EINVAL;
 
 	if (!rcsi2_code_to_fmt(format->format.code))
 		format->format.code = rcar_csi2_formats[0].code;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		priv->mf = format->format;
-	} else {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
-		*framefmt = format->format;
-	}
-
-	mutex_unlock(&priv->lock);
-
-	return 0;
-}
-
-static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *sd_state,
-				struct v4l2_subdev_format *format)
-{
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	v4l2_subdev_lock_state(state);
 
-	mutex_lock(&priv->lock);
+	fmt = v4l2_state_get_stream_format(state, format->pad,
+					   format->stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+	*fmt = format->format;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		format->format = priv->mf;
-	else
-		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
+	/* Propagate format to the other end of the route. */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+	*fmt = format->format;
 
-	mutex_unlock(&priv->lock);
+out:
+	v4l2_subdev_unlock_state(state);
 
-	return 0;
+	return ret;
 }
 
 static int rcsi2_init_cfg(struct v4l2_subdev *sd,
@@ -943,7 +943,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
 static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.init_cfg = rcsi2_init_cfg,
 	.set_fmt = rcsi2_set_pad_format,
-	.get_fmt = rcsi2_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 };
 
 static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
-- 
2.35.0

