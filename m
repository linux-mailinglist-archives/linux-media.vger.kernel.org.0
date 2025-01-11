Return-Path: <linux-media+bounces-24641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C782A0A285
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 10:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D794188A270
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 09:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76FE1917D7;
	Sat, 11 Jan 2025 09:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eCMys+aI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3841922E0
	for <linux-media@vger.kernel.org>; Sat, 11 Jan 2025 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589334; cv=none; b=SVb1fBaQp3a3sIPSUmbTmBVhcE/kh1CB1hMiwMDfBBpP5NdLq9ZVv7oppL6GfkFsQ4cHHEEqBu/ZMwJxkYH0igZMhVhZrux/zuTCGcN/akQDhPXfmUYE0pi5xeY89rXrcNxz+UVhfXf+HC711okDX8VKl+29XnnaThz6cGpihRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589334; c=relaxed/simple;
	bh=BHqXjzXegfvyleJbFzCIkEZ/Ohsk17MMdh8326GOkbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LTueivF3vijgkYsC1rxbkjNOlHuIfaxZtxWFFKRuLA4aUlO34RQ/ZCcTq075/TCLzaJZ12DNdHnUCUIX6WmpDgAFqWDar+7iOfEBAA9uEj7VZKdJzsau73SBguCjS6h4gujHdSdmCRidv47uULQpLvqqIrMCd/NQ4pRApPmOAkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eCMys+aI; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6e9db19c8so234044085a.3
        for <linux-media@vger.kernel.org>; Sat, 11 Jan 2025 01:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736589330; x=1737194130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1KYqWnRc25c7X6AgX8mJMBcXv6X4I+XW042aps6zcs=;
        b=eCMys+aINUeyPpHOqwmcacUWkFZpKdFbU3ZRGl2lokoR4qr5aKpr4UDxLxbAkP0xhm
         W17GheV+iCuPMwLG3CEpQO/NQ1bwW2Q6OJzTb3cPHwjchTh3BfTxzkGoqiSEtI9FfXfO
         ck8Uj5y3NhBNhIllRRwxnAaPKwhiZJUhubre8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736589330; x=1737194130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1KYqWnRc25c7X6AgX8mJMBcXv6X4I+XW042aps6zcs=;
        b=vi7xmIpuMSB0JvlUwOHEu6eKL+LwSLbOodn16unUJKMdUm3dUjs45T5aRsgvsChF/S
         D+3rJP2TreQvduBtj+xgYqM18a81sh97DYvDmNBoiXNU2mdsOsuWTfaXsz2ptKXk3kXr
         1J0EuGax9yVdsroaGCZc+jB78gxSEw++8PjgHR8CM4iogV77ssCbvyBtP/ukfdLJerr5
         Ydv8obcOPE0wiOallmpOVAP4rF6JHwS3fa/BSA2jxkxSLpc2NSvw8+mpqe3CnM9o4sSr
         udc/kP2vNlNqA4NKf4YsdsyXJ0LZ2VSSBg0jBWRXgkEYKnIntYlmX8377Kbmw5gcFUHL
         80OQ==
X-Gm-Message-State: AOJu0Yz7lqf/OkY8jWfws62orb7F/z96rXzS3Ojdz4UejQwRh/cxJRiv
	9kbE7MorOIbHBcWolUW3hdQsm6FJUHoF91iyL6ExdnCwOIpIqACSei8jDhNT4Q==
X-Gm-Gg: ASbGncvQybLpi9gmSPykEGV446OUsUeOusSSBIewNl/m53ZATeErJHDfEDBQmVWgEV5
	TdDJWTNzYksYEAro7TPcv+19ylW1m47j/SAa/heYoabsNuWX4V7O9W/K4ohlkfjoL/Gyvc1JHAO
	W+zeb1QKeLQp6H8GpWe2rF53EWS5VLkLxpZjJrD2TSai3H5B3866f5pZJnO6W1pMIA+IX0NBq9b
	0SyqfOyxhWFjpetJbnERjYTyahOnN57rGOHLY30VaXKZ1PjWXchC8DH3TeZcNCoHID05DBXgB3O
	9gh4wuSVcp7yaWX3r2fGDoukkTEUSpBBOfMo
X-Google-Smtp-Source: AGHT+IEPxC3OyMHAru8G3Gzds3v7OF/JkO9AvPzj8XxD1gntOl6n6mbYKW7VgLUWHJdUgNP6gB5oAA==
X-Received: by 2002:a05:620a:4402:b0:7b6:d6dd:8826 with SMTP id af79cd13be357-7bcd97b8724mr2371667285a.55.1736589330581;
        Sat, 11 Jan 2025 01:55:30 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce327b8besm267096785a.59.2025.01.11.01.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 01:55:29 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 11 Jan 2025 09:55:17 +0000
Subject: [PATCH v6 4/6] media: venus: Remove timeperframe from inst
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-fix-cocci-v6-4-1aa7842006cc@chromium.org>
References: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
In-Reply-To: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The driver only cares about whole fps. We can infer the timeperframe
from the fps field. Remove the redundant field.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h |  2 --
 drivers/media/platform/qcom/venus/vdec.c | 15 ++++++++-------
 drivers/media/platform/qcom/venus/venc.c | 16 ++++++++--------
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index afae2b9fdaf7..1d4fd5cc75d9 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -407,7 +407,6 @@ enum venus_inst_modes {
  * @tss:		timestamp metadata
  * @payloads:		cache plane payload to use it for clock/BW scaling
  * @fps:		holds current FPS
- * @timeperframe:	holds current time per frame structure
  * @fmt_out:	a reference to output format structure
  * @fmt_cap:	a reference to capture format structure
  * @num_input_bufs:	holds number of input buffers
@@ -478,7 +477,6 @@ struct venus_inst {
 	struct venus_ts_metadata tss[VIDEO_MAX_FRAME];
 	unsigned long payloads[VIDEO_MAX_FRAME];
 	u64 fps;
-	struct v4l2_fract timeperframe;
 	const struct venus_format *fmt_out;
 	const struct venus_format *fmt_cap;
 	unsigned int num_input_bufs;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index c1d5f94e16b4..e160a5508154 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -471,10 +471,12 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 		return -EINVAL;
 
 	memset(cap->reserved, 0, sizeof(cap->reserved));
-	if (!timeperframe->denominator)
-		timeperframe->denominator = inst->timeperframe.denominator;
-	if (!timeperframe->numerator)
-		timeperframe->numerator = inst->timeperframe.numerator;
+
+	if (!timeperframe->numerator || !timeperframe->denominator) {
+		timeperframe->numerator = 1;
+		timeperframe->denominator = inst->fps;
+	}
+
 	cap->readbuffers = 0;
 	cap->extendedmode = 0;
 	cap->capability = V4L2_CAP_TIMEPERFRAME;
@@ -487,7 +489,8 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;
-	inst->timeperframe = *timeperframe;
+	timeperframe->numerator = 1;
+	timeperframe->denominator = inst->fps;
 
 	return 0;
 }
@@ -1612,8 +1615,6 @@ static void vdec_inst_init(struct venus_inst *inst)
 	inst->out_width = frame_width_min(inst);
 	inst->out_height = frame_height_min(inst);
 	inst->fps = 30;
-	inst->timeperframe.numerator = 1;
-	inst->timeperframe.denominator = 30;
 	inst->opb_buftype = HFI_BUFFER_OUTPUT;
 }
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 943d432b6568..17bec44c9825 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -401,10 +401,10 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 
 	memset(out->reserved, 0, sizeof(out->reserved));
 
-	if (!timeperframe->denominator)
-		timeperframe->denominator = inst->timeperframe.denominator;
-	if (!timeperframe->numerator)
-		timeperframe->numerator = inst->timeperframe.numerator;
+	if (!timeperframe->numerator || !timeperframe->denominator) {
+		timeperframe->numerator = 1;
+		timeperframe->denominator = inst->fps;
+	}
 
 	out->capability = V4L2_CAP_TIMEPERFRAME;
 
@@ -416,8 +416,9 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	do_div(fps, us_per_frame);
 	fps = min(VENUS_MAX_FPS, fps);
 
-	inst->timeperframe = *timeperframe;
 	inst->fps = fps;
+	timeperframe->numerator = 1;
+	timeperframe->denominator = inst->fps;
 
 	return 0;
 }
@@ -431,7 +432,8 @@ static int venc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 		return -EINVAL;
 
 	a->parm.output.capability |= V4L2_CAP_TIMEPERFRAME;
-	a->parm.output.timeperframe = inst->timeperframe;
+	a->parm.output.timeperframe.numerator = 1;
+	a->parm.output.timeperframe.denominator = inst->fps;
 
 	return 0;
 }
@@ -1454,8 +1456,6 @@ static void venc_inst_init(struct venus_inst *inst)
 	inst->out_width = 1280;
 	inst->out_height = 720;
 	inst->fps = 15;
-	inst->timeperframe.numerator = 1;
-	inst->timeperframe.denominator = 15;
 	inst->hfi_codec = HFI_VIDEO_CODEC_H264;
 }
 

-- 
2.47.1.613.gc27f4b7a9f-goog


