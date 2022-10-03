Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBBFF5F3020
	for <lists+linux-media@lfdr.de>; Mon,  3 Oct 2022 14:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbiJCMTb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Oct 2022 08:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiJCMT3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Oct 2022 08:19:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EEA3DF26
        for <linux-media@vger.kernel.org>; Mon,  3 Oct 2022 05:19:28 -0700 (PDT)
Received: from desky.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22421440;
        Mon,  3 Oct 2022 14:19:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664799564;
        bh=WxP6tIlR6zgwcpiFChJebFIg8An19kx1E0AlLj2EuUM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CCPeCOkQqY0LaaIyFqgDpFaFtIsNIjfrev22I8nq6Jm2Fch3bxdp4aAEItEcjMteW
         Qb2+Nl/uSBSVmsiBmmKgV1KalwQAKP3tEwcrrNYAoclmyZ3TSQ/yKIX+IB2KZwlXKM
         4AZMHCa9tdRLbBuvHHKU95XsNUqkJOS9h3Nzwmw0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v15 07/19] media: subdev: add v4l2_subdev_set_routing helper()
Date:   Mon,  3 Oct 2022 15:18:40 +0300
Message-Id: <20221003121852.616745-8-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a helper function to set the subdev routing. The helper can be used
from subdev driver's set_routing op to store the routing table.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 31 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 16 ++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index fff17b8536fc..3ae4f39a50e4 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -12,6 +12,7 @@
 #include <linux/ioctl.h>
 #include <linux/mm.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/version.h>
@@ -1181,6 +1182,36 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
 
+int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    const struct v4l2_subdev_krouting *routing)
+{
+	struct v4l2_subdev_krouting *dst = &state->routing;
+	const struct v4l2_subdev_krouting *src = routing;
+	struct v4l2_subdev_krouting new_routing = { 0 };
+	size_t bytes;
+
+	if (unlikely(check_mul_overflow(src->num_routes, sizeof(*src->routes),
+					&bytes)))
+		return -EOVERFLOW;
+
+	lockdep_assert_held(state->lock);
+
+	if (src->num_routes > 0) {
+		new_routing.routes = kmemdup(src->routes, bytes, GFP_KERNEL);
+		if (!new_routing.routes)
+			return -ENOMEM;
+	}
+
+	new_routing.num_routes = src->num_routes;
+
+	kfree(dst->routes);
+	*dst = new_routing;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 45c41f4d6a2b..7962e6572bda 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1419,6 +1419,22 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
 int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format);
 
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
+			    const struct v4l2_subdev_krouting *routing);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
-- 
2.34.1

