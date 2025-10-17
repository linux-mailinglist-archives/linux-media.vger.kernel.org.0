Return-Path: <linux-media+bounces-44898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 941A1BE8F43
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABAE8584785
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC052F6931;
	Fri, 17 Oct 2025 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a29VDlmV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5AF2F6913
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708322; cv=none; b=jXThD8qRSBOFDQkENQshvK6jeDGJIKnkU8hwuaIYN0I5l9EksHmu8GJPqLYPendlH1HX59ccH0wRIAFxZudr8/K7xh/l1qHOTel7uqWKvsZzzLV9H7ZAIqAiJXKUOM0JR0bs5Vt91UAVL/Z6R+9laE4JH1FGdiPVIayW7SBN8gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708322; c=relaxed/simple;
	bh=0vr+wDOdfIbKzByFiBbX28PCqMWaZ6SgZOY8HLWvS9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i0QTDOJsgXJ9o5Vm6JNU42j6ICJb5mmU2/rwKP444eLcBiqlvNaEtcMg5MtKzAV75HLB4JqjjaQ+f8OwJraL+M4GNa1a8GBfeCJuVySmq7DvzSxlbx990eobE7LAX6e011kFAJL136uFfzbZKElUqfFOAKV0EUNLKYtMZACZsqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a29VDlmV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578E5C4CEF9;
	Fri, 17 Oct 2025 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708322;
	bh=0vr+wDOdfIbKzByFiBbX28PCqMWaZ6SgZOY8HLWvS9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a29VDlmVo88mYlS9juUTFvk7qY7vMal+FmdK5/3Xk/qcxDs+WZyrwZ1wpz6v4J8Gf
	 yJKy74CUcyHUG+0HgJRHQBAQzEQty+o66SP5IQTHeyIqYAhNlcv/2Tb81ht7gSPvnz
	 LTx6CW2sfANFxPgQa/wEhCqqeS6EcGsb2VB1T19YaHz4WlWd7QPeggh4wgRGRLovkb
	 EmBrkS/w8Q9faNcofzlax6+7ySiXhF5zM/S0B7Hf6GUJ5aOevVg7FSYKts724CbgzT
	 TvR5vAb6LpHeXio02TyDmzGVzCdPwMUiDrRKt/2f47+DTdOKh9Fe4R2H9pj2s7TcD/
	 FDS9Zojts5ceA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 07/14] media: omap3isp: rework isp_video_try/set_format
Date: Fri, 17 Oct 2025 15:26:44 +0200
Message-ID: <679d80346bef43fab642342ab9de407c132b62ed.1760707611.git.hverkuil+cisco@kernel.org>
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

isp_video_set_format now calls isp_video_try_format first, ensuring
consistent behavior and removing duplicate code in both functions.

This fixes an v4l2-compliance error:

	fail: v4l2-test-formats.cpp(519): !pix.sizeimage
test VIDIOC_S_FMT: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 60 +++++++++----------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index d3fe28506fb0..69d17e4dcd36 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -701,11 +701,15 @@ isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
 }
 
 static int
-isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
+isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
 {
-	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
 	struct isp_video *video = video_drvdata(file);
-	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_subdev *subdev;
+	u32 pad;
+	int ret;
 
 	if (format->type != video->type)
 		return -EINVAL;
@@ -745,32 +749,11 @@ isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
 		break;
 	}
 
-	/* Fill the bytesperline and sizeimage fields by converting to media bus
-	 * format and back to pixel format.
-	 */
-	isp_video_pix_to_mbus(&format->fmt.pix, &fmt);
-	isp_video_mbus_to_pix(video, &fmt, &format->fmt.pix);
-
-	mutex_lock(&video->mutex);
-	vfh->format = *format;
-	mutex_unlock(&video->mutex);
-
-	return 0;
-}
-
-static int
-isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
-{
-	struct isp_video *video = video_drvdata(file);
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	struct v4l2_subdev *subdev;
-	u32 pad;
-	int ret;
-
-	if (format->type != video->type)
-		return -EINVAL;
+	if (video->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+		isp_video_pix_to_mbus(&format->fmt.pix, &fmt.format);
+		isp_video_mbus_to_pix(video, &fmt.format, &format->fmt.pix);
+		return 0;
+	}
 
 	subdev = isp_video_remote_subdev(video, &pad);
 	if (subdev == NULL)
@@ -781,12 +764,29 @@ isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
 	fmt.pad = pad;
 	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
 	if (ret)
-		return ret == -ENOIOCTLCMD ? -ENOTTY : ret;
+		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
 
 	isp_video_mbus_to_pix(video, &fmt.format, &format->fmt.pix);
 	return 0;
 }
 
+static int
+isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
+{
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
+	struct isp_video *video = video_drvdata(file);
+	int ret = isp_video_try_format(file, fh, format);
+
+	if (ret)
+		return ret;
+
+	mutex_lock(&video->mutex);
+	vfh->format = *format;
+	mutex_unlock(&video->mutex);
+
+	return 0;
+}
+
 static int
 isp_video_get_selection(struct file *file, void *fh, struct v4l2_selection *sel)
 {
-- 
2.51.0


