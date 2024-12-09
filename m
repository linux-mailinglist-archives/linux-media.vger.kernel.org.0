Return-Path: <linux-media+bounces-22962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4819E9F80
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 20:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49F70165B26
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 19:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7915717C990;
	Mon,  9 Dec 2024 19:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m/fipHAp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8395D198A01
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 19:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772344; cv=none; b=OZ/nB9lJdHUlJFQy1QxEndMnHx7RUztVpoe9zGAIuPpSdINF1y9q6QK6D/BX9/rNqqERUyl5BZePwkn/SjQ6tAG63zOkzYQOeNA8DaVvMjKzvnk8RRAOzGhML33opxLvrpVCBNUq7yH6Zx4CSm+RJwSHylM7z3fCmVMJqmleHT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772344; c=relaxed/simple;
	bh=oaCq3lFHUlXWfLBs1yLgfb1pQhfpAzznJwSy1NrE1wY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gCLt+rG66IbUxP9eF4+FZIkx2UC7AJz5MtLC7a/0cKub4ocm3CcX9RrP9XVX5MzFon1y2fcSv5sJ7K2lF5oddXZIaIx+Rway6r14fkkHkn6PA0vaQMFjysAzLqORUBReu6jjMoefZAARlUf4xZOTZqdYs6D+MEyZlH0eB2/crKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m/fipHAp; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6c6baf8d6so164524085a.0
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 11:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772341; x=1734377141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltErOm77Oh5lK6TbfQofWHlLQPTPm1Kvo+0ZzyBQyKQ=;
        b=m/fipHApLRWoXOYh7YusvwGzNf5CW5p+47YbogJlAMIOgzgXaOAdXFkic2X5Rfd02w
         /6cPL/kTauMxSls1e9w1oxjVPObxtFsaM194/hjD5vLQm42XHvbfgJK473TvFh9+yAlm
         RCFjKEq4lJ7twwDPXcwV36++P0ztVg8Y2QYtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772341; x=1734377141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltErOm77Oh5lK6TbfQofWHlLQPTPm1Kvo+0ZzyBQyKQ=;
        b=Wlir/qaMWllloTstK/H5xKNtqD8DjybDE4DxYxJmWN8W6NZ0QWHxL0NI2DZNXJeoji
         dHHPu1i8A3VUlH1c1p4KQEFGiqKVmtAoA2cV2U6O7E3gJAhU28ij2BeSkvOtWwjohLrK
         wOrHUBvkoeM/GAHfhOOKOJask2Kq4+Unb2FOa8mf/YenwsvAG0enat/j8cfj7YmxzqOK
         TBcvXin2Df9KIt2u8GHTvTfMlWOnBDq7CL8C4m+exrd/1W6feaS7XCP6Wxoodjnw85IZ
         RDPk0IqWs9laP4U5mbnMqptrb6at8pGRsP0oudhazXaKCcniQHZgseUVONlt24BAKOyG
         A6vg==
X-Gm-Message-State: AOJu0YyCPHmpbPyqpq/t7FHgaiPfu6WIceKCuPXQV8OQvpnNqn2DEGto
	3C/19RBHZL5VktD9IETeQJ5HbQ8swkbhku9ZqxiIEpYIw7Rpwvx7Fx/plKBJ9A==
X-Gm-Gg: ASbGncvFAigw7W2BJy4V8OzJohgLMFiH+36vf44GMjxvHBHo86F9b9/cvZz0P7a2QCJ
	zchs5e+JhpMSIwTrgo783FAO+EHN2g2iwuWQkL9k3Q6jJDW208q3lPO2Nka9aMOgZk8tmttWygK
	xs+2h/83n3lVD9KRw0gSVzyPJxhr9FvWECl5XOme3Mxncw0pWYgV3lrZ5oZ/mt/ebtW1mGqEkqo
	CBpDmyiPhUuBEpl+nvGgO0VOUkTdap3Gcw5fisTZCKuQ2nlwUW2nhNGcL5eoRlc6ILw6rJb52KE
	+0Oqv2n7vrsvvT0pkbXh/AqQ
X-Google-Smtp-Source: AGHT+IEC8fFJCiNRaM0A+A/h+DVBohii9gw561GeeuVFgC5WSmzaiO9D+NgO5W3/1EB4ImZzjjZjKw==
X-Received: by 2002:a05:620a:468f:b0:7b6:d0be:ca31 with SMTP id af79cd13be357-7b6de762d37mr79678685a.25.1733772341402;
        Mon, 09 Dec 2024 11:25:41 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:40 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:38 +0000
Subject: [PATCH 07/10] media: v4l2: Remove vidioc_queryctrl callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-7-deff7acfcdcb@chromium.org>
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
vidioc_query_ext_ctrl. We can remove this callback to reduce the
temptation of new drivers to implement it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c   | 3 +--
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 --
 include/media/v4l2-ioctl.h           | 4 ----
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 252308a67fa8..5267a0686400 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -572,8 +572,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	   and that can't be tested here. If the bit for these control ioctls
 	   is set, then the ioctl is valid. But if it is 0, then it can still
 	   be valid if the filehandle passed the control handler. */
-	if (vdev->ctrl_handler || ops->vidioc_queryctrl ||
-	    ops->vidioc_query_ext_ctrl)
+	if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
 		__set_bit(_IOC_NR(VIDIOC_QUERYCTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
 		__set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a5562f2f1fc9..30e32ce5278f 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2294,8 +2294,6 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 		return v4l2_queryctrl(vfh->ctrl_handler, p);
 	if (vfd->ctrl_handler)
 		return v4l2_queryctrl(vfd->ctrl_handler, p);
-	if (ops->vidioc_queryctrl)
-		return ops->vidioc_queryctrl(file, fh, p);
 	if (!ops->vidioc_query_ext_ctrl)
 		return -ENOTTY;
 
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index bdbb7e542321..013996c33a9e 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -193,8 +193,6 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_G_OUTPUT <vidioc_g_output>` ioctl
  * @vidioc_s_output: pointer to the function that implements
  *	:ref:`VIDIOC_S_OUTPUT <vidioc_g_output>` ioctl
- * @vidioc_queryctrl: pointer to the function that implements
- *	:ref:`VIDIOC_QUERYCTRL <vidioc_queryctrl>` ioctl
  * @vidioc_query_ext_ctrl: pointer to the function that implements
  *	:ref:`VIDIOC_QUERY_EXT_CTRL <vidioc_queryctrl>` ioctl
  * @vidioc_g_ctrl: pointer to the function that implements
@@ -461,8 +459,6 @@ struct v4l2_ioctl_ops {
 	int (*vidioc_s_output)(struct file *file, void *fh, unsigned int i);
 
 		/* Control handling */
-	int (*vidioc_queryctrl)(struct file *file, void *fh,
-				struct v4l2_queryctrl *a);
 	int (*vidioc_query_ext_ctrl)(struct file *file, void *fh,
 				     struct v4l2_query_ext_ctrl *a);
 	int (*vidioc_g_ctrl)(struct file *file, void *fh,

-- 
2.47.0.338.g60cca15819-goog


