Return-Path: <linux-media+bounces-22997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9931A9EAC21
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A58C728F722
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FF122333F;
	Tue, 10 Dec 2024 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h+q564Bb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCBF215761
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822951; cv=none; b=VQTfjOmhKDbarm6cn9YqmMT44OxjaQIURK6ZGWSPVmr8V4mz/f0+pvZiMJzmKB3SblxP3e/rr+GCzAYX4QPCKRZ/7dV3LFMamB8SWKWEjIqgeopFiWISorzTDEK8ne10JzaQNH4m0ZTZ4ppWAk0H9Qx56QFqnEWD3MCCA6Wmkk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822951; c=relaxed/simple;
	bh=oBcqkfXM7E90s1taQvAsnIcQGP+0/edriRflHVpoMcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbDGXxfk9Z8nV14Bq2mGrAlkmaaIgxpw9cn0PexevQUcc5St4QE9yTtlcWTVTnTk+DbuK64RvshEa+RDp71tG5/QAFQ9Z5X78JNEXy1TJnfLH/zFNBdDoV5qW9MMBHE5PcIIdZmjehO87uQP2GtpXxE+2Ak1OBF1HVfx5kesGoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h+q564Bb; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6c593e8faso179440085a.2
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822946; x=1734427746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fauP20HSTE8MNs9sZtafcLYAmxh0dWmJO0jdKtoSo0I=;
        b=h+q564BbmKoNGPi+38Y8l45bw8AisgX31eE1zNL5+UxiVINz2okuh3tjZM1FwWvWuY
         XILhu0GHq3gKEW0eqU32ulUac03Q+EbhBTB+6RP6N8OZItddjZ87itOV8BMncpBP0C2o
         t+CHmzt/1/9iRwVftnnoSbzbi5bBg7BoRCrJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822946; x=1734427746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fauP20HSTE8MNs9sZtafcLYAmxh0dWmJO0jdKtoSo0I=;
        b=bvMcidYCXnu22U0nsB0ExnRTmtmICfBoT5vGNjk07HApNY+dXs7IVf6ic07FBrNhFv
         UVYr4YlJ3Y3HyI6EIlyU9+VTM4z8EEfvM2tBd5hZk5c+7lYajLeF7cu+5ex7E3BDoNnb
         lkTgyB7y2U1vmEpF9EHYdynfX+SqyTbGUSN4MqYGA1L+D3mIioguE9hIiUrcGHsU3DHG
         lN4AWkBFifq6CNOvM8yJMJDFrCMLRnaswFFBLGalIPw7O0YQX0smAoc8BbGC6Bmqc8Um
         esNig/xVQjQfrgN4pOKnqvyGh+1lwjGySkZzc3aMotHJ3UZTKfsuHObLa8XHRx9KNe6/
         qzWA==
X-Gm-Message-State: AOJu0YwkY9mQq8ghmjrgVGaszM5TGj9+J6+fJnxPQ6/h7DSTj+QbcSv3
	C23Zz9VqLokHJq4rosHyjwzQIGNvXvO9vwtM31bl9/BKayhak77JrzNpOOO+ow==
X-Gm-Gg: ASbGncvVdGB8TcQmtDUqU5g+20uam/RbHxcutpFI1M5OUiGHr0UxZLX0YBIEpz670c4
	lKACC/ql1dTzxvAnMNKSSMEZs9aZqcCifgBxbmoS39JSFWOsT4K9AcUvOvSJoD+BDZCY6vzw+dx
	13zcSGlDhTCCK8RUsxB4yrEe/6aKtzqsmT3AYf2Nu/bhrrhSjUq7zPKwy1bpjCy95nnBLktz1RP
	iONwGhdXM49mKYaK++c4k64wJGwSJqSbguooZvvLjmcIaPS1YTAYhXE7YYPlGftQu2wQ14lqqXT
	8jOkL81BaMc0gWCmGXidlSzO5LON
X-Google-Smtp-Source: AGHT+IEnAKwp90vPjCXMeqd1g8B6cI75StK2j/sdcO6TCrMFGNndcgYh+1KjE8474PP7wfMI8TymRw==
X-Received: by 2002:a05:620a:2a06:b0:7b6:deaa:3191 with SMTP id af79cd13be357-7b6deaa33cfmr302944585a.55.1733822945932;
        Tue, 10 Dec 2024 01:29:05 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:29:04 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:54 +0000
Subject: [PATCH v2 10/11] media: v4l2: Remove vidioc_s_ctrl callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-10-c0a33d69f416@chromium.org>
References: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
In-Reply-To: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
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
vidiod_ext_ctrl. We can remove this callback.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c   | 2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 --
 include/media/v4l2-ioctl.h           | 4 ----
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 068ee67cd574..b40c08ce909d 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -578,7 +578,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		__set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_g_ext_ctrls)
 		__set_bit(_IOC_NR(VIDIOC_G_CTRL), valid_ioctls);
-	if (vdev->ctrl_handler || ops->vidioc_s_ctrl || ops->vidioc_s_ext_ctrls)
+	if (vdev->ctrl_handler || ops->vidioc_s_ext_ctrls)
 		__set_bit(_IOC_NR(VIDIOC_S_CTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_g_ext_ctrls)
 		__set_bit(_IOC_NR(VIDIOC_G_EXT_CTRLS), valid_ioctls);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 03a62fa960b6..aa31678fb91e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2411,8 +2411,6 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
 		return v4l2_s_ctrl(vfh, vfh->ctrl_handler, p);
 	if (vfd->ctrl_handler)
 		return v4l2_s_ctrl(NULL, vfd->ctrl_handler, p);
-	if (ops->vidioc_s_ctrl)
-		return ops->vidioc_s_ctrl(file, fh, p);
 	if (ops->vidioc_s_ext_ctrls == NULL)
 		return -ENOTTY;
 
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 4d69128023f8..c6ec87e88dfe 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -195,8 +195,6 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_S_OUTPUT <vidioc_g_output>` ioctl
  * @vidioc_query_ext_ctrl: pointer to the function that implements
  *	:ref:`VIDIOC_QUERY_EXT_CTRL <vidioc_queryctrl>` ioctl
- * @vidioc_s_ctrl: pointer to the function that implements
- *	:ref:`VIDIOC_S_CTRL <vidioc_g_ctrl>` ioctl
  * @vidioc_g_ext_ctrls: pointer to the function that implements
  *	:ref:`VIDIOC_G_EXT_CTRLS <vidioc_g_ext_ctrls>` ioctl
  * @vidioc_s_ext_ctrls: pointer to the function that implements
@@ -459,8 +457,6 @@ struct v4l2_ioctl_ops {
 		/* Control handling */
 	int (*vidioc_query_ext_ctrl)(struct file *file, void *fh,
 				     struct v4l2_query_ext_ctrl *a);
-	int (*vidioc_s_ctrl)(struct file *file, void *fh,
-			     struct v4l2_control *a);
 	int (*vidioc_g_ext_ctrls)(struct file *file, void *fh,
 				  struct v4l2_ext_controls *a);
 	int (*vidioc_s_ext_ctrls)(struct file *file, void *fh,

-- 
2.47.0.338.g60cca15819-goog


