Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C972C57C1
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 16:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391298AbgKZPCV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 10:02:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391130AbgKZPCT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 10:02:19 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C87FC0613D4
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 07:02:19 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id z21so2900748lfe.12
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 07:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=P8v5qCpTMD0dws38PXKVsDk7ryFQPD3D9X3Qd0ARTjA=;
        b=DrUDjw3PuSHaxWq12cEqrR3lUFkuVHGxGGVFOVbiXfiCHUR85rk+guQ1e6owOzPZHy
         9jI4XJfZuuHh0wOsZJok2CezwTXHGBXJQbNaOR5zm1rgCZAmtIvEvPwOBrmiv1dhgpez
         xhunng7JKKB3y8DhKmgrRV8ekxowHzlbfXdidplYM2szOOPtAAP6h3NjQzGzsyu1x6cl
         Q2iZoQAcVbFPD8SHZCiBcwxbksVBBW0YQ2mzIs+++4ZV5UE8L0K+4YLGFu6xDXdIOmzm
         jtRYvPCXa73DpEFNG6apIH65ZYY4clfDWxfnMkSoEAt7EyWE9x6sJHBYm4HsI7Jqt1EB
         ci9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=P8v5qCpTMD0dws38PXKVsDk7ryFQPD3D9X3Qd0ARTjA=;
        b=SbJ577SH2ogsAblhcu4rhLbL0AlXgHoF3hSsv5k7Y5BU/K/2w9STHs8fYXR8pSER3O
         JiwPR8qLVvxkxgStM9+08dFnoDzzbxDxPa2WPXvjDJG6dOEboogtzv/ZNq5Kp7Y14FYv
         94qHoeLQTwHVjNmzNvHwmhgCPx3OmIdoW0nf7DCDtSwbUItvBq2OzZ/vlUpj46LT9Jz3
         E3GAFEKR+rpM6D9GCi2X3jid7g16U3tyEo7/3vVv1oGfrWp52kTCufSHDaVjqjQRNTlm
         BXpZkB/Vl3EV8xJ8mnibOp6LefGJk/RdkxP2Dykv+wwA8Fy4jpHvCUbvdkO6WQ3nmHHM
         lgcg==
X-Gm-Message-State: AOAM53354PjLkdRB6DP2wyzjmWYCsM0j1fm1xQf+lmC1KCwTHWzyrx+T
        UMUUrCP3xsG7lSSFW/2EEr/seQ==
X-Google-Smtp-Source: ABdhPJyhW6kjK0ypXsWvJ9FvAsAH5+hBHIg4pM+4kzkYjd0xwns9XhsQEQ6X2f1gj+Wa1ou3QizlDg==
X-Received: by 2002:a19:715:: with SMTP id 21mr1436359lfh.289.1606402937696;
        Thu, 26 Nov 2020 07:02:17 -0800 (PST)
Received: from localhost.localdomain ([85.249.45.205])
        by smtp.googlemail.com with ESMTPSA id i12sm339481lfj.264.2020.11.26.07.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 07:02:16 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     =mchehab@kernel.org, robert.foss@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        peter.griffin@linaro.org, marc.w.gonzalez@free.fr,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v2 1/2] Revert "media: camss: Make use of V4L2_CAP_IO_MC"
Date:   Thu, 26 Nov 2020 18:01:56 +0300
Message-Id: <20201126150157.25870-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit c90f1178dcac30dee5ddd29ec0513e7589aa866e.

The assumption of "Each entry in formats[] table has unique mbus_code"
is valid for the RDI entities, but not for the PIX ones.

Reverting this patch and creating a new one which handles the PIX entities
correctly results in smaller and more straightforward patch than doing the
changes on top of the current version.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 Changes in v2:
  - Fix the misprint in the commit description

 .../media/platform/qcom/camss/camss-video.c   | 67 ++++---------------
 1 file changed, 13 insertions(+), 54 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 114c3ae4a4ab..20673de9020e 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -535,16 +535,17 @@ static int video_querycap(struct file *file, void *fh,
 	return 0;
 }
 
-/*
- *  Returns the index in the video->formats[] array of the element which
- *  has the "ndx"th unique value of pixelformat field.
- *  If not found (no more unique pixelformat's) returns -EINVAL.
- */
-static int video_get_unique_pixelformat_by_index(struct camss_video *video,
-						 int ndx)
+static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
+	struct camss_video *video = video_drvdata(file);
 	int i, j, k;
 
+	if (f->type != video->type)
+		return -EINVAL;
+
+	if (f->index >= video->nformats)
+		return -EINVAL;
+
 	/* find index "i" of "k"th unique pixelformat in formats array */
 	k = -1;
 	for (i = 0; i < video->nformats; i++) {
@@ -557,53 +558,11 @@ static int video_get_unique_pixelformat_by_index(struct camss_video *video,
 		if (j == i)
 			k++;
 
-		if (k == ndx)
-			return i;
-	}
-
-	return -EINVAL;
-}
-
-/*
- *  Returns the index in the video->formats[] array of the element which
- *  has code equal to mcode.
- *  If not found returns -EINVAL.
- */
-static int video_get_pixelformat_by_mbus_code(struct camss_video *video,
-					      u32 mcode)
-{
-	int i;
-
-	for (i = 0; i < video->nformats; i++) {
-		if (video->formats[i].code == mcode)
-			return i;
-	}
-
-	return -EINVAL;
-}
-
-static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
-{
-	struct camss_video *video = video_drvdata(file);
-	int i;
-
-	if (f->type != video->type)
-		return -EINVAL;
-
-	if (f->index >= video->nformats)
-		return -EINVAL;
-
-	if (f->mbus_code) {
-		/* Each entry in formats[] table has unique mbus_code */
-		if (f->index > 0)
-			return -EINVAL;
-
-		i = video_get_pixelformat_by_mbus_code(video, f->mbus_code);
-	} else {
-		i = video_get_unique_pixelformat_by_index(video, f->index);
+		if (k == f->index)
+			break;
 	}
 
-	if (i < 0)
+	if (k < f->index)
 		return -EINVAL;
 
 	f->pixelformat = video->formats[i].pixelformat;
@@ -989,8 +948,8 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	}
 
 	vdev->fops = &msm_vid_fops;
-	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING
-			  | V4L2_CAP_READWRITE | V4L2_CAP_IO_MC;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING |
+							V4L2_CAP_READWRITE;
 	vdev->ioctl_ops = &msm_vid_ioctl_ops;
 	vdev->release = msm_video_release;
 	vdev->v4l2_dev = v4l2_dev;
-- 
2.17.1

