Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA38EB0A41
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 10:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730277AbfILIZa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 04:25:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:56080 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730213AbfILIZ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 04:25:27 -0400
Received: by mail-wm1-f65.google.com with SMTP id g207so6384151wmg.5
        for <linux-media@vger.kernel.org>; Thu, 12 Sep 2019 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=wZB3at2xoK86kPRYZnaC63gPvO1d3NIdf7sjzirM09s=;
        b=ljelFNaR9UoDkgsJB0H0wYRS2AQxUR2OnQtr1VOYGke48iNktsvLz4IDoSayp5WYbO
         83CoEhOmlvD7kkvthgF9yUDvua3NQcYtaJSaJCU9AkAEQQoJ+cOxLJUgsFO/kekAI000
         ZMuz/FHSVqqv8uKZdqD8lAEE85BG1qCoHTPuac8FJdLnZ1nX6Up+/nrSApjvBoUs6X83
         7RXvJ+8TzlJnUwZmkUAFfUVmjyIVM7IhVeFVRwjNjJZOqzK1AqL/SWRmrbxwofZbx/SD
         0tHFXylxTN8NRhIqgz5q38aumbsvouhY93+UBRQ0MHh0UFofynBOtwCGO7f/uUp+c0JW
         jdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wZB3at2xoK86kPRYZnaC63gPvO1d3NIdf7sjzirM09s=;
        b=UR+g+8mdzc0iBFcjwadSMGRl3156U9BqVeRTA4RT3JHyJ3qyZAkq+cMOvaM3ZmyvRI
         xr2H0oqBFBHqaoOLjFRx+zSvBQeYQAUdzTzWFyaJX1s6eujQ9GCAVXyc41MvM6AnX4g8
         ISWbjyC34dK/4DFQJ/iXqVY+D91Sv+A4llBFjKVnpz28QmO7PWlFzm44kmhG/ZIjrpDs
         /az7ZUOeQjS98u3miUp0d7RXQqeCIgh95mBOhAxzE8moTESFb6JDf5QoJrgVfViGjHMC
         vE2F2t6RpTQEEgmtssbAVBFoKVya5z4NFteufTf4FOX8psWsRonUz2skjKww1rnVw2KZ
         xvtw==
X-Gm-Message-State: APjAAAXCFNKvStWWwlgRf38PHs1fMQMYPg5gr6ptJqX5SQ89rNwNppaQ
        hKV0soys/vkStM14FYYty4miFK0ox3M=
X-Google-Smtp-Source: APXvYqz1MbR8Zo5FU9i48ud7sY2+CoubwIQYGXjqRt6G/3bsuVumjdVf+CLq3wJO7qPtLeJtM3bR6Q==
X-Received: by 2002:a7b:cb53:: with SMTP id v19mr7856682wmj.0.1568276724993;
        Thu, 12 Sep 2019 01:25:24 -0700 (PDT)
Received: from mms-0440.qualcomm.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id z189sm8537859wmc.25.2019.09.12.01.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 01:25:24 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3] venus: enc: fix enum_frameintervals
Date:   Thu, 12 Sep 2019 11:25:10 +0300
Message-Id: <20190912082510.31399-1-stanimir.varbanov@linaro.org>
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

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/venc.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 1b7fb2d5887c..bf2dd9287c32 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -22,6 +22,7 @@
 #include "venc.h"
 
 #define NUM_B_FRAMES_MAX	4
+#define FRAMERATE_FACTOR	(1 << 16)
 
 /*
  * Three resons to keep MPLANE formats (despite that the number of planes
@@ -576,7 +577,7 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
 	struct venus_inst *inst = to_inst(file);
 	const struct venus_format *fmt;
 
-	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
+	fival->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
 
 	fmt = find_format(inst, fival->pixel_format,
 			  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
@@ -599,12 +600,12 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
 	    fival->height < frame_height_min(inst))
 		return -EINVAL;
 
-	fival->stepwise.min.numerator = 1;
-	fival->stepwise.min.denominator = frate_max(inst);
-	fival->stepwise.max.numerator = 1;
-	fival->stepwise.max.denominator = frate_min(inst);
+	fival->stepwise.min.numerator = FRAMERATE_FACTOR;
+	fival->stepwise.min.denominator = frate_max(inst) * FRAMERATE_FACTOR;
+	fival->stepwise.max.numerator = FRAMERATE_FACTOR;
+	fival->stepwise.max.denominator = frate_min(inst) * FRAMERATE_FACTOR;
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
@@ -659,9 +661,16 @@ static int venc_set_properties(struct venus_inst *inst)
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
+	if (frate.framerate > frate_max(inst) * FRAMERATE_FACTOR)
+		frate.framerate = frate_max(inst) * FRAMERATE_FACTOR;
 
 	ret = hfi_session_set_property(inst, ptype, &frate);
 	if (ret)
-- 
2.17.1

