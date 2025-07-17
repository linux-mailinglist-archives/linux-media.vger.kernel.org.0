Return-Path: <linux-media+bounces-37973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAF7B08B0F
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E18D1623A7
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DAB2BD03C;
	Thu, 17 Jul 2025 10:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ja8iQTKh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8ED2BCF4D;
	Thu, 17 Jul 2025 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749160; cv=none; b=WZFBy7NBKn2B8tNRaA/467TQ6cJP2ud7+h5oGD/YCombm3kK9qs/rm7GuoJ7ay0eMi4EFzbB8UUaiPE1tbCzhZotAdHxbC5G7xZp4uQ0+0TffIQeYfYljohVmNrZmuwKp5W/2fITVAwVJQRr7Vmb+ebODsZrgQL+87HJmB4QyP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749160; c=relaxed/simple;
	bh=197W8u1gSO7XU4oga3u7Ge9U/VY49m37BOEZ2Y4hDcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6qHaVaUsz0ESgijSQctox83TeJEnCEs3TmoWcELl2F9oNEVI9qoQfI18vg9onR6aAq6cOBlcb+THAJT05QDCLDq3ZIl7+g59jb/oA4RohsNcV4ugzL22ND2u1oNjinNjs5YDa98VKWJ8ICIVHh20TZ2rPlnhl5l5Zlkz7g59W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ja8iQTKh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8609C21F2;
	Thu, 17 Jul 2025 12:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749119;
	bh=197W8u1gSO7XU4oga3u7Ge9U/VY49m37BOEZ2Y4hDcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ja8iQTKheZrLtCb1fEdWhqHs4ashqfpbS6Qc77UCXxliQQ1HArA2OrSDb6YapkbMO
	 estn3R9optM/LLPZjT0X4kvpP7mKvO/HJCyQPNn5bHRm0429McUbs0cRPx1JX/A6x3
	 A4nUgW+bNdItefXcwOzffLuMqkgTZN38VR2tBQt4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:35 +0200
Subject: [PATCH 09/26] media: v4l2-dev: Add
 video_device_context_from_file()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-9-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3667;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=197W8u1gSO7XU4oga3u7Ge9U/VY49m37BOEZ2Y4hDcg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRPaIxen4Bw+KjcuuI/aC5KhOiFFpyZ9JkIi
 eu2RNObyE2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUTwAKCRByNAaPFqFW
 PMX6D/4380V0vWPd3gLiLX2RuDp2c2NJYxbw0KLgTkZAmggpTnVeZHIBeZ1lgcUOQM34GAhqQBl
 Skv2pazfVaQZio+jfqnSTW5526fyb56tq3618wm4Wanq2R1MKN7lsBkqNtmgMWR6Uod2lsHKHhd
 bnmhhyvNFUKkpKAcEmMcWctv+9cRZaBhpRjtkaFFI7jGL8i/Cj8q99Qp0VFx85u9wBnbsxHeV91
 qcUEZV2t7IfqOacFeoNhCMg95wB31iyQHVDMir8Mnc0lqd/VSc6j4MN0glKjaz+EWGFeLYeUD9i
 1v/wJdyZiC+6ECKFTgL5yn2bu2vuqhqAKcckj9/I0gIB0EfToDlNdHfK2bqQ43+Dre5l2J5VVNb
 +1b+qZ9rt7VNuOdfVNLDoC6PWGYFOR31U2syyfW2KsJhc+SjfK+njqVBuZ+QggRHyRJsP9/Z7K/
 QKmdk2lExSHvmlVR4ZiuzJxf22lxDPYfnHl3ZfwBqfqlP+o0UWY4MeHZOijMezr/dOOZc3QRyAd
 aLrOHG1tYEPHoynqFzqmlzLkBnJzNJa7IMFkkJUiq9eMGkmD9f1YQKhtYH8P/vR/ozlki/XLZht
 DPANRuh9Z9U+kckKjZ6tuWZHZabo/whsWs8+VQIlS0lvM5mJdiS1ITOf025nkHF1UmRanm36ikM
 cdpq3tAQIE/ogQQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Introduce an helper function to get a video_device_context from file.
If no context has been bound to the file, return the video device
default context.

As a video device context lifetime is bound to the one of the file
handle it is associated with, and the intended user of this helper are
the v4l2_ioctl_ops handlers that operates on an open file handle, the
context returned by this function is guaranteed to be valid for the
whole function scope of the caller.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 15 +++++++++++++++
 include/media/v4l2-dev.h           | 30 ++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 2d78096931efd88215bc847b105e198a54035546..96696959314abfb1864ea5d96742e579b5a41f6f 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1180,6 +1180,21 @@ struct dentry *v4l2_debugfs_root(void)
 EXPORT_SYMBOL_GPL(v4l2_debugfs_root);
 #endif
 
+struct video_device_context *
+video_device_context_from_file(struct file *filp, struct video_device *vfd)
+{
+	struct v4l2_fh *vfh =
+		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? filp->private_data
+							    : NULL;
+
+	/* If the file handle has been bound to a context return it. */
+	if (vfh && vfh->context)
+		return vfh->context;
+
+	return vfd->default_context;
+}
+EXPORT_SYMBOL_GPL(video_device_context_from_file);
+
 #if defined(CONFIG_MEDIA_CONTROLLER)
 
 __must_check int video_device_pipeline_start(struct video_device *vdev,
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 9e1cf58623acc4ab5f503a9663fd999b38130226..a41afb81663bc9cb3bfc06dcf9b11ceeaf7c3415 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -789,6 +789,36 @@ int video_device_init_context(struct video_device *vdev,
  */
 void video_device_cleanup_context(struct video_device_context *ctx);
 
+/**
+ * video_device_context_from_file - Get the video device context associated with
+ *				    an open file handle
+ * @filp: The file handle
+ * @vdev: The video device
+ *
+ * If a video device context has been bound to an open file handle by a call
+ * to the VIDIOC_BIND_CONTEXT ioctl this function returns it, otherwise returns
+ * the default video device context.
+ *
+ * The intended callers of this helper are the driver-specific v4l2_ioctl_ops
+ * handlers, which receive as first argument a file pointer. By using this
+ * helper drivers can get the context associated with such file, if any.
+ * Otherwise, if the video device  has not been bound to any media device
+ * context, the default video device context is returned.
+ *
+ * As video device contexts are reference counted and their lifetime is
+ * guaranteed to be at least the one of the file handle they are associated
+ * with, callers of this function are guaranteed to always receive a valid
+ * context reference by this function. The reference will remain valid for the
+ * whole function scope of the caller that has received the open file handle as
+ * argument. Likewise, accessing the media context from the video device context
+ * returned by this function is always safe within the same function scope.
+ *
+ * This function does not increase the reference count of the returned video
+ * device context.
+ */
+struct video_device_context *
+video_device_context_from_file(struct file *filp, struct video_device *vdev);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 #endif /* _V4L2_DEV_H */

-- 
2.49.0


