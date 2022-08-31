Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC7C55A7FE8
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbiHaOQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbiHaOQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:16:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87A8D75A7
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:15:56 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A38A63007;
        Wed, 31 Aug 2022 16:14:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955282;
        bh=6eHD+mbxfz+za8GMRbmdZG0qbK/tt5LxptX+2B6q5GE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q+xPf66Wu18csDB1Sem+JykuN/H+qItsIRlcZLKuLwQCHd03L/1GVYHnXkFbofNYI
         xQEOmyAf/14g966ybrXil9o3v/USjHcR6M8EVibJspupKUhmn4ZNRTKfM4z7s6HPOW
         3QBff1+0q4h+PRaTDZ1LAUT89H1V44mA3MYoQ8MQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v14 31/34] media: v4l2-subdev: Add v4l2_subdev_state_xlate_streams() helper
Date:   Wed, 31 Aug 2022 17:13:54 +0300
Message-Id: <20220831141357.1396081-32-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Add a helper function to translate streams between two pads of a subdev,
using the subdev's internal routing table.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 26 ++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 23 +++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4fdde9d8c07d..7d46c9a5a6c4 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1644,6 +1644,32 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
 
+u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
+				    u32 pad0, u32 pad1, u64 *streams)
+{
+	const struct v4l2_subdev_krouting *routing = &state->routing;
+	struct v4l2_subdev_route *route;
+	u64 streams0 = 0;
+	u64 streams1 = 0;
+
+	for_each_active_route(routing, route) {
+		if (route->sink_pad == pad0 && route->source_pad == pad1 &&
+		    (*streams & BIT_ULL(route->sink_stream))) {
+			streams0 |= BIT_ULL(route->sink_stream);
+			streams1 |= BIT_ULL(route->source_stream);
+		}
+		if (route->source_pad == pad0 && route->sink_pad == pad1 &&
+		    (*streams & BIT_ULL(route->source_stream))) {
+			streams0 |= BIT_ULL(route->source_stream);
+			streams1 |= BIT_ULL(route->sink_stream);
+		}
+	}
+
+	*streams = streams0;
+	return streams1;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_state_xlate_streams);
+
 int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 				 const struct v4l2_subdev_krouting *routing,
 				 enum v4l2_subdev_routing_restriction disallow)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1c66a8b9d918..68cd8431c535 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1572,6 +1572,29 @@ struct v4l2_mbus_framefmt *
 v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 					     u32 pad, u32 stream);
 
+/**
+ * v4l2_subdev_state_xlate_streams() - Translate streams from one pad to another
+ *
+ * @state: Subdevice state
+ * @pad0: The first pad
+ * @pad1: The second pad
+ * @streams: Streams bitmask on the first pad
+ *
+ * Streams on sink pads of a subdev are routed to source pads as expressed in
+ * the subdev state routing table. Stream numbers don't necessarily match on
+ * the sink and source side of a route. This function translates stream numbers
+ * on @pad0, expressed as a bitmask in @streams, to the corresponding streams
+ * on @pad1 using the routing table from the @state. It returns the stream mask
+ * on @pad1, and updates @streams with the streams that have been found in the
+ * routing table.
+ *
+ * @pad0 and @pad1 must be a sink and a source, in any order.
+ *
+ * Return: The bitmask of streams of @pad1 that are routed to @streams on @pad0.
+ */
+u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
+				    u32 pad0, u32 pad1, u64 *streams);
+
 /**
  * enum v4l2_subdev_routing_restriction - Subdevice internal routing restrictions
  *
-- 
2.34.1

