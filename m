Return-Path: <linux-media+bounces-22965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8B09E9F86
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 20:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31D07282F12
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 19:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883C219E971;
	Mon,  9 Dec 2024 19:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="esE9m3ti"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41419D075
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 19:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772346; cv=none; b=SCB4Yq6UPLPK/e/dqUwcwE1G+wBE7wG8P1LZ72h3BKKMIy1WDJLtnnONYsNlOrYkotwsrzvEl0ENKIGhLLYHZ6nxCaXHU7l99mLdD2bvip6ZzTH27uiXH/QsSoBsbGctDowcmdB75HhHkfnLuxsL9y87YMRmLcHsEHnJ5EbhjBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772346; c=relaxed/simple;
	bh=xfUwtSBU2RPjXRdqhWZRl04Dp2rWNk2bKx3bk1pDlLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RTJNk7narwB6NdG5NAQ58h4fPdJQ8VIadlaOBzkPWZaS/3xekBzqWsHjnOwDOKpramOr6B3SigZ1FC+DEHe4pShiQ80t/XqL/hhoYuudkzTkvW3ULD0w0p1U2pOXq3q70XRnUSNYPcqw1WstNAaPJQ72j2jxmW/qmHSewBe3tn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=esE9m3ti; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4676f1a43dfso5859671cf.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 11:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772343; x=1734377143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9/yEI3m3K/0zf7XJobUGHsXsYeP/0tT64hyQf5D30E=;
        b=esE9m3ti2XEeRVYi97pW99i/YHLerhGwRx3Qtba/kQtVKU5rSUMTfgc2JGXsy9C+2N
         O0zMu1ORSp6ycYAk6QWV4mDuBUsW9qYPxOB2DBMAeKgae0cQUNgR8A6Z3PHnSBvYqnW7
         XzUSPjH9wsbzGjk37tVALwJAc2CIH4xnjbnhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772343; x=1734377143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9/yEI3m3K/0zf7XJobUGHsXsYeP/0tT64hyQf5D30E=;
        b=cEIGeMIHKHfiIZDZk2tSA26DjtbaiUGGdVpxGxUikFPwHQH/DD1i6zR2KI95iTcW1z
         U0Dsi1q/6PnjsW4SM8DnQtEyhUJMxeXKkq1LTDPpXEHw/xTNQ5sn0VMIvwA11siGZC/I
         IPOuOSKtbLQWgrIF4sXDt0rdAdpIQLNC2bZcuGo4s+JI2JmcVEBv5qpcTaIgbULwh7L4
         aiUWbx4BtFwil7pNV4LUniNx+J8Ns8d7wDgOGy/2BvErodEai5gMinuoDfVM2gGvMxej
         9IGi+vVrJUWyJGdAbRn+sLJX78aCVD7d3KykS86bHHkFSqLe5ex3xbmSiHqlhnBH1255
         XzfA==
X-Gm-Message-State: AOJu0YxITWQvE27noiAJFw48tf1TRs3ptHxdKImDXoh6I568KVMcXjmR
	Zwhm2dAKFZXNgMh+2DQARaE4Sp3QbcfSg0euqepjEOqtTTPF9IFiyz8pPuCa0Q==
X-Gm-Gg: ASbGncvH6F+2NX0SY+3GScz8Z1DTDkHWMleNuqJ5RY6mUuYZePQPUOB1UnRA7okLHuv
	c4+1g5HnHqUp9X9HdYkN/PdlskVKmZLzcE3ssDTgHVG8KfSuNUCk0GNj+jmzyZ/rdbCMgfP3Caz
	rFswp2XqYYEjCYKoqDx4j2l6XDGmrJM2K9mjFTcyrT0PXmKRBci8CK1dUCwYA8VC6YQSgxv3syB
	dLLJYaXsfpsJIgGQ6FOJ/o/gIV0Z5OqSylmnsP78iYbRjiJE60l7f6v0pg2IZ6h//vDclZoW7SP
	RIc/nSvOPcuQRTYc1t0uuTY8tgUB
X-Google-Smtp-Source: AGHT+IHgsfDAcmQoVPz3OqjY4fsfStHe8w+bApIyZU3horEfuMPbagTTxS37mo+7l7Vwk3GrfCkZRA==
X-Received: by 2002:a05:622a:1647:b0:466:93b9:8356 with SMTP id d75a77b69052e-4677528b6camr10363241cf.22.1733772343653;
        Mon, 09 Dec 2024 11:25:43 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:43 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:41 +0000
Subject: [PATCH 10/10] media: v4l2: Remove vidioc_s_ctrl callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-10-deff7acfcdcb@chromium.org>
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
index 4e65d50bef27..5a54e796086d 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2396,8 +2396,6 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
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


