Return-Path: <linux-media+bounces-7781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF99788B1BA
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 21:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91155B3D1B5
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B98B144D0D;
	Mon, 25 Mar 2024 16:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XALqHOUR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDB913440D
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 16:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711384299; cv=none; b=pQfqIoc9bTrLemepZhrYUj9FCszYAOdA8DUrgkc/f7jVfD3DfkN97UtjyzVJiX33EB/W2tSM0PT+Mavj4vLtILiprg7VJtQaf2wMsp4M/rkp/4VG6+YOg4UzBMB0m9lsd9fLjeTvhHiOuv+mTAgwhwOThYQN+ZMMG47+h507OTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711384299; c=relaxed/simple;
	bh=IbGWx43paY/eY3BoKH9LIehCJLKILNpJ3miMe4Ay6xU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VcB4+ycLqzuifyGMdQYuSP6D5u65LNhHw3YoAJ3xQ8OqzUuGm5O9VaZPkcLpZeZa1CeN5FPo9bST7kCujWmq8MTL0z3Tv7xDvj+1pw9Z1IPYfifBFvfiDhg6jGPSv7eO5srFY8iLMMpJa4n0+XQhbNZI/7fEUyAiT+E9J/wQXX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XALqHOUR; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-69629b4ae2bso41226646d6.3
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 09:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711384296; x=1711989096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yu6CRq784zZk8JmoJH+VcllViInTfNkEV44O9xYOrqY=;
        b=XALqHOURwLxzSrUCmAtzogdBXLS0B10YeY7xXUN84e1uA57vs8G54f9t1Y15lCoT8t
         WpkWbGRHUb9R29DwN6A/Az5w6p9CJq1wX5t42u6je8wLdJb36RWtA8D8cYPRhDv4E2ll
         1pdDG2ZiTdgYbtAaePhd2mdxyCXDYj6DIruk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711384296; x=1711989096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yu6CRq784zZk8JmoJH+VcllViInTfNkEV44O9xYOrqY=;
        b=c3BVYaHdxzaByqyk1V2uEmkAKVkXf/bjg0olGwwBCesurp9Tnnd3G64r0kuzBYm0bS
         e+TaX48eq5HkudE6mD0hs3ldzkg93noRleypWYLHCqUQenTOoDm8+8hOIwdAC7ajZAml
         vruSonOzjKfXQvSbqVSGsUAgW9u8JAdmdVLpYjA/61sC/gQHahHWCtKMe2sQuA8SiBeX
         qJESGLDxnBIbIBkLe4oKycaP51wGten9qQpYfbJFtfISBBVepq9oC1jclrLZE1jfQGss
         JV4i4l5HMjJoHWmFnVHUqaksCW6lQFWb0/z6I0QvvE0+gX9sKAbPCbUfmsEd0i3ai/Bk
         FZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCXDxV72I+rqZAvU4Dfa4cRPOWNegAx9m+KN7/HqFSbVM/zP2ypniT7hEI4h6AwD5OvqsRx9cghTrIGtmVQ5fCV7x2eGltFE2a0WhrI=
X-Gm-Message-State: AOJu0YwFsLZcv7EQouNuqVkJOOnJd7xeJKNceYyVBgomzbFcD7gEok/R
	Gp5cCrPTAB9c7bQjp3CNntz+AswaqYGrRFH6QLRIy/Hz1FfnlgSQOSvVvdsTZg==
X-Google-Smtp-Source: AGHT+IEtUg0mwiYcW1LyaV+FksxmaMuJ5FBKdGORci81ZmbE9EryF5lCqjbumq/U6M1tZw0jXCPXEQ==
X-Received: by 2002:a05:6214:acc:b0:696:3705:fe5a with SMTP id g12-20020a0562140acc00b006963705fe5amr9938267qvi.7.1711384296101;
        Mon, 25 Mar 2024 09:31:36 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id jr9-20020a0562142a8900b006905c8b37bbsm376330qvb.133.2024.03.25.09.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 09:31:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 16:31:33 +0000
Subject: [PATCH v3 1/3] media: uvcvideo: stop stream during unregister
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-guenter-mini-v3-1-c4bc61d84e03@chromium.org>
References: <20240325-guenter-mini-v3-0-c4bc61d84e03@chromium.org>
In-Reply-To: <20240325-guenter-mini-v3-0-c4bc61d84e03@chromium.org>
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


