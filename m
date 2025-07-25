Return-Path: <linux-media+bounces-38474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4009BB11F34
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 15:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E47D0AA03A5
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B901E2ED87C;
	Fri, 25 Jul 2025 13:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A8mu3jBa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBE02ECD25
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753449175; cv=none; b=VgJ1DAQgYU1MeAGFpcmqiZsIV+kXQ8X+x8n/pm+IMNJo4b+nNF6X//sQ3g5vFNRzyfZrtxEEzCT6iMxsCOF5EXmnmoy1qYAEmpQbbFAHs6BBk2lI7g+yGCVaunkAwUz2qEYB79ORXxDMrJUOchdCfZyf867uFlMlc/fJiGXfOfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753449175; c=relaxed/simple;
	bh=B+hipYnmnKVQBVxDpHzSUj0j8nDqCDlRm1GoUy4uCGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNfqXlfq/nmLkSVjrOhmaOuCcTNkuh8Huq8dbzJZBWgawWBHdNfFJoJxiahGucvfnuvNdtooRRnjNcSoncpe44NyJQyuEyGVFy4wPb+WVsjkpV4w+mgnzDN4wLASpIxSXTtD6DDKxWxhOP3TaD2ICXZcr/v8z2JixbXap2H/lIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A8mu3jBa; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55a10c74f31so2271016e87.1
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 06:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753449170; x=1754053970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucF/oLOA4TbqpydmTqdjEQZnajk7+aaLS8yv4iP8hbc=;
        b=A8mu3jBaDUv1IPKuQgNESAdD3hNbQAXaTC/352WpL6h+1rAPbNvIQbPGnUTm5P0Rp6
         uyTTL+Xc1LveZkIdMMS8YTRO6FOwpbnj1vDQwyrMnsO48FxLVRv9+LwFAc3wNzGmPAht
         9Jzu73zIDSdg1HNi8CnXNzDAIg6zcDTY5im0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753449170; x=1754053970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucF/oLOA4TbqpydmTqdjEQZnajk7+aaLS8yv4iP8hbc=;
        b=rAEoyPeBFRdrE6ZIVU0FoZ4iUwOLYJfuxgOoxv6URs155IMPS3dO0aNm0uJ7j8uLPr
         2pSwmPb6/HLWKsJApW2uyHO42wxc/7Rl1/SrF0YDoyYmVK3sAVjwAweDk0ZQl0hugpeU
         x8tqiBzR+rn08GnuVhvxGQUY/qANZ8UzRRdz8zxUEEqacXupt/aQdj5RSjx1qFdZv51Z
         RdoNyXv4ohwbSe6D98g4oAtVHnS/Hg+2Suo/yGs5x3AvgkG6OWtax9c2EG8qnqnuO3SX
         lZ3lv61DvIPbtgCSYyuenb0owrSAcrcEe8O1ok6/4nXjLZkYigqnLOw0yrUEGWTCz7J1
         PQWw==
X-Gm-Message-State: AOJu0Ywajo6FcYdMupnFp2znPl9Hms8UbT7jkhuNBxdc3pevNVjoAPjs
	tknhH4S9DAv/IvfEC1UGCUAJS9s1xvozQgzxo66Kovm0ptO62zeIMf57ZtbDofNx8cT2hq5sy+X
	wWcg=
X-Gm-Gg: ASbGncthIjanNyYdtl+q0zo08zwv2C66CD60uTNyEbPueTOVZdrNrwgwGLtsokzF9u+
	JZY18tlHtYR1F0t6z3brY03VoTbixZlvY4idAo3LM7T2I3WSr4GaMM8fVJcBRu87qKJ4KIQwxoL
	2IjtP1ZVAcELPmp6Swgf9PcOYU/eLpzJzOY4CfBeFll/Gkj62vb0i7xsQ1ilnxDM2c+j1y+EJLM
	dbgRzitzEzWdrV5DNlgZerApa2GgffzF7UTI3J4Po49b9/VAjyleOKzX/8T5vnOWgMJ4acUquYx
	fHxBIpsY2pobZGRXZfDqVAvlmNi4IrmaNKIqujq+gSl567qRjhrzItmZP+A2zG+vJmFOa2louaw
	yffvc30/eqmnPElgEZXwRupJFw/XOrARiBi/Wo0F0Rdh4IDUwbABqn8LlQS9oRUxTAAIoI5yIhd
	nNOA==
X-Google-Smtp-Source: AGHT+IGAJSFi+klKs5Qg3NJdNJj8fasBOknOi2sEOpQUzaojuEKAaiJjGDxRSVN36h4PsAqmyofISA==
X-Received: by 2002:a05:6512:23a2:b0:55a:4e0b:54bb with SMTP id 2adb3069b0e04-55b5f45b638mr574961e87.16.1753449170368;
        Fri, 25 Jul 2025 06:12:50 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53c712d3sm934605e87.118.2025.07.25.06.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 06:12:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 25 Jul 2025 13:12:48 +0000
Subject: [PATCH v2 1/2] media: uvcvideo: Drop stream->mutex
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250725-uvc-onelocksless-v2-1-953477834929@chromium.org>
References: <20250725-uvc-onelocksless-v2-0-953477834929@chromium.org>
In-Reply-To: <20250725-uvc-onelocksless-v2-0-953477834929@chromium.org>
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
 drivers/media/usb/uvc/uvc_metadata.c | 10 +++------
 drivers/media/usb/uvc/uvc_v4l2.c     | 41 +++++++-----------------------------
 drivers/media/usb/uvc/uvcvideo.h     |  6 ------
 4 files changed, 11 insertions(+), 50 deletions(-)

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
index 229e08ff323eed9129d835b24ea2e8085bb713b8..649844e2ad60ed9e9951daec871f2000f48702a6 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -100,16 +100,12 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
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
 
-	return ret;
+	return 0;
 }
 
 static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 160f9cf6e6dbdbf39e3eff56a5d5ea1d977fbe22..fdc4520a7bb42af7cd5cb9c1fa49957c31e0041c 100644
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
@@ -466,10 +453,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
 	if (parm->type != stream->type)
 		return -EINVAL;
 
-	mutex_lock(&stream->mutex);
 	numerator = stream->ctrl.dwFrameInterval;
-	mutex_unlock(&stream->mutex);
-
 	denominator = 10000000;
 	v4l2_simplify_fraction(&numerator, &denominator, 8, 333);
 
@@ -519,12 +503,8 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
 	uvc_dbg(stream->dev, FORMAT, "Setting frame interval to %u/%u (%u)\n",
 		timeperframe.numerator, timeperframe.denominator, interval);
 
-	mutex_lock(&stream->mutex);
-
-	if (uvc_queue_streaming(&stream->queue)) {
-		mutex_unlock(&stream->mutex);
+	if (uvc_queue_streaming(&stream->queue))
 		return -EBUSY;
-	}
 
 	format = stream->cur_format;
 	frame = stream->cur_frame;
@@ -556,14 +536,11 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
 
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
@@ -941,10 +918,8 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
 
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

-- 
2.50.1.470.g6ba607880d-goog


