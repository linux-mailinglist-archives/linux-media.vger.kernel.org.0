Return-Path: <linux-media+bounces-33945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D7DACB952
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 18:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAB727AA0A3
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 16:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A37C2248A6;
	Mon,  2 Jun 2025 16:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y5uqi4CP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD07226534
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748880421; cv=none; b=bnHtRLiXALYeL2eqSAnQCP2ST4gBGV1j8occMG48Ack5eau7E/tEZ7fsoTBhkMVxV/mtnv19nUwdCNjEZ5Hhmmgh1faV65nfCirw7sY+oKdgYm550i+DOKYyCtI2FNM088mGBniUGFrDFrpbRjxmU7Ev+zlYhiqp+Jy27uTDat4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748880421; c=relaxed/simple;
	bh=mvmwmP+loYWmqDadmPQCngMfwJYHfBbGn3wUfyXPsa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hNDZCHwR0ZKT0YJicofvjgXrIvUHur0kxSMss2+P+uwYsXveny2nX7WmLDTyVXwLxPPRe8FpITioFpErcoLtwnf2+YvwHgYTZNdyOsCDhlRRANjnYM5ZREIuDfxVMXUiinML4nY/RO80WGt7hkpeOxtGolzgc35k+IAIM9u5glw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y5uqi4CP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5532f9ac219so5275107e87.1
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 09:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748880417; x=1749485217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y74ULT3LPdgyH4OAnVV/2bC+RHsnC8gdCTnFia7kZh4=;
        b=Y5uqi4CPpxII5RVEp6VBVxZf8rJOf7WeGCN7zXJoJnU0yGiBfITxTbJGlZZe+4w6uv
         4C4ZtvMGedOCrkrqrluj7TYRUSAf756RyVw1nCfUD8VNgtfunK1ttWtytast2HwFr4JW
         oAMGjDJDA9a6VLtwd/TUsZBeFl2EfwwIWrPCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748880417; x=1749485217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y74ULT3LPdgyH4OAnVV/2bC+RHsnC8gdCTnFia7kZh4=;
        b=gqXvU/pp3bouI7WDCbde6+oAEcCC18clLKGZrYUj6g2WbhzyL0FTHtuSf9aiimRVXd
         g9pz0sPVe7wYsWaPeiehTbM1rZtKW7BnnWYikSz4sjh4G9nlLcqO2nWcbP8Qyxc99cyM
         s4Dp2u96V91tV+BVobczwAEZYSUT7zf4+KI1Gzdq9yCUNPTPrGHXBuroecke86ZhR9tB
         Cy6S7yrLb+zCVrcxN5ZOkFi8zZuXxpxxdotk3YqHzJYa/ZPdktg7376rGgYe61csxBbE
         POnjcqbSYyZtOs5Rbv2zCv890YGsomSp4KDSO/oDmuVfhbMZ7r5cphwFGqQTqBlUQqWq
         pREQ==
X-Gm-Message-State: AOJu0YwvRkhmJa936xTTLuPcW+sZxKMhUVKfhVlvh04YPOHYKgWhtqJI
	Pvpxc6CwZcy1KNd/9sZ3M82HEa2gI7EQrgEPfkYbJUYu//aXoeNjcGap7yKFvLf+FQ==
X-Gm-Gg: ASbGncsFriPzPvIkiOvAFSd2M2TIQWtxL8DgxAlyZqbgTBxQM2gHGziSjfyuhhRvisb
	TC9dVZufA4BE5z0mEsBkhRcYziSoDRYpb6rWy8Oi1NZoUhJLra/VDEA+qQuB6NSdha8Gap98C5M
	BsBonU40Fh0dFb8TdrXSZZwcK75O5g3/nroKvydak5yEK5HeomZ6IrWuT4VkF5kHBgkwyH73TFv
	pUNVgkYVDw70VNmh09cJfaxsXf2aUNH2webWIt+QpG1iYJxtGQigOnUnAvY1HkeWHRKgsTNWwjP
	wfecBqGLfN7EiCdpk6o2QWb8B4DsHXZu+2nxVbF9bv/1Bd3kaykNx1/rLKVY/arA1CSvIcP9OEZ
	teJwBID3lN5Wvv0VR/2yQnvm7a0hr7GM2GraAku3NMsqiKpE=
X-Google-Smtp-Source: AGHT+IGTKU1WbVBlmwGCeTPrDflgtRy3jQ2qUN9dh8EbI3UeiEfXdHZO8sZqCEtiVUymDdZIURz+zA==
X-Received: by 2002:a05:6512:b88:b0:553:37e7:867a with SMTP id 2adb3069b0e04-5533b93b66fmr3908786e87.49.1748880416881;
        Mon, 02 Jun 2025 09:06:56 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533789ff59sm1685113e87.70.2025.06.02.09.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:06:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 16:06:48 +0000
Subject: [PATCH v3 5/5] media: uvcvideo: Remove stream->is_streaming field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-fop-v3-5-a99e18f65640@chromium.org>
References: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
In-Reply-To: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The is_streaming field is used by modular PM to know if the device is
currently streaming or not.

With the transition to vb2 and fop helpers, we can use vb2 functions for
the same functionality. The great benefit is that vb2 already takes
track of the streaming state for us.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c |  9 +++++++
 drivers/media/usb/uvc/uvc_v4l2.c  | 51 ++-------------------------------------
 drivers/media/usb/uvc/uvcvideo.h  |  1 -
 3 files changed, 11 insertions(+), 50 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3f357c2d48cfd258c26f0342007d1d12f1e01007..6e845705b3286348a60650eb262e620dc6039d60 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -175,12 +175,18 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 
 	lockdep_assert_irqs_enabled();
 
+	ret = uvc_pm_get(stream->dev);
+	if (ret)
+		return ret;
+
 	queue->buf_used = 0;
 
 	ret = uvc_video_start_streaming(stream);
 	if (ret == 0)
 		return 0;
 
+	uvc_pm_put(stream->dev);
+
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
 
 	return ret;
@@ -189,11 +195,14 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 static void uvc_stop_streaming_video(struct vb2_queue *vq)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
+	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
 
 	lockdep_assert_irqs_enabled();
 
 	uvc_video_stop_streaming(uvc_queue_to_stream(queue));
 
+	uvc_pm_put(stream->dev);
+
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
 }
 
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 7a5ecbefa32c0a6b74c85d7f77a25b433598471e..d4bee0d4334b764c0cf02363b573b55fb44eb228 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -617,9 +617,6 @@ static int uvc_v4l2_release(struct file *file)
 
 	uvc_ctrl_cleanup_fh(handle);
 
-	if (handle->is_streaming)
-		uvc_pm_put(stream->dev);
-
 	/* Release the file handle. */
 	vb2_fop_release(file);
 	file->private_data = NULL;
@@ -677,50 +674,6 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
 	return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
 }
 
-static int uvc_ioctl_streamon(struct file *file, void *fh,
-			      enum v4l2_buf_type type)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	if (handle->is_streaming)
-		return 0;
-
-	ret = uvc_pm_get(stream->dev);
-	if (ret)
-		return ret;
-
-	ret = vb2_ioctl_streamon(file, fh, type);
-	if (ret) {
-		uvc_pm_put(stream->dev);
-		return ret;
-	}
-
-	handle->is_streaming = true;
-
-	return 0;
-}
-
-static int uvc_ioctl_streamoff(struct file *file, void *fh,
-			       enum v4l2_buf_type type)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_streaming *stream = handle->stream;
-	int ret;
-
-	ret = vb2_ioctl_streamoff(file, fh, type);
-	if (ret)
-		return ret;
-
-	if (handle->is_streaming) {
-		handle->is_streaming = false;
-		uvc_pm_put(stream->dev);
-	}
-
-	return 0;
-}
-
 static int uvc_ioctl_enum_input(struct file *file, void *fh,
 				struct v4l2_input *input)
 {
@@ -1323,8 +1276,8 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_expbuf = vb2_ioctl_expbuf,
 	.vidioc_dqbuf = vb2_ioctl_dqbuf,
 	.vidioc_create_bufs = vb2_ioctl_create_bufs,
-	.vidioc_streamon = uvc_ioctl_streamon,
-	.vidioc_streamoff = uvc_ioctl_streamoff,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
 	.vidioc_enum_input = uvc_ioctl_enum_input,
 	.vidioc_g_input = uvc_ioctl_g_input,
 	.vidioc_s_input = uvc_ioctl_s_input,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 3ddbf065a2cbae40ee48cb06f84ca8f0052990c4..f895f690f7cdc1af942d5f3a5f10e9dd1c956a35 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -626,7 +626,6 @@ struct uvc_fh {
 	struct uvc_video_chain *chain;
 	struct uvc_streaming *stream;
 	unsigned int pending_async_ctrls;
-	bool is_streaming;
 };
 
 /* ------------------------------------------------------------------------

-- 
2.49.0.1266.g31b7d2e469-goog


