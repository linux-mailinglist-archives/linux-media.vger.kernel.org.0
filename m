Return-Path: <linux-media+bounces-18275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7B5978AD6
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 23:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E2F61C2308D
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 21:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F7C16F0EC;
	Fri, 13 Sep 2024 21:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UzsxQsWp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327EA1527AC
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 21:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264047; cv=none; b=AV+8+oFHDt8bJU08TlUn1LKUshWigEfsHDodhxSA1zGOLKDqq7jugtdVIrmzv9NzhyHknkd118YYNwJd59vaYfexdHLUYDSZ/x8cej1CIlPftEpjlZZ7wDLv/gcJrebCz4lvdpujGvzcbWz832UgJG7MlHR6ecELzjjhEewn3L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264047; c=relaxed/simple;
	bh=I9XkynIK6QYsUmsKZc85wfx8aP+41+aqdO1VT7BsRyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNUG8ERnfRXZfBkevA2cVoWAMyc173znPRKc+iisnCJIJvQkEch7ocff+s3aRdNQKIs5pHAN4sb1/v5IhdV8cmWAplw2Yt5z0fTxlzrPa3RZRhe0KYR1OnCc3m6cU0WBxA8wJbfzST4GY1AFc4umpTeiREJRjyAaT0hutOaj2i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UzsxQsWp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 320311A6F;
	Fri, 13 Sep 2024 23:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726263950;
	bh=I9XkynIK6QYsUmsKZc85wfx8aP+41+aqdO1VT7BsRyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UzsxQsWpn/b3CDiEBYJkcPTwqgaAALbGpbP0BQQfnobwEROqwyWIPf7cnyBUcXo4f
	 2BoUl4aQLoF9BleLz8n5rxHPcZD0tNUoNy5l0aZB7zGaAv3fi5sJRPr4KGEqC0+f4X
	 VQ028sNS/GUCb86JnCDW2T1vd2al7FNgXffs2Wfk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 06/10] media: v4l2-dev: Add video_device_context_from_file()
Date: Fri, 13 Sep 2024 23:46:51 +0200
Message-ID: <20240913214657.1502838-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913214657.1502838-1-jacopo.mondi@ideasonboard.com>
References: <20240913214657.1502838-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 73462191fd17..d92989d76cf0 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1181,6 +1181,21 @@ void video_unregister_device(struct video_device *vdev)
 }
 EXPORT_SYMBOL(video_unregister_device);
 
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
index b79b14e36a2a..32e61f9f9cb5 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -766,6 +766,36 @@ int video_device_init_context(struct video_device *vdev,
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
2.46.0


