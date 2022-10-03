Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4BD15F3026
	for <lists+linux-media@lfdr.de>; Mon,  3 Oct 2022 14:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbiJCMTm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Oct 2022 08:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiJCMTj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Oct 2022 08:19:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA611BF
        for <linux-media@vger.kernel.org>; Mon,  3 Oct 2022 05:19:33 -0700 (PDT)
Received: from desky.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8896B16D3;
        Mon,  3 Oct 2022 14:19:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664799568;
        bh=jzS2wU/7ia7LQVRgeFRUq+kG8oBcgGSn3UKbLwYb+u4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tGopNR+MOJj3NOpROCoa4QvFHyv08KD5kXQDpUryHKi/Km1/RbNwLkBOjxQHfc5qE
         vOBP/mX5UcrF4MzyaksP+3LvMtPqID35HteQL/h+dqIzwRtQ7bjaXKgBR/dDRhAQsm
         Rpk05P6vLi4e3LdppN2oVLLxlvnpMTvsx6SPMGm8=
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
Subject: [PATCH v15 11/19] media: subdev: use streams in v4l2_subdev_link_validate()
Date:   Mon,  3 Oct 2022 15:18:44 +0300
Message-Id: <20221003121852.616745-12-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
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

Update v4l2_subdev_link_validate() to use routing and streams for
validation.

Instead of just looking at the format on the pad on both ends of the
link, the routing tables are used to collect all the streams going from
the source to the sink over the link, and the streams' formats on both
ends of the link are verified.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 182 +++++++++++++++++++++++---
 1 file changed, 162 insertions(+), 20 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index be778e619694..1cea6ec750c0 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1014,7 +1014,7 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
 
 static int
-v4l2_subdev_link_validate_get_format(struct media_pad *pad,
+v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
 				     struct v4l2_subdev_format *fmt)
 {
 	if (is_media_entity_v4l2_subdev(pad->entity)) {
@@ -1023,7 +1023,11 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
 
 		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		fmt->pad = pad->index;
-		return v4l2_subdev_call_state_active(sd, pad, get_fmt, fmt);
+		fmt->stream = stream;
+
+		return v4l2_subdev_call(sd, pad, get_fmt,
+					v4l2_subdev_get_locked_active_state(sd),
+					fmt);
 	}
 
 	WARN(pad->entity->function != MEDIA_ENT_F_IO_V4L,
@@ -1033,31 +1037,169 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
 	return -EINVAL;
 }
 
+#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
+
+static void __v4l2_link_validate_get_streams(struct media_pad *pad,
+					     u64 *streams_mask)
+{
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev *subdev;
+
+	subdev = media_entity_to_v4l2_subdev(pad->entity);
+
+	*streams_mask = 0;
+
+	state = v4l2_subdev_get_locked_active_state(subdev);
+	if (WARN_ON(!state))
+		return;
+
+	for_each_active_route(&state->routing, route) {
+		u32 route_pad;
+		u32 route_stream;
+
+		if (pad->flags & MEDIA_PAD_FL_SOURCE) {
+			route_pad = route->source_pad;
+			route_stream = route->source_stream;
+		} else {
+			route_pad = route->sink_pad;
+			route_stream = route->sink_stream;
+		}
+
+		if (route_pad != pad->index)
+			continue;
+
+		*streams_mask |= BIT_ULL(route_stream);
+	}
+}
+
+#endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
+
+static void v4l2_link_validate_get_streams(struct media_pad *pad,
+					   u64 *streams_mask)
+{
+	struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(pad->entity);
+
+	if (!(subdev->flags & V4L2_SUBDEV_FL_STREAMS)) {
+		/* Non-streams subdevs have an implicit stream 0 */
+		*streams_mask = BIT_ULL(0);
+		return;
+	}
+
+#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
+	__v4l2_link_validate_get_streams(pad, streams_mask);
+#else
+	/* This shouldn't happen */
+	*streams_mask = 0;
+#endif
+}
+
+static int v4l2_subdev_link_validate_locked(struct media_link *link)
+{
+	struct v4l2_subdev *sink_subdev =
+		media_entity_to_v4l2_subdev(link->sink->entity);
+	struct device *dev = sink_subdev->entity.graph_obj.mdev->dev;
+	u64 source_streams_mask;
+	u64 sink_streams_mask;
+	u64 dangling_sink_streams;
+	u32 stream;
+	int ret;
+
+	dev_dbg(dev, "validating link \"%s\":%u -> \"%s\":%u\n",
+		link->source->entity->name, link->source->index,
+		link->sink->entity->name, link->sink->index);
+
+	v4l2_link_validate_get_streams(link->source, &source_streams_mask);
+	v4l2_link_validate_get_streams(link->sink, &sink_streams_mask);
+
+	/*
+	 * It is ok to have more source streams than sink streams as extra
+	 * source streams can just be ignored by the receiver, but having extra
+	 * sink streams is an error as streams must have a source.
+	 */
+	dangling_sink_streams = (source_streams_mask ^ sink_streams_mask) &
+				sink_streams_mask;
+	if (dangling_sink_streams) {
+		dev_err(dev, "Dangling sink streams: mask %#llx\n",
+			dangling_sink_streams);
+		return -EINVAL;
+	}
+
+	/* Validate source and sink stream formats */
+
+	for_each_set_bit(stream, (void *)&sink_streams_mask, 64) {
+		struct v4l2_subdev_format sink_fmt, source_fmt;
+
+		dev_dbg(dev, "validating stream \"%s\":%u:%u -> \"%s\":%u:%u\n",
+			link->source->entity->name, link->source->index, stream,
+			link->sink->entity->name, link->sink->index, stream);
+
+		ret = v4l2_subdev_link_validate_get_format(link->source, stream,
+							   &source_fmt);
+		if (ret < 0) {
+			dev_dbg(dev,
+				"Failed to get format for \"%s\":%u:%u (but that's ok)\n",
+				link->source->entity->name, link->source->index,
+				stream);
+			continue;
+		}
+
+		ret = v4l2_subdev_link_validate_get_format(link->sink, stream,
+							   &sink_fmt);
+		if (ret < 0) {
+			dev_dbg(dev,
+				"Failed to get format for \"%s\":%u:%u (but that's ok)\n",
+				link->sink->entity->name, link->sink->index,
+				stream);
+			continue;
+		}
+
+		/* TODO: add stream number to link_validate() */
+		ret = v4l2_subdev_call(sink_subdev, pad, link_validate, link,
+				       &source_fmt, &sink_fmt);
+		if (!ret)
+			continue;
+
+		if (ret != -ENOIOCTLCMD)
+			return ret;
+
+		ret = v4l2_subdev_link_validate_default(sink_subdev, link,
+							&source_fmt, &sink_fmt);
+
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 int v4l2_subdev_link_validate(struct media_link *link)
 {
-	struct v4l2_subdev *sink;
-	struct v4l2_subdev_format sink_fmt, source_fmt;
-	int rval;
+	struct v4l2_subdev *source_sd, *sink_sd;
+	struct v4l2_subdev_state *source_state, *sink_state;
+	int ret;
 
-	rval = v4l2_subdev_link_validate_get_format(
-		link->source, &source_fmt);
-	if (rval < 0)
-		return 0;
+	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
+	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
 
-	rval = v4l2_subdev_link_validate_get_format(
-		link->sink, &sink_fmt);
-	if (rval < 0)
-		return 0;
+	sink_state = v4l2_subdev_get_unlocked_active_state(sink_sd);
+	source_state = v4l2_subdev_get_unlocked_active_state(source_sd);
 
-	sink = media_entity_to_v4l2_subdev(link->sink->entity);
+	if (sink_state)
+		v4l2_subdev_lock_state(sink_state);
 
-	rval = v4l2_subdev_call(sink, pad, link_validate, link,
-				&source_fmt, &sink_fmt);
-	if (rval != -ENOIOCTLCMD)
-		return rval;
+	if (source_state)
+		v4l2_subdev_lock_state(source_state);
 
-	return v4l2_subdev_link_validate_default(
-		sink, link, &source_fmt, &sink_fmt);
+	ret = v4l2_subdev_link_validate_locked(link);
+
+	if (sink_state)
+		v4l2_subdev_unlock_state(sink_state);
+
+	if (source_state)
+		v4l2_subdev_unlock_state(source_state);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
-- 
2.34.1

