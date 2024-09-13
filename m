Return-Path: <linux-media+bounces-18273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E18978AD4
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 23:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35DBC1C23005
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 21:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1845815B0EE;
	Fri, 13 Sep 2024 21:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PZIymVBY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95346BFD4
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 21:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264044; cv=none; b=aA+BZM02bHNGQVnBacU9Uab+HfGP8W/2V4053+giL4vpMPBKAng69s164aIyuYYHtaUWKU3UNt4JKJcVOrQf/rkuVgi6cWiapJInAzqqAXcEjkLf0RS8/Nad/iDo9Itg0u1gykH9xr1dZo25tQv/EHr7nL8Gh7dqO4OnT1eNrks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264044; c=relaxed/simple;
	bh=C/tLRufzYECRe+GhTy0TGewSXXIqGyGCVTzqUTapgGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2p/zbGk6Zv7M1uWK23I4wpo4qtjWlTEQyKJgfH8TlDpnOcepY1SPdZiJ8GflqdG3q03Oeir9la4v6CqKlDEmVzLDwd4oCqX2mhdYRahs/d+OEV+K6UXD6VHvc6ejBT4JGnYRYqqwjZHWxv7eHQYrvK+9MlEEmdPGFW3UoZULhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PZIymVBY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 989841961;
	Fri, 13 Sep 2024 23:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726263949;
	bh=C/tLRufzYECRe+GhTy0TGewSXXIqGyGCVTzqUTapgGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PZIymVBY0tIA3OpULT+ZeT9fear0PwP0kLVBu5GrxIv9zKNPHqGPYXuUqdJEqN1t4
	 wT9dP0Z1Mgg1pk3iK7Gn61PPA/dttUv9BfZQLWlSihWyhnlfWmXn/2mgP7uOYouwJb
	 rE1JqqZVD/ld3KGInnCUiEDtEgHKWJ8gzpgtn/Vk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 04/10] media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
Date: Fri, 13 Sep 2024 23:46:49 +0200
Message-ID: <20240913214657.1502838-5-jacopo.mondi@ideasonboard.com>
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

Introduce a new ioctl in V4L2 to allocate a video device context and
associate it with a media device context.

The ioctl is valid only if support for MEDIA_CONTROLLER is compiled in
as it calls into the entity ops to let driver allocate a new context and
binds the newly created context with the media context associated
with the file descriptor provided by userspace as the new ioctl
argument.

The newly allocated video context is then stored in the v4l2-fh that
represent the open file handle on which the ioctl has been called.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-dev.c   | 10 +++++
 drivers/media/v4l2-core/v4l2-fh.c    |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c | 64 ++++++++++++++++++++++++++++
 include/media/v4l2-ioctl.h           |  5 +++
 include/uapi/linux/videodev2.h       | 11 +++++
 5 files changed, 91 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 0fd6ff3f00f6..41719b009c1e 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -628,6 +628,10 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		__set_bit(_IOC_NR(VIDIOC_ENUM_FREQ_BANDS), valid_ioctls);
 
 	if (is_vid) {
+#ifdef CONFIG_MEDIA_CONTROLLER
+		__set_bit(_IOC_NR(VIDIOC_BIND_CONTEXT), valid_ioctls);
+#endif
+
 		/* video specific ioctls */
 		if ((is_rx && (ops->vidioc_enum_fmt_vid_cap ||
 			       ops->vidioc_enum_fmt_vid_overlay)) ||
@@ -681,12 +685,18 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_meta_cap);
 		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_cap);
 		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_cap);
+#ifdef CONFIG_MEDIA_CONTROLLER
+		__set_bit(_IOC_NR(VIDIOC_BIND_CONTEXT), valid_ioctls);
+#endif
 	} else if (is_meta && is_tx) {
 		/* metadata output specific ioctls */
 		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_meta_out);
 		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_meta_out);
 		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_out);
 		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_out);
+#ifdef CONFIG_MEDIA_CONTROLLER
+		__set_bit(_IOC_NR(VIDIOC_BIND_CONTEXT), valid_ioctls);
+#endif
 	}
 	if (is_vbi) {
 		/* vbi specific ioctls */
diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index 90eec79ee995..f7af444d2344 100644
--- a/drivers/media/v4l2-core/v4l2-fh.c
+++ b/drivers/media/v4l2-core/v4l2-fh.c
@@ -93,6 +93,7 @@ int v4l2_fh_release(struct file *filp)
 	struct v4l2_fh *fh = filp->private_data;
 
 	if (fh) {
+		video_device_context_put(fh->context);
 		v4l2_fh_del(fh);
 		v4l2_fh_exit(fh);
 		kfree(fh);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 4119b23bb954..0e37e777d21f 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/compat.h>
+#include <linux/file.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -349,6 +350,13 @@ static void v4l_print_format(const void *arg, bool write_only)
 	}
 }
 
+static void v4l_print_context(const void *arg, bool write_only)
+{
+	const struct v4l2_context *c = arg;
+
+	pr_cont("context=%u\n", c->context_fd);
+}
+
 static void v4l_print_framebuffer(const void *arg, bool write_only)
 {
 	const struct v4l2_framebuffer *p = arg;
@@ -2110,6 +2118,61 @@ static int v4l_overlay(const struct v4l2_ioctl_ops *ops,
 	return ops->vidioc_overlay(file, fh, *(unsigned int *)arg);
 }
 
+static int v4l_bind_context(const struct v4l2_ioctl_ops *ops,
+			    struct file *file, void *fh, void *arg)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct media_device_context *mdev_context;
+	struct v4l2_fh *vfh =
+		test_bit(V4L2_FL_USES_V4L2_FH, &vdev->flags) ? fh : NULL;
+	struct v4l2_context *c = arg;
+	int ret;
+
+	/*
+	 * TODO: do not __set_bit(_IOC_NR(VIDIOC_BIND_CONTEXT), valid_ioctls)
+	 * if V4L2_FL_USES_V4L2_FH isn't set or the driver does not implement
+	 * alloc_context and destroy_context.
+	 */
+	if (!vfh)
+		return -ENOTTY;
+
+	if (!vdev->entity.ops || !vdev->entity.ops->alloc_context ||
+	    !vdev->entity.ops->destroy_context)
+		return -ENOTTY;
+
+	mdev_context = media_device_context_get_from_fd(c->context_fd);
+	if (!mdev_context)
+		return -EINVAL;
+
+	/* Let the driver allocate the per-file handle context. */
+	ret = vdev->entity.ops->alloc_context(&vdev->entity,
+					      (struct media_entity_context **)
+					      &vfh->context);
+	if (ret)
+		goto err_put_mdev_context;
+
+	/*
+	 * Bind the newly created video device context to the media device
+	 * context identified by the file descriptor.
+	 */
+	ret = media_device_bind_context(mdev_context,
+					(struct media_entity_context *)
+					vfh->context);
+	if (ret)
+		goto err_put_context;
+
+	media_device_context_put(mdev_context);
+
+	return 0;
+
+err_put_context:
+	video_device_context_put(vfh->context);
+err_put_mdev_context:
+	media_device_context_put(mdev_context);
+
+	return ret;
+}
+
 static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
@@ -2853,6 +2916,7 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
 	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, 0),
 	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
 	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
+	IOCTL_INFO(VIDIOC_BIND_CONTEXT, v4l_bind_context, v4l_print_context, 0),
 	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
 	IOCTL_INFO(VIDIOC_QUERYBUF, v4l_querybuf, v4l_print_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_buffer, length)),
 	IOCTL_INFO(VIDIOC_G_FBUF, v4l_stub_g_fbuf, v4l_print_framebuffer, 0),
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index edb733f21604..a70d2e446351 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -18,6 +18,7 @@
 #include <linux/videodev2.h>
 
 struct v4l2_fh;
+struct video_device_context;
 
 /**
  * struct v4l2_ioctl_ops - describe operations for each V4L2 ioctl
@@ -406,6 +407,10 @@ struct v4l2_ioctl_ops {
 	int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
 				       struct v4l2_format *f);
 
+	/* Context handlers */
+	int (*vidioc_bind_context)(struct file *file, void *fh,
+				   struct video_device_context *c);
+
 	/* Buffer handlers */
 	int (*vidioc_reqbufs)(struct file *file, void *fh,
 			      struct v4l2_requestbuffers *b);
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index f8157c9c9da6..0b7f12fd798e 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1035,6 +1035,14 @@ struct v4l2_jpegcompression {
 					* always use APP0 */
 };
 
+/*
+ *     V I D E O   D E V I C E   C O N T E X T
+ */
+
+struct v4l2_context {
+	__u32 context_fd;
+};
+
 /*
  *	M E M O R Y - M A P P I N G   B U F F E R S
  */
@@ -2758,6 +2766,9 @@ struct v4l2_create_buffers {
 
 #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
 
+/* Context handling */
+#define VIDIOC_BIND_CONTEXT	_IOW('V', 104, struct v4l2_context)
+
 /* Reminder: when adding new ioctls please add support for them to
    drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
 
-- 
2.46.0


