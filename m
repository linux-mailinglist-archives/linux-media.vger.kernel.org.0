Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D46C03FB44F
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236537AbhH3LDj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236507AbhH3LDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:32 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92086146F;
        Mon, 30 Aug 2021 13:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321357;
        bh=Kdf3da2fMbLmRAXhbg5z4fZfZo36UQWwd8a84GIbNZg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XTPRy+gxM/zYz+xLqIJEmWY+5eyjvKgsijcDrR6FnAZbFawCsBqT0r8WnevdMMG7T
         59G27uflua3o2lASIXaNRlqjbR7sZ5IpJ+u7c0YUkMDB29JNgGnpGa6KIxSH8VMlWE
         NlxqnEew5y3P0vytfW478uhrcM24Ii/gigM5bXmQ=
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
Subject: [PATCH v8 30/36] media: subdev: add v4l2_subdev_set_routing helper()
Date:   Mon, 30 Aug 2021 14:01:10 +0300
Message-Id: <20210830110116.488338-31-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a helper function to set the subdev routing. The helper can be used
from subdev driver's set_routing op to store the routing table.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 31 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 16 ++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7497ad0f6024..eb1103afbfbc 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1155,3 +1155,34 @@ void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
 	mutex_unlock(&state->lock);
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_unlock_state);
+
+int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    struct v4l2_subdev_krouting *routing)
+{
+	struct v4l2_subdev_krouting *dst = &state->routing;
+	const struct v4l2_subdev_krouting *src = routing;
+
+	lockdep_assert_held(&state->lock);
+
+	kvfree(dst->routes);
+	dst->routes = NULL;
+	dst->num_routes = 0;
+
+	if (src->num_routes == 0) {
+		dst->which = src->which;
+	} else {
+		dst->routes = kvmalloc_array(src->num_routes, sizeof(*src->routes),
+					     GFP_KERNEL);
+		if (!dst->routes)
+			return -ENOMEM;
+
+		memcpy(dst->routes, src->routes,
+		       src->num_routes * sizeof(*src->routes));
+		dst->num_routes = src->num_routes;
+		dst->which = src->which;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 858e18aa5b20..90e9fda6babb 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1436,4 +1436,20 @@ v4l2_subdev_validate_and_lock_state(struct v4l2_subdev *sd,
 	return state;
 }
 
+/**
+ * v4l2_subdev_set_routing() - Set given routing to subdev state
+ * @sd: The subdevice
+ * @state: The subdevice state
+ * @routing: Routing that will be copied to subdev state
+ *
+ * This will release old routing table (if any) from the state, allocate
+ * enough space for the given routing, and copy the routing.
+ *
+ * This can be used from the subdev driver's set_routing op, after validating
+ * the routing.
+ */
+int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    struct v4l2_subdev_krouting *routing);
+
 #endif
-- 
2.25.1

