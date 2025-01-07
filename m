Return-Path: <linux-media+bounces-24336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A4A03D0C
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 11:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E023A3A2E2B
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 10:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDEA1EF092;
	Tue,  7 Jan 2025 10:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CguypKy6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561B31EB9F7
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247280; cv=none; b=IgtLV/O9ECPm/poLeJtod6R0uUowK0mcvUFsnEvGTxJ+CkVUhVk+3CJDRr0An6uPXZbhbP9UDJKM8r47hK9mNz4huZqCWdfZVJv8S80VoD+u58pWNGMeQQeczU5m6NMTW4rMoqUlkDD7Y4fR2pB9hBmNWpauOkFJMp5Al1ZiLic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247280; c=relaxed/simple;
	bh=BHqXjzXegfvyleJbFzCIkEZ/Ohsk17MMdh8326GOkbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPOl40JymeH/FB3Hz6zmyMqbvLxcPdY6dHxmZIWx4VJGcTccJj28aKRuCTBVm2wVayG/zdN7fH+6Nb8KzTK2NHAutW/amUnOQ4Dm4LfxrS9dwv24SkK2V5B41rrlw2aWq1M3b+mKDh7j6+xRQgEpT447MG95ICva2v5WGtm6Vwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CguypKy6; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-467a8d2d7f1so125364001cf.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 02:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736247275; x=1736852075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1KYqWnRc25c7X6AgX8mJMBcXv6X4I+XW042aps6zcs=;
        b=CguypKy6ZMpZRnG+NSQzB6lh9yeD8YcENqMQfGVUa4ULeiqNmnTg1QRAxQZwJdFTO2
         vEwdjF3rFscKcLvgTNHNyZ1V+SXQOuSvd4ewAzMsfjPaBCIAkxpWTRA2qAxYY9IQUD5B
         0d/m17Vb6rOnGE6tr2Lfp0fMXcxyKOSOmBYKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247275; x=1736852075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1KYqWnRc25c7X6AgX8mJMBcXv6X4I+XW042aps6zcs=;
        b=r8rO9MJFmvNuIPO3xygGHCpjb5ewpBCJ4VNkgS2ClPsz1wFEkMwwKUzMhal+H+q0Q2
         Po6ROUEd79cVWfhTfZ+dfaXt2O0V/4NpasHB7Z+wS5/QUCYhR5sSYbt5TlyYWX/z3mb5
         /d/+/SUzuFagLuvZauIoMU65npNv5m8IKrNAy4pUY7FYNDirkKQku15jXlMAt3Pqupzt
         N7jO4qZjYabZxphyGhUKIbMkntXymB8ta/zolG3WAi9cubTlbUArY9wEbLNXhkv2kTM9
         SZQpeMqqyxsqV2gFyHrcjfX8jwRYvcUAGr/yB/r2Tg7UsojhvhazScYHPGZIcez4ZGUD
         dqJw==
X-Gm-Message-State: AOJu0YyOYCqhvz9gYeC8Z63tOE1TFy5u1MUwccq4hkEJN27APWV1NHgy
	NWCeJM6qgzafykC1W5rqBHXL+5ogeTjH+NwdBCGMF1ROYsN8EftUxBxA3jfG2w==
X-Gm-Gg: ASbGnctw8mbSdcQ9ofyccOuF+Fe1bNLlwwQciKOoeh9XHpoZrdn1eHnLd8yELMre+yk
	L42SAoGZNli7aTcBDg8e4bFUt+OhL6WFbCLmD5hRS6JBhrj29brHwR+5mNFGZc8zEApezQjOoEH
	726Kz6Bj5eY99vT21wgWf8Dyz8vDzEbqknLNkpopkUh3byNN+AQDq2rlFXa/eRQC7gfE0g4EPb3
	sJ+gT9KWpQ7FNj0LfEE4T/mz1QuErYYSCxRO7kjmcyQCtWYRh/GtUs4gGRfIvo2qnYOD+hXDlcH
	DbVPJdXGwYyxo4YqPd9K86U4tvGczyV+pEr9
X-Google-Smtp-Source: AGHT+IEeYqSZWdRFjCueXXmNknxsLb2PxqwfnTmsqfcQ/lgV7+HWTnTmz1e34p6hSwZwuYchYY4mRg==
X-Received: by 2002:a05:622a:2c3:b0:466:a9e6:6d6b with SMTP id d75a77b69052e-46a4a8caf6dmr989977671cf.15.1736247275338;
        Tue, 07 Jan 2025 02:54:35 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb30b97sm185094401cf.86.2025.01.07.02.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:54:34 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 Jan 2025 10:54:29 +0000
Subject: [PATCH v5 4/6] media: venus: Remove timeperframe from inst
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-fix-cocci-v5-4-b26da641f730@chromium.org>
References: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
In-Reply-To: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
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


