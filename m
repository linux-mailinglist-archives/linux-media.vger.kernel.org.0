Return-Path: <linux-media+bounces-1674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 543BE8056CA
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 15:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2FAD1F215E9
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 14:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5047E61FD7;
	Tue,  5 Dec 2023 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ezf3UpKr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2247F12C
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 06:08:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 125E3A06;
	Tue,  5 Dec 2023 15:07:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701785246;
	bh=crAWxiVuN1LyqRzGHCBcsSv2zmWPVvQTUMarfvgio0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ezf3UpKr8lGngOt3fGsbrGSzwr8uwZwCNxITd/Qfh+hBunNQ+FTSrPtoWtlpFt6JT
	 /Dv6W03v6UBWnu2cnqbjtvpvMFwCYBNDVat+mUAParAY9i+fsyRee2kG0cRV/ma1MZ
	 F/45A8vRITZ/xrxVAu8g3rFet378k+o1eKU+dVj8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 3/7] media: v4l2-subdev: Store frame interval in subdev state
Date: Tue,  5 Dec 2023 16:08:06 +0200
Message-ID: <20231205140810.22368-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231205140810.22368-1-laurent.pinchart@ideasonboard.com>
References: <20231205140810.22368-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subdev states store all standard pad configuration data, except for
frame intervals. Fix it by adding interval fields in the
v4l2_subdev_pad_config and v4l2_subdev_stream_config structures, with
corresponding accessor functions and a helper function to implement the
.get_frame_interval() operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Remove WARN_ON() on invalid pad
- Add lockdep_assert_held()
---
 drivers/media/v4l2-core/v4l2-subdev.c | 52 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 45 +++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4cbe4024ff67..74a81b0df7ca 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1651,6 +1651,42 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
 }
 EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
 
+struct v4l2_fract *
+__v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
+				 unsigned int pad, u32 stream)
+{
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
+
+	if (WARN_ON(!state))
+		return NULL;
+
+	lockdep_assert_held(state->lock);
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		if (pad >= state->sd->entity.num_pads)
+			return NULL;
+
+		return &state->pads[pad].interval;
+	}
+
+	lockdep_assert_held(state->lock);
+
+	stream_configs = &state->stream_configs;
+
+	for (i = 0; i < stream_configs->num_configs; ++i) {
+		if (stream_configs->configs[i].pad == pad &&
+		    stream_configs->configs[i].stream == stream)
+			return &stream_configs->configs[i].interval;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_interval);
+
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 
 static int
@@ -1717,6 +1753,22 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
 
+int v4l2_subdev_get_frame_interval(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_frame_interval *fi)
+{
+	struct v4l2_fract *interval;
+
+	interval = v4l2_subdev_state_get_interval(state, fi->pad, fi->stream);
+	if (!interval)
+		return -EINVAL;
+
+	fi->interval = *interval;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_interval);
+
 int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state,
 			    const struct v4l2_subdev_krouting *routing)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b2dbaa739afa..e71ad55e7d04 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -681,11 +681,13 @@ struct v4l2_subdev_ir_ops {
  * @format: &struct v4l2_mbus_framefmt
  * @crop: &struct v4l2_rect to be used for crop
  * @compose: &struct v4l2_rect to be used for compose
+ * @interval: frame interval
  */
 struct v4l2_subdev_pad_config {
 	struct v4l2_mbus_framefmt format;
 	struct v4l2_rect crop;
 	struct v4l2_rect compose;
+	struct v4l2_fract interval;
 };
 
 /**
@@ -697,6 +699,7 @@ struct v4l2_subdev_pad_config {
  * @fmt: &struct v4l2_mbus_framefmt
  * @crop: &struct v4l2_rect to be used for crop
  * @compose: &struct v4l2_rect to be used for compose
+ * @interval: frame interval
  *
  * This structure stores configuration for a stream.
  */
@@ -708,6 +711,7 @@ struct v4l2_subdev_stream_config {
 	struct v4l2_mbus_framefmt fmt;
 	struct v4l2_rect crop;
 	struct v4l2_rect compose;
+	struct v4l2_fract interval;
 };
 
 /**
@@ -1494,6 +1498,24 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
 int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 			struct v4l2_subdev_format *format);
 
+/**
+ * v4l2_subdev_get_frame_interval() - Fill frame interval based on state
+ * @sd: subdevice
+ * @state: subdevice state
+ * @fi: pointer to &struct v4l2_subdev_frame_interval
+ *
+ * Fill @fi->interval field based on the information in the @fi struct.
+ *
+ * This function can be used by the subdev drivers which support active state to
+ * implement v4l2_subdev_pad_ops.get_frame_interval if the subdev driver does
+ * not need to do anything special in their get_frame_interval op.
+ *
+ * Returns 0 on success, error value otherwise.
+ */
+int v4l2_subdev_get_frame_interval(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_frame_interval *fi);
+
 /**
  * v4l2_subdev_set_routing() - Set given routing to subdev state
  * @sd: The subdevice
@@ -1539,6 +1561,29 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
 				     const struct v4l2_subdev_krouting *routing,
 				     const struct v4l2_mbus_framefmt *fmt);
 
+/**
+ * v4l2_subdev_state_get_interval() - Get pointer to a stream frame interval
+ * @state: subdevice state
+ * @pad: pad id
+ * @...: stream id (optional argument)
+ *
+ * This returns a pointer to the frame interval for the given pad + stream in
+ * the subdev state.
+ *
+ * For stream-unaware drivers the frame interval for the corresponding pad is
+ * returned. If the pad does not exist, NULL is returned.
+ */
+#define v4l2_subdev_state_get_interval(state, pad, ...)         \
+        __v4l2_subdev_state_get_interval_ ## __VA_OPT__(stream) \
+        (state, pad __VA_OPT__(,) __VA_ARGS__)
+#define __v4l2_subdev_state_get_interval_(state, pad)	\
+        __v4l2_subdev_state_get_interval(state, pad, 0)
+#define __v4l2_subdev_state_get_interval_stream(state, pad, stream)	\
+        __v4l2_subdev_state_get_interval(state, pad, stream)
+struct v4l2_fract *
+__v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
+				 unsigned int pad, u32 stream);
+
 /**
  * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
  * @routing: routing used to find the opposite side
-- 
Regards,

Laurent Pinchart


