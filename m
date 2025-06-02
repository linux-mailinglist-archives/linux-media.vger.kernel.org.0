Return-Path: <linux-media+bounces-33904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06803ACAE68
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63C541BA0CFC
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B2722068F;
	Mon,  2 Jun 2025 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B3myRb9y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D283A21FF21
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869156; cv=none; b=HICzEncFy75aNqBoD5eHUlI1hg6TOVKMMfaklaSZFRuVC7D/Pqy9/s5tSpXe35yt/tpHk/+arBsY5/qcgJ6YVY0k/EtiTDXjT1VMooD1598U5U7ZznUKps834drtAgFj/8MRNCNnyrzF80LL/AqEtO4rtVB2Swis8PeCsn9fMdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869156; c=relaxed/simple;
	bh=FGQS/DPv/UfUtSlsCQ6Vvh4EyONjnUMmQIJCXsOyPcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PfEmKQcHQ/kBTNjRhmRq1RLRbMHHHTM85ca8e3cC26OKF2n3TIbHnAD21sQMaC/Mfa/GLmkIIxELANz6vqWP9C3hPv30a7MrUGGAvtW/UuOMuKFi4rmGfCCpIKCbpp5EAbSNsWKzMFjq8VNvBAQb40FBMsACNTLooqAuc+1nJ7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B3myRb9y; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso5663320e87.3
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 05:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869153; x=1749473953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToC+Tc0dmXcPfX/TTDxCxEcN/r59cEY9PxQCySvBfGI=;
        b=B3myRb9ybenA/oQbk7UzqtOVkZbBywmaWMxqBNc4aXFLXkob9QXrNlGcPUt9vmjdML
         I58F8eA7z/6SXPKurqtdSziOqbp56/bfBU1gVuPWAYV6jotVoRcfQk9l5Agbn2ClIN1D
         DXIuCFf/TYnRnKe8bo65C9BoLPV0zPK8ltf1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869153; x=1749473953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToC+Tc0dmXcPfX/TTDxCxEcN/r59cEY9PxQCySvBfGI=;
        b=vQ4WOd3Hx5rLrnMgsV91ZcsD67QsMEV8K1L8ZZ36WTPzV1uz55eNVZTVFkUT0Z4TIw
         tVCNBepk+PIrZWAKmxT+Jeahn8GSs80APX77jXcKO2HdMJNSftv3dKBqWbD6lFuV6+il
         TnIDN+zeGaL8Nbqxfoa966prZ2bYYBf3iaBc6YQ7FKfjirWObKQp4u3mlyfZgXdTWcql
         GrtqOxhmX9a6J8ii4TOLdcAVXwas9hQQFSBUNJw88qIQb0NngfJOTkx1ZHHkZ52NirX8
         C4md6weOnnMxBOjuFpuog3GFmR+cMAYFkgq87VyYT7NN1qYPJH80AKIjKfmL7SzhoKtk
         RasQ==
X-Gm-Message-State: AOJu0Yx0hUPIMtn0iLv1yHzxDr6v3rCz37RP0JSM20N85VnabhU/cNOs
	k0JGIn0mJz1YicoOw2BNJWTv7UwcM32SDbyNfiKWTnOVizqu5x8/Y1x0PGF2iDTcJg==
X-Gm-Gg: ASbGnctTL0rFZc5JDtuo0c/JjqXNHLGQGTadZ90YMjB2TF/C3xgPSIXXg5/YPRGSU87
	L73jAmeSoT4MvoND/LGnT45NncwRhszu5KCKAdZX11yrzi3VnnsRW22qZSpdMZSRMN0kBWICvVK
	/qFZegfLXuvnsTBlPy4A8jMm32JSXjdox83Us04NYd+P3RjZNuShFGrhzulyudSY9trrsTJIIIx
	oao1KmETve1/6a3rRhTtNR1/pOauWxmChg/YGBgfwghaDHUdMqdN0mYJW7jCttaxjsLJoe3BCKS
	bNw2VgKxE9bZ2OkNnxtiGWReiW/s37dYk2kuXrcjcmteKzsEduif/AJA4upyKf69qQcwpG7N18Y
	hsOfc1bWyRLz5vCnSZH8aqVMY1w==
X-Google-Smtp-Source: AGHT+IFdCNN4YdbC1Vdbn+B7IdgBUiXxK5TObG5L1wn0bDYUQJ6e5TVqvDwWnb2mlTLtx31JnwUl8Q==
X-Received: by 2002:a05:6512:1318:b0:553:3332:b652 with SMTP id 2adb3069b0e04-5533b8fcdf3mr3719422e87.23.1748869152987;
        Mon, 02 Jun 2025 05:59:12 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379377a8sm1601140e87.239.2025.06.02.05.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 05:59:11 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 12:59:04 +0000
Subject: [PATCH v2 3/3] media: uvcvideo: Remove stream->is_streaming field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-fop-v2-3-508a293eae81@chromium.org>
References: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
In-Reply-To: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
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


