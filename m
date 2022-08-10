Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 470D758EBC8
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 14:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbiHJMM0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 08:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232185AbiHJMMZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 08:12:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C192A6AA0B
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 05:12:24 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E955E46F9;
        Wed, 10 Aug 2022 14:11:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660133517;
        bh=jCYCWU32WkWz0h/cg4f4lR8pPgDHUZDE91FzXNwmwgo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LtEkY2fyQcYh9eKR0/OIzOfnnRj+vj1hzf5pImYRY9ktDjhfU5+odWgzqtoan251o
         KqH2V0N2M4TOuDGAC/UfF2TxdV27lXJnGVcI5taqmniYfQAZ5KuIjLr0jHscq79u29
         SBbdueFzKzCRM7im3yxGoowiRhc/eZofspexulFY=
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
Subject: [PATCH v13 30/34] media: subdev: add v4l2_subdev_routing_validate() helper
Date:   Wed, 10 Aug 2022 15:11:18 +0300
Message-Id: <20220810121122.3149086-31-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
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

Add a v4l2_subdev_routing_validate() helper for verifying routing for
common cases like only allowing non-overlapping 1-to-1 streams.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 102 ++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           |  39 ++++++++++
 2 files changed, 141 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 92a3142fcf23..4fdde9d8c07d 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1644,6 +1644,108 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
 
+int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_krouting *routing,
+				 enum v4l2_subdev_routing_restriction disallow)
+{
+	u32 *remote_pads = NULL;
+	unsigned int i, j;
+	int ret = -EINVAL;
+
+	if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
+		remote_pads = kcalloc(sd->entity.num_pads, sizeof(*remote_pads),
+				      GFP_KERNEL);
+		if (!remote_pads)
+			return -ENOMEM;
+
+		for (i = 0; i < sd->entity.num_pads; ++i)
+			remote_pads[i] = U32_MAX;
+	}
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		const struct v4l2_subdev_route *route = &routing->routes[i];
+
+		/* Validate the sink and source pad numbers. */
+		if (route->sink_pad >= sd->entity.num_pads ||
+		    !(sd->entity.pads[route->sink_pad].flags & MEDIA_PAD_FL_SINK)) {
+			dev_dbg(sd->dev, "route %u sink (%u) is not a sink pad\n",
+				i, route->sink_pad);
+			goto out;
+		}
+
+		if (route->source_pad >= sd->entity.num_pads ||
+		    !(sd->entity.pads[route->source_pad].flags & MEDIA_PAD_FL_SOURCE)) {
+			dev_dbg(sd->dev, "route %u source (%u) is not a source pad\n",
+				i, route->source_pad);
+			goto out;
+		}
+
+		/*
+		 * V4L2_SUBDEV_ROUTING_NO_STREAM_MIX: Streams on the same pad
+		 * may not be routed to streams on different pads.
+		 */
+		if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
+			if (remote_pads[route->sink_pad] != U32_MAX &&
+			    remote_pads[route->sink_pad] != route->source_pad) {
+				dev_dbg(sd->dev,
+					"route %u attempts to mix %s streams\n",
+					i, "sink");
+				goto out;
+			}
+
+			if (remote_pads[route->source_pad] != U32_MAX &&
+			    remote_pads[route->source_pad] != route->sink_pad) {
+				dev_dbg(sd->dev,
+					"route %u attempts to mix %s streams\n",
+					i, "source");
+				goto out;
+			}
+
+			remote_pads[route->sink_pad] = route->source_pad;
+			remote_pads[route->source_pad] = route->sink_pad;
+		}
+
+		for (j = i + 1; j < routing->num_routes; ++j) {
+			const struct v4l2_subdev_route *r = &routing->routes[j];
+
+			/*
+			 * V4L2_SUBDEV_ROUTING_NO_1_TO_N: No two routes can
+			 * originate from the same (sink) stream.
+			 */
+			if ((disallow & V4L2_SUBDEV_ROUTING_NO_1_TO_N) &&
+			    route->sink_pad == r->sink_pad &&
+			    route->sink_stream == r->sink_stream) {
+				dev_dbg(sd->dev,
+					"routes %u and %u originate from same sink (%u/%u)\n",
+					i, j, route->sink_pad,
+					route->sink_stream);
+				goto out;
+			}
+
+			/*
+			 * V4L2_SUBDEV_ROUTING_NO_N_TO_1: No two routes can end
+			 * at the same (source) stream.
+			 */
+			if ((disallow & V4L2_SUBDEV_ROUTING_NO_N_TO_1) &&
+			    route->source_pad == r->source_pad &&
+			    route->source_stream == r->source_stream) {
+				dev_dbg(sd->dev,
+					"routes %u and %u end at same source (%u/%u)\n",
+					i, j, route->source_pad,
+					route->source_stream);
+				goto out;
+			}
+		}
+	}
+
+	ret = 0;
+
+out:
+	kfree(remote_pads);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_routing_validate);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index cacc56ee3ee6..69331adb0aca 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1572,6 +1572,45 @@ struct v4l2_mbus_framefmt *
 v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 					     u32 pad, u32 stream);
 
+/**
+ * enum v4l2_subdev_routing_restriction - Subdevice internal routing restrictions
+ *
+ * @V4L2_SUBDEV_ROUTING_NO_1_TO_N:
+ *	an input stream may not be routed to multiple output streams (stream
+ *	duplication)
+ * @V4L2_SUBDEV_ROUTING_NO_N_TO_1:
+ *	multiple input streams may not be routed to the same output stream
+ *	(stream merging)
+ * @V4L2_SUBDEV_ROUTING_NO_STREAM_MIX:
+ *	streams on the same pad may not be routed to streams on different pads
+ * @V4L2_SUBDEV_ROUTING_ONLY_1_TO_1:
+ *	only non-overlapping 1-to-1 stream routing is allowed (a combination of
+ *	@V4L2_SUBDEV_ROUTING_NO_1_TO_N and @V4L2_SUBDEV_ROUTING_NO_N_TO_1)
+ */
+enum v4l2_subdev_routing_restriction {
+	V4L2_SUBDEV_ROUTING_NO_1_TO_N = BIT(0),
+	V4L2_SUBDEV_ROUTING_NO_N_TO_1 = BIT(1),
+	V4L2_SUBDEV_ROUTING_NO_STREAM_MIX = BIT(2),
+	V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 =
+		V4L2_SUBDEV_ROUTING_NO_1_TO_N |
+		V4L2_SUBDEV_ROUTING_NO_N_TO_1,
+};
+
+/**
+ * v4l2_subdev_routing_validate() - Verify that routes comply with driver
+ *				    constraints
+ * @sd: The subdevice
+ * @routing: Routing to verify
+ * @disallow: Restrictions on routes
+ *
+ * This verifies that the given routing complies with the @disallow constraints.
+ *
+ * Returns 0 on success, error value otherwise.
+ */
+int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_krouting *routing,
+				 enum v4l2_subdev_routing_restriction disallow);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
-- 
2.34.1

