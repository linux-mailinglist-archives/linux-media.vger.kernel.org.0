Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC75376547
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 14:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236744AbhEGMiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 08:38:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59722 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236640AbhEGMiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 08:38:02 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F368C2CF;
        Fri,  7 May 2021 14:37:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620391021;
        bh=7EwTlNzHzd6IbTJ/jUGYEiISglWx8pZJX5Ik1idrwGk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z1FjGqJsgwyAESgeBhxFNIq+ly5PlFXlbp0O5qKYMUFYzUZycoyXWMtwP23NThRzr
         rgcoo7SHGJoaR4mzVo0hATqSChCD2kjnf02DjNhkPTUWGnnLzcWiTMoTBhyDIKnEcY
         FObgg9nvPuY3Ov/Z/vQmA8Nabi/Dpn9Q9hM1ip+c=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, john.wei@mediatek.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC 06/11] v4l: subdev: add stream based configuration
Date:   Fri,  7 May 2021 15:35:53 +0300
Message-Id: <20210507123558.146948-7-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
References: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
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

TODO: use init/deinit instead of alloc/free?

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 61 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 19 +++++++++
 2 files changed, 80 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7b40bf34f8a3..0d2c39aabfc4 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1101,3 +1101,64 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
 	v4l2_subdev_notify(sd, V4L2_DEVICE_NOTIFY_EVENT, (void *)ev);
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
+
+void v4l2_free_stream_configs(struct v4l2_subdev_stream_configs *stream_configs)
+{
+	kvfree(stream_configs->configs);
+	stream_configs->num_configs = 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_free_stream_configs);
+
+int v4l2_alloc_stream_configs(struct v4l2_subdev_stream_configs *stream_configs,
+			      const struct v4l2_subdev_krouting *routing)
+{
+	u32 num_configs = 0;
+	unsigned int i;
+	u32 format_idx = 0;
+
+	v4l2_free_stream_configs(stream_configs);
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
+EXPORT_SYMBOL_GPL(v4l2_alloc_stream_configs);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 63a36eead7dc..36be66e18abc 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -665,6 +665,20 @@ struct v4l2_subdev_pad_config {
 	struct v4l2_rect try_compose;
 };
 
+struct v4l2_subdev_stream_config {
+	u32 pad;
+	u32 stream;
+
+	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_rect crop;
+	struct v4l2_rect compose;
+};
+
+struct v4l2_subdev_stream_configs {
+	u32 num_configs;
+	struct v4l2_subdev_stream_config *configs;
+};
+
 /**
  * struct v4l2_subdev_krouting - subdev routing table
  *
@@ -1267,4 +1281,9 @@ void v4l2_subdev_cpy_routing(struct v4l2_subdev_krouting *dst,
 bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
 			   unsigned int pad0, unsigned int pad1);
 
+void v4l2_free_stream_configs(struct v4l2_subdev_stream_configs *stream_configs);
+
+int v4l2_alloc_stream_configs(struct v4l2_subdev_stream_configs *stream_configs,
+			      const struct v4l2_subdev_krouting *routing);
+
 #endif
-- 
2.25.1

