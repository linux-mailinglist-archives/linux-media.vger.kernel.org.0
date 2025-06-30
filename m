Return-Path: <linux-media+bounces-36313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E635AEE086
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 16:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D54623A302F
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 14:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B18028E574;
	Mon, 30 Jun 2025 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HeGFkQRQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8F328D8C8
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293236; cv=none; b=tMWW4uA3k13mjwmm6ASibmXLHs5AobTm3/OjX2Zf6W3fWy9W7HD3bnt3sDwH8VTHYhDRINRdSOfrZOtPh9MJJ9ylDARtrzElwbkW8Nztvc1e7uPX+ZvkiVzpapDc+fxhnzUlglDnqrAwaN28tJ8z72emMrwPpBlQy9fJFUGNmN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293236; c=relaxed/simple;
	bh=S0aFpFC4n3QawWa7V2OErQFJEBz53JWrHnAFsX28XUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hV5vB09AkyFbZWtXau/dh+MQCgQpMR0gc0fta02FcmlNc7H5IyTt4I8w99m9tsM5Og3+UpIBwAB2EibTt4oN5MCbR9nSrFpi0sxlhIEw99dv3eESYQpM3niPyWCylfaYhbfpn26TwBfKGNQpozhlmS/T2rBbZc99QKoFaRn5yF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HeGFkQRQ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553d771435fso3771604e87.3
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 07:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751293233; x=1751898033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV5zqtGaJFdq64Z/f4wEaBtjans6GYNhmk/s3Cxy0fg=;
        b=HeGFkQRQRPUUfuokoQk5ewNWY/83Csji91i1/neKLNM58RpoN54B1szNCjLEDi/PGl
         Cf3ugZ20+57Lr/ci1Z/M8R05HF9/CovJUoFXzWAN+U+lRhBJuu8R7a7OZnU0yppi1OxS
         N4OuOJAJ3f3KOaQRmFlTgjaw+4qboE5sqnXXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293233; x=1751898033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lV5zqtGaJFdq64Z/f4wEaBtjans6GYNhmk/s3Cxy0fg=;
        b=lYs4jk7sVVTl3gZtLt3A4KFkDBSTEm4EYs89wEfanOgpcqUvqAhChXqYctT3g/sERr
         ZZQHTpt0febJ3rQCxPGZQ3eAYq1sLqtWi+nfOmxO8cy0A4KIb6sOz0Av9rq1Q2teq0tG
         9xMZAzHsk7G3znhgvyNvsMr6ncYXwV9Xc3KXE5V7tR3gaMZXjuooDQGgpxY4SdOcQT+m
         ANumGgqOcAcdFX84pGnJvx5gLXzja7wXtzIJaTloHlhBMcxa4oNb2YAd60nRg+PDv3Hs
         vjciRtGpXY9KEbqgJTAOp0+FjkhOfhCG5EgvGMRmOgiK2uPCGTCHxQ8acaOBfbIRHJ7o
         REKQ==
X-Gm-Message-State: AOJu0YzH9Veqj891n7ztavlyjuKzEEDE1o5wTRx0CgCyoHWyx3j0ZJsZ
	hOHpIJ1D6ooddi+OL3md+bQtQCIp6CYkdVo1RH/qkg4AYoOWL5X/8ONlD9b1tnTw7A==
X-Gm-Gg: ASbGncsWPFPZtogRmpQEA8Pp+XGQAMXsFUEtOrpnR12Xrv2ISuGGB0B2cd/F9xXQ0zs
	VaemC4G78xNTj9MbKbjgZznLJ4RmG6Rh6wxqkCLlMnpAPf5yAkG2lBDRjvQcAo+hCWreq5eZYAB
	GbwsqhI8xgOG2VPnviu1HmXV8cgrjw1KFxuG8dS4k9kR8dSK4XxGsFcMqfKE94QAKqbqgOYJsxj
	pBOGdcXPAp5U2PNR+HruzK9fRBnnKcGt3OrVuQl6pvJTIU60C0SeVrPRzVAdcGVdG2NwQgkx7N6
	Mh+hHk42dzNn2QVFWPuf70hC/tAoP/gnezdGhvRh3UhghibuNlS2Jmw/EpEYLq9jUMqOH0r/3i4
	M6NnBuaWo3snszU7Zxzqegne0Kqw0QLDjla3V90OOig==
X-Google-Smtp-Source: AGHT+IEHySu2ZYesyEoFEJ/oKpjAojmH1jxOLz5N72hVn7IAx/v2lionP8GlV1OsFKCtl8ojRqFamA==
X-Received: by 2002:a05:6512:33c7:b0:553:aa32:4106 with SMTP id 2adb3069b0e04-5550b892b93mr4365091e87.23.1751293232698;
        Mon, 30 Jun 2025 07:20:32 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d8ea8sm1432363e87.210.2025.06.30.07.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:20:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 14:20:33 +0000
Subject: [PATCH v3 8/8] media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM
 logic
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-uvc-grannular-invert-v3-8-abd5cb5c45b7@chromium.org>
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
In-Reply-To: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>
X-Mailer: b4 0.14.2

Instead of listing the IOCTLs that do not need to turn on the camera,
list the IOCTLs that need to turn it on. This makes the code more
maintainable.

This patch changes the behaviour for unsupported IOCTLs. Those IOCTLs
will not turn on the camera.

Suggested-by: Hans Verkuil <hans@jjverkuil.nl>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 52 +++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 350cd2cc88f872d2e8bd19e2b8fb067894916364..94dc97448446d36a85a1b36d16c29f22af89c640 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1222,37 +1222,35 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
 				    unsigned int cmd, unsigned long arg)
 {
 	struct uvc_fh *handle = file->private_data;
+	unsigned int converted_cmd = v4l2_translate_cmd(cmd);
 	int ret;
 
-	/* The following IOCTLs do not need to turn on the camera. */
-	switch (cmd) {
-	case UVCIOC_CTRL_MAP:
-	case VIDIOC_CREATE_BUFS:
-	case VIDIOC_DQBUF:
-	case VIDIOC_ENUM_FMT:
-	case VIDIOC_ENUM_FRAMEINTERVALS:
-	case VIDIOC_ENUM_FRAMESIZES:
-	case VIDIOC_ENUMINPUT:
-	case VIDIOC_EXPBUF:
-	case VIDIOC_G_FMT:
-	case VIDIOC_G_PARM:
-	case VIDIOC_G_SELECTION:
-	case VIDIOC_QBUF:
-	case VIDIOC_QUERYCAP:
-	case VIDIOC_REQBUFS:
-	case VIDIOC_SUBSCRIBE_EVENT:
-	case VIDIOC_UNSUBSCRIBE_EVENT:
-		return video_ioctl2(file, cmd, arg);
-	}
-
-	ret = uvc_pm_get(handle->stream->dev);
-	if (ret)
+	/* The following IOCTLs need to turn on the camera. */
+	switch (converted_cmd) {
+	case UVCIOC_CTRL_QUERY:
+	case VIDIOC_G_CTRL:
+	case VIDIOC_G_EXT_CTRLS:
+	case VIDIOC_G_INPUT:
+	case VIDIOC_QUERYCTRL:
+	case VIDIOC_QUERYMENU:
+	case VIDIOC_QUERY_EXT_CTRL:
+	case VIDIOC_S_CTRL:
+	case VIDIOC_S_EXT_CTRLS:
+	case VIDIOC_S_FMT:
+	case VIDIOC_S_INPUT:
+	case VIDIOC_S_PARM:
+	case VIDIOC_TRY_EXT_CTRLS:
+	case VIDIOC_TRY_FMT:
+		ret = uvc_pm_get(handle->stream->dev);
+		if (ret)
+			return ret;
+		ret = video_ioctl2(file, cmd, arg);
+		uvc_pm_put(handle->stream->dev);
 		return ret;
+	}
 
-	ret = video_ioctl2(file, cmd, arg);
-
-	uvc_pm_put(handle->stream->dev);
-	return ret;
+	/* The other IOCTLs can run with the camera off. */
+	return video_ioctl2(file, cmd, arg);
 }
 
 const struct v4l2_ioctl_ops uvc_ioctl_ops = {

-- 
2.50.0.727.gbf7dc18ff4-goog


