Return-Path: <linux-media+bounces-22955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1688D9E9F74
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 20:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 928F9280AB4
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 19:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544731990C8;
	Mon,  9 Dec 2024 19:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eDl8YVIC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D041957FC
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 19:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772338; cv=none; b=LFQwunsTc5P9OE0In6Yf8SY/UXYWpwLk1ulhiu9fInAyCHzQn4izE7LW2We6MNVcmNOsC/qtgzBucHS4HlWikooOK0oiTkHrm2iTRDyOU0B7vVSrbLOwqest3RyIA0esh1mgIlTiY1RcBTjPfo0QE3hZYXtUbNDvfueHaK6MjMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772338; c=relaxed/simple;
	bh=EY8oqmKTiUV81iDV12LiEs5fxLsbZtTGDuxYmfLNCp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UbmrdbOGzrlv2Gaf3uuLzrrte+ASlwVINOorX74PSGY+Z13iNkkHQjqIxPqWoRJivSbJuWIN9esWy0Dk2TaCHtPhdsYLajXyRl2tYJ7H314dZFn/IJYVyEw8nQpw3hioO7baAn2EX/AOFwyK8li82rn7AsowAQq4MeyOU9fSnuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eDl8YVIC; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4676e708aeaso7091711cf.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 11:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772335; x=1734377135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALuCNiC6NiBbAaZWJ7ZF+lCNq8dvy5S4QphoAjogwrE=;
        b=eDl8YVICjG0HdP+oStEBU76cEvD73LNGZQr4bUC3PDPQJmWs7MzS8TFDsg/zZuBS5j
         yYuDMdi5DgpjIQ/0YWuz6/Bl3DagroPNpJyjVOQ4E6Ip7/B1MMSGcCH+uuPFoxVarOGt
         Cb0J8FRa92vYKcg0Yi1HDY8Zf92Bpn/xFfOxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772335; x=1734377135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALuCNiC6NiBbAaZWJ7ZF+lCNq8dvy5S4QphoAjogwrE=;
        b=UxPl4b2E+BdrTwDyv4mQwbys1xJywccPHyylakgSfVWFp+cBcduY3BBPQPXqfqkfha
         4jPZc0sg13sTRih5BEK1N0Py0gqyexAqqzJlAfax5nhhZ92qBwHHR0TZfrJaRWg5S3Km
         uJHAN2jk5CMYxNKhM78VS7KLSnDlJE2gvpM9Ywo7kyPI7wNkmbbAeqTvhZV5clVCCkyz
         H3JbNtRYQsTCrzG3k+5SWbsca2bezN4C0nRqIppUGDuMRdHrhCDe1NWfXSA2PNlPkEqP
         JWgTL8gybqFvwwY0MQjIMxpdkCSglAU036zGmwXwIH12zQ1ur64zD+B7wQCCdlD+fZeB
         uJ6Q==
X-Gm-Message-State: AOJu0YzYhedmhrY11eSrsv5vY1edlOm5QCCtPYSUP3omT4/HFYY2KsWX
	a9hXKiMmh4Om/0+42P6u9vVQ//HiUZJWpKS8asc7PcWrKxX03qRgFtK94KNkvA==
X-Gm-Gg: ASbGncsxRc/oi7ptQH7XJStFvEpTE8In27vN+gNBFEk0/sKKeaAXjUiYJTwO3zv1LNK
	1QqKEnbBWG9GYcuSVAdSOg+CeSVm4FaXvhwBzsdyS3Gw3En92p8F/b4871LGRoIxzaiVcxwkh8N
	4u3I7TlDaYHjbWBW7vv0AhBJy5z545XwpR/orNcBqtnZA15Y5viV8aNNTjFmSlwUZjjnlVHRzAi
	WNIWDC14GR5eYapK1E4sCCQ/9eh/e7Qu48i1UiUpqeYtlFkcvz8D3iZbsIn4zTNXdBqVt8Yf+YI
	HZOtxmB/x9V9uCDatr7mXMZv
X-Google-Smtp-Source: AGHT+IHsk+VHbWui+xY2odwllC141usB+LpKAHlP2mMq7yUmbaK9+La1b1tTbukiapbv37JDSVTxrw==
X-Received: by 2002:a05:6214:5086:b0:6d8:9002:bde2 with SMTP id 6a1803df08f44-6d8e71a8c8fmr234897486d6.28.1733772335566;
        Mon, 09 Dec 2024 11:25:35 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:35 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:32 +0000
Subject: [PATCH 01/10] media: ioctl: Simulate v4l2_queryctrl with
 v4l2_query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-1-deff7acfcdcb@chromium.org>
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

v4l2_queryctrl is a subset of v4l2_query_ext_ctrl. If the driver does
not implement v4l2_queryctrl we can implement it with
v4l2_query_ext_ctrl.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c   |  3 ++-
 drivers/media/v4l2-core/v4l2-ioctl.c | 22 +++++++++++++++++++++-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 5bcaeeba4d09..252308a67fa8 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -572,7 +572,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	   and that can't be tested here. If the bit for these control ioctls
 	   is set, then the ioctl is valid. But if it is 0, then it can still
 	   be valid if the filehandle passed the control handler. */
-	if (vdev->ctrl_handler || ops->vidioc_queryctrl)
+	if (vdev->ctrl_handler || ops->vidioc_queryctrl ||
+	    ops->vidioc_query_ext_ctrl)
 		__set_bit(_IOC_NR(VIDIOC_QUERYCTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
 		__set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d..a5562f2f1fc9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2284,9 +2284,11 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
+	struct v4l2_query_ext_ctrl qec;
 	struct v4l2_queryctrl *p = arg;
 	struct v4l2_fh *vfh =
 		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	int ret;
 
 	if (vfh && vfh->ctrl_handler)
 		return v4l2_queryctrl(vfh->ctrl_handler, p);
@@ -2294,7 +2296,25 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 		return v4l2_queryctrl(vfd->ctrl_handler, p);
 	if (ops->vidioc_queryctrl)
 		return ops->vidioc_queryctrl(file, fh, p);
-	return -ENOTTY;
+	if (!ops->vidioc_query_ext_ctrl)
+		return -ENOTTY;
+
+	/* Simulate query_ext_ctr using query_ctrl. */
+	qec.id = p->id;
+	ret = ops->vidioc_query_ext_ctrl(file, fh, &qec);
+	if (ret)
+		return ret;
+
+	p->id = qec.id;
+	p->type = qec.type;
+	strscpy(p->name, qec.name, sizeof(p->name));
+	p->minimum = qec.minimum;
+	p->maximum = qec.maximum;
+	p->step = qec.step;
+	p->default_value = qec.default_value;
+	p->flags = qec.flags;
+
+	return 0;
 }
 
 static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,

-- 
2.47.0.338.g60cca15819-goog


