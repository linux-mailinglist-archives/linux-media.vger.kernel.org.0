Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 776B36A7F54
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 11:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjCBKAP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 05:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbjCBJ7K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 04:59:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D421A27D4B
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 01:58:12 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B966056A;
        Thu,  2 Mar 2023 10:57:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677751073;
        bh=lktQp6sphM4fhV/fBuKbg3/47HK6tJVPOZjhbec40YY=;
        h=From:To:Cc:Subject:Date:From;
        b=QF0KYoD7NbNuETjhpuX3eXAWgzGJ7mMejkVINymSPjuHhkYY8ebfgAtk1WurptxCf
         1vjcdwYnJBbjG/BeVBq7konnv12z0bXORiAQO5AQ9sn6MgqjTLIYfd67OkmAtxQOD6
         3vC5ebUQrnkUokxkRH+dTrXXQd8pHUPXCzRVgwxs=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/3] media: subdev: Routing validation improvements
Date:   Thu,  2 Mar 2023 11:57:45 +0200
Message-Id: <20230302095748.100898-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

Hi,

v1 can be found here:

https://lore.kernel.org/all/20230228092346.101105-1-tomi.valkeinen@ideasonboard.com/

v2 contains only doc/comment changes. Diff to v1 below.

 Tomi

Tomi Valkeinen (3):
  media: subdev: Use 'shall' instead of 'may' in route validation
  media: subdev: Split V4L2_SUBDEV_ROUTING_NO_STREAM_MIX
  media: subdev: Add V4L2_SUBDEV_ROUTING_NO_MULTIPLEXING

 drivers/media/v4l2-core/v4l2-subdev.c | 45 ++++++++++++++++++++++++---
 include/media/v4l2-subdev.h           | 32 ++++++++++++++++---
 2 files changed, 68 insertions(+), 9 deletions(-)

Interdiff against v1:
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index ae74a48dd2ba..3650eb3a413f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1694,9 +1694,8 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 		}
 
 		/*
-		 * V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX: Streams on the same
-		 * sink pad may not be routed to streams on different source
-		 * pads.
+		 * V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX: all streams from a
+		 * sink pad must be routed to a single source pad.
 		 */
 		if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
 			if (remote_pads[route->sink_pad] != U32_MAX &&
@@ -1709,9 +1708,8 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 		}
 
 		/*
-		 * V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX: Streams on the same
-		 * source pad may not be routed to streams on different sink
-		 * pads.
+		 * V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX: all streams on a
+		 * source pad must originate from a single sink pad.
 		 */
 		if (disallow & V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX) {
 			if (remote_pads[route->source_pad] != U32_MAX &&
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 4a8d45e2c804..fa300019844b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1638,26 +1638,29 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
  * enum v4l2_subdev_routing_restriction - Subdevice internal routing restrictions
  *
  * @V4L2_SUBDEV_ROUTING_NO_1_TO_N:
- *	an input stream may not be routed to multiple output streams (stream
+ *	an input stream shall not be routed to multiple output streams (stream
  *	duplication)
  * @V4L2_SUBDEV_ROUTING_NO_N_TO_1:
- *	multiple input streams may not be routed to the same output stream
+ *	multiple input streams shall not be routed to the same output stream
  *	(stream merging)
  * @V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX:
- *	streams on the same sink pad may not be routed to streams on different
- *	source pads
+ *	all streams from a sink pad must be routed to a single source pad
  * @V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX:
- *	streams on the same source pad may not be routed to streams on different
- *	sink pads
+ *	all streams on a source pad must originate from a single sink pad
  * @V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING:
- *	source pads may not contain multiplexed streams
+ *	source pads shall not contain multiplexed streams
  * @V4L2_SUBDEV_ROUTING_NO_SINK_MULTIPLEXING:
- *	sink pads may not contain multiplexed streams
+ *	sink pads shall not contain multiplexed streams
  * @V4L2_SUBDEV_ROUTING_ONLY_1_TO_1:
  *	only non-overlapping 1-to-1 stream routing is allowed (a combination of
  *	@V4L2_SUBDEV_ROUTING_NO_1_TO_N and @V4L2_SUBDEV_ROUTING_NO_N_TO_1)
  * @V4L2_SUBDEV_ROUTING_NO_STREAM_MIX:
- *	streams on the same pad may not be routed to streams on different pads
+ *	all streams from a sink pad must be routed to a single source pad, and
+ *	that source pad shall not get routes from any other sink pad
+ *	(a combination of @V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX and
+ *	@V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX)
+ * @V4L2_SUBDEV_ROUTING_NO_MULTIPLEXING:
+ *	no multiplexed streams allowed on either source or sink sides.
  */
 enum v4l2_subdev_routing_restriction {
 	V4L2_SUBDEV_ROUTING_NO_1_TO_N = BIT(0),
-- 
2.34.1

