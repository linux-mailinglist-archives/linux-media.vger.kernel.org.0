Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14C464DB53E
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 16:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357344AbiCPPsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 11:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357340AbiCPPsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 11:48:16 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5336D38E;
        Wed, 16 Mar 2022 08:47:01 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A75DE24000D;
        Wed, 16 Mar 2022 15:46:58 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 03/10] media: adv748x: Move format to subdev state
Date:   Wed, 16 Mar 2022 16:46:34 +0100
Message-Id: <20220316154641.511667-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316154641.511667-1-jacopo+renesas@jmondi.org>
References: <20220316154641.511667-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
 drivers/media/i2c/adv748x/adv748x-csi2.c | 77 +++++-------------------
 drivers/media/i2c/adv748x/adv748x.h      |  1 -
 2 files changed, 16 insertions(+), 62 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 9e0957501d70..8326cfe6192a 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -178,78 +178,33 @@ static int adv748x_csi2_init_cfg(struct v4l2_subdev *sd,
 	return v4l2_subdev_set_routing(sd, state, &routing);
 }
 
-static struct v4l2_mbus_framefmt *
-adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *sd_state,
-			    unsigned int pad, u32 which)
-{
-	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
-
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(sd, sd_state, pad);
-
-	return &tx->format;
-}
-
-static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *sd_state,
-				   struct v4l2_subdev_format *sdformat)
-{
-	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
-	struct adv748x_state *state = tx->state;
-	struct v4l2_mbus_framefmt *mbusformat;
-
-	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
-						 sdformat->which);
-	if (!mbusformat)
-		return -EINVAL;
-
-	mutex_lock(&state->mutex);
-
-	sdformat->format = *mbusformat;
-
-	mutex_unlock(&state->mutex);
-
-	return 0;
-}
-
 static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
 {
-	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
-	struct adv748x_state *state = tx->state;
-	struct v4l2_mbus_framefmt *mbusformat;
+	struct v4l2_mbus_framefmt *fmt;
 	int ret = 0;
 
-	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
-						 sdformat->which);
-	if (!mbusformat)
+	/* Do not allow to set format on the multiplexed source pad. */
+	if (sdformat->pad == ADV748X_CSI2_SOURCE)
 		return -EINVAL;
 
-	mutex_lock(&state->mutex);
-
-	if (sdformat->pad == ADV748X_CSI2_SOURCE) {
-		const struct v4l2_mbus_framefmt *sink_fmt;
-
-		sink_fmt = adv748x_csi2_get_pad_format(sd, sd_state,
-						       ADV748X_CSI2_SINK,
-						       sdformat->which);
-
-		if (!sink_fmt) {
-			ret = -EINVAL;
-			goto unlock;
-		}
+	fmt = v4l2_subdev_state_get_stream_format(sd_state, sdformat->pad,
+						  sdformat->stream);
+	if (!fmt)
+		return -EINVAL;
 
-		sdformat->format = *sink_fmt;
-	}
+	*fmt = sdformat->format;
 
-	*mbusformat = sdformat->format;
+	/* Propagate format to the other end of the route. */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
+							   sdformat->stream);
+	if (!fmt)
+		return ret;
 
-unlock:
-	mutex_unlock(&state->mutex);
+	*fmt = sdformat->format;
 
-	return ret;
+	return 0;
 }
 
 static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
@@ -268,7 +223,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
 
 static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
 	.init_cfg = adv748x_csi2_init_cfg,
-	.get_fmt = adv748x_csi2_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = adv748x_csi2_set_format,
 	.get_mbus_config = adv748x_csi2_get_mbus_config,
 };
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index d651c8390e6f..98a3b3e0642a 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -78,7 +78,6 @@ enum adv748x_csi2_pads {
 
 struct adv748x_csi2 {
 	struct adv748x_state *state;
-	struct v4l2_mbus_framefmt format;
 	unsigned int page;
 	unsigned int port;
 	unsigned int num_lanes;
-- 
2.35.1

