Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB213FB451
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236540AbhH3LDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236515AbhH3LDd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:33 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 525DA1489;
        Mon, 30 Aug 2021 13:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321359;
        bh=yWSraz2WWFSZNzAIH7wjvIl9XbdkuefMjpUviILceAU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UGFYdsKoj/eb+Gi14P88UnZ+YRTwVI2kKmxGN7u/1Jlq101IG/A8rP0tan7XPIXH+
         GB/0PcJDB3jY9HWjfTZ1OXSSdcBWGZXEza7o0wy2VfNLfg+9Ux0gOtbREVQ+7DYrlH
         Ls9ta+a+9pUacfg/KdDlWSlYohuuwLVUZYa+I6eY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v8 32/36] media: subdev: use streams in v4l2_subdev_link_validate()
Date:   Mon, 30 Aug 2021 14:01:12 +0300
Message-Id: <20210830110116.488338-33-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 drivers/media/v4l2-core/v4l2-subdev.c | 217 +++++++++++++++++++++++---
 1 file changed, 199 insertions(+), 18 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 3df30e7e0fef..e8bfca595e11 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -16,6 +16,7 @@
 #include <linux/videodev2.h>
 #include <linux/export.h>
 #include <linux/version.h>
+#include <linux/sort.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -1047,6 +1048,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
 
 static int
 v4l2_subdev_link_validate_get_format(struct media_pad *pad,
+				     u32 stream,
 				     struct v4l2_subdev_format *fmt)
 {
 	if (is_media_entity_v4l2_subdev(pad->entity)) {
@@ -1058,6 +1060,7 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
 
 		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		fmt->pad = pad->index;
+		fmt->stream = stream;
 		return v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
 	}
 
@@ -1068,31 +1071,209 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
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
+static int v4l2_link_validate_get_streams(struct media_link *link,
+					  bool is_source, u32 *out_num_streams,
+					  const u32 **out_streams,
+					  bool *allocated)
+{
+	static const u32 default_streams[] = { 0 };
+	struct v4l2_subdev_krouting *routing;
+	struct v4l2_subdev *subdev;
+	u32 num_streams;
+	u32 *streams;
+	unsigned int i;
+	struct v4l2_subdev_state *state;
+
+	if (is_source)
+		subdev = media_entity_to_v4l2_subdev(link->source->entity);
+	else
+		subdev = media_entity_to_v4l2_subdev(link->sink->entity);
 
-	rval = v4l2_subdev_link_validate_get_format(
-		link->sink, &sink_fmt);
-	if (rval < 0)
+	if (!(subdev->flags & V4L2_SUBDEV_FL_MULTIPLEXED)) {
+		*out_num_streams = 1;
+		*out_streams = default_streams;
+		*allocated = false;
 		return 0;
+	}
 
-	sink = media_entity_to_v4l2_subdev(link->sink->entity);
+	state = v4l2_subdev_lock_active_state(subdev);
 
-	rval = v4l2_subdev_call(sink, pad, link_validate, link,
-				&source_fmt, &sink_fmt);
-	if (rval != -ENOIOCTLCMD)
-		return rval;
+	routing = &state->routing;
+
+	streams = kmalloc_array(routing->num_routes, sizeof(u32), GFP_KERNEL);
+
+	if (!streams) {
+		v4l2_subdev_unlock_state(state);
+		return -ENOMEM;
+	}
+
+	num_streams = 0;
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+		int j;
+		u32 route_pad;
+		u32 route_stream;
+		u32 link_pad;
+
+		if (is_source) {
+			route_pad = route->source_pad;
+			route_stream = route->source_stream;
+			link_pad = link->source->index;
+		} else {
+			route_pad = route->sink_pad;
+			route_stream = route->sink_stream;
+			link_pad = link->sink->index;
+		}
+
+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		if (route_pad != link_pad)
+			continue;
+
+		/* look for duplicates... */
+		for (j = 0; j < num_streams; ++j) {
+			if (streams[j] == route_stream)
+				break;
+		}
+
+		/* ...and drop the stream if we already have it */
+		if (j != num_streams)
+			continue;
+
+		streams[num_streams++] = route_stream;
+	}
+
+	v4l2_subdev_unlock_state(state);
+
+	sort(streams, num_streams, sizeof(u32), &cmp_u32, NULL);
+
+	*out_num_streams = num_streams;
+	*out_streams = streams;
+	*allocated = true;
 
-	return v4l2_subdev_link_validate_default(
-		sink, link, &source_fmt, &sink_fmt);
+	return 0;
+}
+
+int v4l2_subdev_link_validate(struct media_link *link)
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
+	ret = v4l2_link_validate_get_streams(link, true, &num_source_streams,
+					     &source_streams,
+					     &source_allocated);
+	if (ret)
+		return ret;
+
+	ret = v4l2_link_validate_get_streams(link, false, &num_sink_streams,
+					     &sink_streams, &sink_allocated);
+	if (ret)
+		goto free_source;
+
+	/* It is ok to have more source streams than sink streams */
+	if (num_source_streams < num_sink_streams) {
+		dev_err(dev,
+			"Not enough source streams: %d < %d\n",
+			num_source_streams, num_sink_streams);
+		ret = -EINVAL;
+		goto out;
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
+			goto out;
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
+
+		if (ret != -ENOIOCTLCMD)
+			goto out;
+
+		ret = v4l2_subdev_link_validate_default(sink_subdev, link,
+							&source_fmt, &sink_fmt);
+
+		if (ret)
+			goto out;
+	}
+
+out:
+	if (sink_allocated)
+		kfree(sink_streams);
+
+free_source:
+	if (source_allocated)
+		kfree(source_streams);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
-- 
2.25.1

