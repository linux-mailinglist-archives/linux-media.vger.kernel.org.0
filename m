Return-Path: <linux-media+bounces-25585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0253EA25972
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 13:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA22518850F0
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C891205506;
	Mon,  3 Feb 2025 12:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pwh+EB8k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E50F2046A6
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 12:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585656; cv=none; b=jt/3OPq5yzMKcB9jWdNG+c7Vr+5KLFrdeX5bBMqvySMzFCKdS5X2bxIb+vY0yPIvUojOBjp+OTS+QsOgldW6iZu4J2cBkQxHVUPRZu3adpwiOUVl2Rkjjc/7toY+Vz1CymWaQDIHdyROkdzLTDhng7OAPYpvp3BXhxfC8CF9kG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585656; c=relaxed/simple;
	bh=miU1oeGfq2puBnEEsn/CIUWxyN3yf8vwEyCqnsdbUQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KGn4KpXLqXQ1f5ctUvYyEAoRh8Qhg/hcCEJ7D8g+s0vxwPTj4zujwpUCH0EiGG9fNNaTgxpNM0Jz0G6LorGJ563y9viuAgp4WZGVw10PRsXc3deiFzrDlrb15SVXeVB10GnEHtJvVcrfuA5YEuBYKyiwehdvFbm6nNT4pnNU27U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pwh+EB8k; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46785fbb949so50596021cf.3
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 04:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738585653; x=1739190453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtqj4+IbNmzvRx6uGlPp8wYTVx+vhgS082GDqFP9Plk=;
        b=Pwh+EB8kzyWT2kvphPFr5tYDUxKzPvz0faPjH/tAW4GST1pP/Ns5QybJsX6ytUcK33
         df12l+BWiSpROh8aHuaArKaf40MEfqgaa6OJNM8/p+0tU5fp42AP8LFRt7oY0yFrJI0m
         GU9xgNeAsULPtYUBqeTas3J1tC+AOKDyi2H0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585653; x=1739190453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtqj4+IbNmzvRx6uGlPp8wYTVx+vhgS082GDqFP9Plk=;
        b=Y1VXJ+iLy4lpJbxn+ape69CiqPxVhRfjN32UN/sTCWmTle2dyYDbIvc9KaqKjoc1hZ
         +oDHIUv+Eklo2vLp4JpvaimKE4QZeSMXrQ3KLJ6CH+oLSTPEQRLfonwtxDCgEvTUUND+
         1cfhu8nmIa7Yl5yFS1zR5F36mwljUSr9XV6tpsYXcY55wxYUw8fWutfzt+qJtrPa8X1A
         BfdRJmRt3rVIErP2HHmafEJdXFPX3n8pr3jHWHd/k+nFF8ciTZV3j63mzdn0P4IVt11J
         6CUJtIKlFAECZ7qZ3zHIy69+loe2RQxyd8UGCsyuvt9ezeU6GtmzJm5KMaUXsqQUCG9n
         SKDw==
X-Gm-Message-State: AOJu0YymlB9yWZGaoj6p7UpIrhqbD7gdyQZvOlXp+Bo2mMOPbxA1Nepy
	5wVI2Xy986D85TJ6jcsXqt407Yrqq6Cr//mpDGx+2Z9SrhyK3arXdCoBxPTVUw==
X-Gm-Gg: ASbGncu+PKgUkloMe4CS9amkauQytqlZIry07YsGJh0pW+7Cil+4ls+od3U6EDtKEIv
	m9W/wwT12DuPEyGLn3CO4ZgQe5wg6JtI6k6Xkm5pkMF+yFlHLfClvorlIhFgNZ7SN1mjHEzCwg7
	ehVviq3PQgJJIpxtMCbiNG/4NLK3UEygDynkZeEkuaoCYkrRWhaqMcBkGg8yY9/8Sxy+ymfEtNL
	mK4ILWGQ21U/4t3V4c2D00hOMyFSU8cerwABE7dJfTSv8imVZyidP15QBi7g1VuClq6+8XwrOXy
	qDIf0sj8DWLDqbiO/hqAa044gIHyHw1qSaJBABO9W1oF/C5W6tlj7esVb5t8HTImLA==
X-Google-Smtp-Source: AGHT+IG3CpIs4JsMUIfUgUI2ZmvPf7JQ0NDzYOoU8ixfzLE1RSI9XcehHCjZaBSO3YAMEr3FOh7yyA==
X-Received: by 2002:a05:622a:210:b0:460:a82a:39a8 with SMTP id d75a77b69052e-46fd0a97307mr341265011cf.13.1738585653202;
        Mon, 03 Feb 2025 04:27:33 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e0c12sm48240941cf.37.2025.02.03.04.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:27:32 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 12:26:24 +0000
Subject: [PATCH v2 5/6] media: uvcvideo: Make power management granular
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-granpower-ng-v2-5-bef4b55e7b67@chromium.org>
References: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
In-Reply-To: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Now that every ioctl takes care of their power management we can remove
the "global" power management.

Despite its size, this is a relatively big change. We hope that there
are no size effects of it. If there are some specific devices that
miss-behave, we can add a small quirk for them.

This patch introduces a behavioral change for the uvc "trigger" button.
It will not work unless the camera is streaming. We consider that this
the most common (if not the only) usecase and therefore we do not consider
it a regression.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 5d6935539e0a..90ec6f0015ca 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -631,7 +631,6 @@ static int uvc_v4l2_open(struct file *file)
 {
 	struct uvc_streaming *stream;
 	struct uvc_fh *handle;
-	int ret = 0;
 
 	stream = video_drvdata(file);
 	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
@@ -641,12 +640,6 @@ static int uvc_v4l2_open(struct file *file)
 	if (!handle)
 		return -ENOMEM;
 
-	ret = uvc_status_get(stream->dev);
-	if (ret) {
-		kfree(handle);
-		return ret;
-	}
-
 	v4l2_fh_init(&handle->vfh, &stream->vdev);
 	v4l2_fh_add(&handle->vfh);
 	handle->chain = stream->chain;
@@ -680,7 +673,6 @@ static int uvc_v4l2_release(struct file *file)
 	kfree(handle);
 	file->private_data = NULL;
 
-	uvc_status_put(stream->dev);
 	return 0;
 }
 

-- 
2.48.1.362.g079036d154-goog


