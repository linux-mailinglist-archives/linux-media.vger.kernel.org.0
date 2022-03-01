Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 212F44C8FE4
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236080AbiCAQNx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236067AbiCAQNw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F9B93D4BB
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:13:11 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0896437E9;
        Tue,  1 Mar 2022 17:12:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151171;
        bh=GbxAnif2NbxUS2c37bWNqf4oOB3hcsUds1sBX5vH6oI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mVPqESvNSeoQSTxAq3ifbQTsQjdOzcHfZWtIi9zOX5nVphxYjlUEt48Vrmmbd889z
         d/chj7pcv+yuXbUuGS+TG0nhtF7KFNyHdXeFOKgb0k/td/0bjzv9jvT/2xaTqUtNA0
         tY92Topl7BLGkKu/WZoatL58Xyn+3k6D9zbQz9Ug=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 36/36] media: v4l2-subdev: Add v4l2_subdev_s_stream_helper() function
Date:   Tue,  1 Mar 2022 18:11:56 +0200
Message-Id: <20220301161156.1119557-37-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
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
---
 drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 17 ++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index f75a1995a70b..270445821f06 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1914,6 +1914,46 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
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
+		source_mask |= BIT(route->source_stream);
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
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index bb1713863973..817452ec30bb 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1674,6 +1674,23 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
 int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 				u64 streams_mask);
 
+/**
+ * v4l2_subdev_s_stream_helper() - Helper to implement the subdev s_stream
+ *	operation using enable_streams and disable_streams
+ * @sd: The subdevice
+ * @enable: Enable to disable streaming
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
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /**
-- 
2.25.1

