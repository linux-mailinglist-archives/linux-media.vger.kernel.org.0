Return-Path: <linux-media+bounces-56810-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAijAmY4wml+aQQAu9opvQ
	(envelope-from <linux-media+bounces-56810-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:08:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDA4303B4A
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B14243054D4E
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 07:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2EF036683B;
	Tue, 24 Mar 2026 07:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kpLExsBP"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA064397683;
	Tue, 24 Mar 2026 07:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774336004; cv=none; b=UK5DkHqhYCa0sOUJHRElkV84MKvCg4VMxDxiL2HbnDAP0P/QguBOXcnYi0CcJfhWry+ZQyf4oUO0ox7fvObOme5wmyAM8tJSMJo9rB2rKNtDi9h4agEiePD7JcwLmeLqr87Ht6XU7ckPWJscyzB4IkStZqNMnZoTYR2usQ2CJn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774336004; c=relaxed/simple;
	bh=LHhujGMk6weuukeS5dy2YD0iSfnFU9eSzyGfbuoVmCw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IPb7a5kIX4fnuIXP0lzkOe9NHMyjku1vMw1yQjtmqDE3HcAke3lvl8+9VMUgbY9LJPS6zd9ZEqiTYxAIYPn/fcynPjabbo73ALAZF50x5UvZZbJJQLO0iRcxYJpojcSfKyXxbZdT68kNhj+U83fbKubKZAcupTP/zN5z0vj+Frk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kpLExsBP; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=EC
	t3iIDWrav4P5wrIAZ7MzDj+kkt+1A1GncpUQdHIg8=; b=kpLExsBPV3cBzO9hrK
	ZRUtU4zchsPsBD9f85e9Ki3RATXfMYoHlgBg+P2Tja1WiHufD6Qf+YZkrJ+CLNxs
	+TPrEP16eef1emI8FzmuczVb7hTxvnwbF0AaxtYvmX/uHHuvu2eKcGj8Fp1aoUX3
	m2UW8bVn8Snm9ZVkMcI/0V4PU=
Received: from pek-lpg-core5.wrs.com (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD39w6kN8JpbT5hBA--.36422S2;
	Tue, 24 Mar 2026 15:05:09 +0800 (CST)
From: Robert Garcia <rob_garcia@163.com>
To: stable@vger.kernel.org,
	Richard Leitner <richard.leitner@linux.dev>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	Robert Garcia <rob_garcia@163.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.12.y] media: nxp: imx8-isi: Fix streaming cleanup on release
Date: Tue, 24 Mar 2026 15:05:07 +0800
Message-Id: <20260324070507.2554507-1-rob_garcia@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD39w6kN8JpbT5hBA--.36422S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Cr47JFWDGrW8Xw17WFWxJFb_yoWDZw4xpF
	4fWrWfWr48try8A3WDJa1UXr15Ga4vva97JrWxGa4rAF15ur1YqF1UtFW0qrZ5GrWkZFW3
	trW5X3yIkr45XaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_zuAUUUUUU=
X-CM-SenderInfo: 5uresw5dufxti6rwjhhfrp/xtbDAQYCbWnCN6ZIXwAA3F
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56810-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[163.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob_garcia@163.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,pengutronix.de,gmail.com,vger.kernel.org,163.com,lists.linux.dev,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.dev:email]
X-Rspamd-Queue-Id: 9FDA4303B4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Richard Leitner <richard.leitner@linux.dev>

[ Upstream commit 47773031a148ad7973b809cc7723cba77eda2b42 ]

The current implementation unconditionally calls
mxc_isi_video_cleanup_streaming() in mxc_isi_video_release(). This can
lead to situations where any release call (like from a simple
"v4l2-ctl -l") may release a currently streaming queue when called on
such a device.

This is reproducible on an i.MX8MP board by streaming from an ISI
capture device using gstreamer:

	gst-launch-1.0 -v v4l2src device=/dev/videoX ! \
	    video/x-raw,format=GRAY8,width=1280,height=800,framerate=1/120 ! \
	    fakesink

While this stream is running, querying the caps of the same device
provokes the error state:

	v4l2-ctl -l -d /dev/videoX

This results in the following trace:

[  155.452152] ------------[ cut here ]------------
[  155.452163] WARNING: CPU: 0 PID: 1708 at drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c:713 mxc_isi_pipe_irq_handler+0x19c/0x1b0 [imx8_isi]
[  157.004248] Modules linked in: cfg80211 rpmsg_ctrl rpmsg_char rpmsg_tty virtio_rpmsg_bus rpmsg_ns rpmsg_core rfkill nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables mcp251x6
[  157.053499] CPU: 0 UID: 0 PID: 1708 Comm: python3 Not tainted 6.15.4-00114-g1f61ca5cad76 #1 PREEMPT
[  157.064369] Hardware name: imx8mp_board_01 (DT)
[  157.068205] pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  157.075169] pc : mxc_isi_pipe_irq_handler+0x19c/0x1b0 [imx8_isi]
[  157.081195] lr : mxc_isi_pipe_irq_handler+0x38/0x1b0 [imx8_isi]
[  157.087126] sp : ffff800080003ee0
[  157.090438] x29: ffff800080003ee0 x28: ffff0000c3688000 x27: 0000000000000000
[  157.097580] x26: 0000000000000000 x25: ffff0000c1e7ac00 x24: ffff800081b5ad50
[  157.104723] x23: 00000000000000d1 x22: 0000000000000000 x21: ffff0000c25e4000
[  157.111866] x20: 0000000060000200 x19: ffff80007a0608d0 x18: 0000000000000000
[  157.119008] x17: ffff80006a4e3000 x16: ffff800080000000 x15: 0000000000000000
[  157.126146] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[  157.133287] x11: 0000000000000040 x10: ffff0000c01445f0 x9 : ffff80007a053a38
[  157.140425] x8 : ffff0000c04004b8 x7 : 0000000000000000 x6 : 0000000000000000
[  157.147567] x5 : ffff0000c0400490 x4 : ffff80006a4e3000 x3 : ffff0000c25e4000
[  157.154706] x2 : 0000000000000000 x1 : ffff8000825c0014 x0 : 0000000060000200
[  157.161850] Call trace:
[  157.164296]  mxc_isi_pipe_irq_handler+0x19c/0x1b0 [imx8_isi] (P)
[  157.170319]  __handle_irq_event_percpu+0x58/0x218
[  157.175029]  handle_irq_event+0x54/0xb8
[  157.178867]  handle_fasteoi_irq+0xac/0x248
[  157.182968]  handle_irq_desc+0x48/0x68
[  157.186723]  generic_handle_domain_irq+0x24/0x38
[  157.191346]  gic_handle_irq+0x54/0x120
[  157.195098]  call_on_irq_stack+0x24/0x30
[  157.199027]  do_interrupt_handler+0x88/0x98
[  157.203212]  el0_interrupt+0x44/0xc0
[  157.206792]  __el0_irq_handler_common+0x18/0x28
[  157.211328]  el0t_64_irq_handler+0x10/0x20
[  157.215429]  el0t_64_irq+0x198/0x1a0
[  157.219009] ---[ end trace 0000000000000000 ]---

Address this issue by moving the streaming preparation and cleanup to
the vb2 .prepare_streaming() and .unprepare_streaming() operations. This
also simplifies the driver by allowing direct usage of the
vb2_ioctl_streamon() and vb2_ioctl_streamoff() helpers, and removal of
the manual cleanup from mxc_isi_video_release().

Link: https://lore.kernel.org/r/20250813212451.22140-2-laurent.pinchart@ideasonboard.com
Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Richard Leitner <richard.leitner@linux.dev> # i.MX8MP
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
[ Minor context change fixed. ]
Signed-off-by: Robert Garcia <rob_garcia@163.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-video.c    | 156 +++++++-----------
 1 file changed, 58 insertions(+), 98 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index a71eb30323c8..4e6c3540de35 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -937,6 +937,49 @@ static void mxc_isi_video_init_channel(struct mxc_isi_video *video)
 	mxc_isi_channel_set_output_format(pipe, video->fmtinfo, &video->pix);
 }
 
+static int mxc_isi_vb2_prepare_streaming(struct vb2_queue *q)
+{
+	struct mxc_isi_video *video = vb2_get_drv_priv(q);
+	struct media_device *mdev = &video->pipe->isi->media_dev;
+	struct media_pipeline *pipe;
+	int ret;
+
+	/* Get a pipeline for the video node and start it. */
+	scoped_guard(mutex, &mdev->graph_mutex) {
+		ret = mxc_isi_pipe_acquire(video->pipe,
+					   &mxc_isi_video_frame_write_done);
+		if (ret)
+			return ret;
+
+		pipe = media_entity_pipeline(&video->vdev.entity)
+		     ? : &video->pipe->pipe;
+
+		ret = __video_device_pipeline_start(&video->vdev, pipe);
+		if (ret)
+			goto err_release;
+	}
+
+	/* Verify that the video format matches the output of the subdev. */
+	ret = mxc_isi_video_validate_format(video);
+	if (ret)
+		goto err_stop;
+
+	/* Allocate buffers for discard operation. */
+	ret = mxc_isi_video_alloc_discard_buffers(video);
+	if (ret)
+		goto err_stop;
+
+	video->is_streaming = true;
+
+	return 0;
+
+err_stop:
+	video_device_pipeline_stop(&video->vdev);
+err_release:
+	mxc_isi_pipe_release(video->pipe);
+	return ret;
+}
+
 static int mxc_isi_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct mxc_isi_video *video = vb2_get_drv_priv(q);
@@ -985,6 +1028,17 @@ static void mxc_isi_vb2_stop_streaming(struct vb2_queue *q)
 	mxc_isi_video_return_buffers(video, VB2_BUF_STATE_ERROR);
 }
 
+static void mxc_isi_vb2_unprepare_streaming(struct vb2_queue *q)
+{
+	struct mxc_isi_video *video = vb2_get_drv_priv(q);
+
+	mxc_isi_video_free_discard_buffers(video);
+	video_device_pipeline_stop(&video->vdev);
+	mxc_isi_pipe_release(video->pipe);
+
+	video->is_streaming = false;
+}
+
 static const struct vb2_ops mxc_isi_vb2_qops = {
 	.queue_setup		= mxc_isi_vb2_queue_setup,
 	.buf_init		= mxc_isi_vb2_buffer_init,
@@ -992,8 +1046,10 @@ static const struct vb2_ops mxc_isi_vb2_qops = {
 	.buf_queue		= mxc_isi_vb2_buffer_queue,
 	.wait_prepare		= vb2_ops_wait_prepare,
 	.wait_finish		= vb2_ops_wait_finish,
+	.prepare_streaming	= mxc_isi_vb2_prepare_streaming,
 	.start_streaming	= mxc_isi_vb2_start_streaming,
 	.stop_streaming		= mxc_isi_vb2_stop_streaming,
+	.unprepare_streaming	= mxc_isi_vb2_unprepare_streaming,
 };
 
 /* -----------------------------------------------------------------------------
@@ -1147,97 +1203,6 @@ static int mxc_isi_video_s_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int mxc_isi_video_streamon(struct file *file, void *priv,
-				  enum v4l2_buf_type type)
-{
-	struct mxc_isi_video *video = video_drvdata(file);
-	struct media_device *mdev = &video->pipe->isi->media_dev;
-	struct media_pipeline *pipe;
-	int ret;
-
-	if (vb2_queue_is_busy(&video->vb2_q, file))
-		return -EBUSY;
-
-	/*
-	 * Get a pipeline for the video node and start it. This must be done
-	 * here and not in the queue .start_streaming() handler, so that
-	 * pipeline start errors can be reported from VIDIOC_STREAMON and not
-	 * delayed until subsequent VIDIOC_QBUF calls.
-	 */
-	mutex_lock(&mdev->graph_mutex);
-
-	ret = mxc_isi_pipe_acquire(video->pipe, &mxc_isi_video_frame_write_done);
-	if (ret) {
-		mutex_unlock(&mdev->graph_mutex);
-		return ret;
-	}
-
-	pipe = media_entity_pipeline(&video->vdev.entity) ? : &video->pipe->pipe;
-
-	ret = __video_device_pipeline_start(&video->vdev, pipe);
-	if (ret) {
-		mutex_unlock(&mdev->graph_mutex);
-		goto err_release;
-	}
-
-	mutex_unlock(&mdev->graph_mutex);
-
-	/* Verify that the video format matches the output of the subdev. */
-	ret = mxc_isi_video_validate_format(video);
-	if (ret)
-		goto err_stop;
-
-	/* Allocate buffers for discard operation. */
-	ret = mxc_isi_video_alloc_discard_buffers(video);
-	if (ret)
-		goto err_stop;
-
-	ret = vb2_streamon(&video->vb2_q, type);
-	if (ret)
-		goto err_free;
-
-	video->is_streaming = true;
-
-	return 0;
-
-err_free:
-	mxc_isi_video_free_discard_buffers(video);
-err_stop:
-	video_device_pipeline_stop(&video->vdev);
-err_release:
-	mxc_isi_pipe_release(video->pipe);
-	return ret;
-}
-
-static void mxc_isi_video_cleanup_streaming(struct mxc_isi_video *video)
-{
-	lockdep_assert_held(&video->lock);
-
-	if (!video->is_streaming)
-		return;
-
-	mxc_isi_video_free_discard_buffers(video);
-	video_device_pipeline_stop(&video->vdev);
-	mxc_isi_pipe_release(video->pipe);
-
-	video->is_streaming = false;
-}
-
-static int mxc_isi_video_streamoff(struct file *file, void *priv,
-				   enum v4l2_buf_type type)
-{
-	struct mxc_isi_video *video = video_drvdata(file);
-	int ret;
-
-	ret = vb2_ioctl_streamoff(file, priv, type);
-	if (ret)
-		return ret;
-
-	mxc_isi_video_cleanup_streaming(video);
-
-	return 0;
-}
-
 static int mxc_isi_video_enum_framesizes(struct file *file, void *priv,
 					 struct v4l2_frmsizeenum *fsize)
 {
@@ -1293,9 +1258,8 @@ static const struct v4l2_ioctl_ops mxc_isi_video_ioctl_ops = {
 	.vidioc_expbuf			= vb2_ioctl_expbuf,
 	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
 	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
-
-	.vidioc_streamon		= mxc_isi_video_streamon,
-	.vidioc_streamoff		= mxc_isi_video_streamoff,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
 
 	.vidioc_enum_framesizes		= mxc_isi_video_enum_framesizes,
 
@@ -1334,10 +1298,6 @@ static int mxc_isi_video_release(struct file *file)
 	if (ret)
 		dev_err(video->pipe->isi->dev, "%s fail\n", __func__);
 
-	mutex_lock(&video->lock);
-	mxc_isi_video_cleanup_streaming(video);
-	mutex_unlock(&video->lock);
-
 	pm_runtime_put(video->pipe->isi->dev);
 	return ret;
 }
-- 
2.34.1


