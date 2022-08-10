Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD7B558EBB3
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 14:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbiHJMLv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 08:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbiHJMLt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 08:11:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0F86B659
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 05:11:48 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74B351269;
        Wed, 10 Aug 2022 14:11:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660133503;
        bh=Xd0pA4BNUr5J8agRrTuPOX81Jd9gvKY0pDk5pr8aiqQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kmglUAKDjXwcyX0HSRSsYY5v150sP0gkRu0kkUggh5L6V9q+9C7W5Q/hfhvNy8y1C
         7eWB3mw/JXp43x/yBlYLaX7HbVW6bUG4VzktrhKLhDE02pwhCJMp+I97/ue/xqMVX9
         sMbCHc4I+Fup6z/TGRmVS5VNK2tMUplm2FB5TObo=
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
Subject: [PATCH v13 09/34] media: v4l2-dev: Add videodev wrappers for media pipelines
Date:   Wed, 10 Aug 2022 15:10:57 +0300
Message-Id: <20220810121122.3149086-10-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
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

With the upcoming stream related improvements to the pipelines, the
pipelines are moved from media entities to media pads. As the drivers
currently use the pipelines with the entity based model, moving the
pipelines to pads will cause changes to the drivers.

However, most of the uses of media pipelines are related to a video
device (a DMA engine) with a single pad, and thus there's never a need
to support multiple pads in these use cases. We can avoid pushing the
complexities of the pad based model to the drivers by adding video
device wrappers for the pipeline related functions.

This patch adds a number of wrappers to media_pipeline functions, all of
which take a video_device as a parameter (instead of a media_entity),
and verify that there's just one pad.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 61 ++++++++++++++++++++
 include/media/v4l2-dev.h           | 90 ++++++++++++++++++++++++++++++
 2 files changed, 151 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index d00237ee4cae..7f933ff89fd4 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1095,6 +1095,67 @@ void video_unregister_device(struct video_device *vdev)
 }
 EXPORT_SYMBOL(video_unregister_device);
 
+#if defined(CONFIG_MEDIA_CONTROLLER)
+
+__must_check int video_device_pipeline_start(struct video_device *vdev,
+					     struct media_pipeline *pipe)
+{
+	struct media_entity *entity = &vdev->entity;
+
+	if (entity->num_pads != 1)
+		return -ENODEV;
+
+	return media_pipeline_start(entity, pipe);
+}
+EXPORT_SYMBOL_GPL(video_device_pipeline_start);
+
+__must_check int __video_device_pipeline_start(struct video_device *vdev,
+					       struct media_pipeline *pipe)
+{
+	struct media_entity *entity = &vdev->entity;
+
+	if (entity->num_pads != 1)
+		return -ENODEV;
+
+	return __media_pipeline_start(entity, pipe);
+}
+EXPORT_SYMBOL_GPL(__video_device_pipeline_start);
+
+void video_device_pipeline_stop(struct video_device *vdev)
+{
+	struct media_entity *entity = &vdev->entity;
+
+	if (WARN_ON(entity->num_pads != 1))
+		return;
+
+	return media_pipeline_stop(entity);
+}
+EXPORT_SYMBOL_GPL(video_device_pipeline_stop);
+
+void __video_device_pipeline_stop(struct video_device *vdev)
+{
+	struct media_entity *entity = &vdev->entity;
+
+	if (WARN_ON(entity->num_pads != 1))
+		return;
+
+	return __media_pipeline_stop(entity);
+}
+EXPORT_SYMBOL_GPL(__video_device_pipeline_stop);
+
+struct media_pipeline *video_device_pipeline(struct video_device *vdev)
+{
+	struct media_entity *entity = &vdev->entity;
+
+	if (WARN_ON(entity->num_pads != 1))
+		return NULL;
+
+	return media_entity_pipeline(entity);
+}
+EXPORT_SYMBOL_GPL(video_device_pipeline);
+
+#endif /* CONFIG_MEDIA_CONTROLLER */
+
 /*
  *	Initialise video for linux
  */
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 5cf1edefb822..4ccc24f5918a 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -539,4 +539,94 @@ static inline int video_is_registered(struct video_device *vdev)
 	return test_bit(V4L2_FL_REGISTERED, &vdev->flags);
 }
 
+#if defined(CONFIG_MEDIA_CONTROLLER)
+
+/**
+ * video_device_pipeline_start - Mark a pipeline as streaming
+ * @vdev: Starting video device
+ * @pipe: Media pipeline to be assigned to all entities in the pipeline.
+ *
+ * Mark all entities connected to a given video device through enabled links,
+ * either directly or indirectly, as streaming. The given pipeline object is
+ * assigned to every entity in the pipeline and stored in the media_entity pipe
+ * field.
+ *
+ * Calls to this function can be nested, in which case the same number of
+ * video_device_pipeline_stop() calls will be required to stop streaming. The
+ * pipeline pointer must be identical for all nested calls to
+ * video_device_pipeline_start().
+ *
+ * The video device must contain a single pad.
+ *
+ * This is a convenience wrapper to media_pipeline_start().
+ */
+__must_check int video_device_pipeline_start(struct video_device *vdev,
+					     struct media_pipeline *pipe);
+
+/**
+ * __video_device_pipeline_start - Mark a pipeline as streaming
+ *
+ * @vdev: Starting video device
+ * @pipe: Media pipeline to be assigned to all entities in the pipeline.
+ *
+ * ..note:: This is the non-locking version of video_device_pipeline_start()
+ *
+ * The video device must contain a single pad.
+ *
+ * This is a convenience wrapper to __media_pipeline_start().
+ */
+__must_check int __video_device_pipeline_start(struct video_device *vdev,
+					       struct media_pipeline *pipe);
+
+/**
+ * video_device_pipeline_stop - Mark a pipeline as not streaming
+ * @vdev: Starting video device
+ *
+ * Mark all entities connected to a given entity through enabled links, either
+ * directly or indirectly, as not streaming. The media_entity pipe field is
+ * reset to %NULL.
+ *
+ * If multiple calls to media_pipeline_start() have been made, the same
+ * number of calls to this function are required to mark the pipeline as not
+ * streaming.
+ *
+ * The video device must contain a single pad.
+ *
+ * This is a convenience wrapper to media_pipeline_stop().
+ */
+void video_device_pipeline_stop(struct video_device *vdev);
+
+/**
+ * __video_device_pipeline_stop - Mark a pipeline as not streaming
+ *
+ * @vdev: Starting video device
+ *
+ * .. note:: This is the non-locking version of media_pipeline_stop()
+ *
+ * The video device must contain a single pad.
+ *
+ * This is a convenience wrapper to __media_pipeline_stop().
+ */
+void __video_device_pipeline_stop(struct video_device *vdev);
+
+/**
+ * video_device_pipeline - Get the media pipeline a video device is part of
+ * @vdev: The video device
+ *
+ * This function returns the media pipeline that a video device has been
+ * associated with when constructing the pipeline with
+ * video_device_pipeline_start(). The pointer remains valid until
+ * video_device_pipeline_stop() is called.
+ *
+ * Return: The media_pipeline the video device is part of, or NULL if the video
+ * device is not part of any pipeline.
+ *
+ * The video device must contain a single pad.
+ *
+ * This is a convenience wrapper to media_entity_pipeline().
+ */
+struct media_pipeline *video_device_pipeline(struct video_device *vdev);
+
+#endif /* CONFIG_MEDIA_CONTROLLER */
+
 #endif /* _V4L2_DEV_H */
-- 
2.34.1

