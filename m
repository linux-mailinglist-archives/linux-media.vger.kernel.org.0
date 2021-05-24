Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8DF38E465
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbhEXKqZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:46:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60914 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbhEXKqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:46:17 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65A83140C;
        Mon, 24 May 2021 12:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853089;
        bh=ADLUb+MRJXyAFeHiUtO+JuaKbbFTE4g4ySEQXG44N7E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O26+OLdOBWHE1+yCPRDmmmEixIbUpqb1GYzEdyU7fye1mCywvEw/xvIXPeBtQic4J
         1lA8yPS893kqO3thaecuwMiSr+4xW884sQsv7J5Fs7upXMAlRmmVfD3ipNkHyjS9PN
         S20Hk8loweTi+AqRkansbWTRyfwD5tr1QK3meE3o=
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
Subject: [PATCH v7 24/27] v4l: subdev: use streams in v4l2_subdev_link_validate()
Date:   Mon, 24 May 2021 13:44:05 +0300
Message-Id: <20210524104408.599645-25-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update v4l2_subdev_link_validate() to use routing and streams for
validation.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 184 +++++++++++++++++++++++---
 1 file changed, 166 insertions(+), 18 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index da6ea9b14631..b30b456d8d99 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -16,6 +16,7 @@
 #include <linux/videodev2.h>
 #include <linux/export.h>
 #include <linux/version.h>
+#include <linux/sort.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -894,6 +895,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
 
 static int
 v4l2_subdev_link_validate_get_format(struct media_pad *pad,
+				     u32 stream,
 				     struct v4l2_subdev_format *fmt)
 {
 	if (is_media_entity_v4l2_subdev(pad->entity)) {
@@ -902,6 +904,7 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
 
 		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		fmt->pad = pad->index;
+		fmt->stream = stream;
 		return v4l2_subdev_call(sd, pad, get_fmt, NULL, fmt);
 	}
 
@@ -1012,31 +1015,176 @@ bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_has_route);
 
+static int cmp_u32(const void *a, const void *b)
+{
+	u32 a32 = *(u32 *)a;
+	u32 b32 = *(u32 *)b;
+
+	return a32 > b32 ? 1 : (a32 < b32 ? -1 : 0);
+}
+
 int v4l2_subdev_link_validate(struct media_link *link)
 {
-	struct v4l2_subdev *sink;
-	struct v4l2_subdev_format sink_fmt, source_fmt;
-	int rval;
+	int ret;
+	unsigned int i;
 
-	rval = v4l2_subdev_link_validate_get_format(
-		link->source, &source_fmt);
-	if (rval < 0)
-		return 0;
+	struct v4l2_subdev *source_subdev =
+		media_entity_to_v4l2_subdev(link->source->entity);
+	struct v4l2_subdev *sink_subdev =
+		media_entity_to_v4l2_subdev(link->sink->entity);
+	struct device *dev = sink_subdev->entity.graph_obj.mdev->dev;
 
-	rval = v4l2_subdev_link_validate_get_format(
-		link->sink, &sink_fmt);
-	if (rval < 0)
-		return 0;
+	struct v4l2_subdev_krouting routing;
 
-	sink = media_entity_to_v4l2_subdev(link->sink->entity);
+	static const u32 default_streams[] = { 0 };
 
-	rval = v4l2_subdev_call(sink, pad, link_validate, link,
-				&source_fmt, &sink_fmt);
-	if (rval != -ENOIOCTLCMD)
-		return rval;
+	u32 num_source_streams = 0;
+	const u32 *source_streams;
+	u32 num_sink_streams = 0;
+	const u32 *sink_streams;
+
+	dev_dbg(dev, "validating link \"%s\":%u -> \"%s\":%u\n",
+		link->source->entity->name, link->source->index,
+		link->sink->entity->name, link->sink->index);
+
+	/* Get source streams */
+
+	memset(&routing, 0, sizeof(routing));
+
+	ret = v4l2_subdev_get_routing(source_subdev, NULL, &routing);
+
+	if (ret && ret != -ENOIOCTLCMD)
+		return ret;
+
+	if (ret == -ENOIOCTLCMD) {
+		num_source_streams = 1;
+		source_streams = default_streams;
+	} else {
+		u32 *streams;
+
+		streams = kmalloc_array(routing.num_routes, sizeof(u32),
+					GFP_KERNEL);
+
+		for (i = 0; i < routing.num_routes; ++i) {
+			struct v4l2_subdev_route *route = &routing.routes[i];
+
+			if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+				continue;
+
+			if (route->source_pad == link->source->index)
+				streams[num_source_streams++] =
+					route->source_stream;
+		}
+
+		sort(streams, num_source_streams, sizeof(u32), &cmp_u32, NULL);
+
+		source_streams = streams;
+
+		v4l2_subdev_free_routing(&routing);
+	}
+
+	/* Get sink streams */
+
+	memset(&routing, 0, sizeof(routing));
+
+	ret = v4l2_subdev_get_routing(sink_subdev, NULL, &routing);
+
+	if (ret && ret != -ENOIOCTLCMD)
+		return ret;
+
+	if (ret == -ENOIOCTLCMD) {
+		num_sink_streams = 1;
+		sink_streams = default_streams;
+	} else {
+		u32 *streams;
 
-	return v4l2_subdev_link_validate_default(
-		sink, link, &source_fmt, &sink_fmt);
+		streams = kmalloc_array(routing.num_routes, sizeof(u32),
+					GFP_KERNEL);
+
+		for (i = 0; i < routing.num_routes; ++i) {
+			struct v4l2_subdev_route *route = &routing.routes[i];
+
+			if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+				continue;
+
+			if (route->sink_pad == link->sink->index)
+				streams[num_sink_streams++] =
+					route->sink_stream;
+		}
+
+		sort(streams, num_sink_streams, sizeof(u32), &cmp_u32, NULL);
+
+		sink_streams = streams;
+
+		v4l2_subdev_free_routing(&routing);
+	}
+
+	if (num_source_streams != num_sink_streams) {
+		dev_err(dev,
+			"Sink and source stream count mismatch: %d vs %d\n",
+			num_source_streams, num_sink_streams);
+		return -EINVAL;
+	}
+
+	/* Validate source and sink stream formats */
+
+	for (i = 0; i < num_source_streams; ++i) {
+		struct v4l2_subdev_format sink_fmt, source_fmt;
+		u32 stream;
+		int ret;
+
+		if (source_streams[i] != sink_streams[i]) {
+			dev_err(dev, "Sink and source streams do not match\n");
+			return -EINVAL;
+		}
+
+		stream = source_streams[i];
+
+		dev_dbg(dev, "validating stream \"%s\":%u:%u -> \"%s\":%u:%u\n",
+			link->source->entity->name, link->source->index, stream,
+			link->sink->entity->name, link->sink->index, stream);
+
+		ret = v4l2_subdev_link_validate_get_format(link->source, stream,
+							   &source_fmt);
+		if (ret < 0) {
+			dev_err(dev, "Failed to get format for \"%s\":%u:%u\n",
+				link->source->entity->name, link->source->index,
+				stream);
+			return ret;
+		}
+
+		ret = v4l2_subdev_link_validate_get_format(link->sink, stream,
+							   &sink_fmt);
+		if (ret < 0) {
+			dev_err(dev, "Failed to get format for \"%s\":%u:%u\n",
+				link->sink->entity->name, link->sink->index,
+				stream);
+			return ret;
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
+	if (source_streams != default_streams)
+		kfree(source_streams);
+
+	if (sink_streams != default_streams)
+		kfree(sink_streams);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
-- 
2.25.1

