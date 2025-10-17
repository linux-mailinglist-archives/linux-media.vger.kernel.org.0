Return-Path: <linux-media+bounces-44900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBB2BE8F64
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 198F91896B6D
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C058209F5A;
	Fri, 17 Oct 2025 13:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsKu1o+I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700C52F6913
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708326; cv=none; b=KPBvm3MkY4JvWWpjJ9dt4jiAvT8x5hQ56ZYmNhTNv9K0EPXGzyW5TvaG0p0RafqDKDYq9KDveGznqUXtbHasUvJpObfxaIZeYuaXWHhkVNsqo3B2fQ9Z+fSvh0qC9tsyL6csIAVTx5M4WI5Cj3pTk6L7JEh78dLVfg4cuo/W/Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708326; c=relaxed/simple;
	bh=fW0CMSL2iVoax0bpBLXAgym8PYVacdaffC287Y4ytTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FaEbCUtcDqaVklrZPrE+LfvpJmN5n92NbBGSQieY+nwRBgxU+Glc1LwNH+2MKwe0JxkWbZ438HghtbbsgzV6/W+Xwm+u0/vyQFGyxVXJG5No0ZRI3bGx41u2cQyK5BKlJvzyze7c83xSWkxMLB9e2X0B1Aewp5aRx9emzp677dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsKu1o+I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28A0C4CEE7;
	Fri, 17 Oct 2025 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708326;
	bh=fW0CMSL2iVoax0bpBLXAgym8PYVacdaffC287Y4ytTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bsKu1o+Ig6X/BiMou1YlhawVD8iqxiYPm88SDTsLBXu1CN+Ub5WyhMCJJMJLgR1k4
	 +LfDEoqW+r2UmKVc2e3ilBD4vC637B4MvRyZiB93FlsrvIwIB09F1hWUUSB4hT5FY8
	 yqjHn8zBBUvMgOaiULVY041edfCz/5AFG0t/HLj23Ox9TYt8ImHur3CgAI7aoxGU1H
	 KzU8KwBnGJqvAWl3ggckUnkyFsTQ5V41xXmttt9lmkqKTi4EyG1D6+Oaw4IBQLaoiC
	 mvEtVS70szVwi47O1nDpmZcpwhIuDrZ7oVPRWOiuwF7rzKZrZdVF60F7K8JgclMQcs
	 sckGI9eEI7yYQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 09/14] media: omap3isp: better VIDIOC_G/S_PARM handling
Date: Fri, 17 Oct 2025 15:26:46 +0200
Message-ID: <659149538833acf06f40a5660d03809f9f1c7ef6.1760707611.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760707611.git.hverkuil+cisco@kernel.org>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
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
index 471defa6e7fb..5603586271f5 100644
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


