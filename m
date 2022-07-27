Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86860582486
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 12:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbiG0Kh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 06:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbiG0KhY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 06:37:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3DE474EF
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 03:37:19 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B555218CE;
        Wed, 27 Jul 2022 12:37:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658918230;
        bh=YgH5eF/tajBFOmsMJdoWlm3zUWAvIyAZRj+a6DcSOM8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GObRRdpN2Trf7GFxObGcn1mLzgnOK6QxDAXSo5bPS8uep/vKr5YUgFJRgGdTh6C03
         lwp843u1aYJnqWNH80jXDKYUKjmUKIY71nEiQaPa23UMTHMoP2hUqnTD1tplWj3NzE
         y3CXCpgUGK2e0uDgXVnd2bVChu9m1PpE2cuf6NI0=
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
Subject: [PATCH v12 17/30] media: subdev: add stream based configuration
Date:   Wed, 27 Jul 2022 13:36:26 +0300
Message-Id: <20220727103639.581567-18-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
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

Add support to manage configurations (format, crop, compose) per stream,
instead of per pad. This is accomplished with data structures that hold
an array of all subdev's stream configurations.

The number of streams can vary at runtime based on routing. Every time
the routing is changed, the stream configurations need to be
re-initialized.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../v4l/vidioc-subdev-enum-frame-interval.rst |   5 +-
 .../v4l/vidioc-subdev-enum-frame-size.rst     |   5 +-
 .../v4l/vidioc-subdev-enum-mbus-code.rst      |   5 +-
 .../media/v4l/vidioc-subdev-g-crop.rst        |   5 +-
 .../media/v4l/vidioc-subdev-g-fmt.rst         |   5 +-
 .../v4l/vidioc-subdev-g-frame-interval.rst    |   5 +-
 .../media/v4l/vidioc-subdev-g-selection.rst   |   5 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 156 +++++++++++++++++-
 include/media/v4l2-subdev.h                   |  79 +++++++++
 include/uapi/linux/v4l2-subdev.h              |  28 +++-
 10 files changed, 276 insertions(+), 22 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
index 3703943b412f..8def4c05d3da 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
@@ -92,7 +92,10 @@ multiple pads of the same sub-device is not defined.
       - Frame intervals to be enumerated, from enum
 	:ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
     * - __u32
-      - ``reserved``\ [8]
+      - ``stream``
+      - Stream identifier.
+    * - __u32
+      - ``reserved``\ [7]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
index c25a9896df0e..3ef361c0dca7 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
@@ -97,7 +97,10 @@ information about try formats.
       - Frame sizes to be enumerated, from enum
 	:ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
     * - __u32
-      - ``reserved``\ [8]
+      - ``stream``
+      - Stream identifier.
+    * - __u32
+      - ``reserved``\ [7]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
index 417f1a19bcc4..248f6f9ee7c5 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
@@ -73,7 +73,10 @@ information about the try formats.
       - ``flags``
       - See :ref:`v4l2-subdev-mbus-code-flags`
     * - __u32
-      - ``reserved``\ [7]
+      - ``stream``
+      - Stream identifier.
+    * - __u32
+      - ``reserved``\ [6]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
index bd15c0a5a66b..1d267f7e7991 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
@@ -96,7 +96,10 @@ modified format should be as close as possible to the original request.
       - ``rect``
       - Crop rectangle boundaries, in pixels.
     * - __u32
-      - ``reserved``\ [8]
+      - ``stream``
+      - Stream identifier.
+    * - __u32
+      - ``reserved``\ [7]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
index 7acdbb939d89..ed253a1e44b7 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
@@ -102,7 +102,10 @@ should be as close as possible to the original request.
       - Definition of an image format, see :c:type:`v4l2_mbus_framefmt` for
 	details.
     * - __u32
-      - ``reserved``\ [8]
+      - ``stream``
+      - Stream identifier.
+    * - __u32
+      - ``reserved``\ [7]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
index d7fe7543c506..842f962d2aea 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
@@ -90,7 +90,10 @@ the same sub-device is not defined.
       - ``interval``
       - Period, in seconds, between consecutive video frames.
     * - __u32
-      - ``reserved``\ [9]
+      - ``stream``
+      - Stream identifier.
+    * - __u32
+      - ``reserved``\ [8]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
index f9172a42f036..6b629c19168c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
@@ -94,7 +94,10 @@ Selection targets and flags are documented in
       - ``r``
       - Selection rectangle, in pixels.
     * - __u32
-      - ``reserved``\ [8]
+      - ``stream``
+      - Stream identifier.
+    * - __u32
+      - ``reserved``\ [7]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 0b841cf74c74..d26715cbd955 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -154,8 +154,17 @@ static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
 	return 0;
 }
 
-static int check_state_pads(u32 which, struct v4l2_subdev_state *state)
+static int check_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+		       u32 which, u32 pad, u32 stream)
 {
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	if (sd->flags & V4L2_SUBDEV_FL_STREAMS) {
+		if (!v4l2_subdev_state_get_stream_format(state, pad, stream))
+			return -EINVAL;
+		return 0;
+	}
+#endif
+
 	if (which == V4L2_SUBDEV_FORMAT_TRY && (!state || !state->pads))
 		return -EINVAL;
 
@@ -170,7 +179,7 @@ static inline int check_format(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
-	       check_state_pads(format->which, state);
+	       check_state(sd, state, format->which, format->pad, format->stream);
 }
 
 static int call_get_fmt(struct v4l2_subdev *sd,
@@ -197,7 +206,7 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
-	       check_state_pads(code->which, state) ? :
+	       check_state(sd, state, code->which, code->pad, code->stream) ? :
 	       sd->ops->pad->enum_mbus_code(sd, state, code);
 }
 
@@ -209,7 +218,7 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
-	       check_state_pads(fse->which, state) ? :
+	       check_state(sd, state, fse->which, fse->pad, fse->stream) ? :
 	       sd->ops->pad->enum_frame_size(sd, state, fse);
 }
 
@@ -244,7 +253,7 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
-	       check_state_pads(fie->which, state) ? :
+	       check_state(sd, state, fie->which, fie->pad, fie->stream) ? :
 	       sd->ops->pad->enum_frame_interval(sd, state, fie);
 }
 
@@ -256,7 +265,7 @@ static inline int check_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
-	       check_state_pads(sel->which, state);
+	       check_state(sd, state, sel->which, sel->pad, sel->stream);
 }
 
 static int call_get_selection(struct v4l2_subdev *sd,
@@ -915,6 +924,72 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 
+static int
+v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs *stream_configs,
+				const struct v4l2_subdev_krouting *routing)
+{
+	u32 num_configs = 0;
+	unsigned int i;
+	u32 format_idx = 0;
+
+	kvfree(stream_configs->configs);
+	stream_configs->configs = NULL;
+	stream_configs->num_configs = 0;
+
+	/* Count number of formats needed */
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		/*
+		 * Each route needs a format on both ends of the route, except
+		 * for source streams which only need one format.
+		 */
+		num_configs +=
+			(route->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE) ? 1 : 2;
+	}
+
+	if (!num_configs)
+		return 0;
+
+	stream_configs->configs = kvcalloc(num_configs,
+					   sizeof(*stream_configs->configs),
+					   GFP_KERNEL);
+
+	if (!stream_configs->configs)
+		return -ENOMEM;
+
+	stream_configs->num_configs = num_configs;
+
+	/*
+	 * Fill in the 'pad' and stream' value for each item in the array from
+	 * the routing table
+	 */
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+		u32 idx;
+
+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE)) {
+			idx = format_idx++;
+
+			stream_configs->configs[idx].pad = route->sink_pad;
+			stream_configs->configs[idx].stream = route->sink_stream;
+		}
+
+		idx = format_idx++;
+
+		stream_configs->configs[idx].pad = route->source_pad;
+		stream_configs->configs[idx].stream = route->source_stream;
+	}
+
+	return 0;
+}
+
 int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
 				      struct fwnode_endpoint *endpoint)
 {
@@ -1089,7 +1164,8 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
 	else
 		state->lock = &state->_lock;
 
-	if (sd->entity.num_pads) {
+	/* Drivers that support streams do not need the legacy pad config */
+	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS) && sd->entity.num_pads) {
 		state->pads = kvcalloc(sd->entity.num_pads,
 				       sizeof(*state->pads), GFP_KERNEL);
 		if (!state->pads) {
@@ -1129,6 +1205,7 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
 	mutex_destroy(&state->_lock);
 
 	kfree(state->routing.routes);
+	kvfree(state->stream_configs.configs);
 	kvfree(state->pads);
 	kfree(state);
 }
@@ -1199,10 +1276,73 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
 		dst->num_routes = src->num_routes;
 	}
 
-	return 0;
+	return v4l2_subdev_init_stream_configs(&state->stream_configs, dst);
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
 
+struct v4l2_mbus_framefmt *
+v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
+				    unsigned int pad, u32 stream)
+{
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
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
+EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_format);
+
+struct v4l2_rect *
+v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
+				  unsigned int pad, u32 stream)
+{
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
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
+EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_crop);
+
+struct v4l2_rect *
+v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
+				     unsigned int pad, u32 stream)
+{
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
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
+EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_compose);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 37081a2e6697..6d177fc609f7 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -691,6 +691,37 @@ struct v4l2_subdev_pad_config {
 	struct v4l2_rect try_compose;
 };
 
+/**
+ * struct v4l2_subdev_stream_config - Used for storing stream configuration.
+ *
+ * @pad: pad number
+ * @stream: stream number
+ * @fmt: &struct v4l2_mbus_framefmt
+ * @crop: &struct v4l2_rect to be used for crop
+ * @compose: &struct v4l2_rect to be used for compose
+ *
+ * This structure stores configuration for a stream.
+ */
+struct v4l2_subdev_stream_config {
+	u32 pad;
+	u32 stream;
+
+	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_rect crop;
+	struct v4l2_rect compose;
+};
+
+/**
+ * struct v4l2_subdev_stream_configs - A collection of stream configs.
+ *
+ * @num_configs: number of entries in @config.
+ * @configs: an array of &struct v4l2_subdev_stream_configs.
+ */
+struct v4l2_subdev_stream_configs {
+	u32 num_configs;
+	struct v4l2_subdev_stream_config *configs;
+};
+
 /**
  * struct v4l2_subdev_krouting - subdev routing table
  *
@@ -711,6 +742,7 @@ struct v4l2_subdev_krouting {
  * @lock: mutex for the state. May be replaced by the user.
  * @pads: &struct v4l2_subdev_pad_config array
  * @routing: routing table for the subdev
+ * @stream_configs: stream configurations (only for V4L2_SUBDEV_FL_STREAMS)
  *
  * This structure only needs to be passed to the pad op if the 'which' field
  * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
@@ -722,6 +754,7 @@ struct v4l2_subdev_state {
 	struct mutex *lock;
 	struct v4l2_subdev_pad_config *pads;
 	struct v4l2_subdev_krouting routing;
+	struct v4l2_subdev_stream_configs stream_configs;
 };
 
 /**
@@ -1423,6 +1456,52 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state,
 			    struct v4l2_subdev_krouting *routing);
 
+/**
+ * v4l2_subdev_state_get_stream_format() - Get pointer to a stream format
+ * @state: subdevice state
+ * @pad: pad id
+ * @stream: stream id
+ *
+ * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
+ * stream in the subdev state.
+ *
+ * If the state does not contain the given pad + stream, NULL is returned.
+ */
+struct v4l2_mbus_framefmt *
+v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
+				    unsigned int pad, u32 stream);
+
+/**
+ * v4l2_subdev_state_get_stream_crop() - Get pointer to a stream crop rectangle
+ * @state: subdevice state
+ * @pad: pad id
+ * @stream: stream id
+ *
+ * This returns a pointer to crop rectangle for the given pad + stream in the
+ * subdev state.
+ *
+ * If the state does not contain the given pad + stream, NULL is returned.
+ */
+struct v4l2_rect *
+v4l2_subdev_state_get_stream_crop(struct v4l2_subdev_state *state,
+				  unsigned int pad, u32 stream);
+
+/**
+ * v4l2_subdev_state_get_stream_compose() - Get pointer to a stream compose
+ *					    rectangle
+ * @state: subdevice state
+ * @pad: pad id
+ * @stream: stream id
+ *
+ * This returns a pointer to compose rectangle for the given pad + stream in the
+ * subdev state.
+ *
+ * If the state does not contain the given pad + stream, NULL is returned.
+ */
+struct v4l2_rect *
+v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
+				     unsigned int pad, u32 stream);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index ae393f9f17c1..429390c2f8a0 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -44,13 +44,15 @@ enum v4l2_subdev_format_whence {
  * @which: format type (from enum v4l2_subdev_format_whence)
  * @pad: pad number, as reported by the media API
  * @format: media bus format (format code and frame size)
+ * @stream: stream number, defined in subdev routing
  * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_format {
 	__u32 which;
 	__u32 pad;
 	struct v4l2_mbus_framefmt format;
-	__u32 reserved[8];
+	__u32 stream;
+	__u32 reserved[7];
 };
 
 /**
@@ -58,13 +60,15 @@ struct v4l2_subdev_format {
  * @which: format type (from enum v4l2_subdev_format_whence)
  * @pad: pad number, as reported by the media API
  * @rect: pad crop rectangle boundaries
+ * @stream: stream number, defined in subdev routing
  * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_crop {
 	__u32 which;
 	__u32 pad;
 	struct v4l2_rect rect;
-	__u32 reserved[8];
+	__u32 stream;
+	__u32 reserved[7];
 };
 
 #define V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE	0x00000001
@@ -80,6 +84,7 @@ struct v4l2_subdev_crop {
  * @code: format code (MEDIA_BUS_FMT_ definitions)
  * @which: format type (from enum v4l2_subdev_format_whence)
  * @flags: flags set by the driver, (V4L2_SUBDEV_MBUS_CODE_*)
+ * @stream: stream number, defined in subdev routing
  * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_mbus_code_enum {
@@ -88,7 +93,8 @@ struct v4l2_subdev_mbus_code_enum {
 	__u32 code;
 	__u32 which;
 	__u32 flags;
-	__u32 reserved[7];
+	__u32 stream;
+	__u32 reserved[6];
 };
 
 /**
@@ -101,6 +107,7 @@ struct v4l2_subdev_mbus_code_enum {
  * @min_height: minimum frame height, in pixels
  * @max_height: maximum frame height, in pixels
  * @which: format type (from enum v4l2_subdev_format_whence)
+ * @stream: stream number, defined in subdev routing
  * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_frame_size_enum {
@@ -112,19 +119,22 @@ struct v4l2_subdev_frame_size_enum {
 	__u32 min_height;
 	__u32 max_height;
 	__u32 which;
-	__u32 reserved[8];
+	__u32 stream;
+	__u32 reserved[7];
 };
 
 /**
  * struct v4l2_subdev_frame_interval - Pad-level frame rate
  * @pad: pad number, as reported by the media API
  * @interval: frame interval in seconds
+ * @stream: stream number, defined in subdev routing
  * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_frame_interval {
 	__u32 pad;
 	struct v4l2_fract interval;
-	__u32 reserved[9];
+	__u32 stream;
+	__u32 reserved[8];
 };
 
 /**
@@ -136,6 +146,7 @@ struct v4l2_subdev_frame_interval {
  * @height: frame height in pixels
  * @interval: frame interval in seconds
  * @which: format type (from enum v4l2_subdev_format_whence)
+ * @stream: stream number, defined in subdev routing
  * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_frame_interval_enum {
@@ -146,7 +157,8 @@ struct v4l2_subdev_frame_interval_enum {
 	__u32 height;
 	struct v4l2_fract interval;
 	__u32 which;
-	__u32 reserved[8];
+	__u32 stream;
+	__u32 reserved[7];
 };
 
 /**
@@ -158,6 +170,7 @@ struct v4l2_subdev_frame_interval_enum {
  *	    defined in v4l2-common.h; V4L2_SEL_TGT_* .
  * @flags: constraint flags, defined in v4l2-common.h; V4L2_SEL_FLAG_*.
  * @r: coordinates of the selection window
+ * @stream: stream number, defined in subdev routing
  * @reserved: for future use, set to zero for now
  *
  * Hardware may use multiple helper windows to process a video stream.
@@ -170,7 +183,8 @@ struct v4l2_subdev_selection {
 	__u32 target;
 	__u32 flags;
 	struct v4l2_rect r;
-	__u32 reserved[8];
+	__u32 stream;
+	__u32 reserved[7];
 };
 
 /**
-- 
2.34.1

