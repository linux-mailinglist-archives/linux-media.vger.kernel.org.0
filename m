Return-Path: <linux-media+bounces-39305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A26B1F7C2
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E47C0189A6F8
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913661EA7EC;
	Sun, 10 Aug 2025 01:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qzki+ld+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B0114A0B7;
	Sun, 10 Aug 2025 01:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789539; cv=none; b=UIje6z7JlIhYMrZZU4fu8jyrDMIqf0WMWd/Ll/rmaPMT7D7xDTVzROfjlbEaJnfEMJcp5xhUoJk0wsFGs2QVflrBmY+UZUhOaLEWv/weLy1a41+cvWjMZC5MfsTkssOtxZXYyzyMWaHwuIp2W5oxxuWWJcWFzeq/kFMPuIa5/Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789539; c=relaxed/simple;
	bh=E1gxzoQ16XvQ997UGIxN3lvS5G6AlpUu990iKlbsZJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Viqc3gbWeeO+Zp9N1XpObfGRpNGQsUYiIBqTaC49fbmlKX4IaL6Dp2XV9q2SqMO7ffZSmpQB962PNsbTM7dGF2111ta0TjwWN18C3LcooYUPevOjNBxjk96eao+Pi+SD8I8Cv4OiCNBCsQ2vd4wNkrYAdIWqxtH384jUh++7bSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qzki+ld+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 24277104D;
	Sun, 10 Aug 2025 03:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789483;
	bh=E1gxzoQ16XvQ997UGIxN3lvS5G6AlpUu990iKlbsZJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qzki+ld+AUXTqXxiFo+oF9rOzZaLSHtdUOokm72Ks0Sj3+MyuuTegOoeY6vDMuUJL
	 3XFzrxH2MO4cz9glrALxLgu6DVFx/i9rJFA8iYxL4jzuhM4kczPCgprzGE+eNfA9zw
	 6es5W/aKq5k0ZZW1qTA4svvbHjVJBTzN8l7ZERFw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	Erling Ljunggren <hljunggr@cisco.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Ma Ke <make24@iscas.ac.cn>,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 32/76] media: Drop V4L2_FL_USES_V4L2_FH checks
Date: Sun, 10 Aug 2025 04:30:14 +0300
Message-ID: <20250810013100.29776-33-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that all drivers use v4l2_fh, we can drop the V4L2_FL_USES_V4L2_FH
checks through the V4L2 core.

To ensure that all new drivers use v4l2_fh, keep setting the
V4L2_FL_USES_V4L2_FH flag in v4l2_fh_init(), and verify it is set after
the .open() file operation returns.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/driver-api/media/v4l2-fh.rst    | 15 +-------
 .../zh_CN/video4linux/v4l2-framework.txt      |  5 ---
 .../media/common/videobuf2/videobuf2-v4l2.c   | 12 ++----
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  7 +---
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  2 +-
 drivers/media/v4l2-core/v4l2-dev.c            | 21 ++++++++---
 drivers/media/v4l2-core/v4l2-ioctl.c          | 37 ++++++-------------
 drivers/media/v4l2-core/v4l2-mem2mem.c        | 12 ++----
 include/media/v4l2-dev.h                      |  2 +-
 include/media/v4l2-fh.h                       |  2 +-
 10 files changed, 43 insertions(+), 72 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-fh.rst b/Documentation/driver-api/media/v4l2-fh.rst
index afcad22ead7c..a934caa483a4 100644
--- a/Documentation/driver-api/media/v4l2-fh.rst
+++ b/Documentation/driver-api/media/v4l2-fh.rst
@@ -3,13 +3,8 @@
 V4L2 File handles
 -----------------
 
-struct v4l2_fh provides a way to easily keep file handle specific
-data that is used by the V4L2 framework.
-
-.. attention::
-	New drivers must use struct v4l2_fh
-	since it is also used to implement priority handling
-	(:ref:`VIDIOC_G_PRIORITY`).
+struct v4l2_fh provides a way to easily keep file handle specific data that is
+used by the V4L2 framework. Its usage is mandatory in all drivers.
 
 struct v4l2_fh is allocated in the driver's ``open()`` file operation handler.
 It is typically embedded in a larger driver-specific structure. The
@@ -134,12 +129,6 @@ associated device node:
 
 - Same, but it calls v4l2_fh_is_singular with filp->private_data.
 
-.. note::
-        The V4L2 framework knows whether a driver uses :c:type:`v4l2_fh` as its
-        ``file->private_data`` pointer by testing the ``V4L2_FL_USES_V4L2_FH``
-        bit in :c:type:`video_device`->flags. This bit is set whenever
-        :c:func:`v4l2_fh_init` is called.
-
 
 V4L2 fh functions and data structures
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
diff --git a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
index 1653c6e2cb46..f0be21a60a0f 100644
--- a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
+++ b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
@@ -775,11 +775,6 @@ v4l2_fh 结构体提供一个保存用于 V4L2 框架的文件句柄特定数据
 如果 video_device 标志，新驱动
 必须使用 v4l2_fh 结构体，因为它也用于实现优先级处理（VIDIOC_G/S_PRIORITY）。
 
-v4l2_fh 的用户（位于 V4l2 框架中，并非驱动）可通过测试
-video_device->flags 中的 V4L2_FL_USES_V4L2_FH 位得知驱动是否使用
-v4l2_fh 作为他的 file->private_data 指针。这个位会在调用 v4l2_fh_init()
-时被设置。
-
 v4l2_fh 结构体作为驱动自身文件句柄结构体的一部分被分配，且驱动在
 其打开函数中将 file->private_data 指向它。
 
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index f29307e59be5..d911021c1bb0 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -973,18 +973,14 @@ EXPORT_SYMBOL_GPL(vb2_queue_change_type);
 
 __poll_t vb2_poll(struct vb2_queue *q, struct file *file, poll_table *wait)
 {
-	struct video_device *vfd = video_devdata(file);
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	__poll_t res;
 
 	res = vb2_core_poll(q, file, wait);
 
-	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags)) {
-		struct v4l2_fh *fh = file_to_v4l2_fh(file);
-
-		poll_wait(file, &fh->wait, wait);
-		if (v4l2_event_pending(fh))
-			res |= EPOLLPRI;
-	}
+	poll_wait(file, &fh->wait, wait);
+	if (v4l2_event_pending(fh))
+		res |= EPOLLPRI;
 
 	return res;
 }
diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 8a5559225ff2..e5642e639811 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -672,15 +672,12 @@ struct v4l2_ext_control32 {
 static inline bool ctrl_is_pointer(struct file *file, u32 id)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct v4l2_fh *fh = NULL;
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	struct v4l2_ctrl_handler *hdl = NULL;
 	struct v4l2_query_ext_ctrl qec = { id };
 	const struct v4l2_ioctl_ops *ops = vdev->ioctl_ops;
 
-	if (test_bit(V4L2_FL_USES_V4L2_FH, &vdev->flags))
-		fh = file_to_v4l2_fh(file);
-
-	if (fh && fh->ctrl_handler)
+	if (fh->ctrl_handler)
 		hdl = fh->ctrl_handler;
 	else if (vdev->ctrl_handler)
 		hdl = vdev->ctrl_handler;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index b0bba8eec143..afb4e5581b90 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1254,7 +1254,7 @@ int v4l2_ctrl_log_status(struct file *file, void *fh)
 {
 	struct video_device *vfd = video_devdata(file);
 
-	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) && vfd->v4l2_dev) {
+	if (vfd->v4l2_dev) {
 		struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
 		v4l2_ctrl_handler_log_status(vfh->ctrl_handler,
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 1a4184b94838..10a126e50c1c 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -425,14 +425,26 @@ static int v4l2_open(struct inode *inode, struct file *filp)
 	video_get(vdev);
 	mutex_unlock(&videodev_lock);
 
-	if (video_is_registered(vdev))
-		ret = vdev->fops->open(filp);
-	else
+	if (!video_is_registered(vdev)) {
 		ret = -ENODEV;
+		goto done;
+	}
 
+	ret = vdev->fops->open(filp);
+	if (ret)
+		goto done;
+
+	/* All drivers must use v4l2_fh. */
+	if (WARN_ON(!test_bit(V4L2_FL_USES_V4L2_FH, &vdev->flags))) {
+		vdev->fops->release(filp);
+		ret = -ENODEV;
+	}
+
+done:
 	if (vdev->dev_debug & V4L2_DEV_DEBUG_FOP)
 		dprintk("%s: open (%d)\n",
 			video_device_node_name(vdev), ret);
+
 	/* decrease the refcount in case of an error */
 	if (ret)
 		video_put(vdev);
@@ -1114,8 +1126,7 @@ void video_unregister_device(struct video_device *vdev)
 	 */
 	clear_bit(V4L2_FL_REGISTERED, &vdev->flags);
 	mutex_unlock(&videodev_lock);
-	if (test_bit(V4L2_FL_USES_V4L2_FH, &vdev->flags))
-		v4l2_event_wake_all(vdev);
+	v4l2_event_wake_all(vdev);
 	device_unregister(&vdev->dev);
 }
 EXPORT_SYMBOL(video_unregister_device);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 8c81852c3046..6c684884873e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1195,8 +1195,6 @@ static int v4l_s_priority(const struct v4l2_ioctl_ops *ops,
 	u32 *p = arg;
 
 	vfd = video_devdata(file);
-	if (!test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags))
-		return -ENOTTY;
 	vfh = file_to_v4l2_fh(file);
 	return v4l2_prio_change(vfd->prio, &vfh->prio, *p);
 }
@@ -2297,8 +2295,7 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_query_ext_ctrl qec = {};
 	struct v4l2_queryctrl *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = fh;
 	int ret;
 
 	if (vfh && vfh->ctrl_handler)
@@ -2322,8 +2319,7 @@ static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_query_ext_ctrl *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = fh;
 
 	if (vfh && vfh->ctrl_handler)
 		return v4l2_query_ext_ctrl(vfh->ctrl_handler, p);
@@ -2339,8 +2335,7 @@ static int v4l_querymenu(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_querymenu *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = fh;
 
 	if (vfh && vfh->ctrl_handler)
 		return v4l2_querymenu(vfh->ctrl_handler, p);
@@ -2356,8 +2351,7 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_control *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = fh;
 	struct v4l2_ext_controls ctrls;
 	struct v4l2_ext_control ctrl;
 
@@ -2388,8 +2382,7 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_control *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = fh;
 	struct v4l2_ext_controls ctrls;
 	struct v4l2_ext_control ctrl;
 	int ret;
@@ -2418,8 +2411,7 @@ static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_ext_controls *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = fh;
 
 	p->error_idx = p->count;
 	if (vfh && vfh->ctrl_handler)
@@ -2439,8 +2431,7 @@ static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_ext_controls *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = fh;
 
 	p->error_idx = p->count;
 	if (vfh && vfh->ctrl_handler)
@@ -2460,8 +2451,7 @@ static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_ext_controls *p = arg;
-	struct v4l2_fh *vfh =
-		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	struct v4l2_fh *vfh = fh;
 
 	p->error_idx = p->count;
 	if (vfh && vfh->ctrl_handler)
@@ -3073,7 +3063,7 @@ static long __video_do_ioctl(struct file *file,
 	struct v4l2_ioctl_info default_info;
 	const struct v4l2_ioctl_info *info;
 	void *fh = file->private_data;
-	struct v4l2_fh *vfh = NULL;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	int dev_debug = vfd->dev_debug;
 	long ret = -ENOTTY;
 
@@ -3083,9 +3073,6 @@ static long __video_do_ioctl(struct file *file,
 		return ret;
 	}
 
-	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags))
-		vfh = file_to_v4l2_fh(file);
-
 	/*
 	 * We need to serialize streamon/off with queueing new requests.
 	 * These ioctls may trigger the cancellation of a streaming
@@ -3117,10 +3104,10 @@ static long __video_do_ioctl(struct file *file,
 		info = &v4l2_ioctls[_IOC_NR(cmd)];
 
 		if (!is_valid_ioctl(vfd, cmd) &&
-		    !((info->flags & INFO_FL_CTRL) && vfh && vfh->ctrl_handler))
+		    !((info->flags & INFO_FL_CTRL) && vfh->ctrl_handler))
 			goto done;
 
-		if (vfh && (info->flags & INFO_FL_PRIO)) {
+		if (info->flags & INFO_FL_PRIO) {
 			ret = v4l2_prio_check(vfd->prio, vfh->prio);
 			if (ret)
 				goto done;
@@ -3139,7 +3126,7 @@ static long __video_do_ioctl(struct file *file,
 		ret = -ENOTTY;
 	} else {
 		ret = ops->vidioc_default(file, fh,
-			vfh ? v4l2_prio_check(vfd->prio, vfh->prio) >= 0 : 0,
+			v4l2_prio_check(vfd->prio, vfh->prio) >= 0,
 			cmd, arg);
 	}
 
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index e67e67f76f72..7678b8dbedbd 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -951,7 +951,7 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
 __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		       struct poll_table_struct *wait)
 {
-	struct video_device *vfd = video_devdata(file);
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(m2m_ctx);
 	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(m2m_ctx);
 	__poll_t req_events = poll_requested_events(wait);
@@ -970,13 +970,9 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 	if (req_events & (EPOLLOUT | EPOLLWRNORM | EPOLLIN | EPOLLRDNORM))
 		rc = v4l2_m2m_poll_for_data(file, m2m_ctx, wait);
 
-	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags)) {
-		struct v4l2_fh *fh = file_to_v4l2_fh(file);
-
-		poll_wait(file, &fh->wait, wait);
-		if (v4l2_event_pending(fh))
-			rc |= EPOLLPRI;
-	}
+	poll_wait(file, &fh->wait, wait);
+	if (v4l2_event_pending(fh))
+		rc |= EPOLLPRI;
 
 	return rc;
 }
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index a69801274800..a213c3398dcf 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -74,7 +74,7 @@ struct dentry;
  * @V4L2_FL_USES_V4L2_FH:
  *	indicates that file->private_data points to &struct v4l2_fh.
  *	This flag is set by the core when v4l2_fh_init() is called.
- *	All new drivers should use it.
+ *	All drivers must use it.
  * @V4L2_FL_QUIRK_INVERTED_CROP:
  *	some old M2M drivers use g/s_crop/cropcap incorrectly: crop and
  *	compose are swapped. If this flag is set, then the selection
diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index 5e4c76163512..aad4b3689d7e 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -3,7 +3,7 @@
  * v4l2-fh.h
  *
  * V4L2 file handle. Store per file handle data for the V4L2
- * framework. Using file handles is optional for the drivers.
+ * framework. Using file handles is mandatory for the drivers.
  *
  * Copyright (C) 2009--2010 Nokia Corporation.
  *
-- 
Regards,

Laurent Pinchart


