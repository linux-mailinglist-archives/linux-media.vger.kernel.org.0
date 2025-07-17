Return-Path: <linux-media+bounces-37953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3BB0875C
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 09:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BB5B3A8143
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 07:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6518E2676C2;
	Thu, 17 Jul 2025 07:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JUcH0Xdw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3D01EF0B9
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752739010; cv=none; b=FG6ZqhbpaADT1JAtnhiXe/GqbAp32vBgOv34g+tRT/Q9boFNdmOHs0kpEWemjHxPTTtlDVJEIcgZh2YDXgDB/5zO7qgE1kMOgIlZW5P8SCwpgiy4SAmiGAQWhMcugURPwXgpgOebJA/caeiahbosniuK0BR+oU5MsRD7LM4qZh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752739010; c=relaxed/simple;
	bh=ivftYy165sS8mvKEBHuADgPv+nDQA+lt7mqET/+JXhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OjhEJBXxNsSjL8JAkSyCZ43tmYdgC2LDD1OAgewFZLzQjc9h2IXeU+6KQedfnogGCh7euHwUKxGtW7NuRAPuAzqECjzg0ape7Hw5lGMBxVG/L0L7oNXDIDCiCE0mivkOxwc7n0N4Rax1T5KJRb5siY1yu4iQ7Yeg0dgpaFNDwtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JUcH0Xdw; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b435ef653so5188781fa.2
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 00:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752739007; x=1753343807; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPNshWzmBQZhfeU9vekXY/PZSb0CpR11Ox+v95g7FJI=;
        b=JUcH0XdwyQlS0QoypOAQuPedy39cfqBLgOljsVdo6nooTWfgBoLmJKgzSIti12uBuD
         3wTY29xN85UD3whrVKFoxnGRb5aViL4pYAxtZC5T5tPEWxZ3WTu9reAlDKbm4VR95dCX
         tju2DdPYWdfiCGG9o0DTLcqR5/JFBG4pdPmrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752739007; x=1753343807;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPNshWzmBQZhfeU9vekXY/PZSb0CpR11Ox+v95g7FJI=;
        b=pF3PpRhCyjNo5TkSyb6+UG9DEGOcY1M2gp7BIcGjI72KYLRxCNtFhb41cTY8vWFZfS
         cO6s/Bi/rLhIyibbiz5bV/WJTA+bEKcV+WvQXQW41QL0gR6tufqtxEu+xzcqcK4w9xbw
         y375ANfm79M2eES/rvX1TeKd2NeS0mb0FWdO9S4iMz96gfYOchEw/myL+BRVcrgA9Vqw
         NEQoIfXU0S3v6tJ4GpJYagyPGikoNT9iq/2pshuyhLdK/ygzVFR2YuepDl+vUXvBo9Zs
         dyJBmvh0gi8RcI6diqQDNDRDsbNMUWZwGsRxsgyg/kuPeZu27+0GoLeCR7C/mWGPd32t
         vUQA==
X-Gm-Message-State: AOJu0Yx7OzDKe6bttWMd8NJiIqiFI1VPqX5XWjS43NlssIomTSUmlPB/
	YzBAYkkGd7jNM4hzLRV0VQPc4NqEvKrmVeMJvRhvEd7pNJPUr46aRYFfrAVDc4rPqw==
X-Gm-Gg: ASbGncsxknF6pl33Aa89ePrfz+q2pmj2tTYAXAEI2JMWBQnRpR9OaDW41lf4HwNH5YR
	YnD4ClddT4+hosP9m+VurJQVF/EMqHwjtdilU/2eNdmQd4dDSgnAkgKfvU0pd0PzQ6qnQDRnTXk
	K3tA6dJChxl25jQumTpImbjRHtYvWbSzNJNVP5diVy5bfCW2P285tT6z0cnygmfSah8RFFS2nn+
	0+0Cptm++kLU82hP9yAfAl1NZV3MBUiJVPLX/uPn0ejbsTLmWG87WDE3Qu9ATPwRg9fZeIdNNnb
	r2qjmPi15mU/TIMJpZ4Mrkb5VEGIAYshLQyS4RzTfA5tgCNZUPRsF5HAOfcwGpd0gPvvi7loHlJ
	04nugEOaHTDv91qNAo/m1+Pon3LpkuhVsvuA0o9wGFW48X7c3Yg3zG6Z+VwjoNt3n9jjMmcISRt
	lpyw==
X-Google-Smtp-Source: AGHT+IG06381e/XP3pvYOmH/KQ/Oit/WV10yQDnuk2mTQyO3rjInyzCk9SnbTz/7ZYm0a3ZsMWLAiw==
X-Received: by 2002:a05:6512:3f25:b0:553:2dce:3aad with SMTP id 2adb3069b0e04-55a2958fc26mr503739e87.7.1752739006659;
        Thu, 17 Jul 2025 00:56:46 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bbb21sm2946272e87.31.2025.07.17.00.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 00:56:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 17 Jul 2025 07:56:45 +0000
Subject: [PATCH] media: uvcvideo: Drop stream->mutex
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-uvc-onelocksless-v1-1-91a1b834186a@chromium.org>
X-B4-Tracking: v=1; b=H4sIALyseGgC/x3MTQqAIBBA4avIrBM00H6uEi3KphoSDYckiO6et
 PwW7z3AmAgZevFAwkxMMRToSoDbp7ChpKUYalUb1Wgrr+xkDOijO9gjs5yttaZFpde2g5KdCVe
 6/+Uwvu8HbzXi5mIAAAA=
X-Change-ID: 20250716-uvc-onelocksless-b66658e01f89
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Since commit c93d73c9c2cf ("media: uvcvideo: Use vb2 ioctl and fop
helpers"), the IOCTLs are serialized. Due to this there is no more need
to protect ctrl, cur_format or cur_frame from concurrent access.

Drop stream->mutex after thanking it for years of good service.

Use this opportunity to do fix some CodeStyle.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c   |  4 ----
 drivers/media/usb/uvc/uvc_metadata.c |  8 ++------
 drivers/media/usb/uvc/uvc_v4l2.c     | 39 ++++++++----------------------------
 drivers/media/usb/uvc/uvcvideo.h     |  6 ------
 4 files changed, 10 insertions(+), 47 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 775bede0d93d9b3e5391914aa395326d3de6a3b1..3039e6a533b82dd917050d416c9ced8756d69170 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -183,8 +183,6 @@ static void uvc_stream_delete(struct uvc_streaming *stream)
 	if (stream->async_wq)
 		destroy_workqueue(stream->async_wq);
 
-	mutex_destroy(&stream->mutex);
-
 	usb_put_intf(stream->intf);
 
 	kfree(stream->formats);
@@ -201,8 +199,6 @@ static struct uvc_streaming *uvc_stream_new(struct uvc_device *dev,
 	if (stream == NULL)
 		return NULL;
 
-	mutex_init(&stream->mutex);
-
 	stream->dev = dev;
 	stream->intf = usb_get_intf(intf);
 	stream->intfnum = intf->cur_altsetting->desc.bInterfaceNumber;
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 229e08ff323eed9129d835b24ea2e8085bb713b8..d1d4fade634bd3f8b12bbaa75388db42aecc25ea 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -100,14 +100,10 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
 	 * Metadata buffers would still be perfectly parseable, but it's more
 	 * consistent and cleaner to disallow that.
 	 */
-	mutex_lock(&stream->mutex);
-
 	if (vb2_is_busy(&stream->meta.queue.queue))
-		ret = -EBUSY;
-	else
-		stream->meta.format = fmt->dataformat;
+		return -EBUSY;
 
-	mutex_unlock(&stream->mutex);
+	stream->meta.format = fmt->dataformat;
 
 	return ret;
 }
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 160f9cf6e6dbdbf39e3eff56a5d5ea1d977fbe22..d7be4d59f0c73b983aa01321f4acc8f8bf6e83ef 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -329,14 +329,12 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	 * developers test their webcams with the Linux driver as well as with
 	 * the Windows driver).
 	 */
-	mutex_lock(&stream->mutex);
 	if (stream->dev->quirks & UVC_QUIRK_PROBE_EXTRAFIELDS)
 		probe->dwMaxVideoFrameSize =
 			stream->ctrl.dwMaxVideoFrameSize;
 
 	/* Probe the device. */
 	ret = uvc_probe_video(stream, probe);
-	mutex_unlock(&stream->mutex);
 	if (ret < 0)
 		return ret;
 
@@ -395,19 +393,15 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
 	struct uvc_streaming *stream = handle->stream;
 	const struct uvc_format *format;
 	const struct uvc_frame *frame;
-	int ret = 0;
 
 	if (fmt->type != stream->type)
 		return -EINVAL;
 
-	mutex_lock(&stream->mutex);
 	format = stream->cur_format;
 	frame = stream->cur_frame;
 
-	if (format == NULL || frame == NULL) {
-		ret = -EINVAL;
-		goto done;
-	}
+	if (!format || !frame)
+		return -EINVAL;
 
 	fmt->fmt.pix.pixelformat = format->fcc;
 	fmt->fmt.pix.width = frame->wWidth;
@@ -419,9 +413,7 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
 	fmt->fmt.pix.xfer_func = format->xfer_func;
 	fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
 
-done:
-	mutex_unlock(&stream->mutex);
-	return ret;
+	return 0;
 }
 
 static int uvc_ioctl_s_fmt(struct file *file, void *fh,
@@ -441,19 +433,14 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
 	if (ret < 0)
 		return ret;
 
-	mutex_lock(&stream->mutex);
-	if (vb2_is_busy(&stream->queue.queue)) {
-		ret = -EBUSY;
-		goto done;
-	}
+	if (vb2_is_busy(&stream->queue.queue))
+		return -EBUSY;
 
 	stream->ctrl = probe;
 	stream->cur_format = format;
 	stream->cur_frame = frame;
 
-done:
-	mutex_unlock(&stream->mutex);
-	return ret;
+	return 0;
 }
 
 static int uvc_ioctl_g_parm(struct file *file, void *fh,
@@ -466,9 +453,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
 	if (parm->type != stream->type)
 		return -EINVAL;
 
-	mutex_lock(&stream->mutex);
 	numerator = stream->ctrl.dwFrameInterval;
-	mutex_unlock(&stream->mutex);
 
 	denominator = 10000000;
 	v4l2_simplify_fraction(&numerator, &denominator, 8, 333);
@@ -519,12 +504,9 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
 	uvc_dbg(stream->dev, FORMAT, "Setting frame interval to %u/%u (%u)\n",
 		timeperframe.numerator, timeperframe.denominator, interval);
 
-	mutex_lock(&stream->mutex);
 
-	if (uvc_queue_streaming(&stream->queue)) {
-		mutex_unlock(&stream->mutex);
+	if (uvc_queue_streaming(&stream->queue))
 		return -EBUSY;
-	}
 
 	format = stream->cur_format;
 	frame = stream->cur_frame;
@@ -556,14 +538,11 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
 
 	/* Probe the device with the new settings. */
 	ret = uvc_probe_video(stream, &probe);
-	if (ret < 0) {
-		mutex_unlock(&stream->mutex);
+	if (ret < 0)
 		return ret;
-	}
 
 	stream->ctrl = probe;
 	stream->cur_frame = frame;
-	mutex_unlock(&stream->mutex);
 
 	/* Return the actual frame period. */
 	timeperframe.numerator = probe.dwFrameInterval;
@@ -941,10 +920,8 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
 
 	sel->r.left = 0;
 	sel->r.top = 0;
-	mutex_lock(&stream->mutex);
 	sel->r.width = stream->cur_frame->wWidth;
 	sel->r.height = stream->cur_frame->wHeight;
-	mutex_unlock(&stream->mutex);
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 757254fc4fe930ae61c9d0425f04d4cd074a617e..86765b9d7935f0888476249c3fb826cd7f36b35c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -469,12 +469,6 @@ struct uvc_streaming {
 	const struct uvc_format *cur_format;
 	const struct uvc_frame *cur_frame;
 
-	/*
-	 * Protect access to ctrl, cur_format, cur_frame and hardware video
-	 * probe control.
-	 */
-	struct mutex mutex;
-
 	/* Buffers queue. */
 	unsigned int frozen : 1;
 	struct uvc_video_queue queue;

---
base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
change-id: 20250716-uvc-onelocksless-b66658e01f89

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


