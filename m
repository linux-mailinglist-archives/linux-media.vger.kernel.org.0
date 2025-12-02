Return-Path: <linux-media+bounces-48037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1497C9A8CC
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56F6D3A6050
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91378303CB2;
	Tue,  2 Dec 2025 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1O6/K3m"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0143303A00
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661751; cv=none; b=FmgJDHJ5g+Kz/TQS4TrN9lOJeIUSkk2eRhFlHIFZorubVgbMpphBrh54xbsCBAAm5tC8vgjfrSkUi2Ej/sR0sX78gLRpdlWK/iis8uSwUrdOSFX6z3X5t/nmWHJ2kJmgMOhV1apY86OLRzDqIEZmTnOChp0usT5iY8FsQ0ubnbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661751; c=relaxed/simple;
	bh=l+1kDlQwSj8hi9St1QMK0LThX9ivBWy30d2SFpWDN2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SAttd2EhHcI2tcN2VcN0+Ezt85+3+pDj0yoUuFrS4+eMIqX8HipADSNZvV5e/uvezGX8A28UvmFv6SNzK8lbZCriNYbp8i92VkS92W1fl3xnJ8rc3xBWJXnqZ3HxtjLdFH2+8S36NtIbrfVMB7W5FtAXn8db6rL5/oVl9UyM+0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1O6/K3m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B1FC116B1;
	Tue,  2 Dec 2025 07:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661750;
	bh=l+1kDlQwSj8hi9St1QMK0LThX9ivBWy30d2SFpWDN2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P1O6/K3m7n8usBvPX9g544I6eQXAegW0qXzDQNeTPcQV65UoUqvjxIXsq1eRx1qXD
	 G2HJU17BThO3ikeKJNLfnUZpFNkxICEcxAxpBlfC/mzdjDBeIOIvmxHpn0BkNN2Lym
	 i4/CDkac50x8TnmEyEnhk5oNmmYq+kTyJW2bq2pWWG/HBNkY3dJR5wHoErdImXpJyp
	 MQv6MhSUjZxa49gITCY2DYQytZUzxpTeBy8fuwj5Z6R2k4iKDXlyzncSdYE4xivN1p
	 ZfJRd58ua9qrbyA0xzhZhsR6JOM07WxXjYAyAL8Rh37tKLaENu7isBdIppZWKP9dHh
	 6KuKFD3EZChag==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 06/11] media: omap3isp: rework isp_video_try/set_format
Date: Tue,  2 Dec 2025 08:48:07 +0100
Message-ID: <878620dd587ed8e6a14a7307709b892aa88682a8.1764661692.git.hverkuil+cisco@kernel.org>
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

isp_video_set_format now calls isp_video_try_format first, ensuring
consistent behavior and removing duplicate code in both functions.

This fixes an v4l2-compliance error:

	fail: v4l2-test-formats.cpp(519): !pix.sizeimage
test VIDIOC_S_FMT: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 59 ++++++++++---------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index c52312b39598..adea39b6d930 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -700,11 +700,15 @@ isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
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
@@ -744,32 +748,11 @@ isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
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
@@ -786,6 +769,24 @@ isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
 	return 0;
 }
 
+static int
+isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
+{
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
+	struct isp_video *video = video_drvdata(file);
+	int ret;
+
+	ret = isp_video_try_format(file, fh, format);
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


