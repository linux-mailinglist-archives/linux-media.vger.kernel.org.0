Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4F138E462
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbhEXKqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:46:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60880 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232684AbhEXKqO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:46:14 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D9E617C6;
        Mon, 24 May 2021 12:44:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853086;
        bh=bxKq3bwr+jHLPWImDfes9V8Rbc0x8PR//0MsVrKLtz4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WNWwPC+CYSRleRmzoMJmqbWdkLqOJ9LKeOQNIrx3a3Lu/9navRUhf9jugJc9TuSGU
         IR6c/FvDq/XT+h0a7du7VNhIX5DC3fHWY5kf1T/pjLY0thMcQwInTnfsoz4pQDacb1
         4hXcCsT7PfGE5hOqgikiljJkYfLHk1XNtiBUgZDM=
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
Subject: [PATCH v7 21/27] v4l: subdev: routing kernel helper functions
Date:   Mon, 24 May 2021 13:44:02 +0300
Message-Id: <20210524104408.599645-22-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add helper functions for routing. These helpers make it easier for the
drivers to use struct v4l2_subdev_krouting.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 100 ++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           |  69 ++++++++++++++++++
 2 files changed, 169 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 28e84453fe28..ef18682dbc6f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -912,6 +912,106 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
 	return -EINVAL;
 }
 
+int v4l2_subdev_get_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	routing->which = state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	routing->routes = NULL;
+	routing->num_routes = 0;
+
+	ret = v4l2_subdev_call(sd, pad, get_routing, state, routing);
+	if (ret == 0)
+		return 0;
+	if (ret != -ENOSPC)
+		return ret;
+
+	routing->routes = kvmalloc_array(routing->num_routes,
+					 sizeof(*routing->routes), GFP_KERNEL);
+	if (!routing->routes)
+		return -ENOMEM;
+
+	ret = v4l2_subdev_call(sd, pad, get_routing, state, routing);
+	if (ret) {
+		kvfree(routing->routes);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_routing);
+
+void v4l2_subdev_free_routing(struct v4l2_subdev_krouting *routing)
+{
+	kvfree(routing->routes);
+	routing->routes = NULL;
+	routing->num_routes = 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_free_routing);
+
+int v4l2_subdev_cpy_routing(struct v4l2_subdev_krouting *dst,
+			    const struct v4l2_subdev_krouting *src)
+{
+	if (dst->num_routes < src->num_routes) {
+		dst->num_routes = src->num_routes;
+		return -ENOSPC;
+	}
+
+	memcpy(dst->routes, src->routes,
+	       src->num_routes * sizeof(*src->routes));
+	dst->num_routes = src->num_routes;
+	dst->which = src->which;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_cpy_routing);
+
+int v4l2_subdev_dup_routing(struct v4l2_subdev_krouting *dst,
+			    const struct v4l2_subdev_krouting *src)
+{
+	v4l2_subdev_free_routing(dst);
+
+	if (src->num_routes == 0) {
+		dst->which = src->which;
+		return 0;
+	}
+
+	dst->routes = kvmalloc_array(src->num_routes, sizeof(*src->routes),
+				     GFP_KERNEL);
+	if (!dst->routes)
+		return -ENOMEM;
+
+	memcpy(dst->routes, src->routes,
+	       src->num_routes * sizeof(*src->routes));
+	dst->num_routes = src->num_routes;
+	dst->which = src->which;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_dup_routing);
+
+bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
+			   unsigned int pad0, unsigned int pad1)
+{
+	unsigned int i;
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		if ((route->sink_pad == pad0 && route->source_pad == pad1) ||
+		    (route->source_pad == pad0 && route->sink_pad == pad1))
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_has_route);
+
 int v4l2_subdev_link_validate(struct media_link *link)
 {
 	struct v4l2_subdev *sink;
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1cf91372d3cf..87f6bb78bbe9 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1248,4 +1248,73 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
 			      const struct v4l2_event *ev);
 
+/**
+ * v4l2_subdev_get_routing() - Get routing from a subdevice
+ *
+ * @sd: The subdev from which to get the routing
+ * @state: Pointer to &struct v4l2_subdev_state
+ * @routing: Pointer to the target &struct v4l2_subdev_krouting
+ *
+ * Get a copy of the subdevice's routing table.
+ *
+ * Must be freed with v4l2_subdev_free_routing after use.
+ */
+int v4l2_subdev_get_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    struct v4l2_subdev_krouting *routing);
+
+/**
+ * v4l2_subdev_free_routing() - Free the routing
+ *
+ * @routing: The routing to be freed
+ *
+ * Frees the routing data in @routing.
+ */
+void v4l2_subdev_free_routing(struct v4l2_subdev_krouting *routing);
+
+/**
+ * v4l2_subdev_cpy_routing() - Copy the routing
+ *
+ * @dst: The destination routing
+ * @src: The source routing
+ *
+ * Copies routing from @src to @dst without allocating space. If @dst does not
+ * have enough space, set dst->num_routes to the required number of routes, and
+ * return -ENOSPC.
+ *
+ * Can be used in subdevice's v4l2_subdev_pad_ops.get_routing() callback.
+ */
+int v4l2_subdev_cpy_routing(struct v4l2_subdev_krouting *dst,
+			    const struct v4l2_subdev_krouting *src);
+
+/**
+ * v4l2_subdev_dup_routing() - Duplicate the routing
+ *
+ * @dst: The destination routing
+ * @src: The source routing
+ *
+ * Makes a duplicate of the routing from @src to @dst by allocating enough
+ * memory and making a copy of the routing.
+ *
+ * Can be used in subdevice's v4l2_subdev_pad_ops.set_routing() callback
+ * to store the given routing.
+ *
+ * Must be freed with v4l2_subdev_free_routing after use.
+ */
+int v4l2_subdev_dup_routing(struct v4l2_subdev_krouting *dst,
+			    const struct v4l2_subdev_krouting *src);
+
+/**
+ * v4l2_subdev_has_route() - Check if there is a route between two pads
+ *
+ * @routing: The subdevice's routing
+ * @pad0: First pad
+ * @pad1: Second pad
+ *
+ * Returns whether there is a route between @pad0 and @pad1 of the same
+ * subdevice according to the given routing.
+ */
+bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
+			   unsigned int pad0, unsigned int pad1);
+
 #endif
-- 
2.25.1

