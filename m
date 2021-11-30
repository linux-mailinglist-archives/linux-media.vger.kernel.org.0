Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC47463671
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242098AbhK3OUd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:33 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41006 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241974AbhK3OUR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:20:17 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C035352C;
        Tue, 30 Nov 2021 15:16:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281817;
        bh=aNDvl+jDoiJe7HUw04mZrxyJIgwyaLJjHNn8waNuJb0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bBoJdAt6dxyy1oXvS2L1jG4MC0XUEykrE/ha8i/qm7fRgcMvKO6st3+rQ4km65Rpd
         tPTHfMljCZYxQNgA7dMS3P4gh6z6TC5QtLBGfAp0nwtgJGccYQ28sqbSUR+lRYpoVF
         PV0fm39Y2s4zloWKoLI7yRkYJifRgJGPxrRypBfE=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 30/38] media: subdev: add v4l2_subdev_set_routing helper()
Date:   Tue, 30 Nov 2021 16:15:28 +0200
Message-Id: <20211130141536.891878-31-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a helper function to set the subdev routing. The helper can be used
from subdev driver's set_routing op to store the routing table.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 27 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 16 ++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 67f3c14d7398..633e1fccd377 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1153,3 +1153,30 @@ void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
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
+	kfree(dst->routes);
+	dst->routes = NULL;
+	dst->num_routes = 0;
+
+	if (src->num_routes > 0) {
+		dst->routes = kmemdup(src->routes,
+				      src->num_routes * sizeof(*src->routes),
+				      GFP_KERNEL);
+		if (!dst->routes)
+			return -ENOMEM;
+
+		dst->num_routes = src->num_routes;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 350ee4d9600f..8525f39c2c67 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1439,4 +1439,20 @@ v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
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

