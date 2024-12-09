Return-Path: <linux-media+bounces-22963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8847B9E9F82
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 20:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C14571882B14
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 19:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A7419884C;
	Mon,  9 Dec 2024 19:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JAyzBA/y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB8419C554
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 19:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772345; cv=none; b=ZfpbuVCrrMeQ82c1U6JwWx0f2d2VDRVw/YfDpblkA6g87ZlCjeoREBEiYzZfg1eO1Y8dj+1ZUbkks4pnOPjC7vB5gx9UlIEb+pG9xKg/9HuVFaRBE8wrI6DJCQrkUA3kcddnptx0vrW0yWGsv+60c/EwT2mxjvAU6HObUq/dVw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772345; c=relaxed/simple;
	bh=3YJ9Y+ZQdC2SGtqO8a01crBHDOxCq7X/DFwMMUL8kxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UTP2jfiPzLLVP0Qmq3JnTPxKdgMuuJr07V0A0GH+sJF8tHlPpT7pu6yGiEyGZA1lZZE09AB9IU8ztfwjw5qg9AxmLyqjLdF3htZySGdCFd3V8B8odOyA1LVeIFxG1jn/Xf9BbFT2hMAf5bMRqmly2xQ8xadzSdyEk3fe0+ErVag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JAyzBA/y; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6c3b1ee59so181822285a.0
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 11:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772342; x=1734377142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTWHjAR4u8Qk/v839F4GfzYW0oIRDw0e+cKCRcE0Tyo=;
        b=JAyzBA/ym+POLRyoUuP/5p+7uDsR9LvgdICoevXVoh9lUiXnI3VtN/Dv+21TTDDpai
         QUb+odFOe5SxIXD23+OAB2ybX/StIqpSH3ZsWWA2LlqgbIi+gPvjV3mGuNtV5s19Q+xa
         MhG+nJGF+QqUlwOrUd53NL9vBQJWQgNRDiQvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772342; x=1734377142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTWHjAR4u8Qk/v839F4GfzYW0oIRDw0e+cKCRcE0Tyo=;
        b=ry6jRtr+tlZxITlaKoO4adqxJGokCC/UeCOErLFDgv2n6o2VOigh5sH/AaKv/v0nop
         n7EeDSvjd6wbl0YULLA4158oH2aAfEdIBFL7A8k1qHy5nFG4GuTCw6hFa/uXBDilTaNv
         q8bYDEAjO8BhmIDO9GaVOnD5VY9IAX61BNDt1iOGn3Ad1RBy6Wp9gIdo1pO9V7yEKqMY
         MOiVLbPDqWdsyQYacmRJsCGnIlGODOtkwdOPV1u2UE+AWnSlVdZgaolBm2sHJ/Ueh3VB
         tlPyg9usSJ76KJ0F40TKYxVmEOm3bFPk8aFyHCXnZIE6K+uEQw4Y0FMPy0aNDpofcdqd
         vICQ==
X-Gm-Message-State: AOJu0Yy65niaCWC14Tml7k0QhiYZi730Z1f699kT+PWg7f0DK9AEu967
	YBmEf3xKN5hcGdlEVcFZDFZ3bWHuQfsH4rh/hgz/s9i75f2tXfEuFtrIhXIpbg==
X-Gm-Gg: ASbGnctCpSIBdqibsp5TBFLBnCuQNAzL/xXKOAidHo8n5/tDR5Qe5ZhiFTBdIv/AKJD
	wlbvUxaYyOcj5P+fDpuQGNZLcW8EvZhLX/xPLVN2m0uppUKh5PRyIqoVQuUFLZrAbLVJnFbHp26
	gTy69AQnYztpi/nWKVs6h6RmGybK7lRZScIcElw6lAZ4PN/Pfnpb9ikKmwvMtkxcBYH5VwA7C2J
	Km72VeHja/XAG3mFcdUjNO0TigbFweoBpt5Ox8MveSpT2TYK6LNIrYJ98vh03ZRySIXo1i06HPG
	7gHHwlXBRPy9wFnUA3Kv8dJs
X-Google-Smtp-Source: AGHT+IFX2iboYasZ2NAJeqVx58Ze6o0VlnPHCW1gi9xbgB3BYBf0YbNtsWkaDTB0PiB/STP6px6iRg==
X-Received: by 2002:a05:620a:458e:b0:7b1:4d3b:d618 with SMTP id af79cd13be357-7b6dcea6f83mr267761985a.57.1733772342090;
        Mon, 09 Dec 2024 11:25:42 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:41 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:39 +0000
Subject: [PATCH 08/10] media: v4l2: Remove vidioc_g_ctrl callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-8-deff7acfcdcb@chromium.org>
References: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
In-Reply-To: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

All the drivers either use the control framework or provide a
vidioc_g_ext_ctrls callback. We can remove this callback.

Thanks for your service!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c   | 2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 --
 include/media/v4l2-ioctl.h           | 4 ----
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 5267a0686400..068ee67cd574 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -576,7 +576,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		__set_bit(_IOC_NR(VIDIOC_QUERYCTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
 		__set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
-	if (vdev->ctrl_handler || ops->vidioc_g_ctrl || ops->vidioc_g_ext_ctrls)
+	if (vdev->ctrl_handler || ops->vidioc_g_ext_ctrls)
 		__set_bit(_IOC_NR(VIDIOC_G_CTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_s_ctrl || ops->vidioc_s_ext_ctrls)
 		__set_bit(_IOC_NR(VIDIOC_S_CTRL), valid_ioctls);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 30e32ce5278f..4e65d50bef27 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2363,8 +2363,6 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops,
 		return v4l2_g_ctrl(vfh->ctrl_handler, p);
 	if (vfd->ctrl_handler)
 		return v4l2_g_ctrl(vfd->ctrl_handler, p);
-	if (ops->vidioc_g_ctrl)
-		return ops->vidioc_g_ctrl(file, fh, p);
 	if (ops->vidioc_g_ext_ctrls == NULL)
 		return -ENOTTY;
 
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 013996c33a9e..4d69128023f8 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -195,8 +195,6 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_S_OUTPUT <vidioc_g_output>` ioctl
  * @vidioc_query_ext_ctrl: pointer to the function that implements
  *	:ref:`VIDIOC_QUERY_EXT_CTRL <vidioc_queryctrl>` ioctl
- * @vidioc_g_ctrl: pointer to the function that implements
- *	:ref:`VIDIOC_G_CTRL <vidioc_g_ctrl>` ioctl
  * @vidioc_s_ctrl: pointer to the function that implements
  *	:ref:`VIDIOC_S_CTRL <vidioc_g_ctrl>` ioctl
  * @vidioc_g_ext_ctrls: pointer to the function that implements
@@ -461,8 +459,6 @@ struct v4l2_ioctl_ops {
 		/* Control handling */
 	int (*vidioc_query_ext_ctrl)(struct file *file, void *fh,
 				     struct v4l2_query_ext_ctrl *a);
-	int (*vidioc_g_ctrl)(struct file *file, void *fh,
-			     struct v4l2_control *a);
 	int (*vidioc_s_ctrl)(struct file *file, void *fh,
 			     struct v4l2_control *a);
 	int (*vidioc_g_ext_ctrls)(struct file *file, void *fh,

-- 
2.47.0.338.g60cca15819-goog


