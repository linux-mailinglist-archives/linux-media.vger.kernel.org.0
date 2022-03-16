Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDCE4DB535
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 16:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357345AbiCPPsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 11:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357350AbiCPPsV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 11:48:21 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A799E6D3A5;
        Wed, 16 Mar 2022 08:47:04 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id CBD97240011;
        Wed, 16 Mar 2022 15:47:01 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 05/10] media: adv748x: Implement set_routing
Date:   Wed, 16 Mar 2022 16:46:36 +0100
Message-Id: <20220316154641.511667-6-jacopo+renesas@jmondi.org>
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

Add the set_routing() subdev operation to allow userspace to configure
the CSI-2 virtual channel.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 66 ++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 91cd70739e9d..af1c2469900c 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -314,12 +314,78 @@ static int adv748x_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	return ret;
 }
 
+static int adv748x_csi2_routing_validate(struct adv748x_csi2 *tx,
+					 struct v4l2_subdev_krouting *routing)
+{
+	struct v4l2_subdev_route *route;
+
+	if (routing->num_routes != 1) {
+		dev_err(tx->state->dev, "Unsupported number of routes %u",
+			routing->num_routes);
+		return -EINVAL;
+	}
+
+	route = &routing->routes[0];
+
+	if (route->sink_pad != ADV748X_CSI2_SINK ||
+	    route->source_pad != ADV748X_CSI2_SOURCE) {
+		dev_err(tx->state->dev,
+			"Routes should go from the sink to the source pads.\n");
+		return -EINVAL;
+	}
+
+	if (route->source_stream > 4) {
+		dev_err(tx->state->dev, "Unsupported source stream %u\n",
+			route->source_stream);
+		return -EINVAL;
+	}
+
+	if (route->sink_stream != 0) {
+		dev_err(tx->state->dev, "Unsupported sink stream %u\n",
+			route->sink_stream);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int adv748x_csi2_set_vc_with_routing(struct adv748x_csi2 *tx,
+					    struct v4l2_subdev_krouting *routing)
+{
+	struct v4l2_subdev_route *route = &routing->routes[0];
+
+	return adv748x_csi2_set_virtual_channel(tx, route->source_stream);
+}
+
+static int adv748x_csi2_set_routing(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    enum v4l2_subdev_format_whence which,
+				    struct v4l2_subdev_krouting *routing)
+{
+	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
+	int ret;
+
+	ret = adv748x_csi2_routing_validate(tx, routing);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing(sd, state, routing);
+	if (ret)
+		return ret;
+
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	return adv748x_csi2_set_vc_with_routing(tx, routing);
+}
+
 static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
 	.init_cfg = adv748x_csi2_init_cfg,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = adv748x_csi2_set_format,
 	.get_mbus_config = adv748x_csi2_get_mbus_config,
 	.get_frame_desc = adv748x_csi2_get_frame_desc,
+	.set_routing = adv748x_csi2_set_routing,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.35.1

