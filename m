Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 863DA6A7F64
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 11:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjCBKBR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 05:01:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbjCBKAm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 05:00:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8372986AE
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 02:00:10 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 058249CA;
        Thu,  2 Mar 2023 10:57:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677751074;
        bh=y408INqgborv/n2LPouFfV3nOVRWuxi9KgDdmCpBHKU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FCq697lKHxgj8025Ca3aCu5cq5Xt98NtItc9jUBE55wvjGBjqO6QigszPZ8Wiroyj
         wH54AoY7OJZ8aXql6nomzo5Y7jZ748QHET0OOYuQFmRUBnnmLGBWjWtNTmNwrO4IlR
         DGitr6CMPcSUNnfDbe7mFoX+pnBWTKuvB+8og4TA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/3] media: subdev: Split V4L2_SUBDEV_ROUTING_NO_STREAM_MIX
Date:   Thu,  2 Mar 2023 11:57:47 +0200
Message-Id: <20230302095748.100898-3-tomi.valkeinen@ideasonboard.com>
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

V4L2_SUBDEV_ROUTING_NO_STREAM_MIX routing validation flag means that all
routes from a sink pad must go to the same source pad and all routes
going to the same source pad must originate from the same sink pad.

This does not cover all use cases. For example, if a device routes
all streams from a single sink pad to any of the source pads, but
streams from multiple sink pads can go to the same source pad, the
current flag is too restrictive.

Split the flag into two parts, V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX
and V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX, which add the restriction
only on one side of the device. Together they mean the same as
V4L2_SUBDEV_ROUTING_NO_STREAM_MIX.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 15 +++++++++++----
 include/media/v4l2-subdev.h           | 17 ++++++++++++++---
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 8308d20f1bd1..8e91f169ad9e 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1693,10 +1693,10 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 		}
 
 		/*
-		 * V4L2_SUBDEV_ROUTING_NO_STREAM_MIX: Streams on the same pad
-		 * shall not be routed to streams on different pads.
+		 * V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX: all streams from a
+		 * sink pad must be routed to a single source pad.
 		 */
-		if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
+		if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
 			if (remote_pads[route->sink_pad] != U32_MAX &&
 			    remote_pads[route->sink_pad] != route->source_pad) {
 				dev_dbg(sd->dev,
@@ -1705,6 +1705,14 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 				goto out;
 			}
 
+			remote_pads[route->sink_pad] = route->source_pad;
+		}
+
+		/*
+		 * V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX: all streams on a
+		 * source pad must originate from a single sink pad.
+		 */
+		if (disallow & V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX) {
 			if (remote_pads[route->source_pad] != U32_MAX &&
 			    remote_pads[route->source_pad] != route->sink_pad) {
 				dev_dbg(sd->dev,
@@ -1713,7 +1721,6 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 				goto out;
 			}
 
-			remote_pads[route->sink_pad] = route->source_pad;
 			remote_pads[route->source_pad] = route->sink_pad;
 		}
 
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 3649f11a4c35..fb4fddb9b599 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1643,19 +1643,30 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
  * @V4L2_SUBDEV_ROUTING_NO_N_TO_1:
  *	multiple input streams shall not be routed to the same output stream
  *	(stream merging)
- * @V4L2_SUBDEV_ROUTING_NO_STREAM_MIX:
- *	streams on the same pad shall not be routed to streams on different pads
+ * @V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX:
+ *	all streams from a sink pad must be routed to a single source pad
+ * @V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX:
+ *	all streams on a source pad must originate from a single sink pad
  * @V4L2_SUBDEV_ROUTING_ONLY_1_TO_1:
  *	only non-overlapping 1-to-1 stream routing is allowed (a combination of
  *	@V4L2_SUBDEV_ROUTING_NO_1_TO_N and @V4L2_SUBDEV_ROUTING_NO_N_TO_1)
+ * @V4L2_SUBDEV_ROUTING_NO_STREAM_MIX:
+ *	all streams from a sink pad must be routed to a single source pad, and
+ *	that source pad shall not get routes from any other sink pad
+ *	(a combination of @V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX and
+ *	@V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX)
  */
 enum v4l2_subdev_routing_restriction {
 	V4L2_SUBDEV_ROUTING_NO_1_TO_N = BIT(0),
 	V4L2_SUBDEV_ROUTING_NO_N_TO_1 = BIT(1),
-	V4L2_SUBDEV_ROUTING_NO_STREAM_MIX = BIT(2),
+	V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX = BIT(2),
+	V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX = BIT(3),
 	V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 =
 		V4L2_SUBDEV_ROUTING_NO_1_TO_N |
 		V4L2_SUBDEV_ROUTING_NO_N_TO_1,
+	V4L2_SUBDEV_ROUTING_NO_STREAM_MIX =
+		V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX |
+		V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX,
 };
 
 /**
-- 
2.34.1

