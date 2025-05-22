Return-Path: <linux-media+bounces-33193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7664AC12EE
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 20:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B8771BA0F6E
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 18:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62EC29ACCF;
	Thu, 22 May 2025 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m7Zo6JR5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384FA15F306
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 17:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936733; cv=none; b=QtyXdleSpQ7v+HBRcs+umiscUredP7UzERpvrh4KBQqZugKU8npqQK15akod4xs0FblNau8AMGl+PKAEcmZFYjCXECcTSv+RNrdnBS3Gt9VR4W+8JYpXaZCZsQvSA5CUA1mYP4mz4Kjh5ALAf8oy2uMX1rKQRYaTWY7jVfQccQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936733; c=relaxed/simple;
	bh=bydw5Ui1Tm31HV00k8hjsx9u+m7wpL+0gQpn2hpNiaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rtgcof5Ac73KrcX9MtVZIWc0UXAzLEMxi9khGLWW25wSFOFmLAub7a/VV/+mbnmyS6Xh9tbJhN84ET8Ya+Xi4KboxV3OEhlZnciBq3WW9bKtpzf0A4sbk2jCrV5IQXczo55DlOO2Xcsn7pjsfaNike4jhramDToi110p5F5fYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m7Zo6JR5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-551eb17123cso7887422e87.1
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747936729; x=1748541529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2ietCEWaMSFLfYqQUoQI2jJOy0qZzPyzPT/ShmHYYA=;
        b=m7Zo6JR5wnDeVYbQYBslCHS/SZ/rlaHxWQ4Irk04m5KnDD1nRRasEMQVUN0C70A8o2
         rdp8bFLlCnI907fjAX+zUP6RLskaSp9SARmEZlwO5tyDggOIbWzVTsBUWi261AO2NB7z
         rYfKP3uAqMgykqrBVPDkuhkOQ8+MFd+TC4Tlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936729; x=1748541529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2ietCEWaMSFLfYqQUoQI2jJOy0qZzPyzPT/ShmHYYA=;
        b=sBFmvc1hR87iTMNTWSHS4R4YgKWWbgZEsOmXXtH1w2LNa/AAEFT3D3PyWklYb1zaWl
         2lwmH+HqMDGFGq1m2UQedPgncteOE+sRgq9a+QrqxHF65bN+xy2SHImShjHjfLwBoREN
         j06gTTLY0XCVyLx0hl2aUGhMPziVh+IEwPc6AHo0W/dBIVR2JKmRNUh/n7j0LUTVPMaO
         21y82CLvqXg+kheLCt4v0xFAuw7y6VAAy8z9w1WAnETBSXBkkfGimUxnwFY3fPfqzt48
         3AIhdJqK6ekjJqvxyswnoOjm7ic6u8aa/+GC8JzKHA/2PEKx3Jo5uyeCzOBND0YkAxpC
         2SJw==
X-Gm-Message-State: AOJu0YzeHFDFg0u2GYUWAZyrvWOeDKbM0fKQ0GU5q7PUHVU9Fv1pUgaS
	mgooulCgDezIGojc4H63MMQxRJE9FVBJNf4Ppl9rGxfqall3juHVmCqWfWXGMJwneQ==
X-Gm-Gg: ASbGncsf76ps621GTwzl5YL8tnoJfpz5Q10hQCNx0yN77rGWIQb20y2XNzFcWzOqfLH
	HcMweV1FJ9jXMvivg0CGBPYrymvqbjvauH4ijgbcfszTFrDkqlI/cBvrNRNOlb82qyhqc0/zftM
	pA1/6hK0HylWFR9LwS6VsVkYLaDamVkbYc7cDhuoglg6u55rh547wVhj2KGhDu7bxMIMSsh6xNt
	8beqwqFDLJ9BFa7GoEkiQaEofPIZ3QeqH0zZiiA5PVP1ZwffYJpC+w+35UMkBBDDYaHg+4UJ2Zv
	uqUXqayyNbx6j1Yqqov+GBkPJQqpg7nB1MVO5yPWsLMjOp+znj6JwpF6wZNJALDqEIvpayY/2NK
	h91Dz/HQMKqxQSx+746Wpj+2cr8YYj8LKZCIN
X-Google-Smtp-Source: AGHT+IFQHiACQws5UAdZS7de+bdyVNoxTk6zhZQaW3UjcwLI08Kw75LBltk94ixJi/18ILaVsZ5dGw==
X-Received: by 2002:a05:6512:3f27:b0:551:f76c:59fb with SMTP id 2adb3069b0e04-551f76c5c68mr5405231e87.40.1747936729292;
        Thu, 22 May 2025 10:58:49 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703e858sm3483992e87.227.2025.05.22.10.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:58:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 22 May 2025 17:58:48 +0000
Subject: [PATCH 3/3] media: uvcvideo: Remove stream->is_streaming field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-uvc-fop-v1-3-3bfe7a00f31d@chromium.org>
References: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
In-Reply-To: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The is_streaming field is used by modular PM to know if the device is
currently streaming or not.

With the transition to vb2 and fop helpers, we can use vb2 functions for
the same functionality.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 12 +++++-------
 drivers/media/usb/uvc/uvcvideo.h |  1 -
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 7a5ecbefa32c0a6b74c85d7f77a25b433598471e..51419f443f2c43dfd17a9782352bd2cde1094732 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -617,7 +617,8 @@ static int uvc_v4l2_release(struct file *file)
 
 	uvc_ctrl_cleanup_fh(handle);
 
-	if (handle->is_streaming)
+	if (stream->queue.queue.owner == file->private_data &&
+	    uvc_queue_streaming(&stream->queue))
 		uvc_pm_put(stream->dev);
 
 	/* Release the file handle. */
@@ -684,7 +685,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	struct uvc_streaming *stream = handle->stream;
 	int ret;
 
-	if (handle->is_streaming)
+	if (uvc_queue_streaming(&stream->queue))
 		return 0;
 
 	ret = uvc_pm_get(stream->dev);
@@ -697,8 +698,6 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 		return ret;
 	}
 
-	handle->is_streaming = true;
-
 	return 0;
 }
 
@@ -707,16 +706,15 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 {
 	struct uvc_fh *handle = fh;
 	struct uvc_streaming *stream = handle->stream;
+	bool was_streaming = uvc_queue_streaming(&stream->queue);
 	int ret;
 
 	ret = vb2_ioctl_streamoff(file, fh, type);
 	if (ret)
 		return ret;
 
-	if (handle->is_streaming) {
-		handle->is_streaming = false;
+	if (was_streaming)
 		uvc_pm_put(stream->dev);
-	}
 
 	return 0;
 }
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
2.49.0.1151.ga128411c76-goog


