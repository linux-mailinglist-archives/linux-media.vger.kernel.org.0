Return-Path: <linux-media+bounces-34963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2822ADB53F
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21ED7170F1C
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC76A275864;
	Mon, 16 Jun 2025 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QrrFgB9+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D18C25291B
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087496; cv=none; b=IwV1c5v9aaDWHw5LToQtxhlAOGN4qW24WRQR9qzfueWXkUuCqecLZl3foZG46DyerCxXl4I4Mw7hXQY+grSwG+SHeoanOGeLPCqTCOgv3dVYY6U/kwK6c2gkhPEzAz7b3OVMF6pY1x+N4yjM6xeRTF5rtwaLpKZaMdgUCRLhxj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087496; c=relaxed/simple;
	bh=c1fcbRjJ58/n6v45d0hGUAr9YIahYT5F9yuooQ1PvsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3VFXVh2+AVuKTvD8ZUkkpIAtUzlJUqF8JL7g1tDMTLFsk0H8xtGLSqEY2SMHqoJ0scXxO2e5NyWuLqcIJx5xji7tWD7XC2ylpTvSb6MB0Hsk/xJmIa7YCKe+4cNEOM+py32lNqvx1Z2vjt43p3IA4VSEoSx6IlNArO7ciBYJHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QrrFgB9+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b51f5218so2922012e87.0
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087492; x=1750692292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLP+dzsQogEKVLSLXZuJGypFkFhYImTXNZozm06VbFk=;
        b=QrrFgB9+kDog4SRjcMILPaD4HjBq5Q9dZHK3GtCw60wU4Ox5V9zKi5h5jqIyXoKMEr
         3dHVwKo3gIT17kbw4bQQllfbOUaYL9yfmw/717k/9yxoYuJxMAm33Hg1yTeQaXO9uUs0
         7yyCWQMSoAgM4RZDXlPZkAXCkCSpqGzBHbueQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087492; x=1750692292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLP+dzsQogEKVLSLXZuJGypFkFhYImTXNZozm06VbFk=;
        b=SKgkrPzA8ek0BeXX6IkCLDMY5T/DgnG9N1BoslL+YcqBsQxXtdM+wmY+bjxyK+X9R3
         DLj/CGsOpuNsRT0Mq6GyvyAJs7f1lgWZ6iU/64SBplWNPKQwUB/UdU1ftrZKXhSB+Nin
         LO/e/vLIuhBjsrfhr7y+ezmTwTuAbdFoNC8Y0MRK3O1SuNj6FhZfbKWxOXS9XavXBifb
         bME3uFKLlJwuU2UXaSV3Dp1Y7M9V5R45uVPypeV3Xe8vxqNc1E1DgOrSASRvZzgTUYXh
         r5V1YpeqYtSTaySh5IB+275wmzGdwyGwdXFgfXOm5mMBTgylRaV80skeD0q0xrYKe/Ko
         NqUg==
X-Gm-Message-State: AOJu0YzYqyCChsX3LnjjmGTMkUOtD25JYxbYwkb9zTQ2TPVf+Ed6/xhO
	WwiXvf1U1AdWnQpx4tykDSviDLIfUKUXxsZ10n9eZUxHD0CTYFhghwLDfxJ+IhD5gA==
X-Gm-Gg: ASbGncspxiVT89XrpexvMNuLtJJ7y9DeyXQChrtabLi2WSRBVIGxaMOXIJSmc+YeZkE
	EAwCxFq0sNhFNGW9Er3y2vaAU+d1Hsl0gCOFNJhPZRNkxBKowwXlMb85wWq9UeSqLZ2TCHRI3bJ
	mQwmKV6PNmTjVz8njMRkKWtkNWdci4FFakm6DnWV9yBXfqwn6xCUAiN8XzcrGxooXnkeXzzixgo
	a49f/QkANI6MiD50tnuFNiA0aBTyEnVHBtnpQhWwjIPq7nWYofiVnZ94Kw6TtGEF2VZioucZk3u
	sY/lWMWMrCZhf/Pt9BmqC4Ug2Ab/hHq/bbEer5+E5C7MspjT8vJT0TY87Egk1y3Ep+hRtOfTD3A
	QOAKSr6Vt9nPnrXITlM5LYx/luX8skfs67o63BFuzsw==
X-Google-Smtp-Source: AGHT+IHwrxVZaHqzzhsZCvCL26mk133FyEJL7YcfSwuEUUONI/k50br6D5fDapNxD/sPjvUNsvQtfw==
X-Received: by 2002:a05:6512:1105:b0:553:2450:58a6 with SMTP id 2adb3069b0e04-553b6e75904mr2244348e87.1.1750087492221;
        Mon, 16 Jun 2025 08:24:52 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1dbcf5sm1564271e87.190.2025.06.16.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:24:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:24:42 +0000
Subject: [PATCH v4 5/5] media: uvcvideo: Use prio state from v4l2_device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-uvc-fop-v4-5-250286570ee7@chromium.org>
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
In-Reply-To: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Currently, a UVC device can have multiple chains, and each chain maintains
its own priority state. While this behavior is technically correct for UVC,
uvcvideo is the *only* V4L2 driver that does not utilize the priority state
defined within `v4l2_device`.

This patch modifies uvcvideo to use the `v4l2_device` priority state. While
this might not be strictly "correct" for uvcvideo's multi-chain design, it
aligns uvcvideo with the rest of the V4L2 drivers, providing "correct enough"
behavior and enabling code cleanup in v4l2-core. Also, multi-chain
devices are extremely rare, they are typically implemented as two
independent usb devices.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 --
 drivers/media/usb/uvc/uvcvideo.h   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index accfb4ca3c72cb899185ddc8ecf4e29143d58fc6..e3795e40f14dc325e5bd120f5f45b60937841641 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1728,7 +1728,6 @@ static struct uvc_video_chain *uvc_alloc_chain(struct uvc_device *dev)
 	INIT_LIST_HEAD(&chain->entities);
 	mutex_init(&chain->ctrl_mutex);
 	chain->dev = dev;
-	v4l2_prio_init(&chain->prio);
 
 	return chain;
 }
@@ -2008,7 +2007,6 @@ int uvc_register_video_device(struct uvc_device *dev,
 	vdev->fops = fops;
 	vdev->ioctl_ops = ioctl_ops;
 	vdev->release = uvc_release;
-	vdev->prio = &stream->chain->prio;
 	vdev->queue = &queue->queue;
 	vdev->lock = &queue->mutex;
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 3e6d2d912f3a1cfcf63b2bc8edd3f86f3da305db..5ed9785d59c698cc7e0ac69955b892f932961617 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -354,7 +354,6 @@ struct uvc_video_chain {
 						 * uvc_fh.pending_async_ctrls
 						 */
 
-	struct v4l2_prio_state prio;		/* V4L2 priority state */
 	u32 caps;				/* V4L2 chain-wide caps */
 	u8 ctrl_class_bitmap;			/* Bitmap of valid classes */
 };

-- 
2.50.0.rc1.591.g9c95f17f64-goog


