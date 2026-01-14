Return-Path: <linux-media+bounces-50681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F7FD1E1B8
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 11:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 700193062152
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E3E38FF0C;
	Wed, 14 Jan 2026 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HINSe01x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DA038BDA0
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386752; cv=none; b=nIy9UTtLX/5sbosLOOHQopiGJ2PMkvyv+0xXVjYDx3Cg3oKnP2ZZmmCT8iN7VHqMP+kUDQuWudR/j4dxwTgz9OMRG4ZhfinLvsYHEPemmTxqwc5c3Vj6UAdgFVyOKd6tf91NOLDcYZpccCejV+nAPCLeSrLYk11qfqfuqHWuek8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386752; c=relaxed/simple;
	bh=fLDCCM5+VCZGP7XXhipvWTv4MC0kLaeDD1P3yoqPOXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UiwcJFRiWzbhYqGpg03I0/hBGciCnHv/mn8CZJrSp/w1suf2YXSll+a0lzx9Vuubig8hfi42cWTnWA9o4BgcpFopn4WlFDmZJSN88fHXyowIb0MdV+7tgjykfde62nODpYQI7tqDRyXe8j3AZ9DDiUtmq6xsHtT51/WHIsMLEWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HINSe01x; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-59b855a4700so3353969e87.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 02:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768386744; x=1768991544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hiAWrXH6x8EcXbUPmtbuPYc6WD9v4tNKnw7z9A4t3d0=;
        b=HINSe01xosE8PcxbLvhfhZ9sSg53ycT3mscygecOm1/ox5gsDU9fI3WjMp4EcATFWG
         3gYYUKDzrIgvOHsxwXhkthTNWRuocmXHuXQcyAFtWJwwln+Ssufv9rs0IDu1fZMA6Ofd
         u3o+mOryX0CXImuF8jLJaYwWCZTMDYQ02K3wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386744; x=1768991544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hiAWrXH6x8EcXbUPmtbuPYc6WD9v4tNKnw7z9A4t3d0=;
        b=V4XC0a3meYAtSKsTN5vuTcGpHWzFMHN6b/1srfzt6Qpatb2j5rXiAFfOMl2eC9G2gd
         BWDYBWoZbXdKQo1qhvoUrlWt++C9eZMWKBQ0E3szm5BVDEOOenfvs+ZiBCz4Zgw9GL4m
         0T7i3E5CgdjkjOzjOCEG04guWPEgJQNmsxRK9xseiTexDaPZflfCQ54DufMmqJsyY/hu
         PfEuZSjFEiu36FQ8mIqcTqgWA2nJhMbmYztXo/8FLdGclZfmntF6RygpxAv7yXolzzsr
         adECAZgZTqq/3yFYwGTnRPZaoJNh+osRq89HD/7rdyWoNzO0TvxzpwlBrKaTZk2xDM/E
         8vag==
X-Forwarded-Encrypted: i=1; AJvYcCWe7F2gIYi28xktM2WpJLXkDqx94FYr9XaIF+MlruM7w58NXciKH0ksf5MNheUlhZ/8i2WzfGIOaIkq4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaZknUQB9R13/3aDu8q58LgF7f7nmJ09Z8MuvDMTpGnXLZ0xyZ
	hVoTZcdoELN8YwJSP9xOpypGtLKNbA6tVk3FUl4UZRCIk51H9AZzCUY6kR6ADhXbUQ==
X-Gm-Gg: AY/fxX7SIzRrDlMHm0R4fDjeR4RarIcXx/2cuEP/mOZdfnoQAFq6Bl5zZ5gcHcQLcEH
	HS7pIsJSg4QI2/4P9v2nB9NC533Zic/Ui4nOtcmv6/dr4+2jikQd54R3sASaPdd8XCD4+TSNpu3
	kxQRfrhd567yPjWwPEB4BOinU0h/xQSbtxjgBaGt60QMIeQfmRzUzW2vhBguWEMeX8MMvHjtmP2
	eEhORDecTsL6fcnVsLPAapmLei000NS0pUL8WzTejNJS3CcVX5tqnBJeorVQEmc8KLMZlvIa/3n
	sNUIPb4FFaNK9r4TaIxlw3BLE1rrpaY3PvbOalHkRipM7ysZSzIz9SFZ1GrxegPzNV9KnlEezdY
	KxmXVtSAaZgEp/zEdpzMLj1t7awJmvzMaDRP4f6fqbylK9qTcekI0tU29ujHxynjK2M/rM3Z3t8
	8iZOLUcQgEKVKs8kxpveNpz3Zx+HOp1zu6pzsrsUciLAZfkAKrpUiuBG9mM6M1vde0FT4rOQ==
X-Received: by 2002:a05:6512:10cd:b0:57a:2be1:d779 with SMTP id 2adb3069b0e04-59ba15502b6mr638673e87.31.1768386743782;
        Wed, 14 Jan 2026 02:32:23 -0800 (PST)
Received: from ribalda.c.googlers.com (181.105.228.35.bc.googleusercontent.com. [35.228.105.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba10411e5sm573981e87.61.2026.01.14.02.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:32:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Jan 2026 10:32:14 +0000
Subject: [PATCH 2/3] media: uvcvideo: Pass allocation size directly to
 uvc_alloc_urb_buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-uvc-alloc-urb-v1-2-cedf3fb66711@chromium.org>
References: <20260114-uvc-alloc-urb-v1-0-cedf3fb66711@chromium.org>
In-Reply-To: <20260114-uvc-alloc-urb-v1-0-cedf3fb66711@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: Laurent Pinchart <laurent.pinchart@skynet.be>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The uvc_alloc_urb_buffer() function implicitly depended on the
stream->urb_size field, which was set by its caller,
uvc_alloc_urb_buffers(). This implicit data flow makes the code harder
to follow.

More importantly, stream->urb_size was updated within the allocation
loop before the allocation was confirmed to be successful. If the
allocation failed, the stream object would be left with a urb_size that
doesn't correspond to valid, allocated URB buffers.

Refactor uvc_alloc_urb_buffer() to accept the buffer size as an explicit
argument. This makes the function's dependencies clear and improves the
robustness of the error handling path. The stream->urb_size is now set only
after a complete and successful allocation.

This is a pure refactoring and introduces no functional changes.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index ec76595f3c4be0f49b798ec663d6855d78ab21c4..59eb95a4b70c05b1a12986e908b7e9979b064fd0 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1771,12 +1771,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 }
 
 static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
-				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
+				 struct uvc_urb *uvc_urb, unsigned int size,
+				 gfp_t gfp_flags)
 {
 	struct usb_device *udev = stream->dev->udev;
 
-	uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
-						gfp_flags, &uvc_urb->dma,
+	uvc_urb->buffer = usb_alloc_noncoherent(udev, size, gfp_flags,
+						&uvc_urb->dma,
 						uvc_stream_dir(stream),
 						&uvc_urb->sgt);
 	return !!uvc_urb->buffer;
@@ -1813,12 +1814,13 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 
 	/* Retry allocations until one succeed. */
 	for (; npackets > 0; npackets /= 2) {
-		stream->urb_size = psize * npackets;
+		unsigned int urb_size = psize * npackets;
 
 		for (i = 0; i < UVC_URBS; ++i) {
 			struct uvc_urb *uvc_urb = &stream->uvc_urb[i];
 
-			if (!uvc_alloc_urb_buffer(stream, uvc_urb, gfp_flags)) {
+			if (!uvc_alloc_urb_buffer(stream, uvc_urb, urb_size,
+						  gfp_flags)) {
 				uvc_free_urb_buffers(stream);
 				break;
 			}
@@ -1830,6 +1832,7 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 			uvc_dbg(stream->dev, VIDEO,
 				"Allocated %u URB buffers of %ux%u bytes each\n",
 				UVC_URBS, npackets, psize);
+			stream->urb_size = urb_size;
 			return npackets;
 		}
 	}
@@ -1837,7 +1840,6 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 	uvc_dbg(stream->dev, VIDEO,
 		"Failed to allocate URB buffers (%u bytes per packet)\n",
 		psize);
-	stream->urb_size = 0;
 	return 0;
 }
 

-- 
2.52.0.457.g6b5491de43-goog


