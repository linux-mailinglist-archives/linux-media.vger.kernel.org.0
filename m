Return-Path: <linux-media+bounces-166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D49ED7E9281
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 21:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A29E280AB8
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 20:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BF218629;
	Sun, 12 Nov 2023 20:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cF9/gYRd"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031B91A287
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 20:21:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F4D2116
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 12:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699820504; x=1731356504;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W0dcxR0M6LW2i+Pn+4yQk3+B4tz/G/ceupSvGsJkzSA=;
  b=cF9/gYRdDRomoX/TIdNuBhNGBBUkl5TkxcGJxIoF8JQuwyze7CZ195yc
   R2LakUHPZ80XCnFS6Itx167jUc7xnr6TXTqQhM2qepFnle3dKxl3BDhzI
   voDhoHu3KtyXTalyAhYiYMHss20NO3puqCY7czYTNR0fkzZlySicfihpX
   p7qwwDpApclVyCL0MOc2W4bbezuIUko2OWNyJ9LmLat5CXLJ3kBgXySKN
   9lz1cpnQvEhrOqfoCr3gCIOsHmO2kKOt/sAWoBwhTIpQu/wzrc4akxYz6
   fvODhbICow/8gqZv7w0WyHeOPxRidH93rtTkAqsdSv2kEn0e6c4J6h9b4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="393217661"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="393217661"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 12:21:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="764177675"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="764177675"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 12:21:39 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7E300120AE0;
	Sun, 12 Nov 2023 21:57:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1r2GZl-0045dC-0Y;
	Sun, 12 Nov 2023 21:56:57 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v8 6/9] media: v4l: subdev: Always compile sub-device state access functions
Date: Sun, 12 Nov 2023 21:56:44 +0200
Message-Id: <20231112195647.974904-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231112195647.974904-1-sakari.ailus@linux.intel.com>
References: <20231112195647.974904-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compile sub-device state information access functions
v4l2_subdev_state_get_{format,crop,compose} unconditionally as they are
now also used by plain V4L2 drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 252 +++++++++++++-------------
 include/media/v4l2-subdev.h           | 128 ++++++-------
 2 files changed, 190 insertions(+), 190 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 5298226b6a4d..eb57a2582124 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1524,6 +1524,132 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
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
+		/*
+		 * Set the pad to 0 on error as this is aligned with the
+		 * behaviour of the pad state information access functions. The
+		 * purpose of setting pad to 0 here is to avoid accessing memory
+		 * outside the pads array, but still issuing warning of the
+		 * invalid access while making the caller's error handling
+		 * easier.
+		 */
+		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
+			pad = 0;
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
+		/*
+		 * Set the pad to 0 on error as this is aligned with the
+		 * behaviour of the pad state information access functions. The
+		 * purpose of setting pad to 0 here is to avoid accessing memory
+		 * outside the pads array, but still issuing warning of the
+		 * invalid access while making the caller's error handling
+		 * easier.
+		 */
+		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
+			pad = 0;
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
+		/*
+		 * Set the pad to 0 on error as this is aligned with the
+		 * behaviour of the pad state information access functions. The
+		 * purpose of setting pad to 0 here is to avoid accessing memory
+		 * outside the pads array, but still issuing warning of the
+		 * invalid access while making the caller's error handling
+		 * easier.
+		 */
+		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
+			pad = 0;
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
@@ -1670,132 +1796,6 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
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
-		/*
-		 * Set the pad to 0 on error as this is aligned with the
-		 * behaviour of the pad state information access functions. The
-		 * purpose of setting pad to 0 here is to avoid accessing memory
-		 * outside the pads array, but still issuing warning of the
-		 * invalid access while making the caller's error handling
-		 * easier.
-		 */
-		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
-			pad = 0;
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
-		/*
-		 * Set the pad to 0 on error as this is aligned with the
-		 * behaviour of the pad state information access functions. The
-		 * purpose of setting pad to 0 here is to avoid accessing memory
-		 * outside the pads array, but still issuing warning of the
-		 * invalid access while making the caller's error handling
-		 * easier.
-		 */
-		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
-			pad = 0;
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
-		/*
-		 * Set the pad to 0 on error as this is aligned with the
-		 * behaviour of the pad state information access functions. The
-		 * purpose of setting pad to 0 here is to avoid accessing memory
-		 * outside the pads array, but still issuing warning of the
-		 * invalid access while making the caller's error handling
-		 * easier.
-		 */
-		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
-			pad = 0;
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
index 6b34a4afba77..a26cb1e454d2 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1470,70 +1470,6 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
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
@@ -1610,6 +1546,70 @@ struct v4l2_rect *
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


