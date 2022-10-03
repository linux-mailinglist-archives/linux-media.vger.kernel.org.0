Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C41B45F302E
	for <lists+linux-media@lfdr.de>; Mon,  3 Oct 2022 14:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiJCMUB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Oct 2022 08:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbiJCMTz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Oct 2022 08:19:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CE5D129
        for <linux-media@vger.kernel.org>; Mon,  3 Oct 2022 05:19:54 -0700 (PDT)
Received: from desky.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 822713348;
        Mon,  3 Oct 2022 14:19:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664799574;
        bh=XScRqlaeL1pW29PF1766oou6QNyF3d6sBY1HloxuIOU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mW2LQD8rlFAOjIdgiOOZIYIQYSDvlMkkQCv7hnO4H2Rci0vTtW2SGBiwoVz7Z5T1a
         Zr2o3KoWs/lxtrZw4UmqASMQlx8JFVcUCaBAza/VUCmS3K1G64ziAQfIaLwn9mYReQ
         FlDZcVq943sbZmuuh3m+eB13T3F8sACybYBdqJa4=
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
Subject: [PATCH v15 18/19] media: v4l2-subdev: Add v4l2_subdev_s_stream_helper() function
Date:   Mon,  3 Oct 2022 15:18:51 +0300
Message-Id: <20221003121852.616745-19-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
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
index 101c1cfc0123..1da35bf9af01 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1941,6 +1941,46 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
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
index bff824367e0b..b21af00b1884 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1726,6 +1726,23 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
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

