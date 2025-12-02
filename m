Return-Path: <linux-media+bounces-48052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D302C9A90E
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1F83534624D
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C03305047;
	Tue,  2 Dec 2025 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHTw9ajc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B689030276C
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661969; cv=none; b=NnNwiCxIkdC8s8oYUd+xxN+j2CnLiUfpgcheQD1yDzgC2do1iAGiVg+Bde2w8t5y9YXoAjrZGelUqFlWgEBYAGSPnHDsxU7fQzOLOwtNb4IGj0V2lED9sUe9MmAW2aFDoSERHVLEaPFzODwnzO0KJ731RZyN9/tIB11SgnnDOVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661969; c=relaxed/simple;
	bh=5viBkbAHYaWz/5v5CPGSmuIOPg7Yj1OpBmL6uq+Tv64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kC6vdphaQ84kMcWMgL+M3Vm8gL+Q+rDvOeeALDw9DDeijdn0zrTeSVljiBk99c2cXNRoy2Slw6Bl3ldha2vMVBvYFU9sBSJBRAUBo+bQ2xQI9lS9YO7sVRjum1dqAgr3fR6Bctc+lReY8gaHcWwVE6fPKQvmLoO50NQeQt1P/ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHTw9ajc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67F8C4CEF1;
	Tue,  2 Dec 2025 07:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661969;
	bh=5viBkbAHYaWz/5v5CPGSmuIOPg7Yj1OpBmL6uq+Tv64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mHTw9ajcLWpnu2X6tIWgx7vcSMiobzzu0+WV1k/ou4kLhbO+ZoEMQUq5jVuAZnbcW
	 0N2ILmsYvGj8rriyT2k//dKP0BvO5Uvx/ISIq7bTk/er3+Yji4R9XBsQOk3VkOqA5Q
	 zpvhVUBtEMplXyzUb45SgX/BzSxag00tZAtmzcUq72CLOjYZfqGzuuF+QbyKHkQMG4
	 YL3S4uFuOtN9oxyWEJ+ruXvaONXQRf+gRP0fJq6jljhgyBK53rt0NaOhwKnDgs40UN
	 TXpEA6+/ktS1YyZbWD3QNC+yUvM4ToEgEqJnRn+o9yn3NInzEriwYZKQVKBix4TRmF
	 vE/935ER4NQXA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 09/12] media: omap3isp: better VIDIOC_G/S_PARM handling
Date: Tue,  2 Dec 2025 08:51:17 +0100
Message-ID: <d12339bac4f4d7579e5acff47a0289cc6ceb41aa.1764661880.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661880.git.hverkuil+cisco@kernel.org>
References: <cover.1764661880.git.hverkuil+cisco@kernel.org>
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


