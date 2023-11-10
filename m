Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 916E77E7EB4
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344819AbjKJRrF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Nov 2023 12:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235273AbjKJRqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Nov 2023 12:46:05 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103CA27059
        for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 02:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699611076; x=1731147076;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1envzB6of0JuCIzNYwZEfwIsvSnlRVpw0J3YwgfNxIw=;
  b=BEjKj+609wgtSZjLLu3bSR2vnIrwXZCkGCyeMUfQPcwanqjNa9KeDbiv
   IPxnnzjgZClEjGQelEz+HCyP7SAmzCxSst5KbPrv0inwOPsmeV6Kh+v8S
   vF+KnRJmjamssBJn0CWx6e8ouDd1LLcCV67QYkH5FFrazwWCdHLPynoLo
   JQ903zZDwAMWx9v+pIwXznP7BGHUVuuY2Njezu7YLo0rSOP4mguHZ/tLN
   nuwc5zF5nS5WwJQALg7cQUhlvPBhTfcVUFGN6WYOof0AVBmXBH+JSzEC3
   8N+Y3Wo6Rs/WYm8HtfGDV9JtgKftpwkRo/ZwCIln9X+tbzqaRrlng7+gT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="375204766"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="375204766"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 02:11:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="713606600"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="713606600"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 02:11:14 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 62E9E11F7D1;
        Fri, 10 Nov 2023 12:11:11 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1r1OTb-003jgL-0Z;
        Fri, 10 Nov 2023 12:10:59 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com
Subject: [PATCH 1/1] media: v4l: subdev: Always compile sub-device state access functions
Date:   Fri, 10 Nov 2023 12:10:49 +0200
Message-Id: <20231110101049.890577-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Compile sub-device state information access functions
v4l2_subdev_state_get_{format,crop,compose} unconditionally as they are
now also used by plain V4L2 drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 204 +++++++++++++-------------
 include/media/v4l2-subdev.h           | 128 ++++++++--------
 2 files changed, 166 insertions(+), 166 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 57ef4fce1186..efb39172b20f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1524,6 +1524,108 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
 
+struct v4l2_mbus_framefmt *
+__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
+			       unsigned int pad, u32 stream)
+{
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
+
+	if (WARN_ON_ONCE(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		if (pad >= state->sd->entity.num_pads)
+			return NULL;
+
+		return &state->pads[pad].format;
+	}
+
+	lockdep_assert_held(state->lock);
+
+	stream_configs = &state->stream_configs;
+
+	for (i = 0; i < stream_configs->num_configs; ++i) {
+		if (stream_configs->configs[i].pad == pad &&
+		    stream_configs->configs[i].stream == stream)
+			return &stream_configs->configs[i].fmt;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format);
+
+struct v4l2_rect *
+__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
+			     u32 stream)
+{
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
+
+	if (WARN_ON_ONCE(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		if (pad >= state->sd->entity.num_pads)
+			return NULL;
+
+		return &state->pads[pad].crop;
+	}
+
+	lockdep_assert_held(state->lock);
+
+	stream_configs = &state->stream_configs;
+
+	for (i = 0; i < stream_configs->num_configs; ++i) {
+		if (stream_configs->configs[i].pad == pad &&
+		    stream_configs->configs[i].stream == stream)
+			return &stream_configs->configs[i].crop;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop);
+
+struct v4l2_rect *
+__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
+				unsigned int pad, u32 stream)
+{
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
+
+	if (WARN_ON_ONCE(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		if (pad >= state->sd->entity.num_pads)
+			return NULL;
+
+		return &state->pads[pad].compose;
+	}
+
+	lockdep_assert_held(state->lock);
+
+	stream_configs = &state->stream_configs;
+
+	for (i = 0; i < stream_configs->num_configs; ++i) {
+		if (stream_configs->configs[i].pad == pad &&
+		    stream_configs->configs[i].stream == stream)
+			return &stream_configs->configs[i].compose;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
+
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 
 static int
@@ -1670,108 +1772,6 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
 
-struct v4l2_mbus_framefmt *
-__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
-			       unsigned int pad, u32 stream)
-{
-	struct v4l2_subdev_stream_configs *stream_configs;
-	unsigned int i;
-
-	if (WARN_ON_ONCE(!state))
-		return NULL;
-
-	if (state->pads) {
-		if (stream)
-			return NULL;
-
-		if (pad >= state->sd->entity.num_pads)
-			return NULL;
-
-		return &state->pads[pad].format;
-	}
-
-	lockdep_assert_held(state->lock);
-
-	stream_configs = &state->stream_configs;
-
-	for (i = 0; i < stream_configs->num_configs; ++i) {
-		if (stream_configs->configs[i].pad == pad &&
-		    stream_configs->configs[i].stream == stream)
-			return &stream_configs->configs[i].fmt;
-	}
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format);
-
-struct v4l2_rect *
-__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
-			     u32 stream)
-{
-	struct v4l2_subdev_stream_configs *stream_configs;
-	unsigned int i;
-
-	if (WARN_ON_ONCE(!state))
-		return NULL;
-
-	if (state->pads) {
-		if (stream)
-			return NULL;
-
-		if (pad >= state->sd->entity.num_pads)
-			return NULL;
-
-		return &state->pads[pad].crop;
-	}
-
-	lockdep_assert_held(state->lock);
-
-	stream_configs = &state->stream_configs;
-
-	for (i = 0; i < stream_configs->num_configs; ++i) {
-		if (stream_configs->configs[i].pad == pad &&
-		    stream_configs->configs[i].stream == stream)
-			return &stream_configs->configs[i].crop;
-	}
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop);
-
-struct v4l2_rect *
-__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
-				unsigned int pad, u32 stream)
-{
-	struct v4l2_subdev_stream_configs *stream_configs;
-	unsigned int i;
-
-	if (WARN_ON_ONCE(!state))
-		return NULL;
-
-	if (state->pads) {
-		if (stream)
-			return NULL;
-
-		if (pad >= state->sd->entity.num_pads)
-			return NULL;
-
-		return &state->pads[pad].compose;
-	}
-
-	lockdep_assert_held(state->lock);
-
-	stream_configs = &state->stream_configs;
-
-	for (i = 0; i < stream_configs->num_configs; ++i) {
-		if (stream_configs->configs[i].pad == pad &&
-		    stream_configs->configs[i].stream == stream)
-			return &stream_configs->configs[i].compose;
-	}
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
-
 int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
 					  u32 pad, u32 stream, u32 *other_pad,
 					  u32 *other_stream)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b1bad946d813..33c8e5c93a3d 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1393,70 +1393,6 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
 	return sd->active_state;
 }
 
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-
-/**
- * v4l2_subdev_get_fmt() - Fill format based on state
- * @sd: subdevice
- * @state: subdevice state
- * @format: pointer to &struct v4l2_subdev_format
- *
- * Fill @format->format field based on the information in the @format struct.
- *
- * This function can be used by the subdev drivers which support active state to
- * implement v4l2_subdev_pad_ops.get_fmt if the subdev driver does not need to
- * do anything special in their get_fmt op.
- *
- * Returns 0 on success, error value otherwise.
- */
-int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
-			struct v4l2_subdev_format *format);
-
-/**
- * v4l2_subdev_set_routing() - Set given routing to subdev state
- * @sd: The subdevice
- * @state: The subdevice state
- * @routing: Routing that will be copied to subdev state
- *
- * This will release old routing table (if any) from the state, allocate
- * enough space for the given routing, and copy the routing.
- *
- * This can be used from the subdev driver's set_routing op, after validating
- * the routing.
- */
-int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *state,
-			    const struct v4l2_subdev_krouting *routing);
-
-struct v4l2_subdev_route *
-__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
-				struct v4l2_subdev_route *route);
-
-/**
- * for_each_active_route - iterate on all active routes of a routing table
- * @routing: The routing table
- * @route: The route iterator
- */
-#define for_each_active_route(routing, route) \
-	for ((route) = NULL;                  \
-	     ((route) = __v4l2_subdev_next_active_route((routing), (route)));)
-
-/**
- * v4l2_subdev_set_routing_with_fmt() - Set given routing and format to subdev
- *					state
- * @sd: The subdevice
- * @state: The subdevice state
- * @routing: Routing that will be copied to subdev state
- * @fmt: Format used to initialize all the streams
- *
- * This is the same as v4l2_subdev_set_routing, but additionally initializes
- * all the streams using the given format.
- */
-int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
-				     struct v4l2_subdev_state *state,
-				     const struct v4l2_subdev_krouting *routing,
-				     const struct v4l2_mbus_framefmt *fmt);
-
 /*
  * A macro to generate the macro or function name for sub-devices state access
  * wrapper macros below.
@@ -1533,6 +1469,70 @@ struct v4l2_rect *
 __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
 				unsigned int pad, u32 stream);
 
+#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
+
+/**
+ * v4l2_subdev_get_fmt() - Fill format based on state
+ * @sd: subdevice
+ * @state: subdevice state
+ * @format: pointer to &struct v4l2_subdev_format
+ *
+ * Fill @format->format field based on the information in the @format struct.
+ *
+ * This function can be used by the subdev drivers which support active state to
+ * implement v4l2_subdev_pad_ops.get_fmt if the subdev driver does not need to
+ * do anything special in their get_fmt op.
+ *
+ * Returns 0 on success, error value otherwise.
+ */
+int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+			struct v4l2_subdev_format *format);
+
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
+struct v4l2_subdev_route *
+__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
+				struct v4l2_subdev_route *route);
+
+/**
+ * for_each_active_route - iterate on all active routes of a routing table
+ * @routing: The routing table
+ * @route: The route iterator
+ */
+#define for_each_active_route(routing, route) \
+	for ((route) = NULL;                  \
+	     ((route) = __v4l2_subdev_next_active_route((routing), (route)));)
+
+/**
+ * v4l2_subdev_set_routing_with_fmt() - Set given routing and format to subdev
+ *					state
+ * @sd: The subdevice
+ * @state: The subdevice state
+ * @routing: Routing that will be copied to subdev state
+ * @fmt: Format used to initialize all the streams
+ *
+ * This is the same as v4l2_subdev_set_routing, but additionally initializes
+ * all the streams using the given format.
+ */
+int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     const struct v4l2_subdev_krouting *routing,
+				     const struct v4l2_mbus_framefmt *fmt);
+
 /**
  * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
  * @routing: routing used to find the opposite side
-- 
2.39.2

