Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E24D19E05A
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 23:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728308AbgDCVdg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 17:33:36 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60616 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbgDCVdg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 17:33:36 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1CDED29612D;
        Fri,  3 Apr 2020 22:33:30 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com,
        skhan@linuxfoundation.org, niklas.soderlund@ragnatech.se,
        mchehab@kernel.org, Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v2 1/3] media: v4l2-common: add helper functions to call s_stream() callbacks
Date:   Fri,  3 Apr 2020 18:33:10 -0300
Message-Id: <20200403213312.1863876-2-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200403213312.1863876-1-helen.koike@collabora.com>
References: <20200403213312.1863876-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add v4l2_pipeline_stream_{enable,disable} helper functions to iterate
through the subdevices in a given stream (i.e following links from sink
to source) and call .s_stream() callback.

Add stream_count on the subdevice object for simultaneous streaming from
different video devices which shares subdevices.

Prevent calling .s_stream(true) if it was already called previously by
another stream.

Prevent calling .s_stream(false) from one stream when there are still
others active.

If .s_stream(true) fails, call .s_stream(false) in the reverse order.

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Changes in v2:
- re-write helpers to not use media walkers

 drivers/media/v4l2-core/v4l2-common.c | 117 ++++++++++++++++++++++++++
 include/media/v4l2-common.h           |  28 ++++++
 include/media/v4l2-subdev.h           |   2 +
 3 files changed, 147 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index d0e5ebc736f9f..379d4bf4f8128 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -441,3 +441,120 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
+
+/*
+ * v4l2_pipeline_subdevs_get - Assemble a list of subdevices in a pipeline
+ * @subdevs: the array to be filled
+ * @size: the array size
+ *
+ * Walk from a video node, following link from sink to source and fill the
+ * array with subdevices in the path.
+ *
+ * Note: this function follows the first enabled link in a sink pad found in a
+ * given entity. Thus it won't work if there are entities with multiple enabled
+ * links to its sink pads in the topology.
+ *
+ * Return the number of subdevices filled in the array.
+ */
+static unsigned int v4l2_pipeline_subdevs_get(struct video_device *vdev,
+					      struct v4l2_subdev **subdevs,
+					      unsigned int size)
+{
+	struct media_entity *entity = &vdev->entity;
+	unsigned int idx = 0;
+
+	while (1) {
+		struct media_pad *src_pad = NULL;
+		unsigned int i;
+
+		/* Find remote source pad */
+		for (i = 0; i < entity->num_pads; i++) {
+			struct media_pad *sink_pad = &entity->pads[i];
+
+			if (!(sink_pad->flags & MEDIA_PAD_FL_SINK))
+				continue;
+
+			src_pad = media_entity_remote_pad(sink_pad);
+			if (src_pad &&
+			    is_media_entity_v4l2_subdev(src_pad->entity))
+				break;
+		}
+		if (i == entity->num_pads)
+			break;
+
+		if (idx >= size) {
+			WARN_ON(1);
+			return 0;
+		}
+
+		entity = src_pad->entity;
+		subdevs[idx++] = media_entity_to_v4l2_subdev(entity);
+	}
+
+	return idx;
+}
+
+__must_check int v4l2_pipeline_stream_enable(struct video_device *vdev)
+{
+	struct media_device *mdev = vdev->entity.graph_obj.mdev;
+	struct v4l2_subdev *subdevs[MEDIA_ENTITY_ENUM_MAX_DEPTH];
+	struct v4l2_subdev *sd;
+	unsigned int i, size;
+	int ret;
+
+	mutex_lock(&mdev->graph_mutex);
+
+	size = v4l2_pipeline_subdevs_get(vdev, subdevs, ARRAY_SIZE(subdevs));
+
+	for (i = 0; i < size; i++) {
+		sd = subdevs[i];
+		if (sd->stream_count++)
+			continue;
+		dev_dbg(mdev->dev,
+			"enabling stream for '%s'\n", sd->entity.name);
+		ret = v4l2_subdev_call(sd, video, s_stream, true);
+		if (ret && ret != -ENOIOCTLCMD)
+			goto err_stream_disable;
+	}
+
+	mutex_unlock(&mdev->graph_mutex);
+	return 0;
+
+err_stream_disable:
+	do {
+		sd = subdevs[i];
+		if (--sd->stream_count)
+			continue;
+		dev_dbg(mdev->dev,
+			"disabling stream for '%s'\n", sd->entity.name);
+		v4l2_subdev_call(sd, video, s_stream, false);
+	} while (i--);
+
+	mutex_unlock(&mdev->graph_mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(v4l2_pipeline_stream_enable);
+
+void v4l2_pipeline_stream_disable(struct video_device *vdev)
+{
+	struct media_device *mdev = vdev->entity.graph_obj.mdev;
+	struct v4l2_subdev *subdevs[MEDIA_ENTITY_ENUM_MAX_DEPTH];
+	unsigned int size;
+
+	mutex_lock(&mdev->graph_mutex);
+
+	size = v4l2_pipeline_subdevs_get(vdev, subdevs, ARRAY_SIZE(subdevs));
+
+	while (size--) {
+		struct v4l2_subdev *sd = subdevs[size];
+
+		if (--sd->stream_count)
+			continue;
+		dev_dbg(mdev->dev,
+			"disabling stream for '%s'\n", sd->entity.name);
+		v4l2_subdev_call(sd, video, s_stream, false);
+	}
+
+	mutex_unlock(&mdev->graph_mutex);
+}
+EXPORT_SYMBOL_GPL(v4l2_pipeline_stream_disable);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 150ee16ebd811..e833610b0f66d 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -519,6 +519,34 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 			u32 width, u32 height);
 
+/**
+ * v4l2_pipeline_stream_enable - Call .s_stream(true) callbacks in the stream
+ * @vdev: Starting video device
+ *
+ * Call .s_stream(true) callback in all the subdevices participating in the
+ * stream, i.e. following links from sink to source.
+ *
+ * Calls to this function can be nested, in which case the same number of
+ * v4l2_pipeline_stream_disable() calls will be required to stop streaming.
+ * The  pipeline pointer must be identical for all nested calls to
+ * v4l2_pipeline_stream_enable().
+ */
+__must_check int v4l2_pipeline_stream_enable(struct video_device *vdev);
+
+/**
+ * v4l2_pipeline_stream_disable - Call .s_stream(false) callbacks in the stream
+ * @vdev: Starting video device
+ *
+ * Call .s_stream(true) callback in all the subdevices participating in the
+ * stream, i.e. following links from sink to source.
+ *
+ * Calls to this function can be nested, in which case the same number of
+ * v4l2_pipeline_stream_disable() calls will be required to stop streaming.
+ * The  pipeline pointer must be identical for all nested calls to
+ * v4l2_pipeline_stream_enable().
+ */
+void v4l2_pipeline_stream_disable(struct video_device *vdev);
+
 static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
 {
 	/*
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a4848de598521..20f913a9f70c5 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -838,6 +838,7 @@ struct v4l2_subdev_platform_data {
  * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
  *		     device using v4l2_device_register_sensor_subdev().
  * @pdata: common part of subdevice platform data
+ * @stream_count: Stream count for the subdevice.
  *
  * Each instance of a subdev driver should create this struct, either
  * stand-alone or embedded in a larger struct.
@@ -869,6 +870,7 @@ struct v4l2_subdev {
 	struct v4l2_async_notifier *notifier;
 	struct v4l2_async_notifier *subdev_notifier;
 	struct v4l2_subdev_platform_data *pdata;
+	unsigned int stream_count;
 };
 
 
-- 
2.26.0

