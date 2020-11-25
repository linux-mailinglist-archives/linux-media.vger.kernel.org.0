Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC2B2C4051
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 13:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgKYMhd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 07:37:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729324AbgKYMhc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 07:37:32 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B8A7C0613D4
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 04:37:32 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id 142so2092213ljj.10
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 04:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/POD83bhfrWc7gHRAcRmWc2hVCnC37bpTrkRReqOp8k=;
        b=sUqYtGT0hEGE8tEi1032R/GaoUGFH+DufaXLFL7rJuMJ6DKOI0iFV00yHWhyOiGNym
         ht2T35QVus9fTyHFgZdbvUtltl6DwyiZmNfpO3z/SX5fmifAhb8+o/VPwB5nzhBY7Ezi
         4JH5qBpEp2CAha1L+VQwCIempbeqaSbsJNQjMt94zmEW7Or/aQtFAW3hfVvm6+BWOg0u
         D2ZU0vwJyqrqEnZZUHejcHi3MgI9ZJ9WZL8siuzL5vOFmKk4Vd8BB6KeN3QSK6VOqM57
         nQru+/Ws2ug+rwksv0W/RC82M3G27EFFIGgk0iiuf+ZKshSRrD870Ot9rqyM3tymcs9x
         FI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/POD83bhfrWc7gHRAcRmWc2hVCnC37bpTrkRReqOp8k=;
        b=hz7S2Grup8XXyEEwmucYW5x8iaf5kEuoiKZnnNAaRu80odwrVRtNRhTtL+AViJzYgB
         awhogzHTmrlyOgYnlQkfyIlrcspRf0nw8NrfwSVwopB6ZEXJgoxBnsffkdI7wNyxCWED
         zm3ST60e8s4c+PVCiqWEyAsNVXQMt0GboZHfVk4r/Rc9mOFFWwaR36rBgt6X5Xuw/ldH
         aVx95frZAaI49jehxHQazRCgiVqP4c1lVt2XLGfRRoDZwhjdmYcqGj+xnFuDdw2XOtG+
         rvHAabOdYwjGCd9ajPYFTa8epHpUqJyqZwXWM84wJxcPK9PfLr5xnLRKfg/kujTHCwQz
         fNsQ==
X-Gm-Message-State: AOAM531CDhaAFg/PmSiQaKAu6XMK3kQ1vyYpGPu3yRb6A4iwEd/fEVHv
        NMTteiPFlRKrIojw7bq6dow67w==
X-Google-Smtp-Source: ABdhPJye4JdhktkXMcj3D/jUnjbIDFajaWQqF/Qut5f0s1dH0WOkPhMWaYsSqyelrZ8v7gQdxNUf9g==
X-Received: by 2002:a2e:9b83:: with SMTP id z3mr1279273lji.145.1606307850974;
        Wed, 25 Nov 2020 04:37:30 -0800 (PST)
Received: from localhost.localdomain ([85.249.45.205])
        by smtp.googlemail.com with ESMTPSA id z8sm230261ljh.74.2020.11.25.04.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 04:37:29 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, robert.foss@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 1/2] Revert "media: camss: Make use of V4L2_CAP_IO_MC"
Date:   Wed, 25 Nov 2020 15:37:09 +0300
Message-Id: <20201125123710.28491-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit c90f1178dcac30dee5ddd29ec0513e7589aa866e.

The assumption of "Each entry in formats[] table has unique mbus_code"
is valid for the RDI entities, but not for the PIX ones.

Reverting this patch and creating a new one which handles the PIX entities
correctly results in smaller and more straitforward patch than doing the
changes on top of the current version.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
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

