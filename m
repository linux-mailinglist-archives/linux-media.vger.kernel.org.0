Return-Path: <linux-media+bounces-7676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F202887820
	for <lists+linux-media@lfdr.de>; Sat, 23 Mar 2024 11:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0EE91C20DCF
	for <lists+linux-media@lfdr.de>; Sat, 23 Mar 2024 10:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1382541760;
	Sat, 23 Mar 2024 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VC4GNxlr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05FB3B299
	for <linux-media@vger.kernel.org>; Sat, 23 Mar 2024 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711190892; cv=none; b=RhZdynb8MdR/wRH9q20BTWcPZTJmXfzmwG8v0n+PeIhYVVpzOFu9WB5iFq6ROxc6gFDXutCFgQiwN5IigXNxChsYMucpblL3c1/r5AaQQUpSLpyFjFucxyyu2Bkj2D1WczdjJV3kr7tfWVzQ2gEUVajQI1LdANggNF3lTredlnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711190892; c=relaxed/simple;
	bh=qFTxOQkBGu9erbw71YEZSqEyF/rK12RNgQVEwIyXB/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+fuEVjWiCwRDSqlC3dS4G0Z2riMIMM3anHwZjgDkJ1/jt4eZoSokLkL/UKG6KHsfay8UuPi3ZUZmE4do1bSn3n+X1g3qPj4PpLzJ6HMsqTCWJCVgKN+GzucNyT+47CEJPD2YEbmdg4A7UY8WgVuzA9cyi3IBLrG9wDU/ZJF/+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VC4GNxlr; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-430a7497700so21877131cf.1
        for <linux-media@vger.kernel.org>; Sat, 23 Mar 2024 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711190890; x=1711795690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncSdPhx1Hg75PAaBeJCqYSddm8JVUZkcLxF1tdAmwuI=;
        b=VC4GNxlrYy+DRkDj/pEx9XhsjjGXj26lf0ecxa60BL5swAlC0OCYI9GS3QjGVcu32N
         mXDCQ+ylosV7iX9C+tB3wcPAq0YzRsJrz2v9sHZ/W2QQtgpWeY0SzXTVtghx3PBb8RLr
         ACgcnaSFiHv2kne0bVhbFaUZPV7mlGyc6AaRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711190890; x=1711795690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncSdPhx1Hg75PAaBeJCqYSddm8JVUZkcLxF1tdAmwuI=;
        b=mTLzCo+WT3FAdjmB77xJIFczV++0IAghEQ6y8KF33jvTxJzkYeezOwbuzwcO6mA7R2
         tQjfLfkMsTwzR2yFp+EP9ZRbJY8ly3BAwb6xoy5BSYRgrpKJybf4g38umkjQIvrE7R/R
         4uugKwL8636AOd9Gf8iwqP/4wq8x7R6KEDYS/BVltpipiiii84kCVJc3sqc3CiFvPrAH
         tr1yOTw41O3BeogDK0JUFiW2fP/AxHuMBjh2sNc9e0XS4LKYbleW4TmtlKQTs3VYQ/EX
         y/vLpA6EsHIQ2Z32F1wkZcT/1ws5VKg6WSEyphq8EtfX/ZRv1KHKVZZ1ZSRRDZhTB4vH
         dPzg==
X-Gm-Message-State: AOJu0YxrFdUykJ0ADVekZNkVVjzbT1PKnKLdDMxzkW682X3A8RonTznN
	fER6sYKSz+rZj/4YRrh8da4dnAGBE8AxyafUxtS3eTtdm6x4VQmS1UbaEi6P/g==
X-Google-Smtp-Source: AGHT+IFVWVDktDxkoCtudFjhetKiUmTOjHXaMQV/1GH3/G4PRJBMkJCGZASis3MEuqkYW6kx8rPH6w==
X-Received: by 2002:a05:622a:289:b0:431:2b0d:5941 with SMTP id z9-20020a05622a028900b004312b0d5941mr1841942qtw.39.1711190889788;
        Sat, 23 Mar 2024 03:48:09 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id gd14-20020a05622a5c0e00b0042f21fe66f7sm697213qtb.73.2024.03.23.03.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 03:48:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 23 Mar 2024 10:48:07 +0000
Subject: [PATCH v10 6/6] media: uvcvideo: Fix hw timestamp handling for
 slow FPS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240323-resend-hwtimestamp-v10-6-b08e590d97c7@chromium.org>
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
In-Reply-To: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "hn.chen" <hn.chen@sunplusit.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
X-Mailer: b4 0.12.4

In UVC 1.5 we get a single clock value per frame. With the current
buffer size of 32, FPS slowers than 32 might roll-over twice.

The current code cannot handle two roll-over and provide invalid
timestamps.

Remove all the samples from the circular buffer that are more than two
rollovers old, so the algorithm always provides good timestamps.

Note that we are removing values that are more than one second old,
which means that there is enough distance between the two points that
we use for the interpolation to provide good values.

Tested-by: HungNien Chen <hn.chen@sunplusit.com>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 24 ++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h  |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 5df8f61d39cd1..900b57afac93a 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -471,8 +471,31 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
 {
 	unsigned long flags;
 
+	/*
+	 * If we write new data on the position where we had the last
+	 * overflow, remove the overflow pointer. There is no overflow
+	 * on the whole circular buffer.
+	 */
+	if (clock->head == clock->last_sof_overflow)
+		clock->last_sof_overflow = -1;
+
 	spin_lock_irqsave(&clock->lock, flags);
 
+	/* Handle overflows */
+	if (clock->count > 0 && clock->last_sof > sample->dev_sof) {
+		/*
+		 * Remove data from the circular buffer that is older than the
+		 * last overflow. We only support one overflow per circular
+		 * buffer.
+		 */
+		if (clock->last_sof_overflow != -1) {
+			clock->count = (clock->head - clock->last_sof_overflow
+					+ clock->count) % clock->count;
+		}
+		clock->last_sof_overflow = clock->head;
+	}
+
+	/* Add sample */
 	clock->samples[clock->head] = *sample;
 	clock->head = (clock->head + 1) % clock->size;
 	clock->count = min(clock->count + 1, clock->size);
@@ -616,6 +639,7 @@ static void uvc_video_clock_reset(struct uvc_clock *clock)
 	clock->head = 0;
 	clock->count = 0;
 	clock->last_sof = -1;
+	clock->last_sof_overflow = -1;
 	clock->sof_offset = -1;
 }
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index cb9dd50bba8ac..fb9f9771131ac 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -499,6 +499,7 @@ struct uvc_streaming {
 		unsigned int head;
 		unsigned int count;
 		unsigned int size;
+		unsigned int last_sof_overflow;
 
 		u16 last_sof;
 		u16 sof_offset;

-- 
2.44.0.396.g6e790dbe36-goog


