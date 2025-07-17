Return-Path: <linux-media+bounces-37971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BDDB08B0B
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAA763B33F5
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA8229E103;
	Thu, 17 Jul 2025 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SOiHuxq8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198FD29DB7F;
	Thu, 17 Jul 2025 10:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749156; cv=none; b=GkHdO99/oRJE+S23W1cDbm1dUFOeUHEEYXkODmZHDsCG53GQaB+Wz9y9Nup+c9kFwwcUQqLkD/MAwm4tw7hqon9qhvTphFOpZFhbBe9I2QCjYFGKRvBsvhuw6sLhjtSwXQa4u8yRjl8CC+aQmm94TgV6JrFmYINFuoSoVXwIxt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749156; c=relaxed/simple;
	bh=8R73HPaz5pGFoxscWZIYsH9YWq0Ywb87x5bejY/EFeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QHyp/xz8M4R+lxygFeyM8kBI0919U3RgeYmDxW+zj3FOEbpiaF1TztxkN0PiLfCITEjufZDXOo8pjQUUE1X+iAYzpty9vbAEWpkGRSYvzuVewEbs4uSGlj2BTImw7LkxI5VbtQI2d1BlkpBHvYYFKCiNczuUMFc2lV9nzDYwIrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SOiHuxq8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C93F3198D;
	Thu, 17 Jul 2025 12:45:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749115;
	bh=8R73HPaz5pGFoxscWZIYsH9YWq0Ywb87x5bejY/EFeM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SOiHuxq8bdNt7SUOg01x5EwIA3zPLzESlFTgWYrVGjEHsxAno2JVpff/lYDXyYxvn
	 WCggyMJgoWJlyzBLV1qU7pt3DxqyFpOP9ZJoF8o9RwzG+mcQIuu9WkLjtfNN2wZeLC
	 oIBVD8zOmfZjdx9WqMGJG5648ji+ca0iXpNxNG5k=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:32 +0200
Subject: [PATCH 06/26] media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-6-81ac18979c03@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8477;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=8R73HPaz5pGFoxscWZIYsH9YWq0Ywb87x5bejY/EFeM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRPuxlgrQbLEhBMUC26EnJg5sMetl7FSM+mi
 8Q1kKPMoYqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUTwAKCRByNAaPFqFW
 PNIjD/0fEqn9SDhgeerqLoTAs2HwXZnGao1NsXkGYyUmaguuhhDcaMETK1sZeSWBDURKkRGij0X
 WXrWQpEbohjIBjGAObAiOae4/zPpcHEvZCq1P3knfpKdDleAyOMCRkpXgkN9Zbrm/22PMa+zqv8
 jj+g+jdoqDnyOt2f7WqVMiDzlJRTq6KucXNeio3Rwk9QPA+Perj1a5U6niBrZqUPe0Y0SEFzRty
 zxrmQQCaVJXcRy9pMIyqofajGgIrMrXDhrRmGn5nMc9QAu4+oTQwX6zJxgAxlekt08KD9L6Ioqc
 5HkpMu/QtEF1RkZmLbvsV7E7M5qHxGeDd6et4W4wW35Ciw1LNjDWsD/xMHmZ9Kf+thPEZzdIGVV
 j2S3fIJunNWw9nYffnWXm9Q3Su+++kv19zSWanLxPw0zHG7d/xvYSX2BhSbAwQzD/LJnNptXcny
 Y4rs5Ls77K3DuVoybPh9FYdak+5m7uU6AjrBPnnH3ugsztxXkRRXwaG73oK3RjY3PHiuJO28L0e
 ouc9VzJspHZ32CXbyPDzGHYMQvDdmlZCaO8/QS9q+L/cvqu6a9PrJCvRfiFPF6+gB+DkCSkHvc9
 6tTshdadZ/WX6c9BF0XLpWfj2SGOV+vLD1AlAjTcbwd8CZ8mpTRzifPz4nJv+KFt9KV0QKN+KPh
 mZKXBqwSo2SPv2A==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

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
 drivers/media/v4l2-core/v4l2-dev.c   | 10 ++++++
 drivers/media/v4l2-core/v4l2-fh.c    |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c | 64 ++++++++++++++++++++++++++++++++++++
 include/media/v4l2-ioctl.h           |  7 ++++
 include/uapi/linux/videodev2.h       | 11 +++++++
 5 files changed, 93 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index c83c37843c9e7beb899a4b2bd176273c3dec381b..bc6502b4ce21cc0ad53136e1637d1c926e31dd89 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -606,6 +606,10 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		__set_bit(_IOC_NR(VIDIOC_ENUM_FREQ_BANDS), valid_ioctls);
 
 	if (is_vid) {
+#ifdef CONFIG_MEDIA_CONTROLLER
+		__set_bit(_IOC_NR(VIDIOC_BIND_CONTEXT), valid_ioctls);
+#endif
+
 		/* video specific ioctls */
 		if ((is_rx && (ops->vidioc_enum_fmt_vid_cap ||
 			       ops->vidioc_enum_fmt_vid_overlay)) ||
@@ -661,12 +665,18 @@ static void determine_valid_ioctls(struct video_device *vdev)
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
index 90eec79ee995a2d214590beeacc91b9f8f33236d..f7af444d2344541ccae1eae230b39d4cbc47f6bd 100644
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
index 46da373066f4ec786b87ef18b8372abee621332f..bade64cc62b66dd6237ccd5338aa6dd8ab00ef8c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/compat.h>
+#include <linux/file.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -350,6 +351,13 @@ static void v4l_print_format(const void *arg, bool write_only)
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
@@ -2151,6 +2159,61 @@ static int v4l_overlay(const struct v4l2_ioctl_ops *ops,
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
@@ -2998,6 +3061,7 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
 	IOCTL_INFO(VIDIOC_DBG_G_CHIP_INFO, v4l_dbg_g_chip_info, v4l_print_dbg_chip_info, INFO_FL_CLEAR(v4l2_dbg_chip_info, match)),
 	IOCTL_INFO(VIDIOC_QUERY_EXT_CTRL, v4l_query_ext_ctrl, v4l_print_query_ext_ctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_query_ext_ctrl, id)),
 	IOCTL_INFO(VIDIOC_REMOVE_BUFS, v4l_remove_bufs, v4l_print_remove_buffers, INFO_FL_PRIO | INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_remove_buffers, type)),
+	IOCTL_INFO(VIDIOC_BIND_CONTEXT, v4l_bind_context, v4l_print_context, 0),
 };
 #define V4L2_IOCTLS ARRAY_SIZE(v4l2_ioctls)
 
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 82695c3a300a73219f262fb556ed61a8f09d273e..6d9edfd9ca912972ad15acdc07014dee1ed36ab6 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -18,6 +18,7 @@
 #include <linux/videodev2.h>
 
 struct v4l2_fh;
+struct video_device_context;
 
 /**
  * struct v4l2_ioctl_ops - describe operations for each V4L2 ioctl
@@ -149,6 +150,8 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
  * @vidioc_try_fmt_meta_out: pointer to the function that implements
  *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata output
+ * @vidioc_bind_context: pointer to the function that implements
+ *	:ref:`VIDIOC_BIND_CONTEXT <vidioc_bind_context>` ioctl
  * @vidioc_reqbufs: pointer to the function that implements
  *	:ref:`VIDIOC_REQBUFS <vidioc_reqbufs>` ioctl
  * @vidioc_querybuf: pointer to the function that implements
@@ -402,6 +405,10 @@ struct v4l2_ioctl_ops {
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
index 3dd9fa45dde1066d52a68581625a39e7ec92c9b7..0b9aa89e2479620dbbaa54f1aadff7aaa7a3d0f7 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1057,6 +1057,14 @@ struct v4l2_jpegcompression {
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
@@ -2818,6 +2826,9 @@ struct v4l2_remove_buffers {
 #define VIDIOC_REMOVE_BUFS	_IOWR('V', 104, struct v4l2_remove_buffers)
 
 
+/* Context handling */
+#define VIDIOC_BIND_CONTEXT	_IOW('V', 105, struct v4l2_context)
+
 /* Reminder: when adding new ioctls please add support for them to
    drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
 

-- 
2.49.0


