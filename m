Return-Path: <linux-media+bounces-45545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8887C09300
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF41F1AA3BEF
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8611E304963;
	Sat, 25 Oct 2025 16:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyoR+vo+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55013043B5;
	Sat, 25 Oct 2025 16:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761408554; cv=none; b=cB/Vkzhty8dDgE716qU/e8d+VbeFVgETqM1Mtw7oFcG7mdisgElDb32khCAfeRwZXU3T2EkxGV93zH0vvdWBaHAYPkOXeBVCa8rd9FaP4/CE4BhHFtzfQGPdAnC9q5a7T6dQK/xqXjwH2NJGQACKMZXOYAxX1Jdi4/NmbXAcUPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761408554; c=relaxed/simple;
	bh=q5hY1qQbehHqkOmy18rayz6iJCQW8VToOrzPf9NZ4DY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s92lARszVv07iLIRaRa3OynleLac0uWOnGxBEe+ImCvA5eQJMnZUxEiXQdnVf1pz5PWcxzopBtIyDZYgNQvahZG4qKNOUxMrk3f3BLtdOSZ4f16MS9v6LUkiCZvZ5gzaVk+FNlDTyO04xM+9cFhOJN5PlbFc491YepRrF5/s/Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyoR+vo+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271DAC4CEFF;
	Sat, 25 Oct 2025 16:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408553;
	bh=q5hY1qQbehHqkOmy18rayz6iJCQW8VToOrzPf9NZ4DY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZyoR+vo+JihMKJFEgczbPTwjhWt/3NNGy9ciwl9i3czESnmSGKvSmlSQUoHGVUlCd
	 FqJe6Cf/9ts9y3Nan/LH3fvnzP0K334nUQC4pKlAq+zJRpYiBvXRjxir4m4aqdeDtH
	 w3M/RbprDCvPWOZ9miAW6xRsJfldOI9ZW7asCznu65loH8qbX4mcIM7JGjVmiXZ9KY
	 MZcovwGEF7bxOtzEWoEerIFloaJnz0mzkmIZLrVPJ31aKgeaWJIuYM3w3drmCqbyXC
	 /kzaWzdk8G0Yi5HUZIbs4uGbtDEGpu3RTnb3zianh2R6dtNd2qmFEU+LIUKsyXTyfs
	 P1Jvc0tVpaOWg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Richard Leitner <richard.leitner@linux.dev>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shawnguo@kernel.org,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17] media: nxp: imx8-isi: Fix streaming cleanup on release
Date: Sat, 25 Oct 2025 11:53:55 -0400
Message-ID: <20251025160905.3857885-4-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- Fixes a real, user-facing bug: closing any file descriptor on the same
  node could tear down an active stream (e.g., “v4l2-ctl -l”), leading
  to WARNs in the IRQ handler. The commit moves streaming lifetime
  management into vb2 so only the streaming filehandle controls
  teardown.
- Moves pipeline start/stop and discard buffer lifetime from ad-hoc
  ioctl/release paths into vb2’s streaming lifecycle:
  - New prepare path acquires and starts the pipeline, validates format,
    and allocates discard buffers:
    - Acquire/start: drivers/media/platform/nxp/imx8-isi/imx8-isi-
      video.c:949, 957
    - Graph mutex protection (scoped guard):
      drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c:948
    - Format validation: drivers/media/platform/nxp/imx8-isi/imx8-isi-
      video.c:962
    - Discard buffers allocation:
      drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c:967
    - All in mxc_isi_vb2_prepare_streaming():
      drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c:940
  - New unprepare path frees discard buffers, stops the pipeline, and
    releases it:
    - Free/stop/release: drivers/media/platform/nxp/imx8-isi/imx8-isi-
      video.c:1033, 1034, 1035
    - In mxc_isi_vb2_unprepare_streaming():
      drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c:1029
- Switches to standard vb2 stream ioctl helpers, aligning with core
  expectations and ensuring (un)prepare hooks are used:
  - .vidioc_streamon/off → vb2 helpers:
    drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c:1255, 1256
  - Registers vb2 ops including prepare/unprepare:
    drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c:1038
- Removes unconditional teardown from release, preventing non-streaming
  FDs from stopping an active stream:
  - mxc_isi_video_release() now relies on vb2_fop_release() and no
    manual cleanup: drivers/media/platform/nxp/imx8-isi/imx8-isi-
    video.c:1286-1296
- Streaming start/stop remains confined and symmetric:
  - Start: channel init, queue setup, enable:
    drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c:981-1011
  - Stop: pipe disable, channel put, return buffers:
    drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c:1019-1027

Why this fits stable backport criteria
- Important bugfix with clear user impact (streams can be disrupted by
  unrelated handle close; WARN in IRQ handler).
- Contained to the imx8-isi driver; no architectural changes to core
  subsystems.
- Uses established vb2 mechanisms to correctly bind resource lifetime to
  the streaming filehandle, minimizing regression risk.
- Simplifies code by deferring to vb2 helpers and lifecycle callbacks.

Compatibility notes for stable maintainers
- Requires vb2 .prepare_streaming/.unprepare_streaming support (present
  in modern stable series such as 6.1.y and 6.6.y).
- If targeting older stables lacking these vb2 ops, an equivalent fix
  must avoid unconditional release-time cleanup and keep pipeline
  (un)prepare tied to STREAMON/STREAMOFF (i.e., adapt without the new
  callbacks).
- The scoped_guard pattern
  (drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c:948) can be
  replaced with explicit mutex_lock/unlock for older trees if needed.

Overall, this is a focused, low-risk fix for a real streaming lifecycle
bug and is suitable for stable backporting.

 .../platform/nxp/imx8-isi/imx8-isi-video.c    | 156 +++++++-----------
 1 file changed, 58 insertions(+), 98 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 8654150728a86..042b554d2775a 100644
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
@@ -985,13 +1028,26 @@ static void mxc_isi_vb2_stop_streaming(struct vb2_queue *q)
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
 	.buf_prepare		= mxc_isi_vb2_buffer_prepare,
 	.buf_queue		= mxc_isi_vb2_buffer_queue,
+	.prepare_streaming	= mxc_isi_vb2_prepare_streaming,
 	.start_streaming	= mxc_isi_vb2_start_streaming,
 	.stop_streaming		= mxc_isi_vb2_stop_streaming,
+	.unprepare_streaming	= mxc_isi_vb2_unprepare_streaming,
 };
 
 /* -----------------------------------------------------------------------------
@@ -1145,97 +1201,6 @@ static int mxc_isi_video_s_fmt(struct file *file, void *priv,
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
@@ -1291,9 +1256,8 @@ static const struct v4l2_ioctl_ops mxc_isi_video_ioctl_ops = {
 	.vidioc_expbuf			= vb2_ioctl_expbuf,
 	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
 	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
-
-	.vidioc_streamon		= mxc_isi_video_streamon,
-	.vidioc_streamoff		= mxc_isi_video_streamoff,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
 
 	.vidioc_enum_framesizes		= mxc_isi_video_enum_framesizes,
 
@@ -1332,10 +1296,6 @@ static int mxc_isi_video_release(struct file *file)
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
2.51.0


