Return-Path: <linux-media+bounces-36311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C53D1AEE082
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 16:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE4BF7AA56B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 14:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EABD28DF06;
	Mon, 30 Jun 2025 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aMJ2VcZt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F3628BAA1
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293236; cv=none; b=XEVtohBauVfsFvleckHJcF3DqiRMukDIqa2dRSTCpK7TvtTH4uJZ4XdbVeLBZN0Z9BrmMywD7YSc8C/qRiK6JWQx8k7idY1NVREebGcC0L+cSJnIiBSawL10eE6ZyI3LU9siJ2JSukqHCMtQSjqKy/OLuC9VZwM4k7kMWTRVWhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293236; c=relaxed/simple;
	bh=hUSTM0cz4lDmfgU98My5Gb8Nx4v9DP1TnSn7IZqRpUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLwS1BJ0BYHRhdOzfELo4s9Ay7kBsVcw12KxWf1SOSlp87CC91arOM4YsrwlBjRCGaI/6eY2lIiQ0+ZHXR/+LuDaJboitAFJAcAb8E2Fle1+tNFtYqhTgojlri+A5GS9D0otnBcxHT/bqgcSi+GnTULkMNCnGCh3Gh5IsZKnxvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aMJ2VcZt; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553e5df44f8so1817237e87.3
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751293232; x=1751898032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dnt386dfMPODMMm6G8wrSthRtbiPhPkQSBX13EJa6EE=;
        b=aMJ2VcZtwoj6jiMpHaVc5Y3xoS7ekQJIZMYsh1xyZxMtcqCxm8lghZ2TXyuCYpD8NX
         Zi8653ZYC7s9Jo+A2tg6o1RVDnee4hXFwfiX6YHGEo7mQ8AxaXGsuxla2XA+7z/+VtnL
         dDzEDI80CNvmXkn4SdCgxQQEpIHmuDQDNKrqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293232; x=1751898032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnt386dfMPODMMm6G8wrSthRtbiPhPkQSBX13EJa6EE=;
        b=VTW55O/Yhe+Yme9X3WkMfu1ZKniKCpWGF5WIAvg+rGqYRTBApge3F6NCqFa7ES357G
         eNW+IPMCmODNXptzUtnVo9N1TdU1yKCBA9DqaRdJdm6oCyr9qT+qaRMYljn+HXyr4YeE
         xw5rLCy8E2gjEuUUd0inkcHVpUh9l4LprP8OMeGVoz8PivE8wFrLZ0dIoIuG98KQV4HM
         K4iNda5jJ2OHhirhtK8GggcZTN+BMWz68NXItw85d+pLJd/o3zORI1QsWGm3SIUlPQgs
         CPOzhGU83WTo0tztoBajmOX9tDKDThofvhB7Tc50ENJl8+CPJKYSJQSAIdqyOd3JAAJt
         QcVA==
X-Gm-Message-State: AOJu0YzkHf4dy6iD6t8ulEGfLBSG0wi7ysf1jt3a58LldpjqaFoU1yso
	nTzqI8jJ4x9IZjztguPFDvTEtOWhrtMOCWchVKa10r18TwemarxZOWq7aJOdNWUC2g==
X-Gm-Gg: ASbGncu4B9XiHH5Uab+ai8RWjNATnfMx2dwLiu5b0TYZo/5RIoVdTr0zP1q0kNiNtu+
	f7vTu1C2A6VdKBW3tEjNC07Nk76yLomIia9iYoelYaxa1UPnGyYZB2UECokJk2Mmrg+1WAxSxtl
	FFFp96Mo52nkA160QVPrqNhuQPldKyRnVf6Ck/cWB5cMk3FnzW0yoIRDh1i5rpI+5STTrTUsqLw
	xyBUjQxAQIuyCiALrvKN/lQXQh1f6fYXBTXz+y6wtgzP5QYPvcLvyzXHbwh7BKxcOrt3B3xYANg
	osKLL1JnGwdv5y996ynHtjoXjBDx7O8MgVpV5ZuiSd/uXihXZXTEbUfwiRckY9wcjgfrARBThG2
	6NSWfS7eYUDKhoOzrcaxZhHIKvn+MMz+kDr6seDTpqA==
X-Google-Smtp-Source: AGHT+IGdwXnpgUB0vN6sIBFwmisdEJIRVa6FJTkVxayzmF/fNIKWfsG+a9C1TibVfwWUCEy4vc7WRA==
X-Received: by 2002:a05:6512:3156:b0:553:34b7:5731 with SMTP id 2adb3069b0e04-5550b7eccf9mr3761330e87.3.1751293229598;
        Mon, 30 Jun 2025 07:20:29 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d8ea8sm1432363e87.210.2025.06.30.07.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:20:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 14:20:29 +0000
Subject: [PATCH v3 4/8] media: uvcvideo: Remove stream->is_streaming field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-uvc-grannular-invert-v3-4-abd5cb5c45b7@chromium.org>
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
In-Reply-To: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The is_streaming field is used by modular PM to know if the device is
currently streaming or not.

With the transition to vb2 and fop helpers, we can use vb2 functions for
the same functionality. The great benefit is that vb2 already tracks the
streaming state for us.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20250616-uvc-fop-v4-4-250286570ee7@chromium.org
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/usb/uvc/uvc_queue.c |  9 +++++++
 drivers/media/usb/uvc/uvc_v4l2.c  | 51 ++-------------------------------------
 drivers/media/usb/uvc/uvcvideo.h  |  1 -
 3 files changed, 11 insertions(+), 50 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index b11f56d62ec0495a8610580367486dfaa31c450d..790184c9843d211d34fa7d66801631d5a07450bd 100644
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
2.50.0.727.gbf7dc18ff4-goog


