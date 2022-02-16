Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 477D74B92E6
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 22:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234266AbiBPVEi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 16:04:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233940AbiBPVEM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 16:04:12 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931C22AFEA6;
        Wed, 16 Feb 2022 13:03:59 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id EB6601BF209;
        Wed, 16 Feb 2022 21:03:56 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 09/10] media: rcar-csi2: Implement set_routing
Date:   Wed, 16 Feb 2022 22:04:46 +0100
Message-Id: <20220216210447.481006-10-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220216210447.481006-1-jacopo+renesas@jmondi.org>
References: <20220216210447.481006-1-jacopo+renesas@jmondi.org>
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

Add the set_routing() subdev operation to allow userspace to activate
routes on the R-Car CSI-2 receiver.

Routing for this device is fixed. Validate that the provided route
respects it.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 64 ++++++++++++++++++---
 1 file changed, 55 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 793a4d6e5a27..3ceb7bcfe8d1 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -942,6 +942,59 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int __rcsi2_set_routing(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state,
+			       struct v4l2_subdev_krouting *routing)
+{
+	unsigned int i;
+	int ret = 0;
+
+	ret = v4l2_subdev_routing_validate_1_to_1(routing);
+	if (ret)
+		return ret;
+
+	v4l2_subdev_lock_state(state);
+
+	/*
+	 * Routing is fixed for this device.
+	 *
+	 * Only routes in the form of CSI2:0/x->CSI2:x+1/0 are allowed.
+	 *
+	 * We have anyway to implement set_routing to mark the route as active.
+	 */
+	for (i = 0; i < routing->num_routes; ++i) {
+		const struct v4l2_subdev_route *route = &routing->routes[i];
+		unsigned int vc = route->sink_stream;
+		unsigned int pad = vc + 1;
+
+		if (route->sink_pad != 0) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		if (route->source_pad != pad ||
+		    route->source_stream != 0) {
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
+	ret = v4l2_subdev_set_routing(sd, state, routing);
+
+out:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int rcsi2_set_routing(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     enum v4l2_subdev_format_whence which,
+			     struct v4l2_subdev_krouting *routing)
+{
+	return __rcsi2_set_routing(sd, state, routing);
+}
+
 static int rcsi2_init_cfg(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *state)
 {
@@ -992,15 +1045,7 @@ static int rcsi2_init_cfg(struct v4l2_subdev *sd,
 		.routes = routes,
 	};
 
-	int ret = v4l2_subdev_routing_validate_1_to_1(&routing);
-	if (ret)
-		return ret;
-
-	v4l2_subdev_lock_state(state);
-	ret = v4l2_subdev_set_routing(sd, state, &routing);
-	v4l2_subdev_unlock_state(state);
-
-	return ret;
+	return __rcsi2_set_routing(sd, state, &routing);
 }
 
 static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
@@ -1011,6 +1056,7 @@ static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.init_cfg = rcsi2_init_cfg,
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
+	.set_routing = rcsi2_set_routing,
 };
 
 static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
-- 
2.35.0

