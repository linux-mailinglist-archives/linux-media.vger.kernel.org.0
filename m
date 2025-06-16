Return-Path: <linux-media+bounces-34962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5293EADB53E
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3ADC7A8055
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AF526529A;
	Mon, 16 Jun 2025 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CAsTgGDk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD5320F087
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087495; cv=none; b=dFA9lb1UTKDLK6FmUZ+QXrcY8y+2LYnYAn6PS6KIJ/x/fNo1rUVOIkRG26cQLyNGqNupcwHxP0r91LZQ+36BA+Dt/UePOAt7YJsFldmTbauPQvfMRPioVMWb09cza+x5Zbhk6Rq0FFBYVH3sxzecjNWksa7Sd7Zmc7uKIYw4V0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087495; c=relaxed/simple;
	bh=9kA30+57eWk0fVX8unbNgZkjlYMI/wsqPiSazmWfLtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iO0jEoOZgKuT+dFsP37w5AwBDCXKUB5NPd53Rtp7MMwsBuW+tEGaVWn5qce7SehCN2cyl7sfacC6e5bq0E7zJ0g+t5t4dX+/vNv1PR74epF/U5kBubOSNnA+Gca2Vem18t4VjKStNNvBtTtVeWenhCjG9aTE3/QQ2tAc8+lu1p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CAsTgGDk; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso1564722e87.0
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087491; x=1750692291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsPNlHsyKYu+Nk7YIKvEDwnjW+ZYrPSdNGA8EvMV2PM=;
        b=CAsTgGDkrg5zgIkRCLpa/kJpKeJbzKem9pvAx/E7JAM+K/h2Ac1S+8+Hou8r3h5ZdL
         td+RM2bR6UY5Dz/3SC/zijeHYipxmCxaOWxyELKnL3R0QWXresNFYZIXBQMWkaJXelRg
         FBX8zZ/2JMalFHVoOP0U5febEiahS6lTZ/rvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087491; x=1750692291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsPNlHsyKYu+Nk7YIKvEDwnjW+ZYrPSdNGA8EvMV2PM=;
        b=VYxO4mAFYm0i6SRDxpgqTMoz1UWc51WkwXuseNcvyeJf4Rq+xKGfR9rzCk4R/eYKnb
         WGQvmAW0a1WuPSzEozlKz8MQBpYiMCiJ+p6VkgB57HPE8pOmc8yllEpI18pqNCIzYx0P
         e85QGI1SZKkOCp8R7ME1xnoWLj4vOC/8WtrtX9UIVrJigVttJS9defuNXqFIixwFOQ2r
         SBVqqqxwsTsBHNNzvX05v984izmpcXRLPlDlnOSonqZRx7054ziDWTyk7MFftZg04Xdh
         Na0FxGhnQNRzGwLp30ATGcBUUI4GQAy4wQ0SlAAzbpEa2PgMGyhFvHj55dwhc4YW35rF
         ZlhA==
X-Gm-Message-State: AOJu0YyYwCmnpcGGFEJBz9Wrw9zUEZbLnLSL7Dq/5mqhOKVCCgzK4Qjg
	mTQDZsJ7GBa9753QUKGYoeM4kDYcnHgMimtoLs5rUg2Y0vW/F53Fq4iBJNoOAKq0BQ==
X-Gm-Gg: ASbGncu0d5I7XS0vqpOmEkENQuXFSlSkXBx6noqzTigqCid9IlwA7+3CwXqx5XvHLBv
	OaREwZ6QyfPm7Vwe5EmFehzeQKTDFJ8lsPrX9RPjZfjOD1y3OaQbE0kCUkHn+dgHuzRmr6d9eyD
	Uo7i2NCKp+LmROFMp5aB39sHU1UDcRdH1EdBa7UibLjucoAgTFdUDt3xWtsiwHkM++ZN/5U02ku
	o+lI4o9Vqmf9xcaC0ETs5IoCGKG+2pU/dPsA08rhLS8uRYtc7Ug9+SMuG8nY9iJhhzAmRLMcuT/
	5VCbzGE4q7135NKXN73dLMTwUWx5z8Qs2fTAHZCMrYWXLo9VD3Pe1Dcfnqomo2UNgpUNtTQY9Ur
	/8h20WS/HGwgx2D1EEvQ5SOcJEJ0w3nUkKBzf9MYsVg==
X-Google-Smtp-Source: AGHT+IF0Vzm6zGi8l3n7i0OflXc6dTdNk8cfglD8KGqDzscDTr0vc4XtOn3o3k7EBq/QfdcIE2AFfQ==
X-Received: by 2002:a05:6512:4026:b0:553:24b7:2f6f with SMTP id 2adb3069b0e04-553b6f45ccfmr2413522e87.51.1750087491329;
        Mon, 16 Jun 2025 08:24:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1dbcf5sm1564271e87.190.2025.06.16.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:24:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:24:41 +0000
Subject: [PATCH v4 4/5] media: uvcvideo: Remove stream->is_streaming field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-uvc-fop-v4-4-250286570ee7@chromium.org>
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
In-Reply-To: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

The is_streaming field is used by modular PM to know if the device is
currently streaming or not.

With the transition to vb2 and fop helpers, we can use vb2 functions for
the same functionality. The great benefit is that vb2 already tracks the
streaming state for us.

Reviewed-by: Hans de Goede <hansg@kernel.org>
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
index d06ecf3418a988152c6c413568ce32e60040fd87..7ab1bdcfb493fe9f47dbdc86da23cba98d7d10ff 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -617,9 +617,6 @@ static int uvc_v4l2_release(struct file *file)
 
 	uvc_ctrl_cleanup_fh(handle);
 
-	if (handle->is_streaming)
-		uvc_pm_put(stream->dev);
-
 	/* Release the file handle. */
 	vb2_fop_release(file);
 
@@ -676,50 +673,6 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
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
@@ -1320,8 +1273,8 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
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
index b300487e6ec9163ac8236803b9e819814233f419..3e6d2d912f3a1cfcf63b2bc8edd3f86f3da305db 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -629,7 +629,6 @@ struct uvc_fh {
 	struct uvc_video_chain *chain;
 	struct uvc_streaming *stream;
 	unsigned int pending_async_ctrls;
-	bool is_streaming;
 };
 
 /* ------------------------------------------------------------------------

-- 
2.50.0.rc1.591.g9c95f17f64-goog


