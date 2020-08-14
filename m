Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FA2244F54
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 22:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgHNUyp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 16:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgHNUyo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 16:54:44 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F329C061386
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 13:54:44 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w25so11264937ljo.12
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 13:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v89y35h3M88vGCG82awEg4tCgwfd/R9LYLHd6BNE3bg=;
        b=zGNVIsk2UmezNjaacj6ZypLaT5Bq7Jyj+EEMu+EN1MV38GUHIl+wGgeeuxuDawQ59s
         7T1GYsqddFaBhluXp+1SA+uB+Iuv8GDHj0bfHBRLcDbq/kw4K0ejctkugyWLTTZRSG4I
         TTKKHDq2J2u5sRpVPbO/Nk7R79mk3mAUefX8+c/1a2oNV3f1Kx7Gdn9kUcaCkMofGxQd
         VIWqOcuinBP4ljiSPry2ldG5lnPIgG8ms1ekRZ3Jk23uuHq+faNndyy/nSOQGHIO12Ts
         fqEhKoQ8/6V3vB85lIR76zfcqprhAomvy50AsQfQ0+3f7UNlE/sgd2LAwQvaxpDDV1sM
         iBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=v89y35h3M88vGCG82awEg4tCgwfd/R9LYLHd6BNE3bg=;
        b=WeBo58cZmJg3iX5v5xhMAGCRHfe+1+TTT6UUV/uRwRa10ZmzwmDE9zHobi1z97D9hI
         Rn2O0UzuH/ICaWHNRUhXHWzHm55n6j9YKh1XHZWEq4kJ5moN6llizXkj9QUdBDTQVt3x
         cdYMUtm6XFxhZnYeHhy8l1/sLY4GJfMXO2FEYrcGnxmWu4mXuogoibHeRR46W8iM9XKH
         vjBkInqyYWCNdE8e7yZIeZsWf/WUxkpjju0SZ10KJy9VJum5UP+Cniv0xmZXfWayLGnq
         lsYIgz9xsOnOQ+McownXxMlBu3fu5/3qkz//VOVYA1OROus4IbfF7rPmMbLOmy08cl7v
         PB5Q==
X-Gm-Message-State: AOAM5336LfW3M4wA3zhG7QBEGtuqYTMRzc9a21sBbN6WL+YjR5HIY0Z9
        JrSHrRAsRNLCeuxOzORg7GCaRQ==
X-Google-Smtp-Source: ABdhPJwJdJAHjhWNc4Te6cv13EdEpYuM1BQe8agbF0IicazGiWEmZEPTORJ7FzdAZVHcoepkNA+Afg==
X-Received: by 2002:a2e:90e:: with SMTP id 14mr2141399ljj.293.1597438483038;
        Fri, 14 Aug 2020 13:54:43 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id j26sm1963601lja.111.2020.08.14.13.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 13:54:42 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, robert.foss@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 1/3] media: camss: Make use of V4L2_CAP_IO_MC
Date:   Fri, 14 Aug 2020 23:54:01 +0300
Message-Id: <20200814205403.27639-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200814205403.27639-1-andrey.konovalov@linaro.org>
References: <20200814205403.27639-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement mbus_code filtering for format enumeration.

Without this patch libcamera errors out with:
"ERROR V4L2 v4l2_videodevice.cpp:982 /dev/video0[cap]: Media bus code
filtering not supported by the device"

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 .../media/platform/qcom/camss/camss-video.c   | 67 +++++++++++++++----
 1 file changed, 54 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index cdbd6dba1122..90c7dd29b573 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -529,17 +529,16 @@ static int video_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+/*
+ *  Returns the index in the video->formats[] array of the element which
+ *  has the "ndx"th unique value of pixelformat field.
+ *  If not found (no more unique pixelformat's) returns -EINVAL.
+ */
+static int video_get_unique_pixelformat_by_index(struct camss_video *video,
+						 int ndx)
 {
-	struct camss_video *video = video_drvdata(file);
 	int i, j, k;
 
-	if (f->type != video->type)
-		return -EINVAL;
-
-	if (f->index >= video->nformats)
-		return -EINVAL;
-
 	/* find index "i" of "k"th unique pixelformat in formats array */
 	k = -1;
 	for (i = 0; i < video->nformats; i++) {
@@ -552,11 +551,53 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 		if (j == i)
 			k++;
 
-		if (k == f->index)
-			break;
+		if (k == ndx)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+/*
+ *  Returns the index in the video->formats[] array of the element which
+ *  has code equal to mcode.
+ *  If not found returns -EINVAL.
+ */
+static int video_get_pixelformat_by_mbus_code(struct camss_video *video,
+					      u32 mcode)
+{
+	int i;
+
+	for (i = 0; i < video->nformats; i++) {
+		if (video->formats[i].code == mcode)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct camss_video *video = video_drvdata(file);
+	int i;
+
+	if (f->type != video->type)
+		return -EINVAL;
+
+	if (f->index >= video->nformats)
+		return -EINVAL;
+
+	if (f->mbus_code) {
+		/* Each entry in formats[] table has unique mbus_code */
+		if (f->index > 0)
+			return -EINVAL;
+
+		i = video_get_pixelformat_by_mbus_code(video, f->mbus_code);
+	} else {
+		i = video_get_unique_pixelformat_by_index(video, f->index);
 	}
 
-	if (k < f->index)
+	if (i < 0)
 		return -EINVAL;
 
 	f->pixelformat = video->formats[i].pixelformat;
@@ -911,8 +952,8 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
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

