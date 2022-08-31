Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E67D5A7FD8
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiHaOQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbiHaOQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:16:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2171A74BAA
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:15:40 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5219F3004;
        Wed, 31 Aug 2022 16:14:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955277;
        bh=j4d1m0mJVXEk3cKGeubjah3n41Wo8bsMQi53OFYh8Mw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WCRBJszW8ioqL73H7XP4BSTMyGy2uGC/1/k7kgJJsNjeoP8gphGwwQNyp4XUdihkO
         HGGiCfPaEVgrmgG8fJ9EAm/x91QoQGSOcKQp5j9KTrwGrc5bVZv/YLFdmOQt5x6UNx
         5DKiTtSOMM7IM6YluNKGb0SB+1344Gw5pUtf26og=
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
Subject: [PATCH v14 26/34] media: subdev: use streams in v4l2_subdev_link_validate()
Date:   Wed, 31 Aug 2022 17:13:49 +0300
Message-Id: <20220831141357.1396081-27-tomi.valkeinen@ideasonboard.com>
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

Update v4l2_subdev_link_validate() to use routing and streams for
validation.

Instead of just looking at the format on the pad on both ends of the
link, the routing tables are used to collect all the streams going from
the source to the sink over the link, and the streams' formats on both
ends of the link are verified.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 245 +++++++++++++++++++++++---
 1 file changed, 225 insertions(+), 20 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e752eb3df1a3..a46059cda541 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -16,6 +16,7 @@
 #include <linux/videodev2.h>
 #include <linux/export.h>
 #include <linux/version.h>
+#include <linux/sort.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -1062,7 +1063,7 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
 
 static int
-v4l2_subdev_link_validate_get_format(struct media_pad *pad,
+v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
 				     struct v4l2_subdev_format *fmt)
 {
 	if (is_media_entity_v4l2_subdev(pad->entity)) {
@@ -1071,7 +1072,11 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
 
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
@@ -1081,31 +1086,231 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
 	return -EINVAL;
 }
 
-int v4l2_subdev_link_validate(struct media_link *link)
+static int cmp_u32(const void *a, const void *b)
 {
-	struct v4l2_subdev *sink;
-	struct v4l2_subdev_format sink_fmt, source_fmt;
-	int rval;
+	u32 a32 = *(u32 *)a;
+	u32 b32 = *(u32 *)b;
 
-	rval = v4l2_subdev_link_validate_get_format(
-		link->source, &source_fmt);
-	if (rval < 0)
-		return 0;
+	return a32 > b32 ? 1 : (a32 < b32 ? -1 : 0);
+}
+
+static int v4l2_link_validate_get_streams(struct media_pad *pad,
+					  u32 *out_num_streams,
+					  const u32 **out_streams,
+					  bool *allocated)
+{
+	static const u32 default_streams[] = { 0 };
+	struct v4l2_subdev_krouting *routing;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev *subdev;
+	u32 num_streams;
+	u32 *streams;
+	struct v4l2_subdev_state *state;
+	int ret;
 
-	rval = v4l2_subdev_link_validate_get_format(
-		link->sink, &sink_fmt);
-	if (rval < 0)
+	subdev = media_entity_to_v4l2_subdev(pad->entity);
+
+	if (!(subdev->flags & V4L2_SUBDEV_FL_STREAMS)) {
+		*out_num_streams = 1;
+		*out_streams = default_streams;
+		*allocated = false;
 		return 0;
+	}
 
-	sink = media_entity_to_v4l2_subdev(link->sink->entity);
+	state = v4l2_subdev_get_locked_active_state(subdev);
 
-	rval = v4l2_subdev_call(sink, pad, link_validate, link,
-				&source_fmt, &sink_fmt);
-	if (rval != -ENOIOCTLCMD)
-		return rval;
+	routing = &state->routing;
+
+	streams = kmalloc_array(routing->num_routes, sizeof(u32), GFP_KERNEL);
+	if (!streams)
+		return -ENOMEM;
+
+	num_streams = 0;
+
+	for_each_active_route(routing, route) {
+		int j;
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
+		/* look for duplicates */
+		for (j = 0; j < num_streams; ++j) {
+			if (streams[j] == route_stream) {
+				ret = -EINVAL;
+				goto free_streams;
+			}
+		}
+
+		streams[num_streams++] = route_stream;
+	}
+
+	sort(streams, num_streams, sizeof(u32), &cmp_u32, NULL);
+
+	*out_num_streams = num_streams;
+	*out_streams = streams;
+	*allocated = true;
+
+	return 0;
+
+free_streams:
+	kfree(streams);
+
+	return ret;
+}
+
+static int v4l2_subdev_link_validate_locked(struct media_link *link)
+{
+	struct v4l2_subdev *sink_subdev =
+		media_entity_to_v4l2_subdev(link->sink->entity);
+	struct device *dev = sink_subdev->entity.graph_obj.mdev->dev;
+	u32 num_source_streams;
+	const u32 *source_streams;
+	bool source_allocated;
+	u32 num_sink_streams;
+	const u32 *sink_streams;
+	bool sink_allocated;
+	unsigned int sink_idx;
+	unsigned int source_idx;
+	int ret;
+
+	dev_dbg(dev, "validating link \"%s\":%u -> \"%s\":%u\n",
+		link->source->entity->name, link->source->index,
+		link->sink->entity->name, link->sink->index);
+
+	ret = v4l2_link_validate_get_streams(link->source, &num_source_streams,
+					     &source_streams,
+					     &source_allocated);
+	if (ret)
+		return ret;
+
+	ret = v4l2_link_validate_get_streams(link->sink, &num_sink_streams,
+					     &sink_streams, &sink_allocated);
+	if (ret)
+		goto free_source;
+
+	/*
+	 * It is ok to have more source streams than sink streams as extra
+	 * source streams can just be ignored by the receiver, but having extra
+	 * sink streams is an error as streams must have a source.
+	 */
+	if (num_source_streams < num_sink_streams) {
+		dev_err(dev,
+			"Not enough source streams: %d < %d\n",
+			num_source_streams, num_sink_streams);
+		ret = -EINVAL;
+		goto free_sink;
+	}
+
+	/* Validate source and sink stream formats */
+
+	source_idx = 0;
+
+	for (sink_idx = 0; sink_idx < num_sink_streams; ++sink_idx) {
+		struct v4l2_subdev_format sink_fmt, source_fmt;
+		u32 stream;
+
+		stream = sink_streams[sink_idx];
+
+		for (; source_idx < num_source_streams; ++source_idx) {
+			if (source_streams[source_idx] == stream)
+				break;
+		}
+
+		if (source_idx == num_source_streams) {
+			dev_err(dev, "No source stream for sink stream %u\n",
+				stream);
+			ret = -EINVAL;
+			goto free_sink;
+		}
+
+		dev_dbg(dev, "validating stream \"%s\":%u:%u -> \"%s\":%u:%u\n",
+			link->source->entity->name, link->source->index, stream,
+			link->sink->entity->name, link->sink->index, stream);
+
+		ret = v4l2_subdev_link_validate_get_format(link->source, stream,
+							   &source_fmt);
+		if (ret < 0) {
+			dev_dbg(dev, "Failed to get format for \"%s\":%u:%u (but that's ok)\n",
+				link->source->entity->name, link->source->index,
+				stream);
+			ret = 0;
+			continue;
+		}
+
+		ret = v4l2_subdev_link_validate_get_format(link->sink, stream,
+							   &sink_fmt);
+		if (ret < 0) {
+			dev_dbg(dev, "Failed to get format for \"%s\":%u:%u (but that's ok)\n",
+				link->sink->entity->name, link->sink->index,
+				stream);
+			ret = 0;
+			continue;
+		}
+
+		/* TODO: add stream number to link_validate() */
+		ret = v4l2_subdev_call(sink_subdev, pad, link_validate, link,
+				       &source_fmt, &sink_fmt);
+		if (!ret)
+			continue;
 
-	return v4l2_subdev_link_validate_default(
-		sink, link, &source_fmt, &sink_fmt);
+		if (ret != -ENOIOCTLCMD)
+			goto free_sink;
+
+		ret = v4l2_subdev_link_validate_default(sink_subdev, link,
+							&source_fmt, &sink_fmt);
+
+		if (ret)
+			goto free_sink;
+	}
+
+free_sink:
+	if (sink_allocated)
+		kfree(sink_streams);
+
+free_source:
+	if (source_allocated)
+		kfree(source_streams);
+
+	return ret;
+}
+
+int v4l2_subdev_link_validate(struct media_link *link)
+{
+	struct v4l2_subdev *source_sd, *sink_sd;
+	struct v4l2_subdev_state *source_state, *sink_state;
+	int ret;
+
+	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
+	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
+
+	sink_state = v4l2_subdev_get_unlocked_active_state(sink_sd);
+	source_state = v4l2_subdev_get_unlocked_active_state(source_sd);
+
+	if (sink_state)
+		v4l2_subdev_lock_state(sink_state);
+
+	if (source_state)
+		v4l2_subdev_lock_state(source_state);
+
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

