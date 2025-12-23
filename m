Return-Path: <linux-media+bounces-49409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BA5CD8B82
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 11:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F970300AC61
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 10:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260B332D0D0;
	Tue, 23 Dec 2025 10:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e98wvGZ1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFEA33B6D1
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484188; cv=none; b=VQSSwN4hs3xfSG2CstsriMg6Jken3Yjfmf2VqVoeoAy45LE3Who7NzInUw587DtL+uwkWGtoWlagbjLjBHbKgnqtO41L6pw5sgd8AjCuAGihgcPBLLf2qsxQwRve0iJQDw9Vc+U8ELvH5sLi++cjTrXnrORRp1Z/dlLrg7oMXYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484188; c=relaxed/simple;
	bh=ASfJiTL1q6DVJolR1J49qe+02Q0L4hQQW/yS4XZqnOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sdNrUymemnoPXUNZlAGz75NaI2WJ2UcHVo+bAtXY6oX1CASuzVr0/HEZ9IDc4DhUqaNE1TzNwzVrUdOP0eFD+UMR0sjjiKgFmHfRYf0zIm/PFeOT5xPHccozWtKuP9yuitlGB2Vyt5jFYS4/BzlCaqWke6O4B/QbOBqg5YWN9Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e98wvGZ1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59581e32163so5712656e87.1
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 02:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766484182; x=1767088982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNHRxnSnE8voMM72m011bJb2yQG4C90b65WjUVIP41I=;
        b=e98wvGZ1p6sfdQF9Xzg3pkqhXO1w04DzWfl779Sx8bN9cjs1GJkpicOQkXDH/ANd/A
         3/aVAeME4L4oXKYB+pGFsY9G3oEWsoblAz6LrRKqU1FGL/KQ71MRTL7pFtReJbmCibdU
         udftp9+UzwJaUla7CpqAk898ZfxoDvkxe+0tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484182; x=1767088982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hNHRxnSnE8voMM72m011bJb2yQG4C90b65WjUVIP41I=;
        b=esvrmNnsdvhmddTqfZ66H880+3wnWRCCWuANcgHLxHcIzFMcLiNTJiLY5ALi8y3CQr
         /TUdQ1GJXY6iJ2mW3X6eKVmdYHqlDut1nsWlo9b7H8u8Ei8D5cAhk6+wKDOpbMQN/g+x
         NrmnGARb+onxkzoIKG8LC8KLzsB0chyVBDBdKXT1V9owZ/T53S2mKso1My5sajSxo9aJ
         Y2fWrTDRLumo+ufnZwSyFnTgM2ZTYWG1BOut0Vof3CxLPnb6o7Jg6crvNmrNYFgjLpEv
         /OnJPj9paTqjMS+PHv8u7AK+MZdPDh0MILmRXDNprguhrr/80vlUZgRWwry90oXx1nf/
         o2/A==
X-Forwarded-Encrypted: i=1; AJvYcCVldXwZzpnJykPPVbS1AlAv2qqUdrHXZBMER2F/d7yzPRVzC0zwvhvkJoqPI5mxtW5Xb3lGMtMMFRLPmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJfRrGjUxuPKu0FFyHetjDFAAllshrbqAuyhSs+3pArd4AbEvl
	EcrTO+Hbcw+wN0Mz3zna7z3K6JnWRoPhKn+dN5DCEg8ZrfhJ1E0BTj8JXpyqaat0TQ==
X-Gm-Gg: AY/fxX43vn2AlB1UIL9sJRcauIwibdnpbcGK/m/cevfUYNkvBRKeN6nZO+PPhSbnQyA
	1Fm1a3Idpmrue0z1Ei0rOwaHMrMkqAEfxtMQXfVC6eMOH3u9wPWw5DB/p98ssPgrzZFT+cH9xaV
	BVEAlIYoyLhIcNL4rIu+UbCWkWejvz8EDaPgwfEAHn5SLtbSlJons3QsX29LAKStQhpLuZBpRCf
	oRg01yTj43cq4Djrx4gXAf944ew8caIE2+pxV14rjhx7IFWhfH3/LM0m0ieR1bHhz3bWXfuMdZk
	OEVkLJkQP86HzhMTtELbrQ1PTixWgd9Cw4KeOzt8hPgDRqg6H+jw1tbtxCIPYT7ozmxn0Kl8Wn2
	WVquBV8uQBIdizNIV8Ss33IESqcOutAZqLCe/IygKUK7A8KfjPxKwat+SOcOFXRXyWY3AsJSOQz
	Jamj6O1/oFmofHBVzbPgYwfAjpXhzh+WqYcLnHeqoD+ghcKZj2nWDVIL/tN7pfXNAzpNEtpg==
X-Google-Smtp-Source: AGHT+IGNtNheNogZqw0341pm7gPXzJ8uyXpjG5TDNVfW1wZ6fEI74LDfk1NPk65WaE3b21JIBKcnSQ==
X-Received: by 2002:a05:6512:10d5:b0:594:2dbb:723a with SMTP id 2adb3069b0e04-59a17d5da8bmr5427175e87.39.1766484181553;
        Tue, 23 Dec 2025 02:03:01 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea248sm3891990e87.43.2025.12.23.02.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:03:00 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 23 Dec 2025 10:02:58 +0000
Subject: [PATCH v3 2/2] media: iris: Fix fps calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-warnings-6-19-v3-2-e8f56cb204ec@chromium.org>
References: <20251223-warnings-6-19-v3-0-e8f56cb204ec@chromium.org>
In-Reply-To: <20251223-warnings-6-19-v3-0-e8f56cb204ec@chromium.org>
To: Keke Li <keke.li@amlogic.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

iris_venc_s_param() uses do_div to divide two 64 bits operators, this is
wrong. Luckily for us, both of the operators fit in 32 bits, so we can use
a normal division.

Now that we are at it, mark the fps smaller than 1 as invalid, the code
does not seem to handle them properly.

The following cocci warning is fixed with this patch:
./platform/qcom/iris/iris_venc.c:378:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead

Fixes: 4ff586ff28e3 ("media: iris: Add support for G/S_PARM for encoder video device")
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 5830eba93c68b27fa9db87bac63a691eaca338d2..0ed5018f9fe3326f5bcc1678e854589c65e8a954 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -382,8 +382,7 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 	struct v4l2_fract *timeperframe = NULL;
 	u32 default_rate = DEFAULT_FPS;
 	bool is_frame_rate = false;
-	u64 us_per_frame, fps;
-	u32 max_rate;
+	u32 fps, max_rate;
 
 	int ret = 0;
 
@@ -405,23 +404,19 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 			timeperframe->denominator = default_rate;
 	}
 
-	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
-	do_div(us_per_frame, timeperframe->denominator);
-
-	if (!us_per_frame)
+	fps = timeperframe->denominator / timeperframe->numerator;
+	if (!fps)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
 	if (fps > max_rate) {
 		ret = -ENOMEM;
 		goto reset_rate;
 	}
 
 	if (is_frame_rate)
-		inst->frame_rate = (u32)fps;
+		inst->frame_rate = fps;
 	else
-		inst->operating_rate = (u32)fps;
+		inst->operating_rate = fps;
 
 	if ((s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE && vb2_is_streaming(src_q)) ||
 	    (s_parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE && vb2_is_streaming(dst_q))) {

-- 
2.52.0.358.g0dd7633a29-goog


