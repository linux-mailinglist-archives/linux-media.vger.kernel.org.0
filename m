Return-Path: <linux-media+bounces-36386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B352AAEEF2C
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 08:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF9343E17CA
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 06:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6E8262FCB;
	Tue,  1 Jul 2025 06:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R3TSDtgQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949F51DF268
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 06:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352331; cv=none; b=fW30XDFAJXXzTxEAHCly16s+8D2AcFn+L2XyNDwjrsVKoHUFVmCfWMb8wo4mQH2uoSVMxpJd71iKaQo7RCv6qd+IdY5qKvtMbdFABQUqWFjeSccPWmAtl+C8lifzGAfCMLIwKJBd4cLggP2+87RDUVuNhSR7yYW/nv3mvF2mhAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352331; c=relaxed/simple;
	bh=QmZpnmLlh6tX4XaANLS4O9Y/vCKXZvopPBJCBX6jXB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FLkpB4StActXKZg2XGuuK+kfr0V73r3lB7lW7EtvL70kAuJdM44cQ5KI/1MWtmUHJLpqsxJ2QgNEdROIEG+EtCI5qBokrwFcCC6tvNAwzljMwTvZgIJho3wI+DwxfYk77hAWUxWJQ7fXg+FC2ZrKhLpR2hgwOJUzhKvvZXUFUIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R3TSDtgQ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso6186309e87.1
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 23:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751352327; x=1751957127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mD/ZZfdswixudH8eqV8nMYQf/9eq1jLBXUnC6Jy/I1E=;
        b=R3TSDtgQZ+7xQlc6edqU2udtstZq4sCOUKPPxSwmA49CKSkkEkg/vE40ks3HEmDlHf
         E7Dp32fowhMpNZkEnZYVX6IoVEtp8h+9F0znPmxrPZGvSVd7ebe5HlPh7NkrNnydXYsM
         cdeNUE8/Wh+rtoGK8uludInZtWaSwZFBVAgSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352327; x=1751957127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mD/ZZfdswixudH8eqV8nMYQf/9eq1jLBXUnC6Jy/I1E=;
        b=njv2Yo+eOkNZJFUR2BPG6W988ag11W1VHi3WIYVseBP3Nm7a9XOYXMwpAeGX0zUM9J
         v6cAi+lu/4dxEn4uCsb+bD+r2Z5WGl9YRMxkqft5Qhc6pObS3HaXDeKRnmSJ7Mtw8jSG
         q8K9FHe/v3aPwEoJVmU8aY0kH5KEjdZ8t8TCxuSgwmWWUED/OhYoLHq+q7izw0FRDvbP
         QU9AwQoYW0eNnPoUdoXngoJSQUsV/MIieBE6CICrATw98nsUfiIzs8ElKfX+xLMmuL4E
         eV6dEc1Q1/Sm7ScWQUkn5nzajjSo859T9oDTqlnXMXqaiFDYZ/dNG5C6v690/orI9noV
         PbiQ==
X-Gm-Message-State: AOJu0YxPfzHK/I9Lzu7llDjkqruAmWJPVSSjfLm5HdOw5LxKJ1DH4XLC
	Sv4EBrSix/YyumWsvvh2o7Y9MdwHa0aL1/n4IPkiTTqxbSITXaiAHp5zcqmz1bBGKg==
X-Gm-Gg: ASbGncv4uROY8THJq4IKC5UEghlDekiV2b1/SwnA4JG9vaBhmTLDDdBkgp/17Whn9Zi
	vEhMIIHehzIF4QCtLLaB56q0G3eExJtG/KyzQSBj6SouQgZdF0dRQqUX2S9eRZaEs3mJ5v6yHMi
	KQ/R26E6HaxTJptX3OUNMx2BewBzcjRDngzFnp/HTGD71mS5tTKpSA20kYnq9eFaFREaZV1tht1
	tU5Kixp8ddLcZs/11GVrMryVvhq1+C8lTMUYPXLB2r7HEvExtxVmFqImLShQHsiNTPYtCmss4VY
	JCgQWPo8GCiChXktDYeX2oAYqDBvCv1ljsqJkn6qefnuwhsTKKhKv/qVBKXO8R3soy0xjtrfrau
	iUmawqJ1+/wvw6+SrseQjiwnET9rU2wvLlN4bWY0dcw==
X-Google-Smtp-Source: AGHT+IHcvZzYcxMuIZSTWN1rrGh8R7B3bfUeWSAMkh500L9Xm26tRalN09L/Awjdk+uRi9ZggZqHFQ==
X-Received: by 2002:a05:6512:3b0b:b0:553:abd6:cd3 with SMTP id 2adb3069b0e04-5550b7e96bcmr4895630e87.6.1751352327508;
        Mon, 30 Jun 2025 23:45:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1704836e87.248.2025.06.30.23.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:45:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Jul 2025 06:45:19 +0000
Subject: [PATCH v4 7/7] media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM
 logic
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-uvc-grannular-invert-v4-7-8003b9b89f68@chromium.org>
References: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
In-Reply-To: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hans@jjverkuil.nl>, 
 Hans Verkuil <hans@hverkuil.nl>
X-Mailer: b4 0.14.2

Instead of listing the IOCTLs that do not need to turn on the camera,
list the IOCTLs that need to turn it on. This makes the code more
maintainable.

This patch changes the behaviour for unsupported IOCTLs. Those IOCTLs
will not turn on the camera.

Suggested-by: Hans Verkuil <hans@jjverkuil.nl>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans Verkuil <hans@hverkuil.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 52 ++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 7ab1bdcfb493fe9f47dbdc86da23cba98d7d10ff..160f9cf6e6dbdbf39e3eff56a5d5ea1d977fbe22 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1222,36 +1222,36 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
 				    unsigned int cmd, unsigned long arg)
 {
 	struct uvc_fh *handle = file->private_data;
+	unsigned int converted_cmd = v4l2_translate_cmd(cmd);
 	int ret;
 
-	/* The following IOCTLs do not need to turn on the camera. */
-	switch (cmd) {
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
+	case UVCIOC_CTRL_MAP:
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


