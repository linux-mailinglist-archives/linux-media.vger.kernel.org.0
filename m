Return-Path: <linux-media+bounces-48039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57200C9A8D8
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A114E3A48A4
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F8D2FF64E;
	Tue,  2 Dec 2025 07:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9NjuxtF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CFD303A2D
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661754; cv=none; b=XLG7LjaLnr3N/FGkswcWzbhz+BeflB8UW5AgK97vqCkZ67AGGYuo/l3QLbm933aepwOQTAj56hIeH6QbrwJf5ZrbBlQe11MCtsrirGFizeUnPVtzrfY9Qw+U9sCOJOld3wyWxHzbTH2tlEKkuqEqDbnWWsx0nR3JVSpBibCGWX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661754; c=relaxed/simple;
	bh=5viBkbAHYaWz/5v5CPGSmuIOPg7Yj1OpBmL6uq+Tv64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lO5BHr0pgwQlykdOr+ru6V5EeZp4RkJr/Bgj4O8ztEb6vpSRF2rNf54Po11fsvmoaiduuJ96d91vmI/SeTT6aCoRh5onCOICRrQ4Iij71FiJFL9OMCKcjUEmiFyFtQN8Auk4DMAPWphR6N/dYQtLcu3DL8DyZIPf4+A9wg+2Juo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9NjuxtF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87FAC116D0;
	Tue,  2 Dec 2025 07:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661754;
	bh=5viBkbAHYaWz/5v5CPGSmuIOPg7Yj1OpBmL6uq+Tv64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N9NjuxtFSolLAhH9G8ssEvgEj3ba47vIipSOJmfeidrVQVc0SRgCMYqUTosiKh0g3
	 mCzI9Iug5hqr+F+u71INQX3k/qUr196UtuzaFZY2o1QXoE1/gauOes+7lpTI7ea3YK
	 t89pUYG6+or7V9L1+86mCwJ/GR5MHxWFIg2YZl9EhrZC5XvTtuWIuTGJ6t/KCL6Xhy
	 JZRVtvarzgzbcuT99uNU+i7nP17lOAWhiFqkgfb8rr7k9+dHfAo3SqA32TAjHzO67H
	 omijOeKPaG/puKOtff1j1aMIzgF2ptUQ1EXTouDOXuyCpNAivz9CDI3IMe+I2XFQMS
	 nvywYuSVc6nbw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 08/11] media: omap3isp: better VIDIOC_G/S_PARM handling
Date: Tue,  2 Dec 2025 08:48:09 +0100
Message-ID: <5c4c95e160efa7cabf03bdd4f99fb7861a65037e.1764661692.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661692.git.hverkuil+cisco@kernel.org>
References: <cover.1764661692.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various v4l2-compliance errors relating to timeperframe.

VIDIOC_G/S_PARM is only supported for Video Output, so disable
these ioctls for Capture devices.

Ensure numerator and denominator are never 0.

Set missing V4L2_CAP_TIMEPERFRAME capability for VIDIOC_S_PARM.

v4l2-compliance:

	fail: v4l2-test-formats.cpp(1388): out->timeperframe.numerator == 0 || out->timeperframe.denominator == 0
test VIDIOC_G/S_PARM: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index ac170ef4fa01..86cb27b6ca4e 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -928,7 +928,10 @@ isp_video_set_param(struct file *file, void *fh, struct v4l2_streamparm *a)
 
 	if (a->parm.output.timeperframe.denominator == 0)
 		a->parm.output.timeperframe.denominator = 1;
+	if (a->parm.output.timeperframe.numerator == 0)
+		a->parm.output.timeperframe.numerator = 1;
 
+	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
 	vfh->timeperframe = a->parm.output.timeperframe;
 
 	return 0;
@@ -1413,6 +1416,7 @@ static int isp_video_open(struct file *file)
 	handle->format.fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
 	isp_video_pix_to_mbus(&handle->format.fmt.pix, &fmt);
 	isp_video_mbus_to_pix(video, &fmt, &handle->format.fmt.pix);
+	handle->timeperframe.numerator = 1;
 	handle->timeperframe.denominator = 1;
 
 	handle->video = video;
@@ -1532,12 +1536,15 @@ int omap3isp_video_init(struct isp_video *video, const char *name)
 	video->video.vfl_type = VFL_TYPE_VIDEO;
 	video->video.release = video_device_release_empty;
 	video->video.ioctl_ops = &isp_video_ioctl_ops;
-	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		video->video.device_caps = V4L2_CAP_VIDEO_CAPTURE
 					 | V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
-	else
+		v4l2_disable_ioctl(&video->video, VIDIOC_S_PARM);
+		v4l2_disable_ioctl(&video->video, VIDIOC_G_PARM);
+	} else {
 		video->video.device_caps = V4L2_CAP_VIDEO_OUTPUT
 					 | V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
+	}
 
 	video->pipe.stream_state = ISP_PIPELINE_STREAM_STOPPED;
 
-- 
2.51.0


