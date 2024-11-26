Return-Path: <linux-media+bounces-22097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3679D9BA8
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CE80B2F556
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7318C1D88C4;
	Tue, 26 Nov 2024 16:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SMqT6XFK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDFF1D9346
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 16:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732638030; cv=none; b=TV8YIHf1QIAqRGUKI1CGSZP9hsdbupkVivC2ynn67rxIE0y3Ts1UjCx7doz/Lsf8G/Qw1xT5czvXtFg+XM4e977r6bIsX8NuQrehgbrNK33eDfoH7qZPen6cnj38j6l7di5diKBlMNbnDyiI/wffNjdlHBekawHAfdeuPB1wQMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732638030; c=relaxed/simple;
	bh=+QRDEeTl7+1Tb8QYvDBOC4J4A2Fgnf7J9axjy/zTuzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YbcwzXzne70Wo7hwT8nie3om4cT6ZB1+oivrMKL3Ghpi0mA9mzNvFFSRR9Fa2d+/yuk38HfXE/PwaD7UgZvrHo+yYdN1axlK3DEtgfsbB8Ws6BT+awYmO1b4Rf8nYRf8Gd/CiHjwRnA/xw4+lwHkJ9kP5+F6wSRrnk5P2E4ey3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SMqT6XFK; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-29685066b8dso3294972fac.1
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 08:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732638027; x=1733242827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Ec+aWUlYjfVkeFGABKzygP7a2zM71aZZNNdskYbc+0=;
        b=SMqT6XFKwwx794539RRBfMKLXbV11L7MVNP7bWUF5I7VzK0PNRKuMvfe7a1x5jfgYg
         /2I1hMC9l/GPsru1DjVWWMXayn9szsU3SKOLa2hGzrVIgTrN/21E9cOEwV+3nxAe8cfu
         d52t5c7Hn90hzeiYgqW/3e4fbpmBMcwagokxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638027; x=1733242827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ec+aWUlYjfVkeFGABKzygP7a2zM71aZZNNdskYbc+0=;
        b=P1tSN6M+pZD5jgI62bSDBpaoAWHHELf4rOPMjMjX2uyFUFr4fuwf90eVxgBK4khr91
         QKEb59EyXnDQMCZAMyox+q7tNFTg04yDN2BsAdBo6aXZetrL6OY4oDzNZkcPWbiGcJAg
         VOzqfLbLaSjlRW0yIsgsg7kqdhJM+sWI9W3KjW2y19K34LkiR/DC7CVvXdySsvEJy/IZ
         H7ifUgMubMtiMBxasFeA5SCfabOJ/pLtozciQjhAZvpLFrYxoWk+hy4TD2+qBp9mTEPR
         X9YwkpNTQZbX0Te7gwS1jHbY6I1jzGOKxONLXq3lYA2feFzObju1a2EJZoPaVe6ctazq
         OlOg==
X-Gm-Message-State: AOJu0YxfqDQD1+bYP05ISUsp7boONdJJxja2cq3seWpU5OSmdH9No8dK
	daEQHYNQ91hx/TERSrvz4xxwi5uEP9V79MtkeU5WwAR2rrB03zLmb2snbfBplg==
X-Gm-Gg: ASbGncs9h1JJWO8FWvBgil9NOSjpkpLFiBXmul2egQVDxI8x9GNT1iKo9IWmAu2kgOg
	1Axrv5xaJxDZKPFz92WXU3ZCvWBjIWcqnO9ZIxTwOYx6bHUpnYOLVPj8dQ9wGUYksmqqz94wORT
	ph/qG0oY8mtaeX0xRqDmsSLqmtaslGUB1cFAb7agkIOJIH8hkBS6PreRC0leoktf8r1GsCCx3dX
	tpE6wP7K7zpOk7Xf8O5cPUwizSPKNexUGPTvhiM3/vbxem4VJw+nYYkgo0A+GxB2EBDibBq4EOJ
	ZMZmOVyWDOMLA4irBj4Kvm6s
X-Google-Smtp-Source: AGHT+IGTu9xdPCRBJlFbRHegd6Xyp4UDrX/YIXUIDxaC3+Jb94GTMDjckF9lM49VwilT9480EVlfVg==
X-Received: by 2002:a05:6358:d386:b0:1ca:90da:3c1e with SMTP id e5c5f4694b2df-1ca90da3ce2mr516421655d.19.1732638027057;
        Tue, 26 Nov 2024 08:20:27 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b4e8205fdsm346532241.1.2024.11.26.08.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 08:20:26 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 Nov 2024 16:18:53 +0000
Subject: [PATCH 3/9] media: uvcvideo: Keep streaming state in the file
 handle
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-uvc-granpower-ng-v1-3-6312bf26549c@chromium.org>
References: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
In-Reply-To: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Add a variable in the file handle state to figure out if a camera is in
the streaming state or not.
This variable will be used in the future for power management policies.

Now that we are at it, make use of guards to simplify the code.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 15 +++++++++++----
 drivers/media/usb/uvc/uvcvideo.h |  1 +
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index b425306a3b8c..712a531e52f9 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -888,11 +888,17 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
-	mutex_lock(&stream->mutex);
+	guard(mutex)(&stream->mutex);
+
+	if (handle->is_streaming)
+		return 0;
+
 	ret = uvc_queue_streamon(&stream->queue, type);
-	mutex_unlock(&stream->mutex);
+	if (!ret)
+		handle->is_streaming = true;
 
 	return ret;
+
 }
 
 static int uvc_ioctl_streamoff(struct file *file, void *fh,
@@ -904,9 +910,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
-	mutex_lock(&stream->mutex);
+	guard(mutex)(&stream->mutex);
+
 	uvc_queue_streamoff(&stream->queue, type);
-	mutex_unlock(&stream->mutex);
+	handle->is_streaming = false;
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 2f8a9c48e32a..b63194a9c64e 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -613,6 +613,7 @@ struct uvc_fh {
 	struct uvc_streaming *stream;
 	enum uvc_handle_state state;
 	unsigned int pending_async_ctrls; /* Protected by ctrl_mutex. */
+	bool is_streaming;
 };
 
 struct uvc_driver {

-- 
2.47.0.338.g60cca15819-goog


