Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D57B6A559B
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 10:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjB1JYK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 04:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbjB1JYI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 04:24:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D2F130C4
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 01:24:07 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6ACC76F0;
        Tue, 28 Feb 2023 10:24:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677576244;
        bh=B8DqWNEVdnu9dFGgGgR/xUVwHznfn1rq0+98sDEqv6k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gMPXd4jZ1prRxzxlNynxfrI0eLK4LDaIaeAea63RxVtbf5/sJ27r5c7cEoaelbOz8
         JHp099PEBaM0FHsCafb32PGgck9BJoVuRd6KjoMcjzuK+A6VPyGi7v/B+SdPnZfpY3
         1paiDsuk/JnlKyX25b0Z8Lc+0HOycs8x6tiROTI8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 2/2] media: subdev: Add V4L2_SUBDEV_ROUTING_NO_MULTIPLEXING
Date:   Tue, 28 Feb 2023 11:23:46 +0200
Message-Id: <20230228092346.101105-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228092346.101105-1-tomi.valkeinen@ideasonboard.com>
References: <20230228092346.101105-1-tomi.valkeinen@ideasonboard.com>
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

A common case with subdev routing is that on the subdevice just before
the DMA engines (video nodes), no multiplexing is allowed on the source
pads, as the DMA engine can only handle a single stream.

In some other situations one might also want to do the same check on the
sink side.

Add new routing validation flags to check these:
V4L2_SUBDEV_ROUTING_NO_SINK_MULTIPLEXING and
V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 36 ++++++++++++++++++++++++---
 include/media/v4l2-subdev.h           |  9 +++++++
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index bc3678337048..ae74a48dd2ba 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1664,7 +1664,8 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 	unsigned int i, j;
 	int ret = -EINVAL;
 
-	if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
+	if (disallow & (V4L2_SUBDEV_ROUTING_NO_STREAM_MIX |
+			V4L2_SUBDEV_ROUTING_NO_MULTIPLEXING)) {
 		remote_pads = kcalloc(sd->entity.num_pads, sizeof(*remote_pads),
 				      GFP_KERNEL);
 		if (!remote_pads)
@@ -1705,8 +1706,6 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 					i, "sink");
 				goto out;
 			}
-
-			remote_pads[route->sink_pad] = route->source_pad;
 		}
 
 		/*
@@ -1722,7 +1721,38 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 					i, "source");
 				goto out;
 			}
+		}
+
+		/*
+		 * V4L2_SUBDEV_ROUTING_NO_SINK_MULTIPLEXING: Pads on the sink
+		 * side can not do stream multiplexing, i.e. there can be only
+		 * a single stream in a sink pad.
+		 */
+		if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_MULTIPLEXING) {
+			if (remote_pads[route->sink_pad] != U32_MAX) {
+				dev_dbg(sd->dev,
+					"route %u attempts to multiplex on %s pad %u\n",
+					i, "sink", route->sink_pad);
+				goto out;
+			}
+		}
 
+		/*
+		 * V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING: Pads on the
+		 * source side can not do stream multiplexing, i.e. there can
+		 * be only a single stream in a source pad.
+		 */
+		if (disallow & V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING) {
+			if (remote_pads[route->source_pad] != U32_MAX) {
+				dev_dbg(sd->dev,
+					"route %u attempts to multiplex on %s pad %u\n",
+					i, "source", route->source_pad);
+				goto out;
+			}
+		}
+
+		if (remote_pads) {
+			remote_pads[route->sink_pad] = route->source_pad;
 			remote_pads[route->source_pad] = route->sink_pad;
 		}
 
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a4331e0a5aeb..4a8d45e2c804 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1649,6 +1649,10 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
  * @V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX:
  *	streams on the same source pad may not be routed to streams on different
  *	sink pads
+ * @V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING:
+ *	source pads may not contain multiplexed streams
+ * @V4L2_SUBDEV_ROUTING_NO_SINK_MULTIPLEXING:
+ *	sink pads may not contain multiplexed streams
  * @V4L2_SUBDEV_ROUTING_ONLY_1_TO_1:
  *	only non-overlapping 1-to-1 stream routing is allowed (a combination of
  *	@V4L2_SUBDEV_ROUTING_NO_1_TO_N and @V4L2_SUBDEV_ROUTING_NO_N_TO_1)
@@ -1660,12 +1664,17 @@ enum v4l2_subdev_routing_restriction {
 	V4L2_SUBDEV_ROUTING_NO_N_TO_1 = BIT(1),
 	V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX = BIT(2),
 	V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX = BIT(3),
+	V4L2_SUBDEV_ROUTING_NO_SINK_MULTIPLEXING = BIT(4),
+	V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING = BIT(5),
 	V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 =
 		V4L2_SUBDEV_ROUTING_NO_1_TO_N |
 		V4L2_SUBDEV_ROUTING_NO_N_TO_1,
 	V4L2_SUBDEV_ROUTING_NO_STREAM_MIX =
 		V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX |
 		V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX,
+	V4L2_SUBDEV_ROUTING_NO_MULTIPLEXING =
+		V4L2_SUBDEV_ROUTING_NO_SINK_MULTIPLEXING |
+		V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING,
 };
 
 /**
-- 
2.34.1

