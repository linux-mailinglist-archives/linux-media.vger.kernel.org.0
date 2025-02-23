Return-Path: <linux-media+bounces-26729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1275FA4113D
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3FE61769E0
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F55A20F090;
	Sun, 23 Feb 2025 18:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oVcWpjyj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0379020F08E
	for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 18:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337185; cv=none; b=MzZbN121L4uyWHagtMhwf7phXbdjvbv700fo5m+9ABO/flwMjsn34p/hxhEj7mIUkTG3Ck6ocVBGhZG13wwZq8FkWU2uikm643s7pDG2/QQ9/cPh9O2Q8Mb197J34lyRcaIaNUxWr9XQ/yE9WWFutm0pOXi/PJaeUVZ2SXnEbl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337185; c=relaxed/simple;
	bh=R+jYJua/JoNmJtSkvaDUD0DjudTsHKGGp3KP+h8MO+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uug5JOp42IS1PMLo7OBU0fbDp8Acm3tU+kL4DYjV8qd/75duE0/ayVkKJzS9KJP8T8AjFMyutOQ2ig8DwbZ0CWE/Uf+3RqOi/gkDi1isRhwIRP6S0tknjojFgwS1aXB2AHrNDjqQ9fdTGLXQGN/xhduV+V5pVyx8pN3g0aHChsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oVcWpjyj; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c089b2e239so406879885a.0
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 10:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337182; x=1740941982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTHD0WBrVxKMoHAJFWLjBpuZYRSXtcELoY8iTxveD40=;
        b=oVcWpjyjRoujNzYd/fWacYd9WSR4WUuEELJXzBAkBGTi6lx/H2Nhd9H4lbYV/KPTBp
         bnEDUt5tmpD/x42YXopOIIRULNqYyR2pe7oPtGdMpzZrNn7FvRwQnPkvb6VTc/BWkeRz
         nbjmTD4Ge29zWLroV35B7CPSA62jOlvjuW6ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337182; x=1740941982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTHD0WBrVxKMoHAJFWLjBpuZYRSXtcELoY8iTxveD40=;
        b=YAyqFaOXxNavs/hw3Hpq4pl9tlUMOrFojoNcMzI1T134uTzNgaHpOCYpDiPXxsB3h1
         JfbS/dg2RYEvVyVUePdgneBBBdx4Dv9y7YIgMuYGXA/Re1vbBjBULDLVvCGBUfZoi6Vl
         CvlG8KrkM3m5dbdh6x46GL3hfC3YO9AD8q2siVPKWK3mpnSg9zTHff7Hwgr9V2W5MdB1
         h0cNVeZSmoBchAOKr11F2Dh/7Nl2Ehy9I+I4Ssxyajbxgiodm3mvNGwTnXFoe2tRygt+
         IKMvfV5zn87d1XI3gGwdADMFSudfXYxeuLK8suvd54s/F22872uUBbhV5hh0nEkQguGB
         wEdA==
X-Gm-Message-State: AOJu0YwVrk6WF7bjZofEgoMixd/0/3vIOddotcttRPuxZfgLaaOTJMCw
	An5WQy17/uvkGBYc2ZC1PTBjDyX3EswkwoZTHPzfif5LXnprmHGww63OerBuxg==
X-Gm-Gg: ASbGncuifW7ehp68KZE7b43KYFpV5ULEMoI5nbErxYyD5sR9mVnFxx3mGJo3eb+aY6c
	UPjAby3YbjZr8i7XrAgzrtklxjvM2HEwnKYNTGyl8oiEbmHTH/R2db/NGFROmu9TNqD7InDD51p
	Ey8I6bPgOvIB5aNoKVMJgFNyw7OZwkme7W6R4N3jNW8kd0l9vCsTNg4Sh/o8Ogl7c/tJSGc7UwP
	GACxc3DcMC4ZU1+7nKu77o+m+5HQOpmVoJi3cbxQUBxJTRis8h7w6HsQDDxGqpP2XPIYghDStc8
	OR9U8APNBzc3Z4t+ICYPCTzM+vAwhzgZaS/lDPz0MZZchQOZncGn0U/B8t43MIs5YTl5BlXYE18
	R71g=
X-Google-Smtp-Source: AGHT+IHMMtAKUl1nnqWjm92ELMXJMqaYYhbAnpTq7xf63u5qZkQjjXTU4L/aQ34kAl2TkpYkioCZdA==
X-Received: by 2002:a05:620a:468b:b0:7b6:c324:d3a5 with SMTP id af79cd13be357-7c0c227c7demr1840363085a.19.1740337182001;
        Sun, 23 Feb 2025 10:59:42 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:40 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:13 +0000
Subject: [PATCH v3 10/12] media: v4l2: Remove vidioc_s_ctrl callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-10-4292911cab6b@chromium.org>
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
index d6af0ab0d7ea..fea53b419351 100644
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
2.48.1.601.g30ceb7b040-goog


