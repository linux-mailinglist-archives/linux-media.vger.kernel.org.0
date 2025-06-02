Return-Path: <linux-media+bounces-33910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5244EACAE91
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD04A3B760C
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE5922171E;
	Mon,  2 Jun 2025 13:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mYYbbbNj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CFA221560
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869590; cv=none; b=pKRNnAgmOKFH0xKbSMm2QBdLyNcV57deRXoC93JtwgLFECbYm4n+3dSU6tR/0FtSVhLVYEPgnwgvqeH1yoRlXi50V+t/fj+1ZefIUs1yzo9JRHKhQRMvllNQwVa6mFnYSaVXku6fj5vs78TKljuWko2RhA4Krso9qKY6Mm3mfy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869590; c=relaxed/simple;
	bh=WyZB+LaC6SBQm0YqnCnNUB4EQV0vgX/c2EeK3V1jKcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LvHXVrJCLRiMvD5dYcL9MMAEcS6ETJ+IIRczEO+fVMrz554xzFuvYpumVGrHCEWqYuI9xP3OGsyMQZ4xWbgjPBHoawnPPWn+vt9vLniXd5z0ck88r1Awdj/x2YqJpDW/lk6ciXMXmbP7Z4SBM3oIeyneMgqReTq6kWVO6F/OaNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mYYbbbNj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so4682581e87.0
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 06:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869587; x=1749474387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SY8e7u8bpTQHL+5kLl+cCW4+6IGB1TDp/jXS+nQKriw=;
        b=mYYbbbNjnKh9iczJ5A4kGABVF1t7ayghYNIp6HRLl/rmVSeLnIBCwlkgk1HBo7cMCh
         5jyAxC1wS2D/X5GSFBOJzkHJMsEBr5gxkppIuCKkn/tkQgjk+kRtboMrn24C0BfBv3Gy
         OD5v6OJmiE3hFZAfR9/ShVL0rOkH+alk0F1yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869587; x=1749474387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SY8e7u8bpTQHL+5kLl+cCW4+6IGB1TDp/jXS+nQKriw=;
        b=BPpWhXTtnwhL3W/KDj1j/tWLTwKtjVh4fsP9I8rhq4EzK/ncTJlS0l5oJMZvPBbIB2
         74gEUGqhmdl+SjEOwFTwpfZkiD2HYcf/swH2jIFdUivq+yNJlT0Q4Erzw2w0YzZHPUKz
         dbybj2YaTNnz/iwXZ8VdhHODTS35p73cuVC2fSZS8vpnTMKEgyHSNmN04zV3RJuFslwK
         jQD9exMapyioeNg8Ojs2niAdC9YkebMCardfS8p/l/vY2rghiMbykMEjFY7BMRXYdPvp
         Kat4XHp1jQwWg83lVrzB0DFa0fZwTRmlrFw5w8Od2AqXCvMOiSPBlLFnkuuVhRvGcZpO
         PK/A==
X-Gm-Message-State: AOJu0YzhBB5htCPQ+zH9xvgL/ednXKaWWfPaL0pqW4grXYU7rEOr2PYS
	+3Jkvi25mUv4nMZ2tqgmGnpbUihvgtP1C9P28py9pPidfrELN23IMDAN//LuvJKCQQ==
X-Gm-Gg: ASbGncvv3GORagkDllK0eWkzEw5xqnkoicxaBfOlrzP8dmWdugGkzJ6AoKWDRQQASoH
	ACf4oVm+OsdAQmDL3PhK+3YxzgNrN4kMAw12mUjILW91khE/+cYnW1f+b2WpssOE1DEbhL2cgfV
	tQV/7Mv1tJoMkl4NXcVvptkq7xr6sLIbdCqd5O04WUvRGz1ARWLGtC8Rc0DTj/ywzDaVOHL2dps
	XxIb/t+RSXcbDA0p7/e1XGjsTrE95bQyA8r9Rcj7TwiEZPAOB6YCBqaosQ13VZsmW+Bfv8jLOGr
	bKJ5OMLCwzdx1ElL+Te+kv+FqCOVzRQESFdS2GhwQPJlcLWyXOf3zxcv2fRqLDMOUah+97ApfKS
	3CxpBnk9exNcnpVaIyY6dlB72M8QUCmrpZQPb
X-Google-Smtp-Source: AGHT+IETrZAakF9qfxZnmj0tcsM8DSjhCMOB3EfS1qAjcEZh33ISM8jTG+USPdJ6WLT1BS+E/CAXBw==
X-Received: by 2002:a05:6512:3d25:b0:553:3945:82a7 with SMTP id 2adb3069b0e04-5533d160fe8mr3856420e87.12.1748869586379;
        Mon, 02 Jun 2025 06:06:26 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 13:06:16 +0000
Subject: [PATCH v2 4/9] media: uvcvideo: Remove stream->is_streaming field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-grannular-invert-v2-4-c871934ad880@chromium.org>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
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
 drivers/media/usb/uvc/uvc_queue.c | 11 ++++++++-
 drivers/media/usb/uvc/uvc_v4l2.c  | 51 ++-------------------------------------
 drivers/media/usb/uvc/uvcvideo.h  |  1 -
 3 files changed, 12 insertions(+), 51 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 72c5494dee9f46ff61072e7d293bfaddda40e615..dff93bec204428b8aebc09332e0322fa68823fa4 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -165,12 +165,18 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
 
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
 	spin_lock_irq(&queue->irqlock);
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
 	spin_unlock_irq(&queue->irqlock);
@@ -181,11 +187,14 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
 static void uvc_stop_streaming(struct vb2_queue *vq)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
+	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
 
 	lockdep_assert_irqs_enabled();
 
-	if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
+	if (vq->type != V4L2_BUF_TYPE_META_CAPTURE) {
+		uvc_pm_put(stream->dev);
 		uvc_video_stop_streaming(uvc_queue_to_stream(queue));
+	}
 
 	spin_lock_irq(&queue->irqlock);
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 49cc64dd7e2e737f431b9df9df68921d9c543751..100cff47ecc5ffd9941e22fec24756abda1f015e 100644
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
@@ -1321,8 +1274,8 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
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


