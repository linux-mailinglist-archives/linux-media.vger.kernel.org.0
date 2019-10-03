Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 636B9C9BCC
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 12:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfJCKLF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 06:11:05 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35534 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfJCKLF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 06:11:05 -0400
Received: by mail-wm1-f68.google.com with SMTP id y21so1830831wmi.0
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Agp3EuCiHKloFtoDdFx7HfkDvZvPVf/H6q4TAYxz6CI=;
        b=bwvTvYDJReiwmJp2S7ZqvMjhEmKjoex5iMyTxFucuHRs0ZbdKakeVhxE9IICGIkm0x
         A20K319BRbtdDBLRMXAvTYm4kvpalfbEJGAAahpUUx8TrBZ6+OOLI2MOIgWqngA6Nvfm
         amCMfOtGR1nGf56uFPFBKGr7hLD5yPX2mjVXboqvHBBzCQ7GPEaWfAXuoTTUTZIwYXcR
         35RaRs0k3SMA6BruWzKlMjyAhq9CWD3cLjLrk58zsgTGCsS87sFoMxw/nFQkMXqUROxK
         aWBZKglYevfBPjZ5ppmsuRG3PCDt4LFBHULJNGX9reOIJOngr1Qjbb6/8/BSWzdPzeZY
         A+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Agp3EuCiHKloFtoDdFx7HfkDvZvPVf/H6q4TAYxz6CI=;
        b=d678CHn1BVba/A0HWC+bmgphTWXdmKlZuPeaU2tqv5sDFb8LrO/FzH/hjXtNYw5vBK
         uM7qOcHJGIryDyfi+UB/Br0lqO4ZdmqxkyrQYeC8sE/Fz01NxJJAKit+lJR/FtO81VCJ
         1WJW+6VW1XzFK6HPAxoLmz1yIsjjOJMxVysHvgy0K9n/Xs7FcCVV1iDw6wOQmz+f6f+C
         ukdnF1Fpy7mQOJDEKrh8vg94B/MAXcjrNRZO2WiOy1KiDiPPdWiwIycNZnxhRBK5rTwB
         7FhSKfKIwY1xy6BBGQHLLG7CxGQATHCMX5h4GFei+3D3eQBShzPl4EyDHwfk9v8bCD6J
         fExg==
X-Gm-Message-State: APjAAAW4CtOirec9hr2oZNUzTfakbe4rXifS5p+/mTUgtKNfKXVPw3Jo
        Wv3hE8G4xtwsWSrF85na696AlA5dR0Y=
X-Google-Smtp-Source: APXvYqzJEe+cftUJ1kllSXzNpyWW3AZy2P+PuyxK2u9CSOz45mbnGblihdd5B81JvweyNd18y0w6gA==
X-Received: by 2002:a1c:1bcf:: with SMTP id b198mr6780636wmb.0.1570097462511;
        Thu, 03 Oct 2019 03:11:02 -0700 (PDT)
Received: from mms-0440.qualcomm.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id z189sm2355054wmc.25.2019.10.03.03.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 03:11:01 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4] venus: venc: Fix enum frameintervals
Date:   Thu,  3 Oct 2019 13:10:38 +0300
Message-Id: <20191003101038.13732-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This fixes an issue when setting the encoder framerate because of
missing precision. Now the frameinterval type is changed to
TYPE_CONTINUOUS and step = 1. Also the math is changed when
framerate property is called - the firmware side expects the
framerate in Q16 values.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---

Changes since v3:
Keep min/max numerator one, and divide frate(max/min) to frame
factor (returned framerate max/min capabilities are in range
1 to 120fps but in Q16 i.e. 65536 to 7864320).

 drivers/media/platform/qcom/venus/venc.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 1b7fb2d5887c..133ff7eceb83 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -22,6 +22,7 @@
 #include "venc.h"
 
 #define NUM_B_FRAMES_MAX	4
+#define FRAMERATE_FACTOR	BIT(16)
 
 /*
  * Three resons to keep MPLANE formats (despite that the number of planes
@@ -576,7 +577,7 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
 	struct venus_inst *inst = to_inst(file);
 	const struct venus_format *fmt;
 
-	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
+	fival->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
 
 	fmt = find_format(inst, fival->pixel_format,
 			  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
@@ -600,11 +601,11 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
 		return -EINVAL;
 
 	fival->stepwise.min.numerator = 1;
-	fival->stepwise.min.denominator = frate_max(inst);
+	fival->stepwise.min.denominator = frate_max(inst) / FRAMERATE_FACTOR;
 	fival->stepwise.max.numerator = 1;
-	fival->stepwise.max.denominator = frate_min(inst);
+	fival->stepwise.max.denominator = frate_min(inst) / FRAMERATE_FACTOR;
 	fival->stepwise.step.numerator = 1;
-	fival->stepwise.step.denominator = frate_max(inst);
+	fival->stepwise.step.denominator = 1;
 
 	return 0;
 }
@@ -649,6 +650,7 @@ static int venc_set_properties(struct venus_inst *inst)
 	struct hfi_quantization quant;
 	struct hfi_quantization_range quant_range;
 	u32 ptype, rate_control, bitrate, profile = 0, level = 0;
+	u64 framerate;
 	int ret;
 
 	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
@@ -659,9 +661,14 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
+	framerate = inst->timeperframe.denominator * FRAMERATE_FACTOR;
+	/* next line is to round up */
+	framerate += inst->timeperframe.numerator - 1;
+	do_div(framerate, inst->timeperframe.numerator);
+
 	ptype = HFI_PROPERTY_CONFIG_FRAME_RATE;
 	frate.buffer_type = HFI_BUFFER_OUTPUT;
-	frate.framerate = inst->fps * (1 << 16);
+	frate.framerate = framerate;
 
 	ret = hfi_session_set_property(inst, ptype, &frate);
 	if (ret)
-- 
2.17.1

