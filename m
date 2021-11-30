Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A785463675
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242122AbhK3OUh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:37 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41006 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242126AbhK3OUT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:20:19 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1E7B352D;
        Tue, 30 Nov 2021 15:16:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281819;
        bh=bBvldBXStfnkrWdnzATNsrcpZX2WMt6LzWFVTyFiFeQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hm+bDYH+w4h+aG4PUuTa1vsCUef03q7XugWEKUGq63LipwdzaUTVkOz4PXiMyXGdr
         2bkpw6c+5QNS0CjlMxQiVxD5x4yQ5av4LQoB6HjYebO3/Mdp+iTrjRz7w+vkny4b1K
         GWsK5KiJY8RxrWwhiXEOJqEhn8mFcHSujTWN8mL8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 33/38] media: subdev: use streams in v4l2_subdev_link_validate()
Date:   Tue, 30 Nov 2021 16:15:31 +0200
Message-Id: <20211130141536.891878-34-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
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
 drivers/media/v4l2-core/v4l2-subdev.c | 221 +++++++++++++++++++++++---
 1 file changed, 203 insertions(+), 18 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 9b944520eb97..5245ec219ee1 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -16,6 +16,7 @@
 #include <linux/videodev2.h>
 #include <linux/export.h>
 #include <linux/version.h>
+#include <linux/sort.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -1052,6 +1053,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
 
 static int
 v4l2_subdev_link_validate_get_format(struct media_pad *pad,
+				     u32 stream,
 				     struct v4l2_subdev_format *fmt)
 {
 	if (is_media_entity_v4l2_subdev(pad->entity)) {
@@ -1063,6 +1065,7 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
 
 		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		fmt->pad = pad->index;
+		fmt->stream = stream;
 		return v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
 	}
 
@@ -1073,31 +1076,213 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
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
 
-	return v4l2_subdev_link_validate_default(
-		sink, link, &source_fmt, &sink_fmt);
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
+
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
+	/*
+	 * It is ok to have more source streams than sink streams as extra
+	 * source streams can just be ignored (i.e. they go nowhere), but extra
+	 * sink streams is an error.
+	 */
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

