Return-Path: <linux-media+bounces-26724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E40A4112E
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C639B164FFA
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71BB20CCCD;
	Sun, 23 Feb 2025 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bkMaNGH+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C55520D4EE
	for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 18:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337174; cv=none; b=nlL0tomNm5Z2mUljQL1Y5wPS6jIk4yIA/hJsXLNdIZoA3R037Hwtuy9L9o7yuGq1lOQMyx+KOfesqXw4cyloU0xMVUOjvjmBpWvLONsqhYXtqE7/9RL9TcGt58yH/aiP3OoacexmChleuKcW7l+Y5jDKsb73oeQb/8F3KSn6+Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337174; c=relaxed/simple;
	bh=+FQk73Re7Vj5uP8e4zt7dSl+Ft1aZSIU+rolZ0DzE5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GWpsABtCpLB/N56Uzz2OaW1rvXjt4G/3M7tU7mHcMPuH8Al1140jtZkE4GLGeM1n2vq6SrnMzRbEXn+NULZjqc/K7ATyEEftqwqUWCYU6wccaoms5GlxAzv4ksn4x/2GpyngO3EbgfOVZBK+ogKmq78aKvBC/f+CXxc0hVaGFX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bkMaNGH+; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c08b14baa9so352218485a.3
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 10:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337171; x=1740941971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IZ/POm13BMEX8p04+c3Nhi5+imiB9PsNNFLrPKcpkU=;
        b=bkMaNGH+TWmaiA27q/9/D2BTliMN6XtOlLEzbZXC9WEqOgg18K4dJFtDQCTnbLe4vV
         nDYI0VzYpEpk/3QSiyFRUfM2nsjqmYnkLFp0nZIvf/pWsPjrfY35XdCOocqfwfc5g4Kc
         hJe9HJvYWoVL9ac48R4hQaqDtn/glaouj/akY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337171; x=1740941971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IZ/POm13BMEX8p04+c3Nhi5+imiB9PsNNFLrPKcpkU=;
        b=p88+ecoh2jYR+i5/RRMS2UcdBD4nlPJjcYRcDRho1bN33gndDpL7vFJmPP3Fkur/NZ
         4j8LAoXKgysZ6Ern0oAjfriD7F1l7/B3wd3X570ciJGE6bacpgNIAt2o1JZrX6V/R1Q6
         9Jbga3MSAuR9WTppaPPVwttTybnHhDxYmbInHtpewk2KhBcjUyyIsUtpc2SrQ6uV/6hm
         FzzzSwoM+qlRaZrnn45yKnlal/aJ2rIRe8yvBO7Mxbno49bIBkDNd/QzrlbebRGo3o0o
         lT2T2czm8XqOvzqrHxDBzxJXs5PuOR/yhBnJDwJ0voi/DJuBZ7NRnbhMPFYu5XixrVNE
         q7PA==
X-Gm-Message-State: AOJu0YwXLR7loQjWN2Y+/ywG8zqNhIiDA0TAv03ySCgKbwAM3ZWrnj8o
	4dFvEmVvj0TNmXykyefzb8F96Ybm7aqDgrYvyejObQ3C++BJXBDITX9248iPfw==
X-Gm-Gg: ASbGncsZMdimuka4u2qwi46aT+BF3tKiIcinWVtWL88VH2r5zF0eRzLs6tOBQEneY7n
	2I2YB19agelIWZCHAOS3OOEr58rlgnxptCWRTF84PTuDFBPLQgJ/DCGJH/5ISMzmhR1+0nuo3gc
	XpPqFuj98GgDJOVkV+nJHa6GX2CToyz6b5LuFnwhz0jUVj+tDyPnwEl4oMc34fA9uOoT585T9ou
	QXmztn8ucTwQz1D6XmsIppFM0drMWPgjWWwZFKeXC5taO9MqMsivEa3jw8VVpaiR2lJ4pB7YIcp
	hXV1o2RMjoTUUcGKFi7lSa9Sdv0ozIaUltWqzx0Xvq9xybPjB68HvIskKB/nOKlsUvaS8b3lOH3
	Uatc=
X-Google-Smtp-Source: AGHT+IFfEI9iYEbJVGs23xVGmjulSbd3/xfIZiF/IMBZDKee+F4TF5guUHDs7mH9mdkDy3gDc+h3Sw==
X-Received: by 2002:a05:620a:4688:b0:7c0:c15c:1177 with SMTP id af79cd13be357-7c0cef10115mr1616776085a.30.1740337171454;
        Sun, 23 Feb 2025 10:59:31 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:30 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:08 +0000
Subject: [PATCH v3 05/12] media: atomisp: Replace queryctrl with
 query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-5-4292911cab6b@chromium.org>
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

The ioctl framework provides an emulator of queryctrl using
query_ext_ctrl.
Replace our implementation of queryctrl to support both.

Now that we are at it:
- Add comment about missing functionality.
- Remove superfluous clear of reserved[0].
- Remove ret var.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 33 ++++++++++++-----------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 1a960a01854f..6b84bd8e6cf3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -34,7 +34,7 @@ static const char *CARD = "ATOM ISP";	/* max size 31 */
  * FIXME: ISP should not know beforehand all CIDs supported by sensor.
  * Instead, it needs to propagate to sensor unknown CIDs.
  */
-static struct v4l2_queryctrl ci_v4l2_controls[] = {
+static struct v4l2_query_ext_ctrl ci_v4l2_controls[] = {
 	{
 		.id = V4L2_CID_AUTO_WHITE_BALANCE,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
@@ -1140,31 +1140,34 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 
 /*
  * To query the attributes of a control.
- * applications set the id field of a struct v4l2_queryctrl and call the
+ * applications set the id field of a struct v4l2_query_ext_ctrl and call the
  * this ioctl with a pointer to this structure. The driver fills
  * the rest of the structure.
  */
-static int atomisp_queryctl(struct file *file, void *fh,
-			    struct v4l2_queryctrl *qc)
+static int atomisp_query_ext_ctrl(struct file *file, void *fh,
+				  struct v4l2_query_ext_ctrl *qc)
 {
-	int i, ret = -EINVAL;
+	int i;
 
+	/* TODO: implement V4L2_CTRL_FLAG_NEXT_CTRL */
 	if (qc->id & V4L2_CTRL_FLAG_NEXT_CTRL)
-		return ret;
+		return -EINVAL;
 
 	for (i = 0; i < ctrls_num; i++) {
 		if (ci_v4l2_controls[i].id == qc->id) {
-			memcpy(qc, &ci_v4l2_controls[i],
-			       sizeof(struct v4l2_queryctrl));
-			qc->reserved[0] = 0;
-			ret = 0;
-			break;
+			*qc = ci_v4l2_controls[i];
+			qc->elems = 1;
+			qc->elem_size = 4;
+			return 0;
 		}
 	}
-	if (ret != 0)
-		qc->flags = V4L2_CTRL_FLAG_DISABLED;
 
-	return ret;
+	/*
+	 * This is probably not needed, but this flag has been set for
+	 * many kernel versions. Leave it to avoid breaking any apps.
+	 */
+	qc->flags = V4L2_CTRL_FLAG_DISABLED;
+	return -EINVAL;
 }
 
 static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
@@ -1561,7 +1564,7 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
 	.vidioc_enum_input = atomisp_enum_input,
 	.vidioc_g_input = atomisp_g_input,
 	.vidioc_s_input = atomisp_s_input,
-	.vidioc_queryctrl = atomisp_queryctl,
+	.vidioc_query_ext_ctrl = atomisp_query_ext_ctrl,
 	.vidioc_s_ctrl = atomisp_s_ctrl,
 	.vidioc_g_ctrl = atomisp_g_ctrl,
 	.vidioc_s_ext_ctrls = atomisp_s_ext_ctrls,

-- 
2.48.1.601.g30ceb7b040-goog


