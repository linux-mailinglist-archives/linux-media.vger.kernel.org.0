Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E04936C65D
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237887AbhD0MrR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:47:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45386 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237841AbhD0MrK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:47:10 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1F40D3C;
        Tue, 27 Apr 2021 14:46:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619527585;
        bh=oWSKsJ/LUmTzbkhnPWGJO0C7vcVwWXR1Jm6pK1umPCc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jYN+8Bn0h1maXQlW0DS7HG1o0ijs3K75Acf2wMylKUNOcW9ZuLmjQnnsW/l2DZWoL
         SrQn0upsQfI+HvqcfdIN6y9av5U7GGtiXcvjBRegvT68fcR/aEYlcH697c1pogpU6R
         QR5uthNIB0ScYq5nfScNE4ODa+wYI+WdeXXT7dVQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 23/24] v4l: subdev: Take routing information into account in link validation
Date:   Tue, 27 Apr 2021 15:45:22 +0300
Message-Id: <20210427124523.990938-24-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
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
 drivers/media/v4l2-core/v4l2-subdev.c | 144 +++++++++++++++++++++++++-
 1 file changed, 142 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index f08847341a6b..2dd78a293b03 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1096,14 +1096,154 @@ int v4l2_subdev_get_format_dir(struct media_pad *pad, u16 stream,
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
 	struct v4l2_subdev_format sink_fmt, source_fmt;
 	int rval;
 
-	rval = v4l2_subdev_link_validate_get_format(
-		link->source, &source_fmt);
+	if (WARN_ON((link->source->flags & MEDIA_PAD_FL_MULTIPLEXED) !=
+		    (link->sink->flags & MEDIA_PAD_FL_MULTIPLEXED)))
+		return -EINVAL;
+
+	if (link->source->flags & MEDIA_PAD_FL_MULTIPLEXED)
+		return v4l2_subdev_link_validate_routing(link);
+
+	rval = v4l2_subdev_link_validate_get_format(link->source, &source_fmt);
 	if (rval < 0)
 		return 0;
 
-- 
2.25.1

