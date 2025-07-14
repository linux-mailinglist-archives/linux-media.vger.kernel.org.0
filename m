Return-Path: <linux-media+bounces-37655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ECEB042B4
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B1C34A59B9
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3236E25C82E;
	Mon, 14 Jul 2025 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KzA2d58a"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040C825A65A;
	Mon, 14 Jul 2025 15:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505614; cv=none; b=dcMlwmI3bKeaOuM2+uCrrz4oNYizRHDBVj55qKTqHc6b91ZXmpnHy13M9MxKX/3Gt7Sgtl80f0bI+tYXk5E7tcPBD3X+7nICD6uI4d1t++Gdmo6dPOEN1TFbmvtX8wCRAvQ9GverQ7w19ukFX34pBNBOv/owR7b/DRU6Z2OuW0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505614; c=relaxed/simple;
	bh=WPi3EKcjkFStaX7Xo+7uNWCSChPJ0hwr4NqzokzSouI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VDBZcZpylaMugmhUdMOzXMG4v+646UCyQoW0ATFJVZQteKJpVv5DrQBl/aZOESul+x0EXGAvwpQm59u/gGfApThBJtijnbW2lRweybmWofK9ptxD0Hz6LAEZ95xWSRhCIPBJoTuW+CWKDICSEBO9FT5TwIgSr3HnP1AjWtB/PJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KzA2d58a; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1515F5405;
	Mon, 14 Jul 2025 17:06:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505574;
	bh=WPi3EKcjkFStaX7Xo+7uNWCSChPJ0hwr4NqzokzSouI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KzA2d58a4E7TG40tfy0+3/cGLF3FHOs9RuiF9/AKkXJwaxMcOejHv2Evw8vwNNRAt
	 dbX0ggSZn1vUqBLTPAZPTzqzh9OyM/IcvKixkrv+UlOpQiL2xLFU1Jh03DDU8MMSRv
	 3eyNlVkyh3Mm+bGvl9Qr6nsoMY9T0tAiqMVbG1cs=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:28 +0100
Subject: [PATCH v11 02/19] media: v4l2-dev: Add helpers to run
 media_pipeline_[started|stopped]()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-2-bc20e460e42a@ideasonboard.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
In-Reply-To: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5913;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=WPi3EKcjkFStaX7Xo+7uNWCSChPJ0hwr4NqzokzSouI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodRz/2/xgdWQcQcA2A9TCRcbn+3ZQBsGuU1nLb
 BERlNdVwnGJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUc/wAKCRDISVd6bEV1
 MunpEAC7Xc7TA9fJlW5+DgKZemVYOq/vE5czMmmpEVB37POQM0l5x4MeGSbejujoDKajzrFvtPR
 zVC1n5i12EsFmpD1KVbu13t7HiuN4T1cMw9qkJTBAJcLv3JqnQFB7Vql9PEL5G/TakbSqRx16+J
 PSEAImH7Bxgvq4w9U5UZKxS2yl0yX2DDhRoqXo2CuAIONaO9HxXLPAVcqeTCfO62EihaEB0tmVW
 k2HytTMsSLFTuITAnOXALqdwuSLbUgjAdJca9XXHlrT6htEEqH6UJswEpeeNaGQq7dqG6bT/jwY
 mAJzU9gAqpdc4hqDmppONxfZyduj6A2XK0u7nqe4L6UGRoabSIvCqkLqby9d7KpIEKIxpA5MSlg
 QtjTY30sP+5KbNdgL+hEp2NkAvncno0RczuPN0suGTyQMsGS21a8SQVWV48TB1Z/RuiSODU4ZRh
 b3ebt5bc724Oxv5UWhmWnq06MextTQKzPR8eDEsFwzJLT336LEV0GCme7tw8GhSPeMLNNUfPZqi
 Ci48MvflpXkcXOPBgR+9eF8n7/3if0GAvtgTC8Fpe84uxJsBT3/2nKySQGlZps9KXb6v7v04nH+
 8BxVghelMyDZKYTQFruWSROesALeFtG6zzBeyo2MxM0c0L+AZihLng9D4N1/OM/aErekPVYv8Zr
 wZB9eYgYE+Fbu3w==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add helpers to run the new media_pipeline_started() and
media_pipeline_stopped() functions. The helpers iterate over the
entities in the pipeline and count the number of video devices and
compare that to the pipeline's start_count() before acting. This
allows us to only run the media pipeline callbacks in the event that
the pipeline has had video_pipeline_start() called for each video
device.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

---
Changes in v3:
	- Revised the documentation a bit, detailing the specific error
	  codes and rewording the descriptions
	- Renamed __video_device_pipeline_started()
	- List the possible return values explicitly

Changes in v2:

	- Adapted now media_pipeline_for_each_entity() takes an iter
	  variable
	- Fixed the Return: section of the kerneldoc comments
---
 drivers/media/v4l2-core/v4l2-dev.c | 57 ++++++++++++++++++++++++++++++++++++++
 include/media/v4l2-dev.h           | 52 ++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index c369235113d98ae26c30a1aa386e7d60d541a66e..a25038f3c9cc9213b840e2b96d1ef49d17d22fb8 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1200,6 +1200,63 @@ struct media_pipeline *video_device_pipeline(struct video_device *vdev)
 }
 EXPORT_SYMBOL_GPL(video_device_pipeline);
 
+static int video_device_pipeline_unstarted_vdevs(struct media_pipeline *pipe)
+{
+	struct media_pipeline_entity_iter iter;
+	unsigned int n_video_devices = 0;
+	struct media_entity *entity;
+	int ret;
+
+	ret = media_pipeline_entity_iter_init(pipe, &iter);
+	if (ret)
+		return ret;
+
+	media_pipeline_for_each_entity(pipe, &iter, entity) {
+		if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
+			n_video_devices++;
+	}
+
+	media_pipeline_entity_iter_cleanup(&iter);
+
+	return n_video_devices - pipe->start_count;
+}
+
+int video_device_pipeline_started(struct video_device *vdev)
+{
+	struct media_pipeline *pipe;
+	int ret;
+
+	pipe = video_device_pipeline(vdev);
+	if (!pipe)
+		return -ENODEV;
+
+	ret = video_device_pipeline_unstarted_vdevs(pipe);
+	if (ret)
+		return ret;
+
+	return media_pipeline_started(pipe);
+}
+EXPORT_SYMBOL_GPL(video_device_pipeline_started);
+
+int video_device_pipeline_stopped(struct video_device *vdev)
+{
+	struct media_pipeline *pipe;
+	int ret;
+
+	pipe = video_device_pipeline(vdev);
+	if (!pipe)
+		return -ENODEV;
+
+	ret = video_device_pipeline_unstarted_vdevs(pipe);
+	if (ret)
+		return ret;
+
+	media_pipeline_stopped(pipe);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(video_device_pipeline_stopped);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /*
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 1b6222fab24eda96cbe459b435431c01f7259366..45a87a5a76e8782c79da9d4890b063b8f0cbb3d8 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -654,6 +654,58 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
  */
 struct media_pipeline *video_device_pipeline(struct video_device *vdev);
 
+/**
+ * video_device_pipeline_started - Run the pipeline_started() entity operation
+ *				   for a fully-started media pipeline
+ * @vdev: A video device that's part of the pipeline
+ *
+ * This function checks whether all MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
+ * connected to a given video device through enabled links, either directly or
+ * indirectly, have been marked as streaming through the use of
+ * video_device_pipeline_start() or one of its equivalent functions. If so,
+ * media_pipeline_started() is called to inform entities in the pipeline of that
+ * fact. The intention is to provide drivers with a mechanism for checking
+ * whether their pipeline is fully ready to start processing data and call the
+ * .pipeline_started() media entity operation on all the entities in the
+ * pipeline if so.
+ *
+ * Return: The number of video devices in the pipeline remaining to be started,
+ * or a negative error number on failure:
+ *
+ * * 0			- Success
+ * * n > 0		- n video devices in the pipeline remain unstarted
+ * * -ENODEV		- The video device has no pipeline
+ * * -ENOMEM		- failed to allocate pipeline iterator
+ * * n < 0		- Error passed through from a media entity's
+ *			  .pipeline_started() operation
+ */
+int video_device_pipeline_started(struct video_device *vdev);
+
+/**
+ * video_device_pipeline_stopped - Run the pipeline_stopped() entity operation
+ *				   for a fully-started media pipeline
+ * @vdev: A video device that's part of the pipeline
+ *
+ * This function checks whether the MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
+ * connected to a given video device through enabled links, either directly or
+ * indirectly, have been marked as not streaming through the use of
+ * video_device_pipeline_stop() or one of its equivalent functions. If none of
+ * the video devices in the pipeline have been stopped, then the function
+ * media_pipeline_stopped() is called. The intention is to provide drivers with
+ * a mechanism for checking whether this video device is the first device in the
+ * pipeline to be stopped and call the .pipeline_stopped() media entity
+ * operation on all the entities in the pipeline if so.
+ *
+ * Return: The number of video devices in the pipeline remaining to be started,
+ * or a negative error number on failure:
+ *
+ * * 0			- Success
+ * * n > 0		- n video devices in the pipeline already stopped
+ * * -ENODEV		- The video device has no pipeline
+ * * -ENOMEM		- failed to allocate pipeline iterator
+ */
+int video_device_pipeline_stopped(struct video_device *vdev);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 #endif /* _V4L2_DEV_H */

-- 
2.34.1


