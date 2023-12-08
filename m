Return-Path: <linux-media+bounces-2013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 091E280ABDD
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 19:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A74B21F212FA
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 18:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647E04A988;
	Fri,  8 Dec 2023 18:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jy1lF3/D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21760A3
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 10:16:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0216EEE;
	Fri,  8 Dec 2023 19:16:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702059364;
	bh=/nuchVLRotHsSc9/onXkOzFEWipLabMEn4Z5JqQQicw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jy1lF3/DgCaeyki++1psL6Af9wSYKqitns5j/K/c/RyOA+94nP2F11bXuNRTGOG2k
	 OLO9JUZwSPuT4cGOyp0vGGo2pbH3MdI0mEel3fjTelSfmydkcGpoTbk7Pw/S1/fZBu
	 1quFHmGwEV/C2PUcy7qeK3veTj38YvLrCatR5ZMo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 4/8] media: v4l2-subdev: Store frame interval in subdev state
Date: Fri,  8 Dec 2023 20:16:44 +0200
Message-ID: <20231208181648.13568-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208181442.13356-1-laurent.pinchart@ideasonboard.com>
References: <20231208181442.13356-1-laurent.pinchart@ideasonboard.com>
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
Changes since v3:

- Use __v4l2_subdev_state_gen_call()

Changes since v2:

- Remove WARN_ON() on invalid pad
- Add lockdep_assert_held()
---
 drivers/media/v4l2-core/v4l2-subdev.c | 52 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 43 ++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index b9ce3e41d52c..0e901b992b0a 100644
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
index 0ab7dce098e6..a9e6b8146279 100644
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
@@ -1392,6 +1396,27 @@ struct v4l2_rect *
 __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
 				unsigned int pad, u32 stream);
 
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
+#define v4l2_subdev_state_get_interval(state, pad, ...)			\
+	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
+		(state, pad, ##__VA_ARGS__)
+#define __v4l2_subdev_state_get_interval_pad(state, pad)	\
+	__v4l2_subdev_state_get_interval(state, pad, 0)
+struct v4l2_fract *
+__v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
+				 unsigned int pad, u32 stream);
+
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 
 /**
@@ -1411,6 +1436,24 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
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
-- 
Regards,

Laurent Pinchart


