Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5202B422181
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233612AbhJEJAe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:00:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60822 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233592AbhJEJAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:00:31 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9116A25B;
        Tue,  5 Oct 2021 10:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633424320;
        bh=XKBzfwRt9lIOAxhsodNzEsHV2XIyhOsLYSM03gS2PfA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fUAiOki8z8KpEdIaYyRnOluNNw8C+Aymha4u/2fddGHx0GcdNqHO+c3l5j8I6j6Mt
         SS8MFIMfT4z1imIMtZZxDq4alaW8x9Urizt4Cl5D5qg2zoydnig+2bG4C6hCQ2bc++
         CjsCOTRj0YUbSYMv+NYfEw9algFZ/kDfluJAGeCQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH v9 29/36] media: subdev: add v4l2_subdev_set_routing helper()
Date:   Tue,  5 Oct 2021 11:57:43 +0300
Message-Id: <20211005085750.138151-30-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a helper function to set the subdev routing. The helper can be used
from subdev driver's set_routing op to store the routing table.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 28 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 16 +++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 14b8282fe45b..af53f827ec27 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1151,3 +1151,31 @@ void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
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
+	if (src->num_routes > 0) {
+		dst->routes = kvmalloc_array(src->num_routes,
+					     sizeof(*src->routes), GFP_KERNEL);
+		if (!dst->routes)
+			return -ENOMEM;
+
+		memcpy(dst->routes, src->routes,
+		       src->num_routes * sizeof(*src->routes));
+		dst->num_routes = src->num_routes;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 8b2cf3190276..b6c5cd00831e 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1437,4 +1437,20 @@ v4l2_subdev_validate_and_lock_state(struct v4l2_subdev *sd,
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

