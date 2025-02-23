Return-Path: <linux-media+bounces-26727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2888A41137
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31367175D9C
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BCE20E317;
	Sun, 23 Feb 2025 18:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L1bQxXoL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B120E302
	for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 18:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337180; cv=none; b=ebPyuBQtOaVTTe6MTRC+Ek65FjkX31ujNtI0Ubdixz8mpR0Bz7cx/EQBR601BURAjcg1LfJUx3OT6tPsM7FglKh8vBb2WC3DdyoLgxyid5JKBgBGkOqfncPpAyw6y2KH721BbBZlSMnghe9r0ICpmaowSA9YuaSZYNR6Mkiy0zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337180; c=relaxed/simple;
	bh=xXpFiA/NyUpbzOvlTbdhsbIOHNibM6ftIRafynCnP+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OB1Jq2iLtRHXTskecVjFq6KLP+WKj6HP/kdpUKA+7E3aEFXq98C5xOvY+TH7XvXWO/IFdFTIyA4St/u1FrHxcyij+xBLH4np3kA/Nnu3W2rrYX064ntroTdw5fVrifYSFkqLufecxWQIht+L/YFcyN9dASUnXHErovOsw9Li0Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L1bQxXoL; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e67ce516efso30558136d6.3
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 10:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337177; x=1740941977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iyWdZqEotC84XlO1OAQy2WGSlw/iOHY1m4U05QqJMk=;
        b=L1bQxXoLt2OtRdRHXyaQPEmo2MINA6Zg9ZFb3/iKlX9xOfCpAh/23q/FU/ZTMwtylx
         LOQ4G1n3csGuaqvZJ+qXylJezC8oG9eZsDigh+nnhgX4tMzL8KuPuC+K9sZzb6Jx3DBB
         3uZn/idSkZ/5Q7Qzq/Hkf92p8S1rudjutMxfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337177; x=1740941977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iyWdZqEotC84XlO1OAQy2WGSlw/iOHY1m4U05QqJMk=;
        b=l3zAEjblDYc3DtlGNlevoYQy4ozzG4ynExubyNtvU35X2sLCFesxhVaprX/L69hzP0
         1TAdru9uPIVcIKoNsPJWNx5YGxFckr2FXCAeCj2PV0Aykyib3iGEUA/Kn0OP4ufNvUbQ
         Rv01fV/nK09a94U+WJ2TREgbTvgAxe2mTwlfBG+ZydNNS6HLoKnZBzqxZeZ0Pbz5IMrm
         H8ZEDZH+8DGLyrDvas2I7FNcWSrkUqFd3Qo0pl5R8V4dNngb8UQkZn9QTqmPmx2ONNge
         EGOoOcc6kvswsTGP8CinONFoAif3p9xKxpWF0qippZm42sqU2m+4yxOf2g0cPzbUcyjr
         xbnA==
X-Gm-Message-State: AOJu0YxHemjxZb4nueNzofiwruUVsOwYZlwYKWTsKC62HQPH1dkP4nZh
	OW7wd09gl0sLXGiS9TTruqQ8F+GvEDfgWf0K8811ES1GzXVjcwzcVQeTahH/Aw==
X-Gm-Gg: ASbGncuPJ6xvnufnWmGdKRNebIDTSaQqBXzkX1R8m/COS4jjmK3oADm/VRBmas202y5
	zw+owEzAjbPZ2qt8WfXOL/ZEwoCy2qFwyHjlTD2/lIZ6lx+vSEuAtj02tYVI3i0KTFh4rJRlXPB
	bbYiXuHadgeuqw5FMlTlMJ9bErdIfTKGO3CNAzi8UT5SkvwCiYW50jWVqVkcdqVVHngjoJ8ncO9
	PxtvKlkzMxbs5DoczA9dfDd9jF4juvJiMNaS4UymFCrd6vyxUOsTLv8Hl59zFDnOoMl3EsxuiNu
	RiV9IjgtiOU9iXrGw/wzxp3ACG8KVWbobextO7qAB2CI0x/wVT40WbGUONrlATf0Jl+GcNibad/
	qRAQ=
X-Google-Smtp-Source: AGHT+IFmA5F6ZvDlLt6gf9is1F56bMr6yT4/exI4Bz1fcJqcD+qyUMAxAufOoGLCX4weML9wR0ltAg==
X-Received: by 2002:a05:6214:daf:b0:6e4:4331:aad9 with SMTP id 6a1803df08f44-6e6ae7c96e2mr137768826d6.2.1740337177325;
        Sun, 23 Feb 2025 10:59:37 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:36 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:11 +0000
Subject: [PATCH v3 08/12] media: v4l2: Remove vidioc_g_ctrl callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-8-4292911cab6b@chromium.org>
References: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
In-Reply-To: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
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
index 48ddeb01e70a..d6af0ab0d7ea 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2378,8 +2378,6 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops,
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
2.48.1.601.g30ceb7b040-goog


