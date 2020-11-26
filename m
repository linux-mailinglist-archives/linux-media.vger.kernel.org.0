Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 517312C57C5
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 16:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391308AbgKZPCZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 10:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391306AbgKZPCZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 10:02:25 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B74C0617A7
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 07:02:25 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id s9so2644271ljo.11
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 07:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tKIO7ZHqYV5jy4apxisfQrLSwqPSVll/CP0rdQ/t36s=;
        b=PzsXu+oHHKcZsFBm1dpqOuWjNTBUgYFOZgHefsg5h3z3+9GSFA91iYeDFkvM2yWrt2
         sec6fls3/ZYRba1XNNR/fpBrAJ8rL9MwrRngXY+RhjGhap8LHrlIXTJGCjPtXyz1qLC8
         8NoPw9ZGOwXtptrYzbm4aAlzCKD9mgafWDsjXfrBG8sj3HIQEzMa7RWq7z3y+Nesxk0w
         vlNZVe6PUyFETNRmb8Eh3rTN/fElCGtTR4uEyl18dZ2MW2G8xioMBVVBES/0MCcULWr3
         ddY3j9F/zaH1KN1ancw0Fv/yEnRqYKDlbuGvLR5ybdOC5CsBA6/zp3nEzEmHTW5V+dIg
         Kjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tKIO7ZHqYV5jy4apxisfQrLSwqPSVll/CP0rdQ/t36s=;
        b=jZvj5B+PIyEDxGihpMgcjPt2LMoO4moUtDwxfbIX+yWmjzgmqpswZWgJiFyItdOWo6
         hWtZUQU6EHPG1hzM3i58JG7NzN0QAHG/ppwt2tq4Fim1mmI7z8g0128rlI6M9k0g2KZ6
         bm9YEH9oY8Hpq1TCw3JIJ2S6C5HiRFDrs6dAvSFcdybF32Wl7bA4gwwlksONfbV7d/ou
         27AQb1Fz4P9MuP5mJy/4oioCJogthhLe/L5FPKVYCDHVP0Ulh8Mcg9m91PJTM4P4glFL
         2Oq7BztBzhDIOa6pDYRdsOh7ExSZNBOcBPUkQeVxJ0BwF1spAca74wTyz/Y5wRv3x4+K
         VQ9Q==
X-Gm-Message-State: AOAM530TUjwy11+KPRQyw5ZSXg3AQn0ueZ+0HYqmQ8ciBgAAxNh+5zOz
        Fb1W73s5lJ4VzSQt9hMKHVP7MQ==
X-Google-Smtp-Source: ABdhPJxYDNoQCLwarIvgCeBKJXXL+6Tr0zxyFAg3YHBk4A/uvzJY4vFl41DoXfst4IcEvLlJaxrQLA==
X-Received: by 2002:a2e:9a02:: with SMTP id o2mr1422175lji.1.1606402942973;
        Thu, 26 Nov 2020 07:02:22 -0800 (PST)
Received: from localhost.localdomain ([85.249.45.205])
        by smtp.googlemail.com with ESMTPSA id i12sm339481lfj.264.2020.11.26.07.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 07:02:21 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     =mchehab@kernel.org, robert.foss@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        peter.griffin@linaro.org, marc.w.gonzalez@free.fr,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v2 2/2] media: camss: Make use of V4L2_CAP_IO_MC
Date:   Thu, 26 Nov 2020 18:01:57 +0300
Message-Id: <20201126150157.25870-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126150157.25870-1-andrey.konovalov@linaro.org>
References: <20201126150157.25870-1-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement mbus_code filtering for format enumeration.

Without this patch libcamera errors out with:
"ERROR V4L2 v4l2_videodevice.cpp:982 /dev/video0[cap]: Media bus code
filtering not supported by the device"

This is the second version of this change which handles the case of
several pixel formats corresponding to one media bus format correctly.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 Changes in v2:
  - Added the comments to explain V4L2_CAP_IO_MC capability and the
    way it is implemented in camss driver

 .../media/platform/qcom/camss/camss-video.c   | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 20673de9020e..a9bc5438ced3 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -539,6 +539,7 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
 	struct camss_video *video = video_drvdata(file);
 	int i, j, k;
+	u32 mcode = f->mbus_code;
 
 	if (f->type != video->type)
 		return -EINVAL;
@@ -546,10 +547,26 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	if (f->index >= video->nformats)
 		return -EINVAL;
 
-	/* find index "i" of "k"th unique pixelformat in formats array */
+	/*
+	 * Find index "i" of "k"th unique pixelformat in formats array.
+	 *
+	 * If f->mbus_code passed to video_enum_fmt() is not zero, a device
+	 * with V4L2_CAP_IO_MC capability restricts enumeration to only the
+	 * pixel formats that can be produced from that media bus code.
+	 * This is implemented by skipping video->formats[] entries with
+	 * code != f->mbus_code (if f->mbus_code is not zero).
+	 * If the f->mbus_code passed to video_enum_fmt() is not supported,
+	 * -EINVAL is returned.
+	 * If f->mbus_code is zero, all the pixel formats are enumerated.
+	 */
 	k = -1;
 	for (i = 0; i < video->nformats; i++) {
+		if (mcode != 0 && video->formats[i].code != mcode)
+			continue;
+
 		for (j = 0; j < i; j++) {
+			if (mcode != 0 && video->formats[j].code != mcode)
+				continue;
 			if (video->formats[i].pixelformat ==
 					video->formats[j].pixelformat)
 				break;
@@ -563,6 +580,11 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	}
 
 	if (k < f->index)
+		/*
+		 * All the unique pixel formats matching the arguments
+		 * have been enumerated (k >= 0 and f->index > 0), or
+		 * no pixel formats match the non-zero f->mbus_code (k == -1).
+		 */
 		return -EINVAL;
 
 	f->pixelformat = video->formats[i].pixelformat;
@@ -948,8 +970,8 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	}
 
 	vdev->fops = &msm_vid_fops;
-	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING |
-							V4L2_CAP_READWRITE;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING
+			  | V4L2_CAP_READWRITE | V4L2_CAP_IO_MC;
 	vdev->ioctl_ops = &msm_vid_ioctl_ops;
 	vdev->release = msm_video_release;
 	vdev->v4l2_dev = v4l2_dev;
-- 
2.17.1

