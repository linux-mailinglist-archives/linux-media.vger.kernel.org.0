Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC6767D447D
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 03:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbjJXBHw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 21:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbjJXAvf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 20:51:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD41120
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 17:51:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 184B1F02;
        Tue, 24 Oct 2023 02:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698108676;
        bh=RFN+QpDv46gm2oi8tWpGpzjCGwNhdN1m5dt/qS0Z/5o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q8a4dH/1te6E9Lj2FApBx5/bM40AmTT31tIdL0/UQJN7DxHJ5Fwsfx6dOBdiEcHl/
         oyHdCW+KMEQnruFm0iERPknagPawDP7rOflvgmk2qI+rObKRfvKIXu8GSFujm0Cc9g
         3UfPaWFg+XqBdFJtTDAHb052iE2RnAaMBaqQ2SsM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Hans de Goede <hansg@kernel.org>
Subject: [RFC PATCH v1 3/4] media: v4l2-subdev: Store frame interval in subdev state
Date:   Tue, 24 Oct 2023 03:51:29 +0300
Message-ID: <20231024005130.28026-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024005130.28026-1-laurent.pinchart@ideasonboard.com>
References: <20231024005130.28026-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Subdev states store all standard pad configuration data, except for
frame intervals. Fix it by adding interval fields in the
v4l2_subdev_pad_config and v4l2_subdev_stream_config structures, with
corresponding accessor functions and a helper function to implement the
.get_frame_interval() operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 44 +++++++++++++++++++++
 include/media/v4l2-subdev.h           | 57 +++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index c45d60a87701..518f2f35c68d 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1618,6 +1618,29 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
 
+int v4l2_subdev_get_frame_interval(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_frame_interval *fi)
+{
+	struct v4l2_fract *interval;
+
+	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
+		interval = v4l2_subdev_state_get_stream_interval(state, fi->pad,
+								 fi->stream);
+	else if (fi->pad < sd->entity.num_pads && fi->stream == 0)
+		interval = v4l2_subdev_get_pad_interval(sd, state, fi->pad);
+	else
+		interval = NULL;
+
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
@@ -1761,6 +1784,27 @@ v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_compose);
 
+struct v4l2_fract *
+v4l2_subdev_state_get_stream_interval(struct v4l2_subdev_state *state,
+				      unsigned int pad, u32 stream)
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
+			return &stream_configs->configs[i].interval;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_interval);
+
 int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
 					  u32 pad, u32 stream, u32 *other_pad,
 					  u32 *other_stream)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 962b546d0e3b..363f9a8a084c 100644
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
@@ -1199,6 +1203,26 @@ v4l2_subdev_get_pad_compose(struct v4l2_subdev *sd,
 	return &state->pads[pad].compose;
 }
 
+/**
+ * v4l2_subdev_get_pad_interval - ancillary routine to get
+ *	&struct v4l2_subdev_pad_config->interval
+ *
+ * @sd: pointer to &struct v4l2_subdev
+ * @state: pointer to &struct v4l2_subdev_state.
+ * @pad: index of the pad in the &struct v4l2_subdev_state->pads array.
+ */
+static inline struct v4l2_fract *
+v4l2_subdev_get_pad_interval(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     unsigned int pad)
+{
+	if (WARN_ON(!state))
+		return NULL;
+	if (WARN_ON(pad >= sd->entity.num_pads))
+		pad = 0;
+	return &state->pads[pad].interval;
+}
+
 /*
  * Temprary helpers until uses of v4l2_subdev_get_try_* functions have been
  * renamed
@@ -1489,6 +1513,24 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
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
@@ -1580,6 +1622,21 @@ struct v4l2_rect *
 v4l2_subdev_state_get_stream_compose(struct v4l2_subdev_state *state,
 				     unsigned int pad, u32 stream);
 
+/**
+ * v4l2_subdev_state_get_stream_interval() - Get pointer to a stream frame interval
+ * @state: subdevice state
+ * @pad: pad id
+ * @stream: stream id
+ *
+ * This returns a pointer to the frame interval for the given pad + stream in
+ * the subdev state.
+ *
+ * If the state does not contain the given pad + stream, NULL is returned.
+ */
+struct v4l2_fract *
+v4l2_subdev_state_get_stream_interval(struct v4l2_subdev_state *state,
+				      unsigned int pad, u32 stream);
+
 /**
  * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
  * @routing: routing used to find the opposite side
-- 
Regards,

Laurent Pinchart

