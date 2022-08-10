Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28F0B58EBC0
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 14:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbiHJMMP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 08:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232183AbiHJMMN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 08:12:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C16F6BD56
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 05:12:08 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EC1846EE;
        Wed, 10 Aug 2022 14:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660133511;
        bh=sUNKOpkw1NGTZaQ8g3Ug2tcCIdXTlszIGSYersZluvs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mIhIzvnMOkJxDQErj+5pph5eGUbGk8Kki7IPbIoNuFtjZskR1G6bwe3I/FEDMjV10
         X9BSukcbH3UfnRT7/4mRcTsesGGdoijFajNlwkC26JL6BQuhB2A2aBp7nQxJGUjufA
         vrV8aRMDGH9Q+bPLG5XEjMLQ/rNVOmAysyU+0h68=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v13 22/34] media: subdev: add v4l2_subdev_set_routing helper()
Date:   Wed, 10 Aug 2022 15:11:10 +0300
Message-Id: <20220810121122.3149086-23-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/media/v4l2-core/v4l2-subdev.c | 28 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 16 +++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 1ce9a7dc0c6e..f3f872c72180 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1180,6 +1180,34 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
 
+int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    const struct v4l2_subdev_krouting *routing)
+{
+	struct v4l2_subdev_krouting *dst = &state->routing;
+	const struct v4l2_subdev_krouting *src = routing;
+	struct v4l2_subdev_krouting new_routing = { 0 };
+
+	lockdep_assert_held(state->lock);
+
+	if (src->num_routes > 0) {
+		new_routing.routes = kmemdup(src->routes,
+			src->num_routes * sizeof(*src->routes),
+			GFP_KERNEL);
+
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
index 142089a0d1b7..767e4ebd97fe 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1412,6 +1412,22 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
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

