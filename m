Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557543FB450
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236527AbhH3LDk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43936 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236511AbhH3LDd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:33 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FFAB5A7;
        Mon, 30 Aug 2021 13:02:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321358;
        bh=QWFi3+Z4ec8n5lrgrBbbwQ/922FMwz8BNjA5XAjtoCU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YQMJ3EiPiOlYuWQpBok5YtoH34cwZZ2lQf0ZNNJ9piflmeCDYqvQCke/EaZDDTS3M
         nPWRr9Eh45whiYbOo92RMXpJrELHvAtuXJAsFoyCatigiDo1ExAj/A0uQMDR3B+bUG
         fIrYLA09Hyd5S1OJCb7QCZNWiVbt4zvZ3GFYgPRo=
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
Subject: [PATCH v8 31/36] media: subdev: add stream based configuration
Date:   Mon, 30 Aug 2021 14:01:11 +0300
Message-Id: <20210830110116.488338-32-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 drivers/media/v4l2-core/v4l2-subdev.c         | 136 ++++++++++++++++--
 include/media/v4l2-subdev.h                   |  48 +++++++
 include/uapi/linux/v4l2-subdev.h              |  28 +++-
 10 files changed, 225 insertions(+), 22 deletions(-)

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
index eb1103afbfbc..3df30e7e0fef 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -150,14 +150,45 @@ static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
 	return 0;
 }
 
-static int check_state_pads(u32 which, struct v4l2_subdev_state *state)
+static int check_state_pads(struct v4l2_subdev *sd, u32 which,
+			    struct v4l2_subdev_state *state)
 {
+	if (sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED)
+		return 0;
+
 	if (which == V4L2_SUBDEV_FORMAT_TRY && (!state || !state->pads))
 		return -EINVAL;
 
 	return 0;
 }
 
+static int check_state_pad_stream(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u32 stream)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED))
+		return 0;
+
+	/*
+	 * We need to take the state lock to access the format, but as we then
+	 * have to unlock, nothing prevents someone changing the state before
+	 * this call thread enters the driver's op and the driver has the
+	 * change to lock the state.
+	 */
+	v4l2_subdev_lock_state(state);
+
+	fmt = v4l2_state_get_stream_format(state, pad, stream);
+
+	v4l2_subdev_unlock_state(state);
+
+	if (!fmt)
+		return -EINVAL;
+
+	return 0;
+}
+
 static inline int check_format(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
@@ -166,7 +197,8 @@ static inline int check_format(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
-	       check_state_pads(format->which, state);
+	       check_state_pads(sd, format->which, state) ? :
+	       check_state_pad_stream(sd, state, format->pad, format->stream);
 }
 
 static int call_get_fmt(struct v4l2_subdev *sd,
@@ -193,7 +225,8 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
-	       check_state_pads(code->which, state) ? :
+	       check_state_pads(sd, code->which, state) ? :
+	       check_state_pad_stream(sd, state, code->pad, code->stream) ? :
 	       sd->ops->pad->enum_mbus_code(sd, state, code);
 }
 
@@ -205,7 +238,8 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
-	       check_state_pads(fse->which, state) ? :
+	       check_state_pads(sd, fse->which, state) ? :
+	       check_state_pad_stream(sd, state, fse->pad, fse->stream) ? :
 	       sd->ops->pad->enum_frame_size(sd, state, fse);
 }
 
@@ -240,7 +274,8 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
-	       check_state_pads(fie->which, state) ? :
+	       check_state_pads(sd, fie->which, state) ? :
+	       check_state_pad_stream(sd, state, fie->pad, fie->stream) ? :
 	       sd->ops->pad->enum_frame_interval(sd, state, fie);
 }
 
@@ -252,7 +287,8 @@ static inline int check_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
-	       check_state_pads(sel->which, state);
+	       check_state_pads(sd, sel->which, state) ? :
+	       check_state_pad_stream(sd, state, sel->pad, sel->stream);
 }
 
 static int call_get_selection(struct v4l2_subdev *sd,
@@ -868,6 +904,67 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
 	.poll = subdev_poll,
 };
 
+static int
+v4l2_init_stream_configs(struct v4l2_subdev_stream_configs *stream_configs,
+			 const struct v4l2_subdev_krouting *routing)
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
+		 * Each route needs a format on both ends of the route, except for
+		 * source streams which only need one format.
+		 */
+		num_configs += (route->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE) ? 1 : 2;
+	}
+
+	if (num_configs) {
+		stream_configs->configs =
+			kvcalloc(num_configs, sizeof(*stream_configs->configs),
+				 GFP_KERNEL);
+
+		if (!stream_configs->configs)
+			return -ENOMEM;
+
+		stream_configs->num_configs = num_configs;
+	}
+
+	/* Fill in the 'pad' and stream' value for each item in the array from the routing table */
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
 #ifdef CONFIG_MEDIA_CONTROLLER
 
 int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
@@ -1046,7 +1143,8 @@ __v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
 
 	state->which = which;
 
-	if (sd->entity.num_pads) {
+	/* Drivers that support streams do not need the legacy pad config */
+	if (!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED) && sd->entity.num_pads) {
 		state->pads = kvmalloc_array(sd->entity.num_pads,
 					     sizeof(*state->pads),
 					     GFP_KERNEL | __GFP_ZERO);
@@ -1080,6 +1178,7 @@ void v4l2_free_subdev_state(struct v4l2_subdev_state *state)
 	mutex_destroy(&state->lock);
 
 	kvfree(state->routing.routes);
+	kvfree(state->stream_configs.configs);
 	kvfree(state->pads);
 	kfree(state);
 }
@@ -1183,6 +1282,27 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
 		dst->which = src->which;
 	}
 
-	return 0;
+	return v4l2_init_stream_configs(&state->stream_configs, dst);
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
+
+struct v4l2_mbus_framefmt *
+v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
+			     u32 stream)
+{
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
+
+	lockdep_assert_held(&state->lock);
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
+EXPORT_SYMBOL_GPL(v4l2_state_get_stream_format);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 90e9fda6babb..5a2c7e2cb561 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -694,6 +694,37 @@ struct v4l2_subdev_pad_config {
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
@@ -717,6 +748,7 @@ struct v4l2_subdev_krouting {
  * @which: state type (from enum v4l2_subdev_format_whence)
  * @pads: &struct v4l2_subdev_pad_config array
  * @routing: routing table for the subdev
+ * @stream_configs: stream configurations (only for V4L2_SUBDEV_FL_MULTIPLEXED)
  *
  * This structure only needs to be passed to the pad op if the 'which' field
  * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
@@ -727,6 +759,7 @@ struct v4l2_subdev_state {
 	u32 which;
 	struct v4l2_subdev_pad_config *pads;
 	struct v4l2_subdev_krouting routing;
+	struct v4l2_subdev_stream_configs stream_configs;
 };
 
 /**
@@ -1452,4 +1485,19 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state,
 			    struct v4l2_subdev_krouting *routing);
 
+/**
+ * v4l2_state_get_stream_format() - Get pointer to a stream format
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
+v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
+			     u32 stream);
+
 #endif
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 3aa623e0e5f9..d00ef85db1c7 100644
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
2.25.1

