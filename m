Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F286A7F60
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 11:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjCBKAp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 05:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbjCBKAd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 05:00:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E131846158
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 01:59:56 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC2A99D9;
        Thu,  2 Mar 2023 10:57:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677751075;
        bh=otiRC0BQdJgKPfjBrBRQAMDUNyp1x42gTyLKsgyg4GM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BmBzRKUwAQGLJ/az30QEh69a9reQ2wM7ZZMTgUCMEABzZonyRDrGa7lDLznl4dF+Y
         rjj38SafAHcmVLV78rJT0lUrTmKg64DsdSD5tSe5txEWqNrQbY4Mr7eDW2KuPIfGgm
         A0KGFAekJce7w8jLJ2AHt8lLLRHmadKOlhCZE+qM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 3/3] media: subdev: Add V4L2_SUBDEV_ROUTING_NO_MULTIPLEXING
Date:   Thu,  2 Mar 2023 11:57:48 +0200
Message-Id: <20230302095748.100898-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230302095748.100898-1-tomi.valkeinen@ideasonboard.com>
References: <20230302095748.100898-1-tomi.valkeinen@ideasonboard.com>
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
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 36 ++++++++++++++++++++++++---
 include/media/v4l2-subdev.h           | 11 ++++++++
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 8e91f169ad9e..3650eb3a413f 100644
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
@@ -1704,8 +1705,6 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 					i, "sink");
 				goto out;
 			}
-
-			remote_pads[route->sink_pad] = route->source_pad;
 		}
 
 		/*
@@ -1720,7 +1719,38 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
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
index fb4fddb9b599..fa300019844b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1647,6 +1647,10 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
  *	all streams from a sink pad must be routed to a single source pad
  * @V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX:
  *	all streams on a source pad must originate from a single sink pad
+ * @V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING:
+ *	source pads shall not contain multiplexed streams
+ * @V4L2_SUBDEV_ROUTING_NO_SINK_MULTIPLEXING:
+ *	sink pads shall not contain multiplexed streams
  * @V4L2_SUBDEV_ROUTING_ONLY_1_TO_1:
  *	only non-overlapping 1-to-1 stream routing is allowed (a combination of
  *	@V4L2_SUBDEV_ROUTING_NO_1_TO_N and @V4L2_SUBDEV_ROUTING_NO_N_TO_1)
@@ -1655,18 +1659,25 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
  *	that source pad shall not get routes from any other sink pad
  *	(a combination of @V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX and
  *	@V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX)
+ * @V4L2_SUBDEV_ROUTING_NO_MULTIPLEXING:
+ *	no multiplexed streams allowed on either source or sink sides.
  */
 enum v4l2_subdev_routing_restriction {
 	V4L2_SUBDEV_ROUTING_NO_1_TO_N = BIT(0),
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

