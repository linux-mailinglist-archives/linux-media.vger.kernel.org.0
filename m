Return-Path: <linux-media+bounces-48133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA2FC9E522
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 09:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF34B3A62C8
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 08:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B4A2D8783;
	Wed,  3 Dec 2025 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MXi03m5C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0AB2D593E
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752143; cv=none; b=d/2yQTD+YrltU1YaGEjkxwTKUWaUyWDPgqRWRtftJB1h3G4ZE8j6SH0IZNFtgB0+0jYGzFfeyrK0rY4YOIdn0ySVtqBKY0q5f/awezpJNoZXfES/FAuGACC1yYhjJrthhUbM9oyYpSj910xpBQuNWVBR9NbrEYVOWs88w7U3St8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752143; c=relaxed/simple;
	bh=TZXuHFaq1KyCSjmm/uTwxEj/hY+OqQUuzjmQobk8SFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sm3bOkg+BA6omxJm3+UhI4Xiz/s+nYruydq0ETpibRGAtT+5D0Y/GylEBeVgDmMRma0I5efKiMsaBvt9rjkAwXxDw9NfO6diZVWBXRxoFpL2nuU9tsn1g9ymmN5rM+IgxONAfNFR0Ps831kuS1BvXc41d2esX0BHIoexd5WFUSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MXi03m5C; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37cd7f9de7cso49913641fa.1
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 00:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764752140; x=1765356940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQl0/Jxgcp0DOIGMQfCvGhWySrzIG1pMZYIP0O7Y5Yc=;
        b=MXi03m5C2tB48/s/KiMlCD8h7B7mS2jhwMWPQN9PC1O+Rek5eL2cxhHaYmlG7p79vV
         0OsItXF1i6ZzR6zP2VbG6K7CoYemwqDHaxCxtZC64TeNa6PyzZwUqAH0mB8Ti/sbdkti
         Lo3XSC8qqmyd0gKjEJtVlHyogbTdLicN6NjI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752140; x=1765356940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YQl0/Jxgcp0DOIGMQfCvGhWySrzIG1pMZYIP0O7Y5Yc=;
        b=PvIZX9Qx71/rNpjTH7ry1JKD2wsytAassKvqEuLDHFWT8TTuJUMAsTZgJxARq/EURH
         qkhP3gZtApaqujiGh7E57vTPMAYlnchy9tsmc9nAisZR8mLxi1u01PT9x/Kn7lEFGTEy
         uLtSvhX9S6ohY+bpZAZ13h+v/LlT9fybWEo4zMhnNqKl4VHjzHlIindZapImf8x5joDq
         MQUhDz4qGca60fYPgqWgKBYBwBRPPQm59Xx3LMx+gnmBr50BevjrmKhunbJCY+NWaJxo
         Xko1/1UNhLBRcL50djB24oDe+RLGPDtLN6AkAwVi8gNnJ8inpV5hXEAXQUXEdRALRJAb
         w8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3+Qk0iXLLVdheAvlyFFTMEgCDrDn67bkNzlShQi87xrfTGeQwD1ndlw9PRu09ihpwXDoJ56C/CF8Ttg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSaCteaS2NH8jtaaGBKvXTR264TrRgVHAqUbaUnVAbMp6AoJVi
	ZvsiriflJC3EhYiV85LFUpAyjfZCJHqcIVVKXyUmmxf1K0c4O5kTwzgknS5rgOc8zg==
X-Gm-Gg: ASbGnctFQW2Mah9Z1OdRvwpSgfO3FbdzEtP8AsyTJ70CI6+MRfJ3TrSeWfONeYeh4ab
	b6kWFP5sSWUvZYMVBHLP107fu32DdiDVx+PRPbdiL6xi9FVKcVLsW01sI0/UfXylr1oh+rtCuuf
	Z2GecQiT6St/Uo0270gZc2PjggjDjSMFPsUKukthoFZOo2EUpxrDDVWiyCKwuVhZz5tIac2UI+x
	L/bNNl9oXW+aku4CWP9cMvjR9q3I2aw4+gm+616GGSoVY0J50YY7OyMieRi3YrdJWc+RvASsvD6
	N/M+955gfUTyu3T8xzM6KlEEdy4YroKeq5eapWhx/AU9yIOSiCMI9uDZiOsClqnSRgsdcAtowtS
	lB1c/k1KruMKBfE8TP6k5adf5+jj87VsknY05QzcMLc6KLATwcA03s4dZC6rpmk4UaqBvv1UJ5j
	iCwhfeJmTY106/QUFUFEmAxwL4FPgPiJ9E19THtONIfUpsYOZPgTJrKpiG4dGyFxFKohfMhw==
X-Google-Smtp-Source: AGHT+IGlFlHmXIUMj1dgYAUXjSWNyqsmGRvD2s4S8AesPq+R0ZFdEvdTmQACTlVbKUfIiYs7iMs7OA==
X-Received: by 2002:a05:6512:2307:b0:594:2934:8b83 with SMTP id 2adb3069b0e04-597d3fab04cmr678826e87.30.1764752139753;
        Wed, 03 Dec 2025 00:55:39 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa43f3esm5315377e87.47.2025.12.03.00.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:55:39 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 03 Dec 2025 08:55:36 +0000
Subject: [PATCH 3/3] media: iris: Fix fps calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-warnings-6-19-v1-3-25308e136bca@chromium.org>
References: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
In-Reply-To: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
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
 drivers/media/platform/qcom/iris/iris_venc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 5830eba93c68b27fa9db87bac63a691eaca338d2..730f2aa1a83b2f4f90227ab9a7e04aee7c2c3cfe 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -408,11 +408,10 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
+	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
+	fps = USEC_PER_SEC / (u32)us_per_frame;
 	if (fps > max_rate) {
 		ret = -ENOMEM;
 		goto reset_rate;

-- 
2.52.0.158.g65b55ccf14-goog


