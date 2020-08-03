Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC6A623A824
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 16:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbgHCOMe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 10:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbgHCOMe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 10:12:34 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FBAC06174A
        for <linux-media@vger.kernel.org>; Mon,  3 Aug 2020 07:12:34 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 9so14437834wmj.5
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2020 07:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=X3YMifa2y4Vck3amPUtn1ukrB81mOmzNOSZf6OsDjCM=;
        b=HY2SKxaoc2lijbfr2SkusnfP8y4m6gvQ8y/Wf203i5284m2dmvk+9hxEShXc00RVSi
         XeIFo9FshMP8YmacdlL2/Lgz5S8Mj3a+cyuCt9e2q2V9QDTOpyAUZ4EIXsx2H+9k3wnp
         86Sb79OXGpG8nfwLfoegemE54P1zhEJTkhCvuzQKVmht5+uFRm4uuLE5U5PEGrfzfCZA
         Yz/w6cyTLlkk9svtd5TwkURF/UxI0POvrjdLS3rIB/ovhYLAJHTpiPuVcYu2RWbLiP8b
         XNUamQaQ6PgVlVQMCBiJFv7CrpKrhHscIFK+EyHhsg47mJrw78WlmBqpoMerczSWFvOr
         Mjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=X3YMifa2y4Vck3amPUtn1ukrB81mOmzNOSZf6OsDjCM=;
        b=NwuMk8NvK00rUiz/d420zJn3miRkilf/vwJ56lHKN/CNg8kLWBzN/8W7R1dIBOrqfI
         6ygI1jS8CpscaPlLCo45fwVylBR0Y/IvS8UPqBjCwRfCFrVi8Calhy4+uO6HdspEFp+K
         8nE/7IkMZrX8Vvn7N5Gab4W+5NJxjdX4SBN22Z0yVpe5mxk+yufbQonJS75scaI/OJvt
         FIN0ERepxNaSAna1LhxRFh/fCZ5qsDny8bHt/qwX7ALhl+wWv0UMZvz+BpclLUlp/8TC
         hC8i4b2W5xzD2GTvLAFmahq/xN/bPMFT67hGWOxlpvm5JMZZ++J8m0KkBr9qgp0SL0Cc
         B8uA==
X-Gm-Message-State: AOAM5311DdfD7KShYASM7dEb/mQ7FTy6wLSAFl7Z4L46bQtcmXKntFf5
        sIxQamu+h4uR+i7LnvOdasjITg==
X-Google-Smtp-Source: ABdhPJz+pgkU3pcEZD6zkUSYq3SyYB3t9Va8znv136/ktw136qxZZUpvC0nX7LpFikrCt70pFf1k/w==
X-Received: by 2002:a1c:e10a:: with SMTP id y10mr209872wmg.1.1596463952774;
        Mon, 03 Aug 2020 07:12:32 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id 33sm27098957wri.16.2020.08.03.07.12.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Aug 2020 07:12:32 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     stanimir.varbanov@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] media: venus: Fix reported frame intervals
Date:   Mon,  3 Aug 2020 16:17:48 +0200
Message-Id: <1596464268-7382-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On dragonboard-410c (apq8016) with HFI_VERSION_1XX, the reported
framerate is in unit of 1/65535 fps (for fine grained control).
So the current reported supported frame intervals is wrong (max
is 1/65535 fps), leading to encoding issues or format negotiation
failures with gstreamer.

Fix that by setting the framerate numerator according the framerate
factor (65535).

The factor is not always the same, e.g. with db820c (apq8096) HFI
reports framerate in fps unit. So only apply that for HFI_VERSION_1XX.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/media/platform/qcom/venus/venc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 9981a2a..654bbaf 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -575,7 +575,9 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
 				    struct v4l2_frmivalenum *fival)
 {
 	struct venus_inst *inst = to_inst(file);
+	enum hfi_version ver = inst->core->res->hfi_version;
 	const struct venus_format *fmt;
+	unsigned int framerate_factor = 1;
 
 	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
 
@@ -600,11 +602,16 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
 	    fival->height < frame_height_min(inst))
 		return -EINVAL;
 
-	fival->stepwise.min.numerator = 1;
+	if (ver == HFI_VERSION_1XX) {
+		/* framerate is reported in 1/65535 fps unit */
+		framerate_factor = (1 << 16);
+	}
+
+	fival->stepwise.min.numerator = framerate_factor;
 	fival->stepwise.min.denominator = frate_max(inst);
-	fival->stepwise.max.numerator = 1;
+	fival->stepwise.max.numerator = framerate_factor;
 	fival->stepwise.max.denominator = frate_min(inst);
-	fival->stepwise.step.numerator = 1;
+	fival->stepwise.step.numerator = framerate_factor;
 	fival->stepwise.step.denominator = frate_max(inst);
 
 	return 0;
-- 
2.7.4

