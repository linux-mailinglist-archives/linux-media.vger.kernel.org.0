Return-Path: <linux-media+bounces-24286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3845FA026E4
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 14:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1FB51885CB3
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 13:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6F51DF269;
	Mon,  6 Jan 2025 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PAQxFpv9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A471DE8B3
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 13:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170818; cv=none; b=lEnR6E7BDufXgV3+AB3N5I5P6Q4nhXEvxZD60jXhUlEdBoMPa2ysCGkvql5LTX4EjnquadGBt1MGnnruaFx2knEnAZmDL0QNpQCv4fTeq6+H2EI9mHankP2wKFJC/QHgQLiduXw9LOyd1YyASY0ImkxFTYxGlvGxoM9r2evaN8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170818; c=relaxed/simple;
	bh=/hPtkiqbMiSuYUABeLf0k0X64qWSBh2CcTj5F3/fdPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YiLv7bMOsSARwPxuIHrYEOp0haWr0Eg7A7dosjWRGWWMSN4XhFb9ASJa2quugCIVWqysgVnezV6DORMx24GGBSgzmAL83SW6PbD69/fSXIT3YujwFZnoBdIIYw2Jab3s/Yee9DHKlyOkOfbcmW4Pkm2vr00uORFHLozl2R1jS54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PAQxFpv9; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6e5c74cb7so1030717685a.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 05:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736170814; x=1736775614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaluQD75i5WN0/M2E9V2xLSR9NLQRzro4V8nhNRsJEo=;
        b=PAQxFpv9MIGmrwTaRjVIdwABBj58hHScDnH38p+lDl4EVwNoyIoOrdWTWfvpi9x04D
         KhQCidNj7qaHL0gfXVUUQVleuywVolb9Jmbh4hgjbCrpwoXxgL28jr5b9EZpNulVa8Gy
         k2pNZmcNOjW1GJMxV+SE/kKt69WQ/iI8ChNFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170814; x=1736775614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaluQD75i5WN0/M2E9V2xLSR9NLQRzro4V8nhNRsJEo=;
        b=pV4VuuFPcGV87A/9+BKkXsAh0798cs2yZaJf08ihwYU6vmVA4pT1ifcrpENWa6Dg7S
         9VGRdPwVloxCPoAnSS2GXiA+NQAu1esh3mdqgdTZpXXHLTxY+AOdm3YmFHpx5IMF9A+9
         18ifsAWzfo+Pf+WqbTH73S+nrmiB0GcSsMc2Hu3VNDJ+NK25QDPsf8pHP3deDcCktbun
         IeyRBCwUFq1ZKK27wU/HBTc0BRWsxR5LOdBiEsRuj90XejktEdu3bDnivmjAmyBxLH2H
         DUw98cuHXrgbbr4tB/d/K2Ftk8HCIVj/1st+Jt3ET0sR7gUS9wlhK5UE6GWESxfNeTBP
         YLvQ==
X-Gm-Message-State: AOJu0Ywz9YDKGPdXdIwxhqsPKpS5EPBTfNUO9PlLHusEtRJkvtfYJ8T9
	zVPNORQ1KZBDEenQppoDpi3zbfC538dm1sLPuMiAh8cMGDEmYDTcEqFkuwiPLw==
X-Gm-Gg: ASbGncsxhSo/IRVwE2U3qDV6F5InpoDBQZ54x83or8tPW1hjvA1KHXQOZTXeUv3WiYg
	CB8S2d61STu3l1zily6LkCPg9eXBXsWUPUQArXV1EEkQR4cO1d9ewNNJiA1m1lH3PfOqPawfyhX
	crstR4sQwjKiNAYNtujx8dxZsLwydKXE3UPs5zOgrKuXlDr1axNiNYvOTVPbpv+2q/u6MBTEyf4
	XUUxlBnAWdr44b8/pS2WyndavyOT7UyrAb5RRFXgF4EmA6GkUp+W00ylvhSCCxJxVWVItb2fX+u
	r3zMl8osmj08JiC0OE2JkkWgSlmcNzV8Q6mV
X-Google-Smtp-Source: AGHT+IHv1oIpl6WcfgN36jKDKAWdHfzzIkAbnj9H7EHr8HHbAWlAP6Mwo+/BVH3tIZ5MTc2nhgENBw==
X-Received: by 2002:a05:620a:468f:b0:7b6:d050:720f with SMTP id af79cd13be357-7b9ba79ae8bmr10079146685a.22.1736170814275;
        Mon, 06 Jan 2025 05:40:14 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac478d35sm1501861085a.90.2025.01.06.05.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:40:13 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 Jan 2025 13:40:12 +0000
Subject: [PATCH v4 6/6] media: venus: vdec: Make the range of us_per_frame
 explicit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-fix-cocci-v4-6-3c8eb97995ba@chromium.org>
References: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
In-Reply-To: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Fps bigger than 0.000232829 fps, this fits in a 32 bit us_per_frame.
There is no need to do a 64 bit division here.
Also, the driver only works with whole fps.

Found by cocci:
drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 6b8906ced6bc..88f6b5a3a4fe 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -464,7 +464,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_captureparm *cap = &a->parm.capture;
 	struct v4l2_fract *timeperframe = &cap->timeperframe;
-	u64 us_per_frame, fps;
+	u64 us_per_frame;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
 	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -486,10 +486,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
-
-	inst->fps = fps;
+	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
 	timeperframe->numerator = 1;
 	timeperframe->denominator = inst->fps;
 

-- 
2.47.1.613.gc27f4b7a9f-goog


