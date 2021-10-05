Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69FFE4221B7
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 11:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbhJEJKL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:10:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33232 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbhJEJKK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:10:10 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3FAA25B;
        Tue,  5 Oct 2021 11:08:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633424898;
        bh=N95h6kO2iwn19dikvopU8Z2Jhr2NzC6+nz5wzNs4u8w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=v1zSWX/DOHR+WnRSpvLSNFGieyvMC+Z8VuTElXvgl7hWShZ+P6o5v99qnKV3pBE6C
         mWxcZDvNyUVz8rE6Z0GQX7N3I9tg1bPvPLwRYjnI0QkU19bAEs/IJXGkRTgPPURj4+
         xEd5bhUY7enzzpSQZfZmjIFkCPodCdfCfqOcJVqw=
Subject: Re: [PATCH v9 00/36] v4l: subdev internal routing and streams
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <3a9953b0-9a52-dcd0-7d2c-648309d20f6e@ideasonboard.com>
Date:   Tue, 5 Oct 2021 12:08:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 11:57, Tomi Valkeinen wrote:
> Hi,
> 
> This is v9 of the multiplexed streams series. v8 can be found from:
> 
> https://lore.kernel.org/all/20210830110116.488338-1-tomi.valkeinen@ideasonboard.com/

Here is a diff between v8 and v9, which may help in reviews.

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index b28607c3fc79..410e03a29f2a 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -523,7 +523,7 @@ Centrally managed subdev active state
  
  Traditionally V4L2 subdev drivers maintained internal state for the active
  configuration for the subdev. This is often implemented as an array of struct
-v4l2_mbus_framefmt, on entry for each pad.
+v4l2_mbus_framefmt, one entry for each pad.
  
  In addition to the active configuration, each subdev filehandle has contained
  an array of struct v4l2_subdev_pad_config, managed by V4L2 core, which
@@ -531,17 +531,28 @@ contains the TRY configuration.
  
  To simplify the subdev drivers the V4L2 subdev API now optionally supports a
  centrally managed active configuration. A subdev driver must use
-v4l2_subdev_alloc_state() to initialize the active state between calls to
-media_entity_pads_init() and v4l2_*_register_subdev().
+v4l2_subdev_init_finalize() to initialize the active state between calls to
+media_entity_pads_init() and v4l2_*_register_subdev(), and must call
+v4l2_subdev_cleanup() to free the state.
  
-The active state must be locked before access, and can be done with e.g.
+The active state must be locked before access, and can be done with
  v4l2_subdev_lock_state() or v4l2_subdev_lock_active_state().
  
  The V4L2 core will pass either the TRY or ACTIVE state to various subdev ops.
-Unfortunately all the subdev drivers do not comply with this yet, and may
-pass NULL for the ACTIVE case, so the called subdev ops must also handle the
-NULL case. This can be easily managed by the helpers
-v4l2_subdev_validate_state() or v4l2_subdev_validate_and_lock_state().
+Unfortunately all the subdev drivers do not comply with this yet, and may pass
+NULL for the ACTIVE case. This is only a problem for subdev drivers which use
+the cetrally managed active state and are used in media pipelines with older
+subdev drivers. In these cases the called subdev ops must also handle the NULL
+case. This can be easily managed by the use of
+v4l2_subdev_validate_and_lock_state() helper.
+
+Streams, multiplexed media pads and internal routing
+----------------------------------------------------
+
+A subdevice driver can implement support for multiplexed streams by setting
+the V4L2_SUBDEV_FL_MULTIPLEXED subdev flag and implementing support for
+centrally managed subdev active state, routing and stream based
+configuration.
  
  V4L2 sub-device functions and data structures
  ---------------------------------------------
diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index a67c2749089a..ea3efa97bb08 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -503,3 +503,167 @@ source pads.
      :maxdepth: 1
  
      subdev-formats
+
+Streams, multiplexed media pads and internal routing
+----------------------------------------------------
+
+Commonly V4L2 subdevices support only separate video streams, that is, each
+link in the media grap and each pad in a subdevice passes through a single
+video stream. Thus each pad contains a format configuration for that single
+stream. In some cases a subdev can do stream processing and split a stream
+into two or compose two streams into one, but the inputs and outputs for the
+subdev are still a single stream per pad.
+
+Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, a single
+bus carries multiple streams. Thus a camera could output two streams, a pixel
+stream and a metadata stream, and a bridge subdev could route the streams
+from multiple input pads into a single output pad.
+
+Subdevice drivers that support multiplexed streams are compatible with
+non-multiplexed subdev drivers, but, of course, requires such a routing
+configuration where the link between those two types of drivers contain only
+a single stream.
+
+Understanding streams
+^^^^^^^^^^^^^^^^^^^^^
+
+A stream is a stream of content (e.g. pixel data or metadata) flowing through
+the media pipeline from a source (e.g. a sensor) towards the final sink
+(e.g. a receiver in a SoC). Each media link carries all the streams from
+one end of the link to the other, whereas subdevices have routing tables
+which describe how the incoming streams from sink pads are routed to the
+source pads.
+
+A stream ID (often just "stream") is a media link-local identifier for a
+stream. In other words, configuration for a particular stream ID must exist
+on both sides of a media link, but another stream ID can be used for the same
+stream at the other side of the subdevice.
+
+A stream at a specific point in the media pipeline is identified with the
+subdev and a (pad, stream) pair. For subdevices that do not support
+multiplexed streams the 'stream' is always 0.
+
+Configuring streams
+^^^^^^^^^^^^^^^^^^^
+
+The configuration of the streams is done individually for each subdevice and
+the validity of the streams between subdevices is validated when the pipeline
+is started.
+
+There are three steps in configuring the streams:
+
+1) Set up links. Connect the pads between subdevices using the :ref:`Media
+Controller API <media_controller>`
+
+2) Routing. The routing table for the subdevice must be set with
+:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
+
+3) Configure streams. Each route endpoint must be configured
+with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
+
+Multiplexed streams setup example
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+A simple example of a multiplexed stream setup might be as follows:
+
+- Two identical sensors (Sensor A and Sensor B). Each sensor has a single
+  source pad (pad 0), and outputs two streams, pixel data and metadata.
+
+- Multiplexer bridge (Bridge). The bridge has two sink pads, connected to the
+  sensors (pads 0, 1), and one source pad (pad 2), which outputs all 4
+  streams.
+
+- Receiver in the SoC (Receiver). The receiver has a single sink pad (pad 0),
+  connected to the bridge, and four source pads (pads 1-4), going to the DMA
+  engine. The receiver demultiplexes the incoming streams to the four source
+  pads.
+
+- Four DMA Engines in the SoC (DMA Engine). Each DMA engine is connected to a
+  single source pad in the receiver.
+
+The sensors, the bridge and the receiver are modeled as V4L2 subdevices,
+exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
+modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
+
+To configure this pipeline, the userspace must take the following steps:
+
+1) Set up media links between entities: connect the sensors to the bridge,
+bridge to the receiver, and the receiver to the DMA engines. This step does
+not differ from normal non-multiplexed media controller setup.
+
+2) Configure routing.
+
+.. flat-table:: Sensor routing table (identical on both sensors)
+    :header-rows:  1
+
+    * - Sink Pad/Stream
+      - Source Pad/Stream
+      - Routing Flags
+      - Comments
+    * - 0/0 (unused)
+      - 0/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_SOURCE
+      - Pixel data stream. Source route, i.e. the sink fields are unused.
+    * - 0/0 (unused)
+      - 0/1
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE | V4L2_SUBDEV_ROUTE_FL_SOURCE
+      - Metadata stream. Source route, i.e. the sink fields are unused.
+
+.. flat-table:: Bridge routing table
+    :header-rows:  1
+
+    * - Sink Pad/Stream
+      - Source Pad/Stream
+      - Routing Flags
+      - Comments
+    * - 0/0
+      - 2/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from Sensor A
+    * - 0/1
+      - 2/1
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from Sensor A
+    * - 1/0
+      - 2/2
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from Sensor B
+    * - 1/1
+      - 2/3
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from Sensor B
+
+.. flat-table:: Receiver routing table
+    :header-rows:  1
+
+    * - Sink Pad/Stream
+      - Source Pad/Stream
+      - Routing Flags
+      - Comments
+    * - 0/0
+      - 1/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from Sensor A
+    * - 0/1
+      - 2/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from Sensor A
+    * - 0/2
+      - 3/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Pixel data stream from Sensor B
+    * - 0/3
+      - 4/0
+      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
+      - Metadata stream from Sensor B
+
+3) Configure streams
+
+After configuring the routing table, the next step is configuring the streams.
+This step is similar to configuring the pads in a non-multiplexed streams
+setup, with the difference that we need to configure each (pad, stream) pair
+(i.e. route endpoint), instead of just a pad.
+
+Presuming there are no format conversions in the pipeline, the userspace needs
+to configure all the route endpoints using four formats (two pixel formats
+and two metadata formats) with VIDIOC_SUBDEV_S_FMT.
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 1de30d5b437f..e6bd94d63e4f 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -244,6 +244,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
  {
  	struct v4l2_subdev *sd = vin_to_source(vin);
  	struct v4l2_subdev_state *sd_state;
+	static struct lock_class_key key;
  	struct v4l2_subdev_format format = {
  		.which = which,
  		.pad = vin->parallel.source_pad,
@@ -252,7 +253,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
  	u32 width, height;
  	int ret;
  
-	sd_state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_ACTIVE);
+	sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
  	if (IS_ERR(sd_state))
  		return PTR_ERR(sd_state);
  
@@ -288,7 +289,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
  
  	rvin_format_align(vin, pix);
  done:
-	v4l2_free_subdev_state(sd_state);
+	__v4l2_subdev_state_free(sd_state);
  
  	return ret;
  }
diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
index 63ea5e472c33..e607c3ae2520 100644
--- a/drivers/media/platform/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/vsp1/vsp1_entity.c
@@ -613,6 +613,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
  		     const char *name, unsigned int num_pads,
  		     const struct v4l2_subdev_ops *ops, u32 function)
  {
+	static struct lock_class_key key;
  	struct v4l2_subdev *subdev;
  	unsigned int i;
  	int ret;
@@ -675,7 +676,8 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
  	 * Allocate the pad configuration to store formats and selection
  	 * rectangles.
  	 */
-	entity->config = v4l2_alloc_subdev_state(&entity->subdev, V4L2_SUBDEV_FORMAT_ACTIVE);
+	entity->config = __v4l2_subdev_state_alloc(&entity->subdev,
+						   "vsp1:config->lock", &key);
  	if (IS_ERR(entity->config)) {
  		media_entity_cleanup(&entity->subdev.entity);
  		return PTR_ERR(entity->config);
@@ -690,6 +692,6 @@ void vsp1_entity_destroy(struct vsp1_entity *entity)
  		entity->ops->destroy(entity);
  	if (entity->subdev.ctrl_handler)
  		v4l2_ctrl_handler_free(entity->subdev.ctrl_handler);
-	v4l2_free_subdev_state(entity->config);
+	__v4l2_subdev_state_free(entity->config);
  	media_entity_cleanup(&entity->subdev.entity);
  }
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e3a7793157db..2a64ff003e4b 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -27,11 +27,10 @@
  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
  static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
  {
-	static struct lock_class_key __key;
  	struct v4l2_subdev_state *state;
+	static struct lock_class_key key;
  
-	state = __v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_TRY,
-					  "v4l2_subdev_fh->state", &__key);
+	state = __v4l2_subdev_state_alloc(sd, "fh->state->lock", &key);
  	if (IS_ERR(state))
  		return PTR_ERR(state);
  
@@ -42,7 +41,7 @@ static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
  
  static void subdev_fh_free(struct v4l2_subdev_fh *fh)
  {
-	v4l2_free_subdev_state(fh->state);
+	__v4l2_subdev_state_free(fh->state);
  	fh->state = NULL;
  }
  
@@ -815,11 +814,11 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
  				return -EINVAL;
  		}
  
-		krouting.which = routing->which;
  		krouting.num_routes = routing->num_routes;
  		krouting.routes = routes;
  
-		return v4l2_subdev_call(sd, pad, set_routing, state, &krouting);
+		return v4l2_subdev_call(sd, pad, set_routing, state,
+					routing->which, &krouting);
  	}
  
  	default:
@@ -925,10 +924,11 @@ v4l2_init_stream_configs(struct v4l2_subdev_stream_configs *stream_configs,
  			continue;
  
  		/*
-		 * Each route needs a format on both ends of the route, except for
-		 * source streams which only need one format.
+		 * Each route needs a format on both ends of the route, except
+		 * for source streams which only need one format.
  		 */
-		num_configs += (route->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE) ? 1 : 2;
+		num_configs +=
+			(route->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE) ? 1 : 2;
  	}
  
  	if (num_configs) {
@@ -942,7 +942,10 @@ v4l2_init_stream_configs(struct v4l2_subdev_stream_configs *stream_configs,
  		stream_configs->num_configs = num_configs;
  	}
  
-	/* Fill in the 'pad' and stream' value for each item in the array from the routing table */
+	/*
+	 * Fill in the 'pad' and stream' value for each item in the array from
+	 * the routing table
+	 */
  	for (i = 0; i < routing->num_routes; ++i) {
  		struct v4l2_subdev_route *route = &routing->routes[i];
  		u32 idx;
@@ -1277,7 +1280,8 @@ int v4l2_subdev_link_validate(struct media_link *link)
  }
  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
  
-bool v4l2_subdev_has_route(struct media_entity *entity, unsigned int pad0, unsigned int pad1)
+bool v4l2_subdev_has_route(struct media_entity *entity, unsigned int pad0,
+			   unsigned int pad1)
  {
  	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
  	struct v4l2_subdev_krouting *routing;
@@ -1308,9 +1312,7 @@ bool v4l2_subdev_has_route(struct media_entity *entity, unsigned int pad0, unsig
  EXPORT_SYMBOL_GPL(v4l2_subdev_has_route);
  
  struct v4l2_subdev_state *
-__v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
-			  enum v4l2_subdev_format_whence which,
-			  const char *lock_name,
+__v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
  			  struct lock_class_key *lock_key)
  {
  	struct v4l2_subdev_state *state;
@@ -1322,8 +1324,6 @@ __v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
  
  	__mutex_init(&state->lock, lock_name, lock_key);
  
-	state->which = which;
-
  	/* Drivers that support streams do not need the legacy pad config */
  	if (!(sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED) && sd->entity.num_pads) {
  		state->pads = kvmalloc_array(sd->entity.num_pads,
@@ -1349,9 +1349,9 @@ __v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
  
  	return ERR_PTR(ret);
  }
-EXPORT_SYMBOL_GPL(__v4l2_alloc_subdev_state);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_alloc);
  
-void v4l2_free_subdev_state(struct v4l2_subdev_state *state)
+void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
  {
  	if (!state)
  		return;
@@ -1363,7 +1363,7 @@ void v4l2_free_subdev_state(struct v4l2_subdev_state *state)
  	kvfree(state->pads);
  	kfree(state);
  }
-EXPORT_SYMBOL_GPL(v4l2_free_subdev_state);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_free);
  
  #endif /* CONFIG_MEDIA_CONTROLLER */
  
@@ -1394,12 +1394,12 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
  }
  EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
  
-int __v4l2_subdev_alloc_state(struct v4l2_subdev *sd, const char *name,
-			      struct lock_class_key *key)
+int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
+				struct lock_class_key *key)
  {
  	struct v4l2_subdev_state *state;
  
-	state = __v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_ACTIVE, name, key);
+	state = __v4l2_subdev_state_alloc(sd, name, key);
  	if (IS_ERR(state))
  		return PTR_ERR(state);
  
@@ -1407,14 +1407,14 @@ int __v4l2_subdev_alloc_state(struct v4l2_subdev *sd, const char *name,
  
  	return 0;
  }
-EXPORT_SYMBOL_GPL(__v4l2_subdev_alloc_state);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
  
-void v4l2_subdev_free_state(struct v4l2_subdev *sd)
+void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
  {
-	v4l2_free_subdev_state(sd->state);
+	__v4l2_subdev_state_free(sd->state);
  	sd->state = NULL;
  }
-EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
+EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
  
  struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd)
  {
@@ -1449,18 +1449,15 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
  	dst->routes = NULL;
  	dst->num_routes = 0;
  
-	if (src->num_routes == 0) {
-		dst->which = src->which;
-	} else {
-		dst->routes = kvmalloc_array(src->num_routes, sizeof(*src->routes),
-					     GFP_KERNEL);
+	if (src->num_routes > 0) {
+		dst->routes = kvmalloc_array(src->num_routes,
+					     sizeof(*src->routes), GFP_KERNEL);
  		if (!dst->routes)
  			return -ENOMEM;
  
  		memcpy(dst->routes, src->routes,
  		       src->num_routes * sizeof(*src->routes));
  		dst->num_routes = src->num_routes;
-		dst->which = src->which;
  	}
  
  	return v4l2_init_stream_configs(&state->stream_configs, dst);
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 691f5e04b0a1..3516735f0cad 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -491,6 +491,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
  				      struct v4l2_pix_format *pix)
  {
  	const struct tegra_video_format *fmtinfo;
+	static struct lock_class_key key;
  	struct v4l2_subdev *subdev;
  	struct v4l2_subdev_format fmt;
  	struct v4l2_subdev_state *sd_state;
@@ -507,7 +508,8 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
  	if (!subdev)
  		return -ENODEV;
  
-	sd_state = v4l2_alloc_subdev_state(subdev, V4L2_SUBDEV_FORMAT_ACTIVE);
+	sd_state = __v4l2_subdev_state_alloc(subdev, "tegra:state->lock",
+					     &key);
  	if (IS_ERR(sd_state))
  		return PTR_ERR(sd_state);
  	/*
@@ -558,7 +560,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
  	v4l2_fill_pix_format(pix, &fmt.format);
  	tegra_channel_fmt_align(chan, pix, fmtinfo->bpp);
  
-	v4l2_free_subdev_state(sd_state);
+	__v4l2_subdev_state_free(sd_state);
  
  	return 0;
  }
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index cd1750e495df..f90cc6417d30 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -933,7 +933,8 @@ struct media_pad *__media_entity_next_routed_pad(struct media_pad *root,
  						 struct media_pad *iter);
  
  /**
- * media_entity_for_each_routed_pad - Iterate over entity pads connected by routes
+ * media_entity_for_each_routed_pad - Iterate over entity pads connected by
+ *				      routes
   *
   * @root: The root pad to which the iterated pads have a route
   * @iter: The iterator pad
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 476d797ecc68..5e50f2ded653 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -728,24 +728,20 @@ struct v4l2_subdev_stream_configs {
  /**
   * struct v4l2_subdev_krouting - subdev routing table
   *
- * @which: format type (from enum v4l2_subdev_format_whence)
- * @routes: &struct v4l2_subdev_route
   * @num_routes: number of routes
+ * @routes: &struct v4l2_subdev_route
   *
- * This structure is used to translate arguments received from
- * VIDIOC_SUBDEV_G/S_ROUTING() ioctl to subdev device drivers operations.
+ * This structure contains the routing table for a subdev.
   */
  struct v4l2_subdev_krouting {
-	u32 which;
-	struct v4l2_subdev_route *routes;
  	unsigned int num_routes;
+	struct v4l2_subdev_route *routes;
  };
  
  /**
   * struct v4l2_subdev_state - Used for storing subdev state information.
   *
   * @lock: mutex for the state
- * @which: state type (from enum v4l2_subdev_format_whence)
   * @pads: &struct v4l2_subdev_pad_config array
   * @routing: routing table for the subdev
   * @stream_configs: stream configurations (only for V4L2_SUBDEV_FL_MULTIPLEXED)
@@ -756,7 +752,6 @@ struct v4l2_subdev_krouting {
   */
  struct v4l2_subdev_state {
  	struct mutex lock;
-	u32 which;
  	struct v4l2_subdev_pad_config *pads;
  	struct v4l2_subdev_krouting routing;
  	struct v4l2_subdev_stream_configs stream_configs;
@@ -872,6 +867,7 @@ struct v4l2_subdev_pad_ops {
  			       struct v4l2_mbus_config *config);
  	int (*set_routing)(struct v4l2_subdev *sd,
  			   struct v4l2_subdev_state *state,
+			   enum v4l2_subdev_format_whence which,
  			   struct v4l2_subdev_krouting *route);
  };
  
@@ -950,7 +946,12 @@ struct v4l2_subdev_internal_ops {
  /*
   * Set this flag if this subdev supports multiplexed streams. This means
   * that the driver supports routing and handles the stream parameter in its
- * v4l2_subdev_pad_ops handlers.
+ * v4l2_subdev_pad_ops handlers. More specifically, this means:
+ *
+ * - Centrally managed active state is enabled
+ * - Legacy pad config is _not_ supported (state->pads)
+ * - Routing ioctls are available
+ * - Multiple streams per pad are supported
   */
  #define V4L2_SUBDEV_FL_MULTIPLEXED		(1U << 4)
  
@@ -1008,7 +1009,7 @@ struct v4l2_subdev_platform_data {
   *		     device using v4l2_async_register_subdev_sensor().
   * @pdata: common part of subdevice platform data
   * @state: active state for the subdev (NULL for subdevs tracking the state
- * 	   internally)
+ *	   internally)
   *
   * Each instance of a subdev driver should create this struct, either
   * stand-alone or embedded in a larger struct.
@@ -1040,6 +1041,18 @@ struct v4l2_subdev {
  	struct v4l2_async_notifier *notifier;
  	struct v4l2_async_notifier *subdev_notifier;
  	struct v4l2_subdev_platform_data *pdata;
+
+	/*
+	 * The fields below are private, and should only be accessed via
+	 * appropriate functions.
+	 */
+
+	/*
+	 * TODO: state should most likely be changed from a pointer to an
+	 * embedded field. For the time being it's kept as a pointer to more
+	 * easily catch uses of state in the cases where the driver doesn't
+	 * support it.
+	 */
  	struct v4l2_subdev_state *state;
  };
  
@@ -1263,32 +1276,24 @@ bool v4l2_subdev_has_route(struct media_entity *entity, unsigned int pad0,
  			   unsigned int pad1);
  
  /**
- * v4l2_alloc_subdev_state - allocate v4l2_subdev_state
+ * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
   *
   * @sd: pointer to &struct v4l2_subdev for which the state is being allocated.
- * @which: configuration type for the state (from enum v4l2_subdev_format_whence)
+ * @lock_name: name of the state lock
+ * @key: lock_class_key for the lock
   *
- * Must call v4l2_free_subdev_state() when state is no longer needed.
+ * Must call __v4l2_subdev_state_free() when state is no longer needed.
   */
-#define v4l2_alloc_subdev_state(sd, which)                                     \
-	({                                                                     \
-		static struct lock_class_key __key;                            \
-		const char *name = KBUILD_BASENAME                             \
-			":" __stringify(__LINE__) ":sd->state->lock";          \
-		__v4l2_alloc_subdev_state(sd, which, name, &__key);            \
-	})
-
-struct v4l2_subdev_state *
-__v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
-			  enum v4l2_subdev_format_whence which,
-			  const char *lock_name, struct lock_class_key *key);
+struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd,
+						    const char *lock_name,
+						    struct lock_class_key *key);
  
  /**
- * v4l2_free_subdev_state - free a v4l2_subdev_state
+ * __v4l2_subdev_state_free - free a v4l2_subdev_state
   *
   * @state: v4l2_subdev_state to be freed.
   */
-void v4l2_free_subdev_state(struct v4l2_subdev_state *state);
+void __v4l2_subdev_state_free(struct v4l2_subdev_state *state);
  
  #endif /* CONFIG_MEDIA_CONTROLLER */
  
@@ -1358,33 +1363,36 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
  			      const struct v4l2_event *ev);
  
  /**
- * v4l2_subdev_alloc_state() - Allocate active subdev state for subdevice
- * @sd: The subdev for which the state is allocated
+ * v4l2_subdev_init_finalize() - Finalize the initialization of the subdevice
+ * @sd: The subdev
   *
- * This will allocate a subdev state and store it to
- * &struct v4l2_subdev->state.
+ * This finalizes the initialization of the subdev, including allocation of
+ * the active state for the subdev.
   *
- * Must call v4l2_subdev_free_state() when the state is no longer needed.
+ * This must be called by the subdev drivers that use the centralized active
+ * state, after the subdev struct has been initialized and
+ * media_entity_pads_init() has been called.
+ *
+ * Must call v4l2_subdev_cleanup() when the subdev is being removed.
   */
-#define v4l2_subdev_alloc_state(sd)                                            \
+#define v4l2_subdev_init_finalize(sd)                                          \
  	({                                                                     \
  		static struct lock_class_key __key;                            \
  		const char *name = KBUILD_BASENAME                             \
-			":" __stringify(__LINE__) ":sd->state->lock";          \
-		__v4l2_subdev_alloc_state(sd, name, &__key);                   \
+			":" __stringify(__LINE__) ":subdev->state->lock";      \
+		__v4l2_subdev_init_finalize(sd, name, &__key);                 \
  	})
  
-int __v4l2_subdev_alloc_state(struct v4l2_subdev *sd, const char *name,
-			      struct lock_class_key *key);
+int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
+				struct lock_class_key *key);
  
  /**
- * v4l2_subdev_free_state() - Free the active subdev state for subdevice
+ * v4l2_subdev_cleanup() - Release the resources needed by the subdevice
   * @sd: The subdevice
   *
- * This will free the subdev's state and set
- * &struct v4l2_subdev->state to NULL.
+ * This will release the resources allocated in v4l2_subdev_init_finalize.
   */
-void v4l2_subdev_free_state(struct v4l2_subdev *sd);
+void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
  
  /**
   * v4l2_subdev_get_active_state() - Return the active subdev state for subdevice
@@ -1400,7 +1408,8 @@ v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
  }
  
  /**
- * v4l2_subdev_lock_active_state() - Lock and return the active subdev state for subdevice
+ * v4l2_subdev_lock_active_state() - Lock and return the active subdev state for
+ *				     subdevice
   * @sd: The subdevice
   *
   * Return the locked active state for the subdevice, or NULL if the subdev
@@ -1429,34 +1438,26 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
  void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
  
  /**
- * v4l2_subdev_validate_state() - Gets the TRY or ACTIVE subdev state
+ * v4l2_subdev_validate_and_lock_state() - Gets locked TRY or ACTIVE subdev
+ *					   state
   * @sd: subdevice
   * @state: subdevice state as passed to the subdev op
   *
- * Subdev ops used to be sometimes called with NULL as the state for ACTIVE
- * case. Even if the v4l2 core now passes proper state for both TRY and
- * ACTIVE cases, a subdev driver may call an op in another subdev driver,
- * passing NULL.
+ * Due to legacy reasons, when subdev drivers call ops in other subdevs they use
+ * NULL as the state parameter, as subdevs always used to have their active
+ * state stored privately.
   *
- * This function can be used as a helper to get the state also for the ACTIVE
- * case. The subdev driver that supports ACTIVE state can use this function
- * as the first thing in its ops, ensuring that the state variable contains
- * either the TRY or ACTIVE state.
- */
-static inline struct v4l2_subdev_state *
-v4l2_subdev_validate_state(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *state)
-{
-	return state ? state : sd->state;
-}
-
-/**
- * v4l2_subdev_validate_and_lock_state() - Gets locked TRY or ACTIVE subdev state
- * @sd: subdevice
- * @state: subdevice state as passed to the subdev op
+ * However, newer state-aware subdev drivers, which store their active state in
+ * a common place, subdev->state, expect to always get a proper state as a
+ * parameter.
+ *
+ * These state-aware drivers can use v4l2_subdev_validate_and_lock_state()
+ * instead of v4l2_subdev_lock_state(). v4l2_subdev_validate_and_lock_state()
+ * solves the issue by using subdev->state in case the passed state is
+ * NULL.
   *
- * This is a helper function which does the same as v4l2_subdev_validate_state
- * () except that it also locks the state.
+ * This is a temporary helper function, and should be removed when we can ensure
+ * that all drivers pass proper state when calling other subdevs.
   */
  static inline struct v4l2_subdev_state *
  v4l2_subdev_validate_and_lock_state(struct v4l2_subdev *sd,
@@ -1486,7 +1487,8 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
  			    struct v4l2_subdev_krouting *routing);
  
  /**
- * v4l2_subdev_set_routing_with_fmt() - Set given routing and format to subdev state
+ * v4l2_subdev_set_routing_with_fmt() - Set given routing and format to subdev
+ *					state
   * @sd: The subdevice
   * @state: The subdevice state
   * @routing: Routing that will be copied to subdev state
@@ -1532,7 +1534,8 @@ int v4l2_state_find_opposite_end(struct v4l2_subdev_krouting *routing, u32 pad,
  				 u32 stream, u32 *other_pad, u32 *other_stream);
  
  /**
- * v4l2_state_get_opposite_stream_format() - Get pointer to opposite stream format
+ * v4l2_state_get_opposite_stream_format() - Get pointer to opposite stream
+ *					     format
   * @state: subdevice state
   * @pad: pad id
   * @stream: stream id
@@ -1564,7 +1567,7 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
  
  /**
   * v4l2_routing_simple_verify() - Verify that all streams are non-overlapping
- * 				  1-to-1 streams
+ *				  1-to-1 streams
   * @routing: routing to verify
   *
   * This verifies that the given routing contains only non-overlapping 1-to-1
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index d00ef85db1c7..f61ace2b5755 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -206,13 +206,13 @@ struct v4l2_subdev_capability {
   * Is the route active? An active route will start when streaming is enabled
   * on a video node.
   */
-#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		BIT(0)
+#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1 << 0)
  
  /*
   * Is the route immutable, i.e. can it be activated and inactivated?
   * Set by the driver.
   */
-#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		BIT(1)
+#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1 << 1)
  
  /*
   * Is the route a source endpoint? A source endpoint route refers to a stream
@@ -221,7 +221,7 @@ struct v4l2_subdev_capability {
   * fields are unused.
   * Set by the driver.
   */
-#define V4L2_SUBDEV_ROUTE_FL_SOURCE		BIT(2)
+#define V4L2_SUBDEV_ROUTE_FL_SOURCE		(1 << 2)
  
  /**
   * struct v4l2_subdev_route - A route inside a subdev
