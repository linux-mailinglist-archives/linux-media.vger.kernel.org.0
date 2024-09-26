Return-Path: <linux-media+bounces-18597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AA1986C31
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 07:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABB201C2244A
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 05:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D8D18890A;
	Thu, 26 Sep 2024 05:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bx0IQXOO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A18218756A
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 05:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727330361; cv=none; b=ULCINWmQNcYljMlZuqbXjqgoZh3qjk7/ErLbUAR66RhW7+Y2HSIJut2M5ttMtqTtG98yEVXOiuvOLSaImuEuhovjto+7b8rSnZBh9RJsZSpfZIX4MLviIKnoT5Y3FtLH0vrTaB0kJKT9gzXlnK6BDfBM/oHYe97vo4+U6NhJp6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727330361; c=relaxed/simple;
	bh=XYyn/uWSwGEwZ2izkIKhOmYIuCbBJ8CxIZasp0IY31A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BLA1M66HQuF3EyVCyz3017czMx9lcBBXpsUM3JCPBlECK8mUA4fsJEBgraBV0qP9FD+zN0BJcwNxejAminwOxF519J5+jWCSHc1WhNnzFzxduoa5seBM/hBwgOqtE9Vv6E4B7bkigBBkVZGeFZjUzqNGzV7ys+p+aqnBKw4k5jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bx0IQXOO; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-456757d8871so3637361cf.0
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 22:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727330357; x=1727935157; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/c8AisojHt8E8qq/bSCfOVPkpZhoMvB2alieW7bAk4=;
        b=bx0IQXOOJVzSvCeYKB1yNPRKrRMe4LGl0iKna1BizoObe62ouDS05M4Xt2C6w5ZPU1
         jRRmxJju8Wa4ks7XOMnnGybV6D1E4tFtEPIU3CbktPPob5kM43FXvy4WEA6dR3uwQv/v
         CplrSGwYP0t/c9Gik+XjCDUC7M5pfaIRDgi7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727330357; x=1727935157;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/c8AisojHt8E8qq/bSCfOVPkpZhoMvB2alieW7bAk4=;
        b=B4ysQJFgmFPE3BUD9Ly/r5vkwZGH+HoEuKA2/TzrEl7YLk5DvNJOMyxxg0EDiOi8HV
         VoKgZUw99EzmNM+CIAGisS2MgIAi3mbn4mf4Et+pbGvl7C6prGeUxQxVLks8/mJq+mx4
         ptWuC250bxLmvUo5Z5F4a84CkDccT0esszANRJ39vhgc3n05qu9ayNZKFh8DjX/vYh/X
         mIZDGGlLawx77HklM+s8CrKxN46BP7lmOuc8Nb9JbZxs5NgtDF/fC/XXNnGIvi+vdDaW
         EW0s3NJP1HDPwXGG3JYOFVcmhMtELdaHkx3pF8GwkdvPTaWzo5AQ1UktpkfQox0hH9A+
         SzGg==
X-Gm-Message-State: AOJu0YyIzk+UoiqekPzkVmCP8poVFseBzS7IEsoNZvFpLQYw6zNR6kpR
	OVirDrpWVHemtKT3YFjLHJPtfo312b/k0pD+YVBiCCDC6Dm3Fz0gNo1J46v7Ag==
X-Google-Smtp-Source: AGHT+IH8HqXesp42SaUkdV4xroJDzKJ0Wpb2M4gze5VjC9BE0JCCtVeG2eBFGZII9cPYa+Z2uyfzxQ==
X-Received: by 2002:ac8:5fd0:0:b0:458:2e48:b5ec with SMTP id d75a77b69052e-45b5e094b69mr64342101cf.45.1727330356886;
        Wed, 25 Sep 2024 22:59:16 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5253b05fsm22611271cf.10.2024.09.25.22.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 22:59:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 26 Sep 2024 05:59:06 +0000
Subject: [PATCH] media: uvcvideo: Stop stream during unregister
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-uvc_stop_streaming-v1-1-038180fafe5f@chromium.org>
X-B4-Tracking: v=1; b=H4sIACn49GYC/x2MQQqAIBAAvyJ7TjAJw74SEaZb7SELLQnEvyddB
 uYwkyFiIIwwsAwBE0U6fZW2YWB34zfk5KqDFLITWir+JDvH+7wqApqD/MYV6tVJgbpfLNTwCrj
 S+0/HqZQPntZ+N2QAAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

uvc_unregister_video() can be called asynchronously from
uvc_disconnect(). If the device is still streaming when that happens, a
plethora of race conditions can occur.

Make sure that the device has stopped streaming before exiting this
function.

If the user still holds handles to the driver's file descriptors, any
ioctl will return -ENODEV from the v4l2 core.

This change makes uvc more consistent with the rest of the v4l2 drivers
using the vb2_fop_* and vb2_ioctl_* helpers.

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
This patch was part of the series:
https://patchwork.linuxtv.org/project/linux-media/list/?series=13064

Moved out from it to ease the review.
---
 drivers/media/usb/uvc/uvc_driver.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index f0febdc08c2d..bee150b852e4 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1919,11 +1919,41 @@ static void uvc_unregister_video(struct uvc_device *dev)
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
+		/* 4. Stop streaming. */
+		uvc_queue_release(&stream->queue);
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

---
base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
change-id: 20240926-uvc_stop_streaming-6e9fd20e97bc

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


