Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 331F018736A
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 20:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732502AbgCPTd3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 15:33:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51864 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732366AbgCPTd3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 15:33:29 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 2B27B293369
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com,
        niklas.soderlund@ragnatech.se, mchehab@kernel.org,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH 2/4] media: v4l2-common: add helper functions to call s_stream() callbacks
Date:   Mon, 16 Mar 2020 16:33:03 -0300
Message-Id: <20200316193305.428378-3-helen.koike@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200316193305.428378-1-helen.koike@collabora.com>
References: <20200316193305.428378-1-helen.koike@collabora.com>
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

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

 drivers/media/v4l2-core/v4l2-common.c | 99 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 30 ++++++++
 include/media/v4l2-subdev.h           |  2 +
 3 files changed, 131 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index d0e5ebc736f9..6a5a3d2c282e 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -441,3 +441,102 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
+
+int v4l2_pipeline_stream_disable(struct media_entity *entity,
+				 struct media_pipeline *pipe)
+{
+	struct media_device *mdev = entity->graph_obj.mdev;
+	int ret = 0;
+
+	mutex_lock(&mdev->graph_mutex);
+
+	if (!pipe->streaming_count) {
+		ret = media_graph_walk_init(&pipe->graph, mdev);
+		if (ret) {
+			mutex_unlock(&mdev->graph_mutex);
+			return ret;
+		}
+	}
+
+	media_graph_walk_start(&pipe->graph, entity);
+
+	while ((entity = media_graph_walk_next_stream(&pipe->graph))) {
+		struct v4l2_subdev *sd;
+
+		if (!is_media_entity_v4l2_subdev(entity))
+			continue;
+
+		sd = media_entity_to_v4l2_subdev(entity);
+		if (!sd->stream_count || --sd->stream_count)
+			continue;
+
+		ret = v4l2_subdev_call(sd, video, s_stream, false);
+		if (ret && ret != -ENOIOCTLCMD)
+			dev_dbg(mdev->dev,
+				"couldn't disable stream for subdevice '%s'\n",
+				entity->name);
+			break;
+		}
+
+		dev_dbg(mdev->dev,
+			"stream disabled for subdevice '%s'\n", entity->name);
+	}
+
+	if (!pipe->streaming_count)
+		media_graph_walk_cleanup(&pipe->graph);
+
+	mutex_unlock(&mdev->graph_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(v4l2_pipeline_stream_disable);
+
+__must_check int v4l2_pipeline_stream_enable(struct media_entity *entity,
+					     struct media_pipeline *pipe)
+{
+	struct media_device *mdev = entity->graph_obj.mdev;
+	int ret = 0;
+
+	mutex_lock(&mdev->graph_mutex);
+
+	if (!pipe->streaming_count) {
+		ret = media_graph_walk_init(&pipe->graph, mdev);
+		if (ret) {
+			mutex_unlock(&mdev->graph_mutex);
+			return ret;
+		}
+	}
+
+	media_graph_walk_start(&pipe->graph, entity);
+
+	while ((entity = media_graph_walk_next_stream(&pipe->graph))) {
+		struct v4l2_subdev *sd;
+
+		if (!is_media_entity_v4l2_subdev(entity))
+			continue;
+
+		sd = media_entity_to_v4l2_subdev(entity);
+		if (sd->stream_count++)
+			continue;
+
+		ret = v4l2_subdev_call(sd, video, s_stream, true);
+		if (ret && ret != -ENOIOCTLCMD)
+			dev_dbg(mdev->dev,
+				"couldn't enable stream for subdevice '%s'\n",
+				entity->name);
+			v4l2_pipeline_stream_disable(entity, pipe);
+			break;
+		}
+
+		dev_dbg(mdev->dev,
+			"stream enabled for subdevice '%s'\n", entity->name);
+	}
+
+	if (!pipe->streaming_count)
+		media_graph_walk_cleanup(&pipe->graph);
+
+	mutex_unlock(&mdev->graph_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(v4l2_pipeline_stream_enable);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 150ee16ebd81..46c0857d07c4 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -519,6 +519,36 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 			u32 width, u32 height);
 
+/**
+ * media_pipeline_stop - Mark a pipeline as not streaming
+ * @entity: Starting entity
+ * @pipe: Media pipeline to iterate through the topology
+ *
+ * Call .s_stream(false) callback in all the subdevices participating in the
+ * stream, i.e. following links from sink to source.
+ *
+ * If multiple calls to v4l2_pipeline_stream_enable() have been made, the
+ * same number of calls to this function are required.
+ */
+int v4l2_pipeline_stream_disable(struct media_entity *entity,
+				 struct media_pipeline *pipe);
+
+/**
+ * v4l2_pipeline_stream_enable - Call .s_stream(true) callbacks in the stream
+ * @entity: Starting entity
+ * @pipe: Media pipeline to iterate through the topology
+ *
+ * Call .s_stream(true) callback in all the subdevices participating in the
+ * stream, i.e. following links from sink to source.
+ *
+ * Calls to this function can be nested, in which case the same number of
+ * v4l2_pipeline_stream_disable() calls will be required to stop streaming.
+ * The  pipeline pointer must be identical for all nested calls to
+ * v4l2_pipeline_stream_enable().
+ */
+__must_check int v4l2_pipeline_stream_enable(struct media_entity *entity,
+					     struct media_pipeline *pipe);
+
 static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
 {
 	/*
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a4848de59852..20f913a9f70c 100644
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
2.25.0

