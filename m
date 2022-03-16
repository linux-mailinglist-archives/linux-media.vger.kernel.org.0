Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5F24DB52E
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 16:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357337AbiCPPsP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 11:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357329AbiCPPsO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 11:48:14 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30176D383;
        Wed, 16 Mar 2022 08:46:59 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2878C240012;
        Wed, 16 Mar 2022 15:46:56 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 02/10] media: adv748x: Add support for v4l2_subdev_state
Date:   Wed, 16 Mar 2022 16:46:33 +0100
Message-Id: <20220316154641.511667-3-jacopo+renesas@jmondi.org>
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

Create and initialize the v4l2_subdev_state for the adv748x CSI-2
subdevice in order to prepare to support routing of the video stream.

Create the subdevice state with v4l2_subdev_init_finalize() and
implement the init_cfg() operation to guarantee the state is initialized
correctly with the default routing set.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 52 +++++++++++++++++++++++-
 drivers/media/i2c/adv748x/adv748x.h      |  3 ++
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 8c2701e1da0e..9e0957501d70 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -139,6 +139,45 @@ static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
  * But we must support setting the pad formats for format propagation.
  */
 
+static int adv748x_csi2_init_cfg(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state)
+{
+	/* One route for each virtual channel. Route 0 enabled by default. */
+	struct v4l2_subdev_route routes[ADV748X_CSI2_STREAMS] = {
+		{
+			.sink_pad = ADV748X_CSI2_SINK,
+			.sink_stream = 0,
+			.source_pad = ADV748X_CSI2_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+		{
+			.sink_pad = ADV748X_CSI2_SINK,
+			.sink_stream = 0,
+			.source_pad = ADV748X_CSI2_SOURCE,
+			.source_stream = 1,
+		},
+		{
+			.sink_pad = ADV748X_CSI2_SINK,
+			.sink_stream = 0,
+			.source_pad = ADV748X_CSI2_SOURCE,
+			.source_stream = 2,
+		},
+		{
+			.sink_pad = ADV748X_CSI2_SINK,
+			.sink_stream = 0,
+			.source_pad = ADV748X_CSI2_SOURCE,
+			.source_stream = 3,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ADV748X_CSI2_STREAMS,
+		.routes = routes,
+	};
+
+	return v4l2_subdev_set_routing(sd, state, &routing);
+}
+
 static struct v4l2_mbus_framefmt *
 adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state,
@@ -228,6 +267,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
 }
 
 static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
+	.init_cfg = adv748x_csi2_init_cfg,
 	.get_fmt = adv748x_csi2_get_format,
 	.set_fmt = adv748x_csi2_set_format,
 	.get_mbus_config = adv748x_csi2_get_mbus_config,
@@ -297,7 +337,8 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 		return 0;
 
 	adv748x_subdev_init(&tx->sd, state, &adv748x_csi2_ops,
-			    MEDIA_ENT_F_VID_IF_BRIDGE, 0,
+			    MEDIA_ENT_F_VID_IF_BRIDGE,
+			    V4L2_SUBDEV_FL_MULTIPLEXED,
 			    is_txa(tx) ? "txa" : "txb");
 
 	/* Ensure that matching is based upon the endpoint fwnodes */
@@ -314,10 +355,14 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 	if (ret)
 		return ret;
 
-	ret = adv748x_csi2_init_controls(tx);
+	ret = v4l2_subdev_init_finalize(&tx->sd);
 	if (ret)
 		goto err_free_media;
 
+	ret = adv748x_csi2_init_controls(tx);
+	if (ret)
+		goto err_free_state;
+
 	ret = v4l2_async_register_subdev(&tx->sd);
 	if (ret)
 		goto err_free_ctrl;
@@ -326,6 +371,8 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 
 err_free_ctrl:
 	v4l2_ctrl_handler_free(&tx->ctrl_hdl);
+err_free_state:
+	v4l2_subdev_cleanup(&tx->sd);
 err_free_media:
 	media_entity_cleanup(&tx->sd.entity);
 
@@ -338,6 +385,7 @@ void adv748x_csi2_cleanup(struct adv748x_csi2 *tx)
 		return;
 
 	v4l2_async_unregister_subdev(&tx->sd);
+	v4l2_subdev_cleanup(&tx->sd);
 	media_entity_cleanup(&tx->sd.entity);
 	v4l2_ctrl_handler_free(&tx->ctrl_hdl);
 }
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 92c8caee6a42..d651c8390e6f 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -73,6 +73,9 @@ enum adv748x_csi2_pads {
 /* CSI2 transmitters can have 2 internal connections, HDMI/AFE */
 #define ADV748X_CSI2_MAX_SUBDEVS 2
 
+/* CSI2 number of streams: 1 for each CSI-2 Virtual channel output. */
+#define ADV748X_CSI2_STREAMS	4
+
 struct adv748x_csi2 {
 	struct adv748x_state *state;
 	struct v4l2_mbus_framefmt format;
-- 
2.35.1

