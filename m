Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAAD2C4057
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 13:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbgKYMh4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 07:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgKYMh4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 07:37:56 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D58C0613D4
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 04:37:40 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id b17so2083986ljf.12
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 04:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=52E/kGckX47/YFVLHUCD+7iLeZo5CiFQYz7tFvrv0pM=;
        b=ZZIbH44H1Bk5JfpCWGFPENkd779/Q0CUuAmhZGycRsJVw0N+Kk6HOsq3EnffMgwBJk
         9WBvN0E8LMcpSxfmzJHURfuGjK9nsF2iZ2IsiTCNEWc9X/cIw6Tzbsl0Pnqj6tcp+MAA
         MShDBOPG7gjdIpvBD0NkcazqCSsIsgNaKIUUBUajLohuIYcJCy/3leIJjGa+wEeX4ZyE
         vwjs+NTxG7KQjZSmE4t1LicMVfbQq7xgJ4IvW0c8ZU7gBboHg9Ng8/iCiDsBH3VrlTXH
         2NB4+7vc9xa8sKZT8szL/Z4EMKGVjPNsdjx2UFSQmKu8mlUJYvdk7TqIkI8U0yao1hAp
         J34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=52E/kGckX47/YFVLHUCD+7iLeZo5CiFQYz7tFvrv0pM=;
        b=JfGzLfopXbMq2m1aB76A6IfbAr34irxBGfYJ/RiuxyznHtVX1sMxOOmywvJN251nUj
         UjobtUxO0/nLsVi6ul57zXppwUNaDO6AFSzXs1AVaGt21v1U+nLBE1fv4CaqQrfjlmHr
         cDMZ/v634a81Oph/wBlwmDPlmXtl0+Lr5MXYKuH88LVOV1xkU0Y6RYFrfMJdMcC3OwnY
         tWDkuS9mjilHA3+aZOjAbGwz7G9B2bDsTAmkS2Q+vYCcx7c3/O1gZNnhpraQaDTBhnfp
         5QoncEnz8KNBhaeeSGQVpI5DTOiE3I8Wx6zOt0tMxyTIpc1uYfKmcpfYNdUqtWMRYJfc
         KKgw==
X-Gm-Message-State: AOAM5330Yl5H4vuvYSsghrHnaMjr38DvI6BWX5Qjqi/ep0HnKL2CtX0F
        YBTWMQC3k92sDDzSMhoONhFy6A==
X-Google-Smtp-Source: ABdhPJwxt3kMo26KgOWuDlpVa0JPk367ybLv9TNo6pT3rAqQEvZFy/fcEeojmZLMIpRdz48kLb3vYA==
X-Received: by 2002:a2e:9550:: with SMTP id t16mr1224617ljh.117.1606307859184;
        Wed, 25 Nov 2020 04:37:39 -0800 (PST)
Received: from localhost.localdomain ([85.249.45.205])
        by smtp.googlemail.com with ESMTPSA id z8sm230261ljh.74.2020.11.25.04.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 04:37:38 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, robert.foss@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 2/2] media: camss: Make use of V4L2_CAP_IO_MC
Date:   Wed, 25 Nov 2020 15:37:10 +0300
Message-Id: <20201125123710.28491-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201125123710.28491-1-andrey.konovalov@linaro.org>
References: <20201125123710.28491-1-andrey.konovalov@linaro.org>
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
---
 drivers/media/platform/qcom/camss/camss-video.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 20673de9020e..60737b771d52 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -539,6 +539,7 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
 	struct camss_video *video = video_drvdata(file);
 	int i, j, k;
+	u32 mcode = f->mbus_code;
 
 	if (f->type != video->type)
 		return -EINVAL;
@@ -549,7 +550,12 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	/* find index "i" of "k"th unique pixelformat in formats array */
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
@@ -948,8 +954,8 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
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

