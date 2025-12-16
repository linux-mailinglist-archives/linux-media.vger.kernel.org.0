Return-Path: <linux-media+bounces-48917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B63CC4032
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54675301F3C3
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375AC35CBB9;
	Tue, 16 Dec 2025 15:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cD5UOMm3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561D336922E
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765899752; cv=none; b=GDT3V0Y8gWyE101ZjbE7uHR39kz6yoJ9RHeHTIgGASdHc43/eSZDlmqnOrl1RbLUicz5G6F3lrcq36vTyfCn4ywS96qaU2T9u7dmqW1xMaf4Ub3Xqwhw03L1lnn9off+8/TfQU+Sj9o5xH+YsJGD1EZ8MP8/w7uwW4fRQ5XF178=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765899752; c=relaxed/simple;
	bh=M5jI5mFgh0sO9xG8ITV3eUOJCXfWDu7rg24QOLJv8T4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HGqKMGvnVmhw0oVURb2aMPUrAv6HHJeNN/7v+vWmDT4foyA5N6IfXc6izYA/Z3tzoJ2+WTRvg+pXcDLhqa0j5Wz/jXvToYqr8gzTqnb7p/GKHJOyolbhH+xn8Mp9783IGSbhF+KmhYa3LkR+0ULNpMX2XNKR8efacZG03IHbBhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cD5UOMm3; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5959105629bso4955336e87.2
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 07:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765899748; x=1766504548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ztlm7b+VM0LLd3VqoVbu/MTVuy9mYjOFBwoz/bGs1wo=;
        b=cD5UOMm3TvMdCtojq07eAg7hqxe5dbzv8mAdZ+hnTEA+yZdHhTK/Y3TNtoQeCIfNg2
         9pPWwlOQrynQ+VBLIwL/mwPpwyFfXW2QppwtSs5XyB9IZ029MvCOMYnojxIIs6vgH8wZ
         r/pB5IRYWLYk2v8G89hJGkMX/x1Hot8lMEAQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765899748; x=1766504548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ztlm7b+VM0LLd3VqoVbu/MTVuy9mYjOFBwoz/bGs1wo=;
        b=N5rKT+2dej0lw1azda+p8QMV/mzrvzpQzpuB77n0+8fT/Sc/pNgZsQja0PQ9gawwHP
         cFgkgqBAMjIr1dMBXtFOJWTUJWBzvrXiE8ZeZeKE9xyuxREVsCkhBNVX9rqrPaseLvbB
         4BYUYRmM7BB+EKfTZ8kVVN7AkuUEu+9RrgY/PlXzMXAsfahSjOk5WBrKTLsIgOvckDxn
         XxFHPOcdpXbbXdTxvF3BNIi9dh0LuFqMdFlL2mVRYZpbTTtu2k1d8xIVfY8Trt97R72x
         iUodLuIBKo9YxsQDBnSLpcNBCHCen0uwSOmJOUGSkLhAUzHRZbzjoBaBZq47sDLTQ+rj
         zBGA==
X-Forwarded-Encrypted: i=1; AJvYcCUomu21D7ZJMqtNmERRQ8t60nIYIEP5c7h/L/kiWajoZ1kZlUowv27iMblRZqqg3REVMSnSNHYb4UKoag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgsHCMBxNaQYwRyVSIjEDpRk2uyEI2TfhDaToirw27hNImqRk1
	n1230YyGRHiEq4v1DKY4OrefecobFO9nD8IXfSFfBeZPZiUNyZ6/o1aKIi/pekmLzA==
X-Gm-Gg: AY/fxX6ZiYEuHZfXW2zf8j7N4SjS9kj8+t+MYfZFLVWFHggyUa5n06IzyABJ1IztvN2
	ftT0+CXIqw+iiptwJzTnIIzrOZxe5f2umGCBryoo1QQlUaTa/lI7UiTgOQqXtB2tRiVfBa2+p/T
	lVNbJ36/8ZHEWlwtzv+UN7m76L8vDjNZQyK08y/IrQRjempYFVbDqZowTC7aNUF6qRAUkDVNXKj
	J9XA/O5iYqVhhP4ZBCqXMDRjYtfcjDmO3E4BL1vfDhQ0VX6AV4Y/rZb1/YUVSosUIN/MGY+d7+9
	ckBtvQwk6XvcTWDmdxHAcWaduHTGLhPaWRGvC3dg+m6uYMP5wHFZtdAtgmo6IMxKJmSxAixKg/K
	eA6KmRfdXMxkL7D8hoa65NMek/NJWO8wQi0uZWUWeYaieGY2yWafD5XV1Btk9yVF2e+Ek7r8Eqq
	KoHS7Ci+KX4qYhFMWOjstMxBdybv37OFWmmXkBqIlX2cQmgbRipT5PtlxHp7KAMFkuO2rh1g==
X-Google-Smtp-Source: AGHT+IEX1A/Iv3xmmU4qq0eqYZmFq5GrjwGFzD+8NRTYO1Zb7ju+OO+Wo6JMepkOgf9/tyK+xCBEGg==
X-Received: by 2002:a05:6512:618:20b0:598:faeb:2e2c with SMTP id 2adb3069b0e04-598faeb2e31mr3906303e87.34.1765899748347;
        Tue, 16 Dec 2025 07:42:28 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da1a4b8sm1003489e87.31.2025.12.16.07.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:42:27 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 16 Dec 2025 15:42:25 +0000
Subject: [PATCH v2 2/2] media: iris: Fix fps calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-warnings-6-19-v2-2-12075e3dece7@chromium.org>
References: <20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org>
In-Reply-To: <20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org>
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
index 5830eba93c68b27fa9db87bac63a691eaca338d2..3b941aeb55a2f498898a27a5f8cb58cdb26fdfed 100644
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
+	fps = timeperframe->numerator / timeperframe->denominator;
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
2.52.0.239.gd5f0c6e74e-goog


