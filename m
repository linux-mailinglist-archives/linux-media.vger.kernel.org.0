Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6E7376544
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 14:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236615AbhEGMiA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 08:38:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59674 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236569AbhEGMh7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 08:37:59 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F7E3D4A;
        Fri,  7 May 2021 14:36:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620391019;
        bh=8DPrS2WWZL/fgOJvorYFzGjmuL7BwEspF28Yv1QzZvs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qJ0w96AbO/IzmbOtBiCjTkDcErXaMJmsiNfVVgasXMhCF6Ai8P5rhaC6Me4tYKXAV
         mDVwPq5ZXJyBpDkK3jC8fW7CjcTjKPt7Sc7/uKA9O4hpC5ldEsVKiMA+Rsh7uRhWMB
         46T26r5XuLsctudD8bmrgcXY6kZM9Kw1kcWzOisI=
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
Subject: [RFC 04/11] v4l: subdev: routing kernel helper functions
Date:   Fri,  7 May 2021 15:35:51 +0300
Message-Id: <20210507123558.146948-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
References: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add helper functions for routing. These helpers make it easier for the
drivers to use struct v4l2_subdev_krouting.

TODO: add docs
TODO: fix according to comments

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 89 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 15 +++++
 2 files changed, 104 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 28e84453fe28..7b40bf34f8a3 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -912,6 +912,95 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
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
index 4cd1a3818c68..63a36eead7dc 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1252,4 +1252,19 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
 			      const struct v4l2_event *ev);
 
+int v4l2_subdev_get_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    struct v4l2_subdev_krouting *routing);
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

