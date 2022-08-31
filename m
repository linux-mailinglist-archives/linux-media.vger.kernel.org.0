Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573AF5A7FEA
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbiHaOQ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbiHaOQT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:16:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D18A394
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:15:59 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BB283019;
        Wed, 31 Aug 2022 16:14:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955284;
        bh=j2BM3LkGUpzRh0dgXtB1wXiTXMwQad/GR6c8Rx6OP/c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uOJMruE7SmeJQNuUeWknIclJtdbxP/fEdgahh6uE0N0bN1cLAVXAyLjm9I0NB9JS0
         2J4jPnByXkM7FfXrIzed+UCHbgt1QnS69FSbqO9iDllXxy3TsD0y4zIQB9AuszIGv3
         Cr2g9HjgE7Tlr+SPjM1p74RORJemv7tGFXUgmHu4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v14 33/34] media: v4l2-subdev: Add v4l2_subdev_s_stream_helper() function
Date:   Wed, 31 Aug 2022 17:13:56 +0300
Message-Id: <20220831141357.1396081-34-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The v4l2_subdev_s_stream_helper() helper can be used by subdevs that
implement the stream-aware .enable_streams() and .disable_streams()
operations to implement .s_stream(). This is limited to subdevs that
have a single source pad.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 17 ++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 258f04968047..cfd7d795abef 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1996,6 +1996,46 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_disable_streams);
 
+int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
+{
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *route;
+	struct media_pad *pad;
+	u64 source_mask = 0;
+	int pad_index = -1;
+
+	/*
+	 * Find the source pad. This helper is meant for subdevs that have a
+	 * single source pad, so failures shouldn't happen, but catch them
+	 * loudly nonetheless as they indicate a driver bug.
+	 */
+	media_entity_for_each_pad(&sd->entity, pad) {
+		if (pad->flags & MEDIA_PAD_FL_SOURCE) {
+			pad_index = pad->index;
+			break;
+		}
+	}
+
+	if (WARN_ON(pad_index == -1))
+		return -EINVAL;
+
+	/*
+	 * As there's a single source pad, just collect all the source streams.
+	 */
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	for_each_active_route(&state->routing, route)
+		source_mask |= BIT_ULL(route->source_stream);
+
+	v4l2_subdev_unlock_state(state);
+
+	if (enable)
+		return v4l2_subdev_enable_streams(sd, pad_index, source_mask);
+	else
+		return v4l2_subdev_disable_streams(sd, pad_index, source_mask);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 0d660d4d17e1..76d284c99484 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1719,6 +1719,23 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
 int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 				u64 streams_mask);
 
+/**
+ * v4l2_subdev_s_stream_helper() - Helper to implement the subdev s_stream
+ *	operation using enable_streams and disable_streams
+ * @sd: The subdevice
+ * @enable: Enable or disable streaming
+ *
+ * Subdevice drivers that implement the streams-aware
+ * &v4l2_subdev_pad_ops.enable_streams and &v4l2_subdev_pad_ops.disable_streams
+ * operations can use this helper to implement the legacy
+ * &v4l2_subdev_video_ops.s_stream operation.
+ *
+ * This helper can only be used by subdevs that have a single source pad.
+ *
+ * Return: 0 on success, or a negative error code otherwise.
+ */
+int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable);
+
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
-- 
2.34.1

