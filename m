Return-Path: <linux-media+bounces-36310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C89AEE084
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 16:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FAA43AFA89
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 14:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6171E28DEE8;
	Mon, 30 Jun 2025 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DABCQcdN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED8028D829
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293235; cv=none; b=L1GZSHDB8z4PogA4DbjL9fBo78c6b0DKrrG+4nWYhxQqWegbr3pGtdTj4sTz3AeAK6DxewNKly8DppLM9bwXx9hHajPV1WBKFbze8WbeU7n79+cNn2oPmSStOyY/3fwXdgap75OvclcoiGdpC0z4+Cm4VSROIj/v5W2SBzeSt1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293235; c=relaxed/simple;
	bh=M4iJm9plTTflFPunOkSmnLashKdwUdy/6f2HU79tXu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IYeoIzBJ2WW/fdT7d4H20nuxzr9Ov8+sCB5LluuLk+Z4/gj/8e1m54WPlDVlZWIvLiSpgjx9vG3HguAIgupTDHxkq878DO6jo6wzHrnRyzVAu0Q3qRVl4onUZcp5K/D9iNV/aH/WWPBaQx0HyzqeMY2zXB8xNpUhlM/Vprh5GtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DABCQcdN; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553dceb345eso2582744e87.1
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751293232; x=1751898032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53U0DriXJKKU6AjmS/GbGBXA7AhDrFUGqACgSJAnLKQ=;
        b=DABCQcdNlfn/h2NxFRQwRnb257GneGPaYoZz8xaD+/G0W8DqL/PC3DBow43v/m/Ihk
         UWaEIw/TecrRtDFSHfcJzmAdoAus8N2ejM3dUZAAITi4BnZKzb3X6KdplduReNwp0XHY
         iNKg/EDkBnzwREAYUnbOClxsQ8mlIyPH/AcT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293232; x=1751898032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53U0DriXJKKU6AjmS/GbGBXA7AhDrFUGqACgSJAnLKQ=;
        b=GUCA+Fl2s1i399g0OcHh6of1p8cSsXO5u3M0xSXhyLa1hQXQEqTeaeAuF92xz5+0xU
         usN4p5SNEQ/NNZHyDg+YsqfeqnSIjtkrkzJZHWkS5PzO4zvOt0Uc/nZKHM+X8EL4s5Rd
         c/W/+fUPj0tMHxNWGZY9SxeMLdGoYC7Rsbpx+2WOr5QnWh59qkevzsmMALUPhU79wL5j
         tkv0jKWf1Z9F6liPdCtLBP/mB1SX+0qffXneiOtKFDnER1fHkiYXeBB5aj5m23etGdmz
         3/pZswevf0R9/XvyExxqNe6+YT62MZx2f0ZiRhxJxbVNnlvC0qGmEfSmvsGX5HpildsW
         11CA==
X-Gm-Message-State: AOJu0YzLaXISyCNYCuwGhoCMwiD1aDd5Ndk/GPeZhRoYQGUKMIf/dqPM
	BzddmJP7+hEDrmeqxQr22cB1apqW5DE3zRS8//UNcBkvpfs5jRgKsMGbuRjhGCXY5w==
X-Gm-Gg: ASbGncsJyBfZjgI2w8RHCNbxA+be84AQUwR+YpKtkujsdczY0vhZ4wLhvGizHvGvtKy
	6iKV3Nh5l8LKxjXPziRwlqQrYQjV3kxGQQbHGC2bCTqpGar+qYi6eVhl2u/6zn4BywhC1b0ZI79
	RQA64boZs3hA40EjFR8fFEJA92i+4aK3apteQ3EB3OshRDAad7Vssuz2VyzqPZWN7ZfEnsbljjI
	YNtL8nk4mGQfQ8pvyFnW8gL6xFRRan+QCwWP+D/8kbc/EOlGdMHw0ReQPolQuJ+YGtQUKZvE9Dz
	hq/mzBuJ6m/xxzAXbSX6bjYKG9ZGa/XAP0acgDK2PkL+rUk1I6ov54DFheYpHXL044SQmc2PVxK
	nXN3x3rigXr74oVcNs8yERL3PqxxZyOoSE6/eaefMvw==
X-Google-Smtp-Source: AGHT+IEyEk+IFI/NztfDlgnMuyWUGlQ1F/bRW1nlXrov83yP0tHVCKZPdgUeT/hlzVW+RcxmBJvWqQ==
X-Received: by 2002:a05:6512:118a:b0:553:2dbd:6a61 with SMTP id 2adb3069b0e04-5550b80c2c7mr4349117e87.14.1751293231929;
        Mon, 30 Jun 2025 07:20:31 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d8ea8sm1432363e87.210.2025.06.30.07.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:20:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 14:20:31 +0000
Subject: [PATCH v3 6/8] media: uvcvideo: Do not enable camera during
 UVCIOC_CTRL_MAP*
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-uvc-grannular-invert-v3-6-abd5cb5c45b7@chromium.org>
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
In-Reply-To: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The device does not need to be enabled to do this, it is merely an
internal data operation.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 7ab1bdcfb493fe9f47dbdc86da23cba98d7d10ff..350cd2cc88f872d2e8bd19e2b8fb067894916364 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1178,10 +1178,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 	void __user *up = compat_ptr(arg);
 	long ret;
 
-	ret = uvc_pm_get(handle->stream->dev);
-	if (ret)
-		return ret;
-
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
@@ -1197,9 +1193,15 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 
 	case UVCIOC_CTRL_QUERY32:
 		ret = uvc_v4l2_get_xu_query(&karg.xqry, up);
+		if (ret)
+			break;
+
+		ret = uvc_pm_get(handle->stream->dev);
 		if (ret)
 			break;
 		ret = uvc_xu_ctrl_query(handle->chain, &karg.xqry);
+		uvc_pm_put(handle->stream->dev);
+
 		if (ret)
 			break;
 		ret = uvc_v4l2_put_xu_query(&karg.xqry, up);
@@ -1212,8 +1214,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 		break;
 	}
 
-	uvc_pm_put(handle->stream->dev);
-
 	return ret;
 }
 #endif
@@ -1226,6 +1226,7 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
 
 	/* The following IOCTLs do not need to turn on the camera. */
 	switch (cmd) {
+	case UVCIOC_CTRL_MAP:
 	case VIDIOC_CREATE_BUFS:
 	case VIDIOC_DQBUF:
 	case VIDIOC_ENUM_FMT:

-- 
2.50.0.727.gbf7dc18ff4-goog


