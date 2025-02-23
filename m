Return-Path: <linux-media+bounces-26720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54649A41128
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7E54188ADD9
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29E520B7F3;
	Sun, 23 Feb 2025 18:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZVJUnLiY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA8218FC9F
	for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 18:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337166; cv=none; b=YVsftuJfgcn96yQTMNAO3zyZN4+CPQFFf8j07q9V5yaYfHVPxve5IOXy7nRcHDcbyuuRN4zy0791c9riuOGJFfzYrDnLQmxPwtU90ly71+X304bAh8E9aLbl5qYnRI4dFViY8w7nx4ymDXtngVxG4GG10ZCeMQ3DgY7e5In6RNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337166; c=relaxed/simple;
	bh=o5WkpnQ73V+VMo8bdoFaUftuXdW+rujG4ME3lX7eEqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=czqlV7DBnE4eRiyNl2Z4ek+cEt4le3wwhmNb+jrCBAZFpBaTMWtHIKkpr/RRJbGMaDZ6OPx6uUvkNDEYmfNHYNvxcZ5m2sG3wZEIXDHmt2Chc9wTdyXylDxm4CUNV7MzqMSp3K0dSpYNKHEpVdrcQc4Yo5tjBG/wPYK/NZzrlpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZVJUnLiY; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c0c5682c41so248274785a.2
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 10:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337163; x=1740941963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgEaj88gwe50jW8BgyaHtEFtSSSTKBTD6iombmDXrgk=;
        b=ZVJUnLiY1GSIP75VooeahuZnuYwRhsVZWXF1VAxDhKZaRwq4FlkUjpy7Uecd6UDGme
         rGNBLSM65Rtzzqi6a6BqTJToyJ9QJXTJlg/wvgCos6T/dEmEwQ/6SFMFYuxQIUSmqe9q
         E9yACB8p2ZyVeOIGAnOv54niodLHiOldbp9to=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337163; x=1740941963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgEaj88gwe50jW8BgyaHtEFtSSSTKBTD6iombmDXrgk=;
        b=rUwSXgQedoEGj0xqWUJC3aJ7rDOze4RcbDsRqMA2OR0Kpx9WgQ4n00BSbXwZiqHYwB
         7xWTkGByCUXXSvhMEpetmRFPi5ZcnU2URle0kCWUNDc8TDVTuBbyXPCOvOrhRAq5/rYy
         VTjVTiCJY+7jd2NoEsdRH8PtFs3VW2Ad2S7+3Qcv0MqEa7OEpkwb8TQQKs4wKmT+RNAF
         xufenEQuFbmh6kWysppYXmJ4aNY2FzBjxfW929Pem+S9DNoZOskoXM799lHNLCxAMJ9F
         oC7vrxHEeWjxzuhVhCOk0pXEyIAXlulN3Du+8EHadK2NyPqfCkmg1hhq6qamPCZgGC8G
         5aRg==
X-Gm-Message-State: AOJu0Yy9nCSl0bP/duRZ56qH5bKlUBsJZRIaSNiuZZIYyv3kLFb/FiBP
	7UMwB2Z44s/s2m58euFitUTUuyMMKkd+HVgbezo3rgC/1oc+RONhq4yx7bmRag==
X-Gm-Gg: ASbGncsuWfHQ1b/suZLtiVMb6zIvRWX95d2QJXK4cg1H5o490OocqXiKrbmCwf/6G44
	hnmCknSic/3b3a5jDiTEAXkdIDqb8OnZSiBqyRsXL93Dvsy9lvV8uOnkmagMO8w42fbGLaI+dts
	HAl3802EUnEqv0e6hpzi0tQTFWotSU+tA55vkeeLgKri/6jNxcXgrZRMjzh9XdeMjHk2sZsgnzo
	3BjYVH2P4ilABY8kaIqQtxdFc7z9c5MS/VvhTfD4vTTSIRn93KNCYywlv7nlIzP8YMF1oJpHFRZ
	PbsVlf6jdg3pnUJsCvhD7N465+uN9dkqyIEKwl5cfP/hz4EUlsc7+6yVWzyq9PrVn/quHoeyssr
	Ncxg=
X-Google-Smtp-Source: AGHT+IHGjRoitg4iizBR56/YqzL9lfxWldkcIk6dKi7DdbK876lHC2pCcmEyx2EPjcz9GSOVicGTRQ==
X-Received: by 2002:a05:620a:1910:b0:7c0:b4f4:1633 with SMTP id af79cd13be357-7c0cf8c6679mr1064156285a.15.1740337163452;
        Sun, 23 Feb 2025 10:59:23 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:22 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:04 +0000
Subject: [PATCH v3 01/12] media: ioctl: Simulate v4l2_queryctrl with
 v4l2_query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-1-4292911cab6b@chromium.org>
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

v4l2_queryctrl is a subset of v4l2_query_ext_ctrl. If the driver does
not implement v4l2_queryctrl we can implement it with
v4l2_query_ext_ctrl.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c   |  3 ++-
 drivers/media/v4l2-core/v4l2-ioctl.c | 37 +++++++++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

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
index 0304daa8471d..deed2b44ee18 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2284,9 +2284,11 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
 	struct video_device *vfd = video_devdata(file);
+	struct v4l2_query_ext_ctrl qec = {};
 	struct v4l2_queryctrl *p = arg;
 	struct v4l2_fh *vfh =
 		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
+	int ret;
 
 	if (vfh && vfh->ctrl_handler)
 		return v4l2_queryctrl(vfh->ctrl_handler, p);
@@ -2294,7 +2296,40 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
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
+	p->flags = qec.flags;
+	strscpy(p->name, qec.name, sizeof(p->name));
+	switch (p->type) {
+	case V4L2_CTRL_TYPE_INTEGER:
+	case V4L2_CTRL_TYPE_BOOLEAN:
+	case V4L2_CTRL_TYPE_MENU:
+	case V4L2_CTRL_TYPE_INTEGER_MENU:
+	case V4L2_CTRL_TYPE_STRING:
+	case V4L2_CTRL_TYPE_BITMASK:
+		p->minimum = qec.minimum;
+		p->maximum = qec.maximum;
+		p->step = qec.step;
+		p->default_value = qec.default_value;
+		break;
+	default:
+		p->minimum = 0;
+		p->maximum = 0;
+		p->step = 0;
+		p->default_value = 0;
+		break;
+	}
+
+	return 0;
 }
 
 static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,

-- 
2.48.1.601.g30ceb7b040-goog


