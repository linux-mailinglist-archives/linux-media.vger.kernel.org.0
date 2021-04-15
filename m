Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160B4360A0B
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbhDONFv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46132 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbhDONFu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:50 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD20189A;
        Thu, 15 Apr 2021 15:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491927;
        bh=7TUiN8wSn9bkB9qFYZKbph7srm2sf/NcAksCY77Wi6A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EyjS+e9KHXHNbydPTit/DvYomDbC89XZ5FiS9aheZE+c5FAB9pqZwlsld2N6HH2LY
         dgNATLQnEsnxnDS7GLoIoiJ8aGbGkqJuyfmf5hEoxY7csjwK5QEeTphawu3/Q8PRAA
         K/LiFCSa9BXtKxQ2KFYfIwLh89dvLFTuTIa+f34g=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 22/24] v4l: subdev: add v4l2_subdev_get_format_dir()
Date:   Thu, 15 Apr 2021 16:04:48 +0300
Message-Id: <20210415130450.421168-23-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add v4l2_subdev_get_format_dir() which can be used to find subdev format
for a specific stream on a multiplexed pad. The function will follow the
routes and links until it finds a non-multiplexed pad.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 96 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 26 ++++++++
 2 files changed, 122 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7a4f71d8c6c3..430dbdaab080 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -998,6 +998,102 @@ bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_has_route);
 
+int v4l2_subdev_get_format_dir(struct media_pad *pad, u16 stream,
+			       enum v4l2_direction dir,
+			       struct v4l2_subdev_format *fmt)
+{
+	struct device *dev = pad->entity->graph_obj.mdev->dev;
+	int ret;
+	int i;
+
+	dev_dbg(dev, "%s '%s':%u:%u %s\n", __func__,
+		pad->entity->name, pad->index, stream,
+		dir == V4L2_DIR_SOURCEWARD ? "sourceward" : "sinkward");
+
+	while (true) {
+		struct v4l2_subdev_krouting routing;
+		struct v4l2_subdev_route *route;
+
+		if (pad->entity->obj_type != MEDIA_ENTITY_TYPE_V4L2_SUBDEV)
+			return -EINVAL;
+
+		ret = v4l2_subdev_link_validate_get_format(pad, fmt);
+		if (ret == 0)
+			return 0;
+		else if (ret != -ENOIOCTLCMD)
+			return ret;
+
+		if (pad->flags &
+		    (dir == V4L2_DIR_SINKWARD ? MEDIA_PAD_FL_SOURCE :
+						MEDIA_PAD_FL_SINK)) {
+			pad = media_entity_remote_pad(pad);
+
+			if (!pad)
+				return -EINVAL;
+
+			if (pad->entity->obj_type != MEDIA_ENTITY_TYPE_V4L2_SUBDEV)
+				return -EINVAL;
+
+			ret = v4l2_subdev_link_validate_get_format(pad, fmt);
+			if (ret == 0)
+				return 0;
+			else if (ret != -ENOIOCTLCMD)
+				return ret;
+		}
+
+		ret = v4l2_subdev_get_krouting(media_entity_to_v4l2_subdev(pad->entity), &routing);
+		if (ret)
+			return ret;
+
+		route = NULL;
+		for (i = 0; i < routing.num_routes; ++i) {
+			u16 near_pad = dir == V4L2_DIR_SINKWARD ?
+					       routing.routes[i].sink_pad :
+					       routing.routes[i].source_pad;
+			u16 near_stream = dir == V4L2_DIR_SINKWARD ?
+						  routing.routes[i].sink_stream :
+						  routing.routes[i].source_stream;
+
+			if (!(routing.routes[i].flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+				continue;
+
+			if (near_pad != pad->index)
+				continue;
+
+			if (near_stream != stream)
+				continue;
+
+			if (route) {
+				dev_err(dev,
+					"%s: '%s' has multiple active routes for stream %u\n",
+					__func__, pad->entity->name, stream);
+				v4l2_subdev_free_routing(&routing);
+				return -EINVAL;
+			}
+
+			route = &routing.routes[i];
+		}
+
+		if (!route) {
+			dev_err(dev, "%s: no route found in '%s' for stream %u\n",
+				__func__, pad->entity->name, stream);
+			v4l2_subdev_free_routing(&routing);
+			return -EINVAL;
+		}
+
+		if (dir == V4L2_DIR_SINKWARD) {
+			pad = &pad->entity->pads[route->source_pad];
+			stream = route->source_stream;
+		} else {
+			pad = &pad->entity->pads[route->sink_pad];
+			stream = route->sink_stream;
+		}
+
+		v4l2_subdev_free_routing(&routing);
+	}
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_format_dir);
+
 int v4l2_subdev_link_validate(struct media_link *link)
 {
 	struct v4l2_subdev *sink;
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1843b77dd843..730631f9a091 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1239,4 +1239,30 @@ void v4l2_subdev_cpy_routing(struct v4l2_subdev_krouting *dst,
 bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
 			   unsigned int pad0, unsigned int pad1);
 
+/**
+ * enum v4l2_direction - Direction either towards the source or the sink
+ *
+ * @V4L2_DIR_SOURCEWARD: Direction towards the source.
+ * @V4L2_DIR_SINKWARD: Direction towards the sink.
+ */
+enum v4l2_direction {
+	V4L2_DIR_SOURCEWARD,
+	V4L2_DIR_SINKWARD,
+};
+
+/**
+ * v4l2_subdev_get_format_dir() - Find format by following streams
+ * @pad: The pad from which to start the search
+ * @stream: The stream for which we want to find the format
+ * @dir: The direction of the search
+ * @fmt: Pointer to &struct v4l2_subdev_format where the found format is stored
+ *
+ * This function attempts to find v4l2_subdev_format for a specific stream on a
+ * multiplexed pad by following the stream using routes and links to the specified
+ * direction, until a non-multiplexed pad is found.
+ */
+int v4l2_subdev_get_format_dir(struct media_pad *pad, u16 stream,
+			       enum v4l2_direction dir,
+			       struct v4l2_subdev_format *fmt);
+
 #endif
-- 
2.25.1

