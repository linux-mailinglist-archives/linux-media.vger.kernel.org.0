Return-Path: <linux-media+bounces-33914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFB0ACAE9B
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E390A3A6BF4
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58C12222B2;
	Mon,  2 Jun 2025 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bIBX7PlQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BB32222A6
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 13:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869598; cv=none; b=R/UEJU//+2URyRaLoJZhw8X5CrtqWjPtUHn+cUIn8O+JS3b1+1SZUgpXCd/PgJdB7DXN9G8fhnmrcmHYZJUa+yTmULbnBrUJgqecRo9v8IBgdMUdmYzQIYFKdgCKK4ZK2L8HGD0IzN+MSVi8p+mUOnEM6UeElKQW+4S0uoR2yXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869598; c=relaxed/simple;
	bh=fc23CTNTD/5dwFWW51Oa6nQRUyLg8YME2F5fGjT2y/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cpyM/DRP1uWfXiO4fF+3SDV9D9ZaULItI/FfgvC1DwfJScw3j7K4+Z079xJ4jjLAfk2MHghcHjZS2D2qa5N3vIAsnFxcsuUzwy4x/t4ss0hLG5jEStQn53WDr/9rUCIOhStg7usKWSCl0OpQkC7vVNqIt6HggoVROkBSmxyfTWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bIBX7PlQ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-551efd86048so5169667e87.3
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 06:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869593; x=1749474393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTh0byM1hk1JW8FszCVsWx6/0+6cP5UpipLznYZuSMk=;
        b=bIBX7PlQvGdfuLHZvs8esiWiquIP24ZG8EhGW7SSkD4OqAwURyPh/EqMKqxHf08apn
         YDqRvpVBhFcpYot0HleCreXWyap1SUMAseUFBK6N/PSpjuT3hI9nfT8MwvhXDWmTiJTg
         g3MYvVF/8EX1zp4XJiRuD17CT4M+wUWmMig94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869593; x=1749474393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTh0byM1hk1JW8FszCVsWx6/0+6cP5UpipLznYZuSMk=;
        b=puXDpRxo8ofHW6KIfRdoFHj9yWpEwRWx4EQoNQOlK+SVQJ7Q/Ux5kQuRL9QgkY76KW
         WYaa5Iap4Kxur2b/513xQeWP0Wm4mraWJkkxXODF/8ZuAzRzR/SziPx0Qs1UA/r0L3AW
         ZSCx5vfQLrq5S95u3ZN8GBRVVmKzPNOUU3J/kr5j0DaWyKeIdRPybPVcZ7oio7J4sbhZ
         BzCt3ZpeN2igUC/rRkDl5TwZH/Iz6skaMLGH9szsn1cIOGTXdFux9ufjFXaN65HybFA/
         aTrK9Qws8mxrFfkm+84xwFgE6chaPU1FqwZW4UtR3GjpoaJwcSyTtjpHbYmMrKnkE/cU
         E/RQ==
X-Gm-Message-State: AOJu0YydLOswAxFZ2/nioQrBAEVmz1vSFVcKJ77TX9FxeO8OOO5bUO5D
	PFmTYD9wXn8UjZHDy+GixqbC8vUL768LN5n6N5RsNiHvqDfHvkRJK+kfBrvxDfJyDQ==
X-Gm-Gg: ASbGncs7dam8FjjtomhDaZ/vzP/W43RQmVocnxAi9Y+0KRckorfq6km3lfu4YU9U+I3
	HSOGq2U8oahi0xeddnL63MHTXuXZ7bU6hgHfL74gaKc+Mok3jWCWLmHM1cnyYno3Yig4eQaiWyr
	KPYwNSSBrhqqq9Cerw3v5sqlyNBTN7JFJBA/eWuKK3DwZneuqAexQg4F2hBPjW+iVlJa1U9w8Mk
	W0faD8taCvZTsqQjwlSHdWsb5BcZ3V8aDWmOPmq/u3x0IhEV5D71Uc0C+rPOwwgE596ChhK3jff
	F4zFng6TJYrgcHGpVcZK6hG9/MSo8tTOv1p6ivJEHOyy398zjp0JCYSI4CKCmrQCmqABJkvouuf
	17io0URznHxC9/KfGKTmj7deFWA==
X-Google-Smtp-Source: AGHT+IGLsHBEoVmtd5NKV7jtspYoybyPtSFNaIEksBmBsZO+upEkAy6ZGHoutD0TgtPmWaeUDGX0Dg==
X-Received: by 2002:a05:6512:3da6:b0:553:2e92:2c98 with SMTP id 2adb3069b0e04-5533d1bb8d6mr3488304e87.42.1748869593135;
        Mon, 02 Jun 2025 06:06:33 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 13:06:19 +0000
Subject: [PATCH v2 7/9] media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM
 logic
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-grannular-invert-v2-7-c871934ad880@chromium.org>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>
X-Mailer: b4 0.14.2

Instead of listing the IOCTLs that do not need to turn on the camera,
list the IOCTLs that need to turn it on. This makes the code more
maintainable.

This patch changes the behaviour for unsupported IOCTLs. Those IOCTLs
will not turn on the camera.

Suggested-by: Hans Verkuil <hans@jjverkuil.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 61 ++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 020def11b60e00ca2875dd96f23ef9591fed11d9..13388879091c46ff74582226146521b5b5eb3d10 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1219,43 +1219,54 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 }
 #endif
 
-static long uvc_v4l2_unlocked_ioctl(struct file *file,
-				    unsigned int cmd, unsigned long arg)
+static long uvc_v4l2_pm_ioctl(struct file *file,
+			      unsigned int cmd, unsigned long arg)
 {
 	struct uvc_fh *handle = file->private_data;
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
 	ret = uvc_pm_get(handle->stream->dev);
 	if (ret)
 		return ret;
-
 	ret = video_ioctl2(file, cmd, arg);
-
 	uvc_pm_put(handle->stream->dev);
+
 	return ret;
 }
 
+static long uvc_v4l2_unlocked_ioctl(struct file *file,
+				    unsigned int cmd, unsigned long arg)
+{
+	/*
+	 * For now, we do not support granular power saving for compat
+	 * syscalls.
+	 */
+	if (in_compat_syscall())
+		return uvc_v4l2_pm_ioctl(file, cmd, arg);
+
+	/* The following IOCTLs do need to turn on the camera. */
+	switch (cmd) {
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
+		return uvc_v4l2_pm_ioctl(file, cmd, arg);
+	}
+
+	/* The other IOCTLs can run with the camera off. */
+	return video_ioctl2(file, cmd, arg);
+}
+
 const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
 	.vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,

-- 
2.49.0.1266.g31b7d2e469-goog


