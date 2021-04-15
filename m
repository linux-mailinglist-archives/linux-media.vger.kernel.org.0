Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C71360A0C
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233105AbhDONFy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbhDONFw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85EFC061574
        for <linux-media@vger.kernel.org>; Thu, 15 Apr 2021 06:05:29 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4FB289D;
        Thu, 15 Apr 2021 15:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491928;
        bh=kOnBvNp5F9+H0hYRVxW8IVo8qa6qCdLclm9Qs2H4JLI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SwcLBRMbDEkJPINSun635SKjZ62I7oGMeihl+DLVfiugglgp4L5thFnNiUGYCWsAW
         guZ3YVyl6qlkcvt2CxqhSDNmDo3u8EyxnUhrN6xE+cF6EA8VHasFzuNUDy/4/34dID
         0tTSelbG3Zi90LXmEPkzncvgPOz+za7sAnOaRwGs=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 23/24] v4l: subdev: Take routing information into account in link validation
Date:   Thu, 15 Apr 2021 16:04:49 +0300
Message-Id: <20210415130450.421168-24-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The routing information is essential in link validation for multiplexed
links: the pads at the ends of a multiplexed link have no single format
defined for them. Instead, the format is accessible in the sink (or
source) pads of the sub-devices at both ends of that link.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 138 ++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 430dbdaab080..e0cb5b7d84a7 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1094,6 +1094,140 @@ int v4l2_subdev_get_format_dir(struct media_pad *pad, u16 stream,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_format_dir);
 
+static int v4l2_subdev_link_validate_routing_stream(
+	struct media_link *link, struct media_pad *sink_pad, u16 sink_stream,
+	struct media_pad *source_pad, u16 source_stream)
+{
+	struct v4l2_subdev_format source_fmt;
+	struct v4l2_subdev_format sink_fmt;
+	struct v4l2_subdev *sink_sd;
+	int ret;
+
+	ret = v4l2_subdev_get_format_dir(sink_pad, sink_stream,
+					 V4L2_DIR_SINKWARD, &sink_fmt);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_get_format_dir(source_pad, source_stream,
+					 V4L2_DIR_SOURCEWARD, &source_fmt);
+	if (ret)
+		return ret;
+
+	sink_sd = media_entity_to_v4l2_subdev(sink_pad->entity);
+
+	ret = v4l2_subdev_call(sink_sd, pad, link_validate, link, &source_fmt,
+			       &sink_fmt);
+	if (ret != -ENOIOCTLCMD)
+		return ret;
+
+	ret = v4l2_subdev_link_validate_default(sink_sd, link, &source_fmt,
+						&sink_fmt);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int v4l2_subdev_link_validate_routing(struct media_link *link)
+{
+	int ret;
+	unsigned int i, j;
+
+	struct route_info {
+		struct v4l2_subdev_krouting routing;
+		struct media_pad *pad;
+		struct v4l2_subdev *subdev;
+	};
+
+	struct route_info source_route_info = {
+		.pad = link->source,
+		.subdev = media_entity_to_v4l2_subdev(link->source->entity),
+	};
+
+	struct route_info sink_route_info = {
+		.pad = link->sink,
+		.subdev = media_entity_to_v4l2_subdev(link->sink->entity),
+	};
+
+	struct device *dev = sink_route_info.subdev->entity.graph_obj.mdev->dev;
+
+	dev_dbg(dev, "validating link \"%s\":%u -> \"%s\":%u\n",
+		link->source->entity->name, link->source->index,
+		link->sink->entity->name, link->sink->index);
+
+	ret = v4l2_subdev_get_krouting(source_route_info.subdev,
+				       &source_route_info.routing);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_get_krouting(sink_route_info.subdev,
+				       &sink_route_info.routing);
+	if (ret) {
+		v4l2_subdev_free_routing(&source_route_info.routing);
+		return ret;
+	}
+
+	/*
+	 * Every active sink route needs an active source route, but it's ok
+	 * to have active source routes without matching sink route.
+	 */
+	for (i = 0; i < sink_route_info.routing.num_routes; ++i) {
+		struct v4l2_subdev_route *sink_route =
+			&sink_route_info.routing.routes[i];
+
+		if (!(sink_route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		if (sink_route->sink_pad != sink_route_info.pad->index)
+			continue;
+
+		for (j = 0; j < source_route_info.routing.num_routes; ++j) {
+			struct v4l2_subdev_route *source_route =
+				&source_route_info.routing.routes[j];
+
+			if (!(source_route->flags &
+			      V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+				continue;
+
+			if (source_route->source_pad !=
+			    source_route_info.pad->index)
+				continue;
+
+			if (source_route->source_stream !=
+			    sink_route->sink_stream)
+				continue;
+
+			ret = v4l2_subdev_link_validate_routing_stream(
+				link,
+				&sink_route_info.pad->entity
+					 ->pads[sink_route->sink_pad],
+				sink_route->sink_stream,
+				&source_route_info.pad->entity
+					 ->pads[source_route->source_pad],
+				source_route->source_stream);
+			if (ret)
+				goto out;
+
+			break;
+		}
+
+		if (j == source_route_info.routing.num_routes) {
+			dev_err(dev,
+				"%s: no active source route found for sink route '%s':%u:%u\n",
+				__func__, sink_route_info.pad->entity->name,
+				sink_route->sink_pad, sink_route->sink_stream);
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
+out:
+	v4l2_subdev_free_routing(&source_route_info.routing);
+	v4l2_subdev_free_routing(&sink_route_info.routing);
+
+	return ret;
+}
+
 int v4l2_subdev_link_validate(struct media_link *link)
 {
 	struct v4l2_subdev *sink;
@@ -1102,11 +1236,15 @@ int v4l2_subdev_link_validate(struct media_link *link)
 
 	rval = v4l2_subdev_link_validate_get_format(
 		link->source, &source_fmt);
+	if (rval == -ENOIOCTLCMD)
+		return v4l2_subdev_link_validate_routing(link);
 	if (rval < 0)
 		return 0;
 
 	rval = v4l2_subdev_link_validate_get_format(
 		link->sink, &sink_fmt);
+	if (rval == -ENOIOCTLCMD)
+		return v4l2_subdev_link_validate_routing(link);
 	if (rval < 0)
 		return 0;
 
-- 
2.25.1

