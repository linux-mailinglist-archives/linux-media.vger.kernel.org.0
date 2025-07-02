Return-Path: <linux-media+bounces-36608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A5AF5C8C
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 17:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E667C7B436F
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 15:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8864330B998;
	Wed,  2 Jul 2025 15:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I3XV4dnX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547962D3753
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 15:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469332; cv=none; b=bzcxdCVqhZ/+kTBIES+dYSiGaz5oyU2iFtwif0Vqj86h/3rEw1Z6g5r2XAyZy6qP2NsglEOcS/owtKKSZbGvFF7LjttZMRnU9Iba5gzkc9oLJlxuMROF23/P4xBVqtlf2SRddOfQPmtcvE1uFFuhmMGPsnSwSS6l2FNJPs/8dec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469332; c=relaxed/simple;
	bh=y73q6f8htuSOBlxjlh095u2DGNM/jXxx12mG0CwJDeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ik0s1Z2obXyGInrABrvvWP5eYxfPZtLDiKlNdnKoNMxUgn8iUxa7S93vp/wBGS14YuqBCbUOfJX8+WeKJrntytd7cmOlH29XFZPY6Lpx4/Y2s7Tvbic8XNgxwtfeKnR2VwIIZuor+6MkRmLj0+Y3n46UZYAixrUth3fFRbB/RNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I3XV4dnX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CBD02206;
	Wed,  2 Jul 2025 17:15:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751469300;
	bh=y73q6f8htuSOBlxjlh095u2DGNM/jXxx12mG0CwJDeU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I3XV4dnXQQtgminEytfczLqpMJyqbnJgZSuOsKTWlUQFloJ8Ngk6G3jwoh4MMnvvT
	 wupsEMZuOX9mXd6nbyUo82sM0stajzzpiDyTuAz7ZtS3bo5S7dddCRCXmwx7LuwybO
	 hzp+bBlYokMAFj6kS8h7sMxiF4ZiUayd7K9Rzwyo=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 02 Jul 2025 16:15:05 +0100
Subject: [PATCH 4/4] media: v4l2-dev: Add helpers to run
 media_pipeline_[started|stopped]()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-pipelines-v1-4-34525973e773@ideasonboard.com>
References: <20250702-pipelines-v1-0-34525973e773@ideasonboard.com>
In-Reply-To: <20250702-pipelines-v1-0-34525973e773@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5224;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=y73q6f8htuSOBlxjlh095u2DGNM/jXxx12mG0CwJDeU=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoZU0J0e2Lo7pH22SoZtus85fxd3/6zUL1bd40+
 CL5fJMEDwSJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaGVNCQAKCRDISVd6bEV1
 Mrn0D/9owY6qqs1fvlCahddOpTXbyJexYea0Fb+pn2yXhMzl4BFNYLKP6DVP4Yen8Y/54/E7YHO
 72Fv5HFb6qagHMfdK8jSQX5ekPAU6SQVk0QX5EJcPAFSA0nLF52zT6QcYZsNqRvf2LeiwM/PsUl
 9nQzPwrzoTMWEK8J0eRZ7nPvaj6qYr4ZC42LLTYUXkPz2k2k8FUgxVl0KHZRAaHWLoxMqTM3zIX
 jxlkccG9/ptRmlt7ZolgIIEzXuADZA/5/VF4ZVKoF1uLIlueIlVo3hRhFqjf/f58Iy2oiDjnucd
 6G0WiUWTvGhzjTmaSDVdsa2fc/2ZbvnZNNliIJBAXXJ68VtnUPfXaVKs7qLTyN8XLpx4E7TU9fh
 +ec24mSFggCMKQnfTozkcNZr3M4Tsz1mYqsfJeGnidQHzfzoETh2dBTXnqY8KjaODkVmvC+Xf9p
 1vNborsUw2kt3XvO0KcRQD06ybyJGHt3A9NeGTzNhs7uSB1p85SDkuKWOSk/zkwWEpFbNAQDV4J
 EWdU/XRu+rToKpROM9srknGFD1wOJy9zhX+jJm/QIOKGDZaORgc0+YKbf+ZJZRKpTo3JHr79iFG
 WsaKZLAlkNrz98WkE7k05vTTmpWv9FwgJmziGbeVzLICc6BN6iSA8AbNfKIinq1YbsR8KkYbwmP
 ytPsNjn+/85pdUg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add helpers to run the new media_pipeline_started() and
media_pipeline_stopped() functions. The helpers iterate over the
entities in the pipeline and count the number of video devices and
compare that to the pipeline's start_count() before acting. This
allows us to only run the media pipeline callbacks in the event that
the pipeline has had video_pipeline_start() called for each video
device.

Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

---

We could take this further perhaps and include the equivalent routine
in video_device_pipeline[_alloc]_start()...if none of the entities
involved have .pipeline_started() or .pipeline_stopped() operations it
should be harmless. Dealing with the three possible return values
shouldn't be problematic I think but I'm a bit reluctant to force the
choice to run those operations on users.
---
 drivers/media/v4l2-core/v4l2-dev.c | 49 ++++++++++++++++++++++++++++++++++++++
 include/media/v4l2-dev.h           | 46 +++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index c369235113d98ae26c30a1aa386e7d60d541a66e..868be3b0ea40a6439aac53ccb54aa72a66a907f6 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1200,6 +1200,55 @@ struct media_pipeline *video_device_pipeline(struct video_device *vdev)
 }
 EXPORT_SYMBOL_GPL(video_device_pipeline);
 
+static int __video_device_pipeline_started(struct media_pipeline *pipe)
+{
+	unsigned int n_video_devices = 0;
+	struct media_entity *entity;
+
+	media_pipeline_for_each_entity(pipe, entity) {
+		if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
+			n_video_devices++;
+	}
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
+	ret = __video_device_pipeline_started(pipe);
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
+	ret = __video_device_pipeline_started(pipe);
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
index 1b6222fab24eda96cbe459b435431c01f7259366..cbd0636bc9f37c0286d0d6d1fcededfbd6182b55 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -654,6 +654,52 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
  */
 struct media_pipeline *video_device_pipeline(struct video_device *vdev);
 
+/**
+ * video_device_pipeline_started - Run the pipeline_started() entity operation
+ *				   for a fully-started media pipeline
+ * @vdev: A video device that's part of the pipeline
+ *
+ * This function checks whether all MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
+ * connected to a given video device through enabled links have been marked as
+ * streaming through the use of video_device_pipeline_start() or one of its
+ * equivalent functions. If so, media_pipeline_started() is called to inform
+ * entities in the pipeline of that fact. The intention is to provide drivers
+ * with a shortcut for checking whether their pipeline is fully ready to start
+ * processing data.
+ *
+ * Returns:
+ *
+ * The number of video devices in the pipeline remaining to be started, or a
+ * negative error number on failure.
+ *
+ * * %-ENODEV		- The given video device is not part of a pipeline
+ * * Other errors	- media_pipeline_started() may pass through other error
+ *			  codes.
+ */
+int video_device_pipeline_started(struct video_device *vdev);
+
+/**
+ * video_device_pipeline_stopped - Run the pipeline_stopped() entity operation
+ *				   for a fully-started media pipeline
+ * @vdev: A video device that's part of the pipeline
+ *
+ * This function checks whether all MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
+ * connected to a given video device through enabled links have been marked as
+ * streaming through the use of video_device_pipeline_start() or one of its
+ * equivalent functions. If so, media_pipeline_stopped() is called for each
+ * entity in the pipeline. The intention is to provide drivers with a shortcut
+ * for checking whether this video device is the first device in the pipeline
+ * to be stopped.
+ *
+ * Returns:
+ *
+ * The number of video devices in the pipeline remaining to be started, or a
+ * negative error number on failure.
+ *
+ * * %-ENODEV		- The given video device is not part of a pipeline
+ */
+int video_device_pipeline_stopped(struct video_device *vdev);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 #endif /* _V4L2_DEV_H */

-- 
2.34.1


