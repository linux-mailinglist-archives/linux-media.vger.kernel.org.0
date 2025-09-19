Return-Path: <linux-media+bounces-42751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24355B88AD1
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 11:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C74331BC63DE
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 09:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7471C2ECD1D;
	Fri, 19 Sep 2025 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DD7UEsq1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95106233D7B;
	Fri, 19 Sep 2025 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275827; cv=none; b=FAkwJfdCeTfre0OQkFRhPDd0pSQIzGR0hwera4S5U+99PRnUiGqelQgQ8fWRxtUNSBx4Vp92ZLrzg1OoJHC+1B50ABzjNTpekdl2zLtB+F4omQMn4z7mrzXaKEg8SfM2otGNJBZ8TFtKLHWF4P/5PyfF+FVGaYT4nbCSRPeg/ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275827; c=relaxed/simple;
	bh=dQZUXDBU9VTisrmACgFhfCmslHInS7+4IkSl/wCbELw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CABUwKgIME2ibn8zew7LgRBH48V4j5eH0qLd5Wyee6n0XdfsGR4zlefKYnHFRymY72ELdnbTSuE41Rdpe3V5kwHGN/0E7m129kNaABoBjuKwtBM9kAjEnl6eFEmhteAN3le4mUfG0QmTcTcCv8g77gJOnuu7KFnwjmqPt8GwDXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DD7UEsq1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4816:952:3054:81b6:1a3a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C673B842;
	Fri, 19 Sep 2025 11:55:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758275743;
	bh=dQZUXDBU9VTisrmACgFhfCmslHInS7+4IkSl/wCbELw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DD7UEsq10EOVsS4MqGUsBYgyCmkmOq+zvxkjtCc+LB2oVkW4wzlxc38P5yj5u8F3C
	 93lf0OFXIeb7v1ocRAuZBMvpQczOozR/JxPrybzHS8M8N43A1BGDafWnpR4CJF0QMk
	 iqFcskLQ4OE1fiZ/TqUEv4tg00sE5pfanumjC8SM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 19 Sep 2025 15:25:53 +0530
Subject: [PATCH v2 01/10] media: v4l2-core: Introduce state management for
 video devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-vdev-state-v2-1-b2c42426965c@ideasonboard.com>
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
 Al Viro <viro@zeniv.linux.org.uk>, Ma Ke <make24@iscas.ac.cn>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Similar to V4L2 subdev states, introduce state support for video devices
to provide a centralized location for storing device state information.
This includes the current (active) pixelformat used by the device and
the temporary (try) pixelformat used during format negotiation. In the
future, this may be extended or subclassed by device drivers to store
their internal state variables.

Also introduce a flag for drivers that wish to use this state
management. When set, the framework automatically allocates the state
during device registration and stores a pointer to it within the
video_device structure.

This change aligns video devices with V4L2 subdevices by storing
hardware state in a common framework-allocated structure. This is the
first step towards enabling the multiplexing of the underlying hardware
by using different software "contexts", each represented by the combined
state of all video devices and V4L2 subdevices in a complex media graph.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
--
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Ma Ke <make24@iscas.ac.cn>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/v4l2-core/v4l2-dev.c | 27 +++++++++++++++++++++++++
 include/media/v4l2-dev.h           | 40 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 10a126e50c1ca25b1bd0e9872571261acfc26b39..997255709448510fcd17b6de798a3df99cd7ea09 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -163,6 +163,27 @@ void video_device_release_empty(struct video_device *vdev)
 }
 EXPORT_SYMBOL(video_device_release_empty);
 
+struct video_device_state *
+__video_device_state_alloc(struct video_device *vdev)
+{
+	struct video_device_state *state =
+		kzalloc(sizeof(struct video_device_state), GFP_KERNEL);
+
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	state->vdev = vdev;
+
+	return state;
+}
+EXPORT_SYMBOL_GPL(__video_device_state_alloc);
+
+void __video_device_state_free(struct video_device_state *state)
+{
+	kfree(state);
+}
+EXPORT_SYMBOL_GPL(__video_device_state_free);
+
 static inline void video_get(struct video_device *vdev)
 {
 	get_device(&vdev->dev);
@@ -939,6 +960,10 @@ int __video_register_device(struct video_device *vdev,
 	spin_lock_init(&vdev->fh_lock);
 	INIT_LIST_HEAD(&vdev->fh_list);
 
+	/* state support */
+	if (test_bit(V4L2_FL_USES_STATE, &vdev->flags))
+		vdev->state = __video_device_state_alloc(vdev);
+
 	/* Part 1: check device type */
 	switch (type) {
 	case VFL_TYPE_VIDEO:
@@ -1127,6 +1152,8 @@ void video_unregister_device(struct video_device *vdev)
 	clear_bit(V4L2_FL_REGISTERED, &vdev->flags);
 	mutex_unlock(&videodev_lock);
 	v4l2_event_wake_all(vdev);
+	if (test_bit(V4L2_FL_USES_STATE, &vdev->flags))
+		__video_device_state_free(vdev->state);
 	device_unregister(&vdev->dev);
 }
 EXPORT_SYMBOL(video_unregister_device);
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index a213c3398dcf60be8c531df87bf40c56b4ad772d..57e4691ef467aa2b0782dd4b8357bd0670643293 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -89,12 +89,18 @@ struct dentry;
  *	set by the core when the sub-devices device nodes are registered with
  *	v4l2_device_register_ro_subdev_nodes() and used by the sub-device ioctl
  *	handler to restrict access to some ioctl calls.
+ * @V4L2_FL_USES_STATE:
+ *	indicates that the &struct video_device has state support.
+ *	The active video and metadata formats are stored in video_device.state,
+ *	and the try video and metadata formats are stored in v4l2_fh.state.
+ *	All new drivers should use it.
  */
 enum v4l2_video_device_flags {
 	V4L2_FL_REGISTERED		= 0,
 	V4L2_FL_USES_V4L2_FH		= 1,
 	V4L2_FL_QUIRK_INVERTED_CROP	= 2,
 	V4L2_FL_SUBDEV_RO_DEVNODE	= 3,
+	V4L2_FL_USES_STATE		= 4,
 };
 
 /* Priority helper functions */
@@ -214,6 +220,17 @@ struct v4l2_file_operations {
 	int (*release) (struct file *);
 };
 
+/**
+ * struct video_device_state - Used for storing video device state information.
+ *
+ * @fmt: Format of the capture stream
+ * @vdev: Pointer to video device
+ */
+struct video_device_state {
+	struct v4l2_format fmt;
+	struct video_device *vdev;
+};
+
 /*
  * Newer version of video_device, handled by videodev2.c
  *	This version moves redundant code from video device code to
@@ -238,6 +255,7 @@ struct v4l2_file_operations {
  * @queue: &struct vb2_queue associated with this device node. May be NULL.
  * @prio: pointer to &struct v4l2_prio_state with device's Priority state.
  *	 If NULL, then v4l2_dev->prio will be used.
+ * @state: &struct video_device_state, holds the active state for the device.
  * @name: video device name
  * @vfl_type: V4L device type, as defined by &enum vfl_devnode_type
  * @vfl_dir: V4L receiver, transmitter or m2m
@@ -283,6 +301,7 @@ struct video_device {
 	struct vb2_queue *queue;
 
 	struct v4l2_prio_state *prio;
+	struct video_device_state *state;
 
 	/* device info */
 	char name[64];
@@ -546,6 +565,27 @@ static inline int video_is_registered(struct video_device *vdev)
 	return test_bit(V4L2_FL_REGISTERED, &vdev->flags);
 }
 
+/** __video_device_state_alloc - allocate video device state structure
+ *
+ * @vdev: pointer to struct video_device
+ *
+ * .. note::
+ *
+ *	This function is meant to be used only inside the V4L2 core.
+ */
+struct video_device_state *
+__video_device_state_alloc(struct video_device *vdev);
+
+/** __video_device_state_free - free video device state structure
+ *
+ * @state: pointer to the state to be freed
+ *
+ * .. note::
+ *
+ *	This function is meant to be used only inside the V4L2 core.
+ */
+void __video_device_state_free(struct video_device_state *state);
+
 /**
  * v4l2_debugfs_root - returns the dentry of the top-level "v4l2" debugfs dir
  *

-- 
2.51.0


