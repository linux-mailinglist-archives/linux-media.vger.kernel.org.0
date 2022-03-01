Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432F54C8FE3
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236074AbiCAQNv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236075AbiCAQNu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329A035DEE
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:13:09 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0160A1C6D;
        Tue,  1 Mar 2022 17:12:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151169;
        bh=l0HlvnqRm6HTy6W1ABUu6EwPuABmqOZTgbkeGIpaV+4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vyUFmAYM2vJeVDQYMCG1L44sWSslLpPoOAhVQcNgiE2aNBahI+f53G5WekLBH1rbm
         DaY/o+UaV+glZoCf+UFAQYjycaTcNvjrMHEy7iw+0iWGDcVm1p9UVLGahnLu0A5K9k
         sS/S4BiXt+7DKoboI2sVzdUSjAybbGnyf1we3p9k=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 34/36] media: v4l2-subdev: Add v4l2_subdev_state_xlate_streams() helper
Date:   Tue,  1 Mar 2022 18:11:54 +0200
Message-Id: <20220301161156.1119557-35-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
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
 drivers/media/v4l2-core/v4l2-subdev.c | 25 +++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 23 +++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e30338a53088..6a9fc62dacbf 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1529,6 +1529,31 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
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
+		    (*streams & BIT(route->sink_stream))) {
+			streams0 |= BIT(route->sink_stream);
+			streams1 |= BIT(route->source_stream);
+		}
+		if (route->source_pad == pad0 && route->sink_pad == pad1 &&
+		    (*streams & BIT(route->source_stream))) {
+			streams0 |= BIT(route->source_stream);
+			streams1 |= BIT(route->sink_stream);
+		}
+	}
+
+	*streams = streams0;
+	return streams1;
+}
+
 int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format)
 {
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1eced0f47296..992debe116ac 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1497,6 +1497,29 @@ struct v4l2_mbus_framefmt *
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
  * v4l2_subdev_get_fmt() - Fill format based on state
  * @sd: subdevice
-- 
2.25.1

