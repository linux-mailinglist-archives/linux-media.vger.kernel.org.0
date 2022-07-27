Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 451B358248A
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 12:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbiG0Kha (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 06:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232005AbiG0Kh2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 06:37:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3215F474E8
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 03:37:26 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F290D37;
        Wed, 27 Jul 2022 12:37:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658918231;
        bh=4mBfHIaDpJMPHCo3RVY1gKTO7ynybTbPolstUGT2ndE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PP5XDzuNGWtWF/x1aouAqABThNvQ92DU3oN9Bun5InYhE+ySujzjSIb8CsX0iutVB
         xSZQkKQI4EFORPPRwIwP5WifxY924p8dLbhzK8XT0/AWw48Zs1PRNU5v7Xt39rE0ah
         ZtTX2/nyp3daNL29S46P34veA5NubX/l8keWuXG4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v12 19/30] media: subdev: add "opposite" stream helper funcs
Date:   Wed, 27 Jul 2022 13:36:28 +0300
Message-Id: <20220727103639.581567-20-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
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

Add two helper functions to make dealing with streams easier:

v4l2_subdev_routing_find_opposite_end - given a routing table and a pad
+ stream, return the pad + stream on the opposite side of the subdev.

v4l2_subdev_state_get_opposite_stream_format - return a pointer to the
format on the pad + stream on the opposite side from the given pad +
stream.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 48 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 36 ++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7ca2337ca8d3..0dd612f09f35 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1558,6 +1558,54 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_compose);
 
+int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
+					  u32 pad, u32 stream, u32 *other_pad,
+					  u32 *other_stream)
+{
+	unsigned int i;
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (route->source_pad == pad &&
+		    route->source_stream == stream) {
+			if (other_pad)
+				*other_pad = route->sink_pad;
+			if (other_stream)
+				*other_stream = route->sink_stream;
+			return 0;
+		}
+
+		if (route->sink_pad == pad && route->sink_stream == stream) {
+			if (other_pad)
+				*other_pad = route->source_pad;
+			if (other_stream)
+				*other_stream = route->source_stream;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_routing_find_opposite_end);
+
+struct v4l2_mbus_framefmt *
+v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
+					     u32 pad, u32 stream)
+{
+	u32 other_pad, other_stream;
+	int ret;
+
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, stream,
+						    &other_pad, &other_stream);
+	if (ret)
+		return NULL;
+
+	return v4l2_subdev_state_get_stream_format(state, other_pad,
+						   other_stream);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 6d177fc609f7..69831967fb6f 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1502,6 +1502,42 @@ struct v4l2_rect *
 v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
 				     unsigned int pad, u32 stream);
 
+/**
+ * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
+ * @routing: routing used to find the opposite side
+ * @pad: pad id
+ * @stream: stream id
+ * @other_pad: pointer used to return the opposite pad
+ * @other_stream: pointer used to return the opposite stream
+ *
+ * This function uses the routing table to find the pad + stream which is
+ * opposite the given pad + stream.
+ *
+ * @other_pad and/or @other_stream can be NULL if the caller does not need the
+ * value.
+ *
+ * Returns 0 on success, or -EINVAL if no matching route is found.
+ */
+int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
+					  u32 pad, u32 stream, u32 *other_pad,
+					  u32 *other_stream);
+
+/**
+ * v4l2_subdev_state_get_opposite_stream_format() - Get pointer to opposite
+ *                                                  stream format
+ * @state: subdevice state
+ * @pad: pad id
+ * @stream: stream id
+ *
+ * This returns a pointer to &struct v4l2_mbus_framefmt for the pad + stream
+ * that is opposite the given pad + stream in the subdev state.
+ *
+ * If the state does not contain the given pad + stream, NULL is returned.
+ */
+struct v4l2_mbus_framefmt *
+v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
+					     u32 pad, u32 stream);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
-- 
2.34.1

