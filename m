Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8874038E463
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232701AbhEXKqY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:46:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60914 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232494AbhEXKqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:46:15 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A186345C;
        Mon, 24 May 2021 12:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853087;
        bh=dRACppGO0vScoL90ipeeNKSysWmpuH8hEJSMmFsu3iM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NJxL2MOYJdjKHZZCFX3COsrHU/zcb0/74XxrEv0a1rfFd0f2CzF2lQiuMsv6h9oKg
         caQGLGx3O3hODh7xa2tX4qQ6DcEdQ/x1nrpM/1qjW3WJaAVnfmedtlM6+VGc4+rwY6
         EkVZn0GoX3VtYxTddKvfuVKHDI6/ExMZm8jUsx6U=
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
Subject: [PATCH v7 22/27] v4l: subdev: add stream based configuration
Date:   Mon, 24 May 2021 13:44:03 +0300
Message-Id: <20210524104408.599645-23-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to manage configurations (format, crop, compose) per stream,
instead of per pad. This is accomplished with data structures that hold
an array of all subdev's stream configurations.

The number of streams can vary at runtime based on routing. Every time
the routing is changed, the stream configurations need to be
re-initialized.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 62 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 55 ++++++++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index ef18682dbc6f..da6ea9b14631 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1112,3 +1112,65 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
 	v4l2_subdev_notify(sd, V4L2_DEVICE_NOTIFY_EVENT, (void *)ev);
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
+
+int v4l2_init_stream_configs(struct v4l2_subdev_stream_configs *stream_configs,
+			     const struct v4l2_subdev_krouting *routing)
+{
+	u32 num_configs = 0;
+	unsigned int i;
+	u32 format_idx = 0;
+
+	v4l2_uninit_stream_configs(stream_configs);
+
+	/* Count number of formats needed */
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		/* Each route needs a format on both ends of the route */
+		num_configs += 2;
+	}
+
+	if (num_configs) {
+		stream_configs->configs =
+			kvcalloc(num_configs, sizeof(*stream_configs->configs),
+				 GFP_KERNEL);
+
+		if (!stream_configs->configs)
+			return -ENOMEM;
+
+		stream_configs->num_configs = num_configs;
+	}
+
+	/* Fill in the 'pad' and stream' value for each item in the array from the routing table */
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+		u32 idx;
+
+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		idx = format_idx++;
+
+		stream_configs->configs[idx].pad = route->sink_pad;
+		stream_configs->configs[idx].stream = route->sink_stream;
+
+		idx = format_idx++;
+
+		stream_configs->configs[idx].pad = route->source_pad;
+		stream_configs->configs[idx].stream = route->source_stream;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_init_stream_configs);
+
+void v4l2_uninit_stream_configs(struct v4l2_subdev_stream_configs *stream_configs)
+{
+	kvfree(stream_configs->configs);
+	stream_configs->configs = NULL;
+	stream_configs->num_configs = 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_uninit_stream_configs);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 87f6bb78bbe9..39c6b811463a 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -661,6 +661,37 @@ struct v4l2_subdev_pad_config {
 	struct v4l2_rect try_compose;
 };
 
+/**
+ * struct v4l2_subdev_stream_config - Used for storing stream configuration.
+ *
+ * @pad: pad number
+ * @stream: stream number
+ * @fmt: &struct v4l2_mbus_framefmt
+ * @crop: &struct v4l2_rect to be used for crop
+ * @compose: &struct v4l2_rect to be used for compose
+ *
+ * This structure stores configuration for a stream.
+ */
+struct v4l2_subdev_stream_config {
+	u32 pad;
+	u32 stream;
+
+	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_rect crop;
+	struct v4l2_rect compose;
+};
+
+/**
+ * struct v4l2_subdev_stream_configs - A collection of stream configs.
+ *
+ * @num_configs: number of entries in @config.
+ * @config: an array of &struct v4l2_subdev_stream_configs.
+ */
+struct v4l2_subdev_stream_configs {
+	u32 num_configs;
+	struct v4l2_subdev_stream_config *configs;
+};
+
 /**
  * struct v4l2_subdev_krouting - subdev routing table
  *
@@ -1317,4 +1348,28 @@ int v4l2_subdev_dup_routing(struct v4l2_subdev_krouting *dst,
 bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
 			   unsigned int pad0, unsigned int pad1);
 
+
+/**
+ * v4l2_init_stream_configs() - Initialize stream configs according to routing
+ *
+ * @stream_configs: The stream configs to initialize
+ * @routing: The routing used for the stream configs
+ *
+ * Initializes @stream_configs according to @routing, allocating enough
+ * space to hold configuration for each route endpoint.
+ *
+ * Must be freed with v4l2_uninit_stream_configs().
+ */
+int v4l2_init_stream_configs(struct v4l2_subdev_stream_configs *stream_configs,
+			     const struct v4l2_subdev_krouting *routing);
+
+/**
+ * v4l2_uninit_stream_configs() - Uninitialize stream configs
+ *
+ * @stream_configs: The stream configs to uninitialize
+ *
+ * Frees any allocated memory in @stream_configs.
+ */
+void v4l2_uninit_stream_configs(struct v4l2_subdev_stream_configs *stream_configs);
+
 #endif
-- 
2.25.1

