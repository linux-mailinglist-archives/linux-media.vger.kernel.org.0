Return-Path: <linux-media+bounces-42754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 942EBB88B0D
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 11:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 571E3526490
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 09:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C702A2EF662;
	Fri, 19 Sep 2025 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KNuclECY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4092F7AA4;
	Fri, 19 Sep 2025 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275839; cv=none; b=f85A8WKZHS2T/lP9DpOPVPFmzCszOcXlSE91VyUlMQ5jBhp7Fp8FS96xCiap7DAdvLbbcbZGhflvK775zqIvxJl5feHT6K6GZ3yYqkrsQhbZSdU+ITnIGLDmQMfAjVOP4bKt5vE68WkCRrT6ht23amOidJpeEElKHqfauQb5roU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275839; c=relaxed/simple;
	bh=6MlR3I7XdVy2osWukwrjAk/wS3sYFAFigVFBtWar3jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJfUzi+kpEggZSouh6qYl4iuQrd6k2PzR2q/YjhrD8RrxA7ckf+9OTe9MQ/0u9W+UaFhJwAhsBeQ/dTq4WR6MMdAl/1z93MPbuXujORJargK4c4opqqeZyuoRRlQv0ud6olb8HXDK9w92qDLXmeV1DnHuqm1v44nlIZSuk0TV9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KNuclECY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4816:952:3054:81b6:1a3a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64A6799F;
	Fri, 19 Sep 2025 11:55:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758275754;
	bh=6MlR3I7XdVy2osWukwrjAk/wS3sYFAFigVFBtWar3jM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KNuclECYpnc1+hLwIrdWWgPYLn6KgG0pa3UQ6fhWT//hnk+U9R1M+6mIf9uu2mcV2
	 Hs9JeHUebDGtP5wfWOxQwa/bmSR9oDdBjNS/akzNqD7LGNlj+Abqeb2hWo6UvCHTIc
	 9jJvcXUKdBI4vFe1TtWNXOG9k2GOEEwsZRgWAEIY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 19 Sep 2025 15:25:55 +0530
Subject: [PATCH v2 03/10] media: v4l2-dev: Add callback for initializing
 video device state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-vdev-state-v2-3-b2c42426965c@ideasonboard.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Al Viro <viro@zeniv.linux.org.uk>, Ma Ke <make24@iscas.ac.cn>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Drivers may need to initialize the video device state with default
values, such as setting a default pixelformat and resolution.

Introduce an optional callback that drivers can populate. The framework
calls this callback during state allocation to allow driver-specific
initialization.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
--
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Ma Ke <make24@iscas.ac.cn>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/v4l2-core/v4l2-dev.c | 13 +++++++++++++
 include/media/v4l2-dev.h           | 11 +++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 26b6b2f37ca55ce981aa17a28a875dc3cf253d9b..dff23c6a0b56fb3d29e1c04e386bb445fa8773bb 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -169,6 +169,7 @@ __video_device_state_alloc(struct video_device *vdev,
 {
 	struct video_device_state *state =
 		kzalloc(sizeof(struct video_device_state), GFP_KERNEL);
+	int ret;
 
 	if (!state)
 		return ERR_PTR(-ENOMEM);
@@ -176,7 +177,19 @@ __video_device_state_alloc(struct video_device *vdev,
 	state->which = which;
 	state->vdev = vdev;
 
+	if (vdev->vdev_ops && vdev->vdev_ops->init_state) {
+		ret = vdev->vdev_ops->init_state(state);
+
+		if (ret)
+			goto err;
+	}
+
 	return state;
+
+err:
+	kfree(state);
+
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(__video_device_state_alloc);
 
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 5ca04a1674e0bf7016537e6fb461d790fc0a958f..d327be16f6def70554a7d92d10436a29384ae32a 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -244,6 +244,15 @@ struct video_device_state {
 	enum video_device_state_whence which;
 };
 
+/**
+ * struct video_device_internal_ops - Callbacks for video device management.
+ *
+ * @init_state: pointer to a function that initializes the video device state.
+ */
+struct video_device_internal_ops {
+	int (*init_state)(struct video_device_state *state);
+};
+
 /*
  * Newer version of video_device, handled by videodev2.c
  *	This version moves redundant code from video device code to
@@ -284,6 +293,7 @@ struct video_device_state {
  *
  * @release: video device release() callback
  * @ioctl_ops: pointer to &struct v4l2_ioctl_ops with ioctl callbacks
+ * @vdev_ops: pointer to &struct video_device_internal_ops
  *
  * @valid_ioctls: bitmap with the valid ioctls for this device
  * @lock: pointer to &struct mutex serialization lock
@@ -336,6 +346,7 @@ struct video_device {
 	/* callbacks */
 	void (*release)(struct video_device *vdev);
 	const struct v4l2_ioctl_ops *ioctl_ops;
+	const struct video_device_internal_ops *vdev_ops;
 	DECLARE_BITMAP(valid_ioctls, BASE_VIDIOC_PRIVATE);
 
 	struct mutex *lock;

-- 
2.51.0


