Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677493FB44E
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236534AbhH3LDj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43936 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236505AbhH3LDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:32 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3A63237E;
        Mon, 30 Aug 2021 13:02:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321356;
        bh=zJ6zupZ20SJEAwDDZfm9lvG5CMwc9AYBmK3WeT9+rIs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j7pVswcq6KB0NidE67XJRXgovb+zM3783/ZXu+LaPnxgBwS0OU0ZkGbkhjSmGJdEw
         Oh/5V7b/KcKVnhk6xbn8vEIVMpglCOV5Q+n9Z2MTelrFFIDW/vyoFPZZb8W2RbyypK
         MfTCjeJZdeYr4BAWiyV901ojwSvh69mG/FPAOd5I=
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
Subject: [PATCH v8 29/36] media: subdev: add v4l2_subdev_has_route()
Date:   Mon, 30 Aug 2021 14:01:09 +0300
Message-Id: <20210830110116.488338-30-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a v4l2_subdev_has_route() helper function which can be used for
media_entity_operations.has_route op.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 30 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 16 ++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 0e1f325b3159..7497ad0f6024 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -999,6 +999,36 @@ int v4l2_subdev_link_validate(struct media_link *link)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
+bool v4l2_subdev_has_route(struct media_entity *entity, unsigned int pad0, unsigned int pad1)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct v4l2_subdev_krouting *routing;
+	unsigned int i;
+	struct v4l2_subdev_state *state;
+
+	state = v4l2_subdev_lock_active_state(sd);
+
+	routing = &state->routing;
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		if ((route->sink_pad == pad0 && route->source_pad == pad1) ||
+		    (route->source_pad == pad0 && route->sink_pad == pad1)) {
+			v4l2_subdev_unlock_state(state);
+			return true;
+		}
+	}
+
+	v4l2_subdev_unlock_state(state);
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_has_route);
+
 struct v4l2_subdev_state *
 __v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
 			  enum v4l2_subdev_format_whence which,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index cd6aad21ae0c..858e18aa5b20 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1213,6 +1213,22 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
  */
 int v4l2_subdev_link_validate(struct media_link *link);
 
+/**
+ * v4l2_subdev_has_route - MC has_route implementation for subdevs
+ *
+ * @entity: pointer to &struct media_entity
+ * @pad0: pad number for the first pad
+ * @pad1: pad number for the second pad
+ *
+ * This function looks at the routing in subdev's active state and returns if
+ * there is a route connecting pad0 and pad1.
+ *
+ * This function can be used as implementation for
+ * media_entity_operations.has_route.
+ */
+bool v4l2_subdev_has_route(struct media_entity *entity, unsigned int pad0,
+			   unsigned int pad1);
+
 /**
  * v4l2_alloc_subdev_state - allocate v4l2_subdev_state
  *
-- 
2.25.1

