Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE99C360A0A
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbhDONFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46134 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233092AbhDONFu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:50 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04CD38BA;
        Thu, 15 Apr 2021 15:05:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491926;
        bh=bHVmpQV6etDZ39MiKhd6jeoTgL0mtllf+Q5OvZ/4t+Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VcomdBvVeRlX8fDm8Ad/lGRgGCb9p1F7nqT6rNff6AbzeGRSCIqY7LIXrW9mniWLg
         uCtlo/GCw3QF7w2zRAbOl6LZlUe5v0d9FVA2rXmzZvEMXvuTNTdGIOQx3mBK4BpWK5
         Yei+Agme3C8Gueuz7goX4kX0p4IqHce0MmX04WVQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 21/24] v4l: subdev: routing kernel helper functions
Date:   Thu, 15 Apr 2021 16:04:47 +0300
Message-Id: <20210415130450.421168-22-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add helper functions for routing.

TODO: add docs.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 89 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 14 +++++
 2 files changed, 103 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 95a4c3091fa6..7a4f71d8c6c3 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -909,6 +909,95 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
 	return -EINVAL;
 }
 
+int v4l2_subdev_get_krouting(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	routing->which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	routing->routes = NULL;
+	routing->num_routes = 0;
+
+	ret = v4l2_subdev_call(sd, pad, get_routing, routing);
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
+	ret = v4l2_subdev_call(sd, pad, get_routing, routing);
+	if (ret) {
+		kvfree(routing->routes);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_krouting);
+
+void v4l2_subdev_free_routing(struct v4l2_subdev_krouting *routing)
+{
+	kvfree(routing->routes);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_free_routing);
+
+void v4l2_subdev_cpy_routing(struct v4l2_subdev_krouting *dst,
+			     const struct v4l2_subdev_krouting *src)
+{
+	memcpy(dst->routes, src->routes,
+	       src->num_routes * sizeof(*src->routes));
+	dst->num_routes = src->num_routes;
+	dst->which = src->which;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_cpy_routing);
+
+int v4l2_subdev_dup_routing(struct v4l2_subdev_krouting *dst,
+			    const struct v4l2_subdev_krouting *src)
+{
+	if (dst->routes)
+		kvfree(dst->routes);
+
+	if (src->num_routes == 0) {
+		dst->which = src->which;
+		dst->routes = NULL;
+		dst->num_routes = 0;
+		return 0;
+	}
+
+	dst->routes = kvmalloc_array(src->num_routes, sizeof(*src->routes),
+				     GFP_KERNEL);
+	if (!dst->routes)
+		return -ENOMEM;
+
+	v4l2_subdev_cpy_routing(dst, src);
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
+		if (route->sink_pad == pad0 && route->source_pad == pad1)
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
index 3826ab918731..1843b77dd843 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1225,4 +1225,18 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
 			      const struct v4l2_event *ev);
 
+int v4l2_subdev_get_krouting(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_krouting *routing);
+
+void v4l2_subdev_free_routing(struct v4l2_subdev_krouting *routing);
+
+int v4l2_subdev_dup_routing(struct v4l2_subdev_krouting *dst,
+			    const struct v4l2_subdev_krouting *src);
+
+void v4l2_subdev_cpy_routing(struct v4l2_subdev_krouting *dst,
+			     const struct v4l2_subdev_krouting *src);
+
+bool v4l2_subdev_has_route(struct v4l2_subdev_krouting *routing,
+			   unsigned int pad0, unsigned int pad1);
+
 #endif
-- 
2.25.1

