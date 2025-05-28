Return-Path: <linux-media+bounces-33550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3BDAC7081
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 20:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 694084E4BD0
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 17:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D90128F959;
	Wed, 28 May 2025 17:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dz3ENNmK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E9528EA65
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455102; cv=none; b=oWeAjQqqtBgkpo4M13cTGt9yYTM9G8/Nir3muIzkbTmtWsRfGuGRzZ9zUncZDALtnIKaaN5nTyccv4zatj/7zbnb1hD6K0ToqtSHoTlChyu8uMFKTiA/bvUm+a3OpoqO3Ye41Xme9lU72oTCFTQjOpGUVMAEPaRPHbqpvRgb0lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455102; c=relaxed/simple;
	bh=0tY2vHO1hSHETEU5NJ28ZPlV9OSEuEIkkxCtmk8GL9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0HIbUDSi2ViJynlmQjeZJgyDKcS7RJ3Hxf/XiOKGWruokNTT9hGB9jkhfRsp29BJLZT4/3TCcE4+Yiv7kXGRJpw8UKWReaTyjLAoGuS3hUiyg/qHjH4lc/pwoWM4eOahGSPhbUiUTa9hDdAlwemOyRBeAyxNaKnHuAeqSqzk5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dz3ENNmK; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54e816aeca6so4407e87.2
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 10:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455098; x=1749059898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGJ1fPweFHWMTsg0HgqwvAn1DtJjgjoW0O70zAHXxoM=;
        b=Dz3ENNmKoU+mAMXgz8KIWjqTGBN8zmTObQjYBzI21qU84i+VLiF7YKYLToF5nTOjRk
         VmNnVcYhbjTF9BmG4rtUHxu8vc95ritG9Am2+O8OQp4F28KNENBECNk5oQUZGyk/YEkD
         Db5pxNDQcgO8wZ+ftDnMw0n+A9J7HswAOqd74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455098; x=1749059898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGJ1fPweFHWMTsg0HgqwvAn1DtJjgjoW0O70zAHXxoM=;
        b=w7SNgNhoqU3xAgL/kHQGYZa92XxKYslTnVT3aFcCkXixD5xWQlQUtNeZOWoH906sYi
         dS3OY0OdPxDBYJgcGWTdFeR4FQNYHm/mt9u5R8cdMlxhniUxtdLEDtTHosBM3ZyA9quY
         JgDjk/APt3qCbMXWh9MeCqQ0608tNqJIoSCHYX8lX1InRcDe4xxMSeVyRv98kOjokAgJ
         HOAqaQxe0RRclTnTIcs+GgF7+P0/28XBSx2RvQk9OpcOIPwIcOdAnmgNruc91QSAHlX1
         AOUD09hq9GRGetI5wwbFJ80B33yaNldaUw9BEogkPR9pZyeTFCnqGonSeh1iR8JSp8Jn
         2XEA==
X-Gm-Message-State: AOJu0YzgzYkfYLmLgZEq1/LZ6r9b+71SceXcqnMJEizjblTyX4tEZ8y0
	sj2sDg9mee8IIxpWtGFvISzYIH51MQv5AyeUKBzec0czIqy/fGEbDCQTm8oQpNfWWQJyZjzehYA
	8EyHIuQ==
X-Gm-Gg: ASbGncuKj/d4DemGV6KHV5rAom7Bpn43jxpEwIK3cBbT3mOPFLY96jH8GVh2/3qHXp5
	1I2nLvTmVB3MFKVzZS9B9700gg347+uMRk1GqkjamC/qxzDyyju6Qq1DFiJnbD4WdE0dmhlUwNg
	QHlsbSDwWb8F4VcJevMQL8DPFAPpxjhAmvDPgIMXpsHsPVYFHXVcLdFT/nhZcwLI+t+i1lffCj0
	T7728KH7f3hqOHh/uJ6TFfWBwEtfS1II+Fb6eITVDKVFT9o+nTqTf6xYfN7GIdmsPg4TvT81K60
	Tbf8AdNBnYccGCSeAclVL+nJOf5XQJT5zhN7GKQHXjd2yXuq7EvQ+xJwZPTg9uvwsF/0xHHzfD6
	dn1JaMHEzo/gnumYBEl6e+VhAFQ==
X-Google-Smtp-Source: AGHT+IHg4uwY5pHE8HQz7g2AWH8xW287i0HnJpxZMDaAgSGjEn7J8TG2eBQXfzqvF/9EN1laDtI8Ew==
X-Received: by 2002:a05:6512:2388:b0:553:252f:ade9 with SMTP id 2adb3069b0e04-553252fafc9mr3783218e87.4.1748455097777;
        Wed, 28 May 2025 10:58:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a6eesm376805e87.98.2025.05.28.10.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:58:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 17:58:04 +0000
Subject: [PATCH 9/9] media: uvcvideo: Support granular power saving for
 compat syscalls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-uvc-grannular-invert-v1-9-d01581f9cc25@chromium.org>
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Right now we cannot support granular power saving on compat syscalls
because the VIDIOC_*32 NRs defines are not accessible to drivers.

Use the video_translate_cmd() helper to convert the compat syscall NRs
into syscall NRs.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c     | 9 ++-------
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 ++-
 include/media/v4l2-ioctl.h           | 1 +
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index fcb1b79c214849ce4da96a86a688d777b32cc688..048ee7e01808c8944f9bd46e5df2931b9c146ad5 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1282,15 +1282,10 @@ static long uvc_v4l2_pm_ioctl(struct file *file,
 static long uvc_v4l2_unlocked_ioctl(struct file *file,
 				    unsigned int cmd, unsigned long arg)
 {
-	/*
-	 * For now, we do not support granular power saving for compat
-	 * syscalls.
-	 */
-	if (in_compat_syscall())
-		return uvc_v4l2_pm_ioctl(file, cmd, arg);
+	unsigned int converted_cmd = video_translate_cmd(cmd);
 
 	/* The following IOCTLs do need to turn on the camera. */
-	switch (cmd) {
+	switch (converted_cmd) {
 	case UVCIOC_CTRL_QUERY:
 	case VIDIOC_G_CTRL:
 	case VIDIOC_G_EXT_CTRLS:
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 650dc1956f73d2f1943b56c42140c7b8d757259f..6fbd28f911cf23eec43ef1adcf64bd46ef067c81 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3245,7 +3245,7 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
 	return ret;
 }
 
-static unsigned int video_translate_cmd(unsigned int cmd)
+unsigned int video_translate_cmd(unsigned int cmd)
 {
 #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
 	switch (cmd) {
@@ -3266,6 +3266,7 @@ static unsigned int video_translate_cmd(unsigned int cmd)
 
 	return cmd;
 }
+EXPORT_SYMBOL(video_translate_cmd);
 
 static int video_get_user(void __user *arg, void *parg,
 			  unsigned int real_cmd, unsigned int cmd,
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index c6ec87e88dfef9e6cfe1d1fb587c1600882fb14d..437b9f90714c62e0ba434ce47391ef64d88110aa 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -687,6 +687,7 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
 int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
 			       void *mbuf, size_t array_size,
 			       unsigned int cmd, void *arg);
+unsigned int video_translate_cmd(unsigned int cmd);
 
 /**
  * typedef v4l2_kioctl - Typedef used to pass an ioctl handler.

-- 
2.49.0.1266.g31b7d2e469-goog


