Return-Path: <linux-media+bounces-7911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EA088D8C7
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 09:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E767D1C25D0B
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 08:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E171432182;
	Wed, 27 Mar 2024 08:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j195btc+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8013228DD7
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 08:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711527892; cv=none; b=rUQyQ31IDBtamS+AklSIVUK9m+6b6JhQM4YXZhmLH6r8t8gmdfGPgtW1hGKdZvknSu/JkKVEaYFBJz9/wi6W193BXygkBdPr2tu4598rsQxg9lysyQHOuKwT/5tC/9pYPnK8qELzdzL5uyIVkBzCfWAuSFOAkh9+qVzxXwt9ofA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711527892; c=relaxed/simple;
	bh=IbGWx43paY/eY3BoKH9LIehCJLKILNpJ3miMe4Ay6xU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZNzW/aDBv9n12Hc/3DSvS46WzEh8nyOO1AYdxXlHfDYiqfPMWxK45SuWauejz3v9sRnJjdEChA7+KJu9ueilA/RH/A74wAWH+flHvdFSOwozU+gY5EuPtbA6eoIahHBt+QNmfno5GZX/fOeOFdb0BHk93Mo0C1RKEPGoZMjTB4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j195btc+; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-430c63d4da9so45520671cf.0
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 01:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711527889; x=1712132689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yu6CRq784zZk8JmoJH+VcllViInTfNkEV44O9xYOrqY=;
        b=j195btc+VTQAeWheL6eIlXjFDfcR87V3HGPtAkf5AM9y4VKX4MVYtflg7RPLiupkbh
         SITfTx+3alq059iL6R0ASdTwA6Qr5OePwsrFfDlQGIbT3G4xiaOBOlGLgxVWKgfhUXtD
         EHgPnYd5nTS4EnKfnRwVR1UmzWHd2ZD72QTOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711527889; x=1712132689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yu6CRq784zZk8JmoJH+VcllViInTfNkEV44O9xYOrqY=;
        b=FRTPEqN1U8SwU8Ji+QfNgvYA0UhzAm1rHX2Az6KbDB0AxlIhl++XXJobXRTK76GR2e
         V6F7ln671glRl7MAKf2+8gq2dIfzaVfB+UZi670jUbROnZpJNPkI0IFWjilH6vZnx0lq
         tmvCOQ6f0YaUR13wZgTMv/yroRL/qeN7t9QNTL64ZJGp94J1kDJMQyCHGa0BSlYc5/e0
         ZOKAJkt8RM6Z8yoRUzw5S5Qrg1W2KWqdIQYge9sxoR1QgFxQP9yA46IwGeWWoCNc6xrU
         J2CpVnohBOXzdEj91/WWzfoUxRGoWCdWt3or5udeiNWYhCBmH3NhWDRlwsMruUBgjXVq
         4TpA==
X-Forwarded-Encrypted: i=1; AJvYcCWGduT4vOyXlxv9doMt1VDcvqvyyo7rtI1eHheNA3mrXKdxw5s85sO6T/iL4BYMrACTiPm9F4Wfkxr68qTFujSPb4AtHIlORy5yT/E=
X-Gm-Message-State: AOJu0YyiuqxpM2C1hlVlO/de5JGRqYyK6yJsI5WdeQlx8oywvz0RhzIl
	pNw025tISq2sP71EnTr6rajrIrM0iZe2BleDTkpkaZZo90RqgsICH+KpR2F6WA==
X-Google-Smtp-Source: AGHT+IGgVDltHpo85/iezWoRecn1u3UhxgTUnv8za/M4lLvLgH586s4zoUdEZcsJsYWBFRbX5QyQxg==
X-Received: by 2002:a05:622a:2a07:b0:431:80c9:ab17 with SMTP id hc7-20020a05622a2a0700b0043180c9ab17mr683009qtb.29.1711527889256;
        Wed, 27 Mar 2024 01:24:49 -0700 (PDT)
Received: from denia.c.googlers.com (131.65.194.35.bc.googleusercontent.com. [35.194.65.131])
        by smtp.gmail.com with ESMTPSA id ca9-20020a05622a1f0900b00430ea220b32sm4581691qtb.71.2024.03.27.01.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:24:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 27 Mar 2024 08:24:44 +0000
Subject: [PATCH v4 1/4] media: uvcvideo: stop stream during unregister
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-guenter-mini-v4-1-49955c198eae@chromium.org>
References: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
In-Reply-To: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Max Staudt <mstaudt@chromium.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.12.4

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
 drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index bbd90123a4e76..17fc945c8deb6 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1911,8 +1911,19 @@ static void uvc_unregister_video(struct uvc_device *dev)
 		if (!video_is_registered(&stream->vdev))
 			continue;
 
+		/*
+		 * Serialize other access to the stream.
+		 */
+		mutex_lock(&stream->mutex);
+		uvc_queue_streamoff(&stream->queue, stream->type);
 		video_unregister_device(&stream->vdev);
 		video_unregister_device(&stream->meta.vdev);
+		mutex_unlock(&stream->mutex);
+
+		/*
+		 * Now the vdev is not streaming and all the ioctls will
+		 * return -ENODEV
+		 */
 
 		uvc_debugfs_cleanup_stream(stream);
 	}

-- 
2.44.0.396.g6e790dbe36-goog


