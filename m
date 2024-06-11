Return-Path: <linux-media+bounces-12925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1741903502
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 10:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EA351F25259
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 08:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E4A174ED3;
	Tue, 11 Jun 2024 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dQ3GW1cG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F93173321
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718093533; cv=none; b=a2MYWGeYmaruZaHj1MAWdxqBK6gaEcdmn4Gm59+kSK5B5DivUPMCQZcy7Fcd8SuqWATeHSh1hIC7Ek8RpNl1mKvqze0z+fU6Fmx8qLwCW1q1uUIDqEr98PO9zGmtRX1RjM9P2RfooDqlnJjMemwKDVUdAbFgAKkkUe/DFf1HYn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718093533; c=relaxed/simple;
	bh=VBjl8MShjb4jhR/wD8VA+h2otUV+ZOfH5etejEqA764=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FNuH6D4zNcSZQg9mZoK6Zu1U13vn+T+l5INutcKbpOqaHQ8VmEiJFNLrs7vZzeitPLUdPnC9HREVyM6P01sU4wwf9z0Vt1GbKrBsatETZiR8GaQMRbG5jamqUAbH7Bqhx4FtlieMYlzd5MTccnyIRjTishfIDdyOLjK2T8LmJTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dQ3GW1cG; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6aedd5167d1so4299996d6.1
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 01:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718093530; x=1718698330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8v2HQzZnsAarKFZFIMw3d0cEESgGzGkmVZsX2rItjw=;
        b=dQ3GW1cGwHS6WY7hLP8xLKQ/QFBn0kB0bn+iMZlaGl6loEJnPjk1UT9x5PEmRw1zRP
         uN8LSed9YT4v2soVzdfBsZfEYLylW69olvevfUFEuB5EiQ5bsAVAobeB9f6I0Vh/mwT2
         4PdxyDRNz23oUwD/QsAJaniqMIpSARxGWRs0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718093530; x=1718698330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8v2HQzZnsAarKFZFIMw3d0cEESgGzGkmVZsX2rItjw=;
        b=qY2ECYiftMD0mEfhC8tqdCXzNm7v06qO+nWy1s9tS7sv6/vtL4eMoK7YKdfxDIt+2R
         UkdM7WckcKdvXkOx4eMsTqH5ZhUFpRv7nbcALm1WGAZtwjC5teKtmQw/ObqP5I3Rg3gQ
         q+/LJePt+PgBL0/4X4wkTg1KvwDCj25WRdgKVCQXdzCElRCJNC0L5vEIRkkommmFg07g
         R4HtJ9MokRJCnAqI7llVz9gWxmAJlxK+pqh4TtrYBkMNJ6akiuNmaSXCxh+OcSuoCCZ9
         gBbLXjObruYdpt0utRYRwcyirSrRelzHte+iVjMvEHuxo92hrgSQFJsrz1TXNxxPcrsd
         FgAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCa6+sOdsJAUOgucxK3JQkhfOdQJFQwlsc/bjpZxlQkZFrKRWcVgseVJyh1Y02QRrV8pBKf8T15xCtvMRoxTkDIIKxkRKXI64AK+U=
X-Gm-Message-State: AOJu0YwwUBZ/x1B5gB0po7JwS2k83QR8hn/ErWLfLhWzxDVqbz3dXApY
	j5D6RIB0kur8EXcXG4yEH7lpaypBPQnOyywBvgO6hAPLTjPBDgSkf/ro1cqynA==
X-Google-Smtp-Source: AGHT+IHJrD3aaT0KJbL4s5UWU+yxBKPow1+9VOCVV8mz/2gwC8+wamLfq6YRjGQFX/uJQr7Tf9Tp0g==
X-Received: by 2002:a05:6214:3186:b0:6b0:8b2d:b6e with SMTP id 6a1803df08f44-6b08b2d3a43mr14553876d6.63.1718093529989;
        Tue, 11 Jun 2024 01:12:09 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b09039c2b9sm1548886d6.28.2024.06.11.01.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 01:12:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 11 Jun 2024 08:12:06 +0000
Subject: [PATCH v5 1/4] media: uvcvideo: stop stream during unregister
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-guenter-mini-v5-1-047b6fe5d08b@chromium.org>
References: <20240611-guenter-mini-v5-0-047b6fe5d08b@chromium.org>
In-Reply-To: <20240611-guenter-mini-v5-0-047b6fe5d08b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.13.0

uvc_unregister_video() can be called asynchronously from
uvc_disconnect(). If the device is still streaming when that happens, a
plethora of race conditions can happen.

Make sure that the device has stopped streaming before exiting this
function.

If the user still holds handles to the driver's file descriptors, any
ioctl will return -ENODEV from the v4l2 core.

This change make uvc more consistent with the rest of the v4l2 drivers
using the vb2_fop_* and vb2_ioctl_* helpers.

Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index bbd90123a4e7..f1df6384e738 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1908,11 +1908,41 @@ static void uvc_unregister_video(struct uvc_device *dev)
 	struct uvc_streaming *stream;
 
 	list_for_each_entry(stream, &dev->streams, list) {
+		/* Nothing to do here, continue. */
 		if (!video_is_registered(&stream->vdev))
 			continue;
 
+		/*
+		 * For stream->vdev we follow the same logic as:
+		 * vb2_video_unregister_device().
+		 */
+
+		/* 1. Take a reference to vdev */
+		get_device(&stream->vdev.dev);
+
+		/* 2. Ensure that no new ioctls can be called. */
 		video_unregister_device(&stream->vdev);
-		video_unregister_device(&stream->meta.vdev);
+
+		/* 3. Wait for old ioctls to finish. */
+		mutex_lock(&stream->mutex);
+
+		/* 4. Stop streamming. */
+		uvc_queue_streamoff(&stream->queue, stream->type);
+
+		mutex_unlock(&stream->mutex);
+
+		put_device(&stream->vdev.dev);
+
+		/*
+		 * For stream->meta.vdev we can directly call:
+		 * vb2_video_unregister_device().
+		 */
+		vb2_video_unregister_device(&stream->meta.vdev);
+
+		/*
+		 * Now both vdevs are not streaming and all the ioctls will
+		 * return -ENODEV.
+		 */
 
 		uvc_debugfs_cleanup_stream(stream);
 	}

-- 
2.45.2.505.gda0bf45e8d-goog


