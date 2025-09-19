Return-Path: <linux-media+bounces-42753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBEDB88B04
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 11:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1C211BC642F
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 09:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC882F8BF4;
	Fri, 19 Sep 2025 09:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aK6UsDOG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C962F7AA4;
	Fri, 19 Sep 2025 09:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275833; cv=none; b=BIa55DNdlLpO4l05sGyPwPL4iO2zsW5OOxCNiRls+L7mS2CojBwVaPnuD+9r1aBMcnK8HHk2JzOm7Hu3ePxb94B9N+PBVc14WJuN9QgHDtxOtec8V/WMHzwzkvSbBEKLuxXzdr23xdykLj3gLkZTtf5o80je/iI5hN1tT4QHZKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275833; c=relaxed/simple;
	bh=zi+W0CZreNIqEcNEjhFL5ido8PnktxVJ9Wdjfz6ljaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tu6KFoIPuF2H/V/+87jZCCTbzKep+YTF1Omx0FMByvPEMZmhYqX5RRFjW2ShCDX6xdsDWet3gBLEzK91g8mOoZbwe4Wnp5KlJne+9nYER9dYLYhaCEkeC4g8tZ886IYyDaJjFAc2G4zAv0leiUnvTajClbXIYNRBXlNyw8iLC3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aK6UsDOG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4816:952:3054:81b6:1a3a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B715E842;
	Fri, 19 Sep 2025 11:55:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758275749;
	bh=zi+W0CZreNIqEcNEjhFL5ido8PnktxVJ9Wdjfz6ljaI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aK6UsDOG75qZzWgbZY+yfsWVdTDgPsvguu0zVZMEHbTwmCUMcqHVJ/oxhuLM96rSq
	 KEOiuCR9y9X2L9uSOfAHVsMQkP1vulVTSd7+zquWxbJxoKDSEg7SVVCHuTZh/4f5i7
	 fI6idbCDw+ZaId4ngQjm7UDOLr+/H0euOFBfOa08=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 19 Sep 2025 15:25:54 +0530
Subject: [PATCH v2 02/10] media: v4l2-dev: Add support for try state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-vdev-state-v2-2-b2c42426965c@ideasonboard.com>
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
In-Reply-To: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Ma Ke <make24@iscas.ac.cn>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Format negotiation performed via the TRY_FMT ioctl should only affect
the temporary context of a specific filehandle, not the active state
stored in the video device structure. To support this distinction, we
need separate storage for try and active states.

Introduce an enum to distinguish between these two state types and store
the try state in struct v4l2_fh instead of the video device structure.
The try state is allocated during file handle initialization in
v4l2_fh_init() and released in v4l2_fh_exit().

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
--
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Ma Ke <make24@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/v4l2-core/v4l2-dev.c |  7 +++++--
 drivers/media/v4l2-core/v4l2-fh.c  |  6 ++++++
 include/media/v4l2-dev.h           | 17 ++++++++++++++++-
 include/media/v4l2-fh.h            |  2 ++
 4 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 997255709448510fcd17b6de798a3df99cd7ea09..26b6b2f37ca55ce981aa17a28a875dc3cf253d9b 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -164,7 +164,8 @@ void video_device_release_empty(struct video_device *vdev)
 EXPORT_SYMBOL(video_device_release_empty);
 
 struct video_device_state *
-__video_device_state_alloc(struct video_device *vdev)
+__video_device_state_alloc(struct video_device *vdev,
+			   enum video_device_state_whence which)
 {
 	struct video_device_state *state =
 		kzalloc(sizeof(struct video_device_state), GFP_KERNEL);
@@ -172,6 +173,7 @@ __video_device_state_alloc(struct video_device *vdev)
 	if (!state)
 		return ERR_PTR(-ENOMEM);
 
+	state->which = which;
 	state->vdev = vdev;
 
 	return state;
@@ -962,7 +964,8 @@ int __video_register_device(struct video_device *vdev,
 
 	/* state support */
 	if (test_bit(V4L2_FL_USES_STATE, &vdev->flags))
-		vdev->state = __video_device_state_alloc(vdev);
+		vdev->state = __video_device_state_alloc(vdev,
+							 VIDEO_DEVICE_STATE_ACTIVE);
 
 	/* Part 1: check device type */
 	switch (type) {
diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index df3ba9d4674bd25626cfcddc2d0cb28c233e3cc3..522acc0eb8401305c6893232d96d826669ab90d5 100644
--- a/drivers/media/v4l2-core/v4l2-fh.c
+++ b/drivers/media/v4l2-core/v4l2-fh.c
@@ -38,6 +38,10 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
 	INIT_LIST_HEAD(&fh->subscribed);
 	fh->sequence = -1;
 	mutex_init(&fh->subscribe_lock);
+	/* state support */
+	if (test_bit(V4L2_FL_USES_STATE, &fh->vdev->flags))
+		fh->state = __video_device_state_alloc(vdev,
+						       VIDEO_DEVICE_STATE_TRY);
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_init);
 
@@ -84,6 +88,8 @@ void v4l2_fh_exit(struct v4l2_fh *fh)
 {
 	if (fh->vdev == NULL)
 		return;
+	if (test_bit(V4L2_FL_USES_STATE, &fh->vdev->flags))
+		kfree(fh->state);
 	v4l_disable_media_source(fh->vdev);
 	v4l2_event_unsubscribe_all(fh);
 	mutex_destroy(&fh->subscribe_lock);
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 57e4691ef467aa2b0782dd4b8357bd0670643293..5ca04a1674e0bf7016537e6fb461d790fc0a958f 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -220,15 +220,28 @@ struct v4l2_file_operations {
 	int (*release) (struct file *);
 };
 
+/**
+ * enum video_device_state_whence - Video device state type
+ *
+ * @VIDEO_DEVICE_STATE_TRY: from VIDIOC_TRY_xxx, for negotiation only
+ * @VIDEO_DEVICE_STATE_ACTIVE: from VIDIOC_S_xxx, applied to the device
+ */
+enum video_device_state_whence {
+	VIDEO_DEVICE_STATE_TRY = 0,
+	VIDEO_DEVICE_STATE_ACTIVE = 1,
+};
+
 /**
  * struct video_device_state - Used for storing video device state information.
  *
  * @fmt: Format of the capture stream
  * @vdev: Pointer to video device
+ * @which: State type (from enum video_device_state_whence)
  */
 struct video_device_state {
 	struct v4l2_format fmt;
 	struct video_device *vdev;
+	enum video_device_state_whence which;
 };
 
 /*
@@ -568,13 +581,15 @@ static inline int video_is_registered(struct video_device *vdev)
 /** __video_device_state_alloc - allocate video device state structure
  *
  * @vdev: pointer to struct video_device
+ * @which: type of video device state (from enum video_device_state_whence)
  *
  * .. note::
  *
  *	This function is meant to be used only inside the V4L2 core.
  */
 struct video_device_state *
-__video_device_state_alloc(struct video_device *vdev);
+__video_device_state_alloc(struct video_device *vdev,
+			   enum video_device_state_whence which);
 
 /** __video_device_state_free - free video device state structure
  *
diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index aad4b3689d7ea191978f24ce24d24cd2e73636b6..55455704a98d0785d0a3418b8a43d7363b7c8aa2 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -28,6 +28,7 @@ struct v4l2_ctrl_handler;
  * @vdev: pointer to &struct video_device
  * @ctrl_handler: pointer to &struct v4l2_ctrl_handler
  * @prio: priority of the file handler, as defined by &enum v4l2_priority
+ * @state: try state used for format negotiation on the video device
  *
  * @wait: event' s wait queue
  * @subscribe_lock: serialise changes to the subscribed list; guarantee that
@@ -44,6 +45,7 @@ struct v4l2_fh {
 	struct video_device	*vdev;
 	struct v4l2_ctrl_handler *ctrl_handler;
 	enum v4l2_priority	prio;
+	struct video_device_state *state;
 
 	/* Events */
 	wait_queue_head_t	wait;

-- 
2.51.0


