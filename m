Return-Path: <linux-media+bounces-44273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9CFBD35CF
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E2BCD4E75FB
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD7325DCE0;
	Mon, 13 Oct 2025 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T7ULooxs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7C324A044
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364821; cv=none; b=YWtqPK8j1PjJ/CPa1kZtPhwWm0bMiZzX9LKXFa8af/gd7k81KLxwJJ3dW3a8pBvyjFYwFqQAohYpuTcdIoH8orQ05xkxlo8SBHb/UhsUDc4VAetmzQHQbrFMZYhU0t59WI5c0FgDbLRhwLgFoUsNzhv6KI6xzTJgr+ez15/6oNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364821; c=relaxed/simple;
	bh=VrwVxnBJbE1HH8epyWBnfON3AOVOOL93Wc26DKJqcVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EVPoP5bQsG1vGvNksQR7MtzKISMm8c2gf+Ihi64CMTciTF/ElwYMHYVoK2X+6WlLVcXs1fi+qrZv2c0Y/LkmTsdDEIYFfaM4sppxhesTJ2aHbdHvmI/TddlmxadEtda5FATq4HrUqLo2Jk4J9fNEVJDt1NJVssXzwuKJ4Yg/UIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T7ULooxs; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59054fc6a45so1055376e87.3
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364818; x=1760969618; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VMoJohml7hT26UAcl5VOsiah4+MzHyU0IYmm0KpSVVE=;
        b=T7ULooxssY5ZM/BQm4id/0/6TPr3Yw/1jqyL5rk93NrCojhaq5EsU4NeaFcGmCUvcl
         NVlQRvUjZpR9ADpWJPMP5QS99k1AxPyHVseAaQVaDoKBtBSDe89YP3aLAVAUUi7g/m+X
         vmiwn3aBSr0fKh204I7+94nDc7Sfxgt1o95Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364818; x=1760969618;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMoJohml7hT26UAcl5VOsiah4+MzHyU0IYmm0KpSVVE=;
        b=S3O1knScyE3epcyQ1TwcGobhGIQwwRvpBBMQ0LJZ0E7IedZjP1Aoy8Mje2gf2TU/Le
         UOc/TEZtjRG69H7dSimVUBcdvVsczl+eT9syrcc+ZPRHUzZqFk3ybgQl7thcCu2fv47B
         DGUVSEku/u0Oa3wTqPIiIQkCdppR2xH4bSornb3w9L1lHVZWW4aVmgS/WZpYiEdCgeGz
         q49PbOfDUzjJTRGE+kB0MQteCnIXvU8ECXljV51rcoUmOgS0WwEuk/ZRLlxYAnHvruPQ
         EfuxkG5StJjJG4KY/8n8uJ9eLW+pyf9sXDBuNFoVbTR5QWdmuvgouB4mKcKx7uHvOquF
         eltQ==
X-Gm-Message-State: AOJu0YzZqw92e3mwAnUbWiXj21c1lflnXddn2aq67AxL0bmePRxc7L7M
	4M4h6WsGmAcvU6159HoxZpG6P8MeEj8v5HqDnKA8aYAc3Jr+UBDbmBPQqVen5G2h7Q==
X-Gm-Gg: ASbGncu6d5SFmsmwblZdWUYx9uiEw5j/iivjC6zRHPWvZaSu7L5MEMeWMBNWyAmEADC
	Os4dv6JMGSh1wIZzVq+kQk0UigX2pbem0LWIvsdaSKbQmMPvnb3SbPstk1eKWp1317Y/mww9119
	bXSrAKTyPAFWvbPIXDpEeEfDbaa1ceFp3R8fRcXuCeMyqb37oxfPT8/bKY97qe2ZyGlUJgWejq9
	53ktKSSitWcvYhnl1Gamwm30t9FsB8Cyew4JHCgTH5GbWrIG+l0jSN3ZVqdLNa5ovqxHx2VxhoL
	jD6sv0EVtrLNlzqMEEBtdJTrs2exTufc0Q2VpVuKmbuP2Nz9Ecz5ml5uuUA2UTAwLKQ/xjzNr8e
	KXx8jZEDPiXPlQ5e6gqS5U/DFILltsYUC91rmMx/EBZBVY8+EVrfy3d/lEttt3l+7uXT8O8dmZ0
	/LFOJJogqf5EoKW90hIjO7133qT50F
X-Google-Smtp-Source: AGHT+IE2EczYKFQFN7sMxN2/+GfInkv+GHaLvdo/s9X0uHJy14+SUpjLLq4nVeukL3Rqh7NbHKU/DQ==
X-Received: by 2002:a05:6512:3c9c:b0:577:494e:ca61 with SMTP id 2adb3069b0e04-5906dd53f00mr6801047e87.31.1760364817682;
        Mon, 13 Oct 2025 07:13:37 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f91c0sm4168722e87.41.2025.10.13.07.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:13:37 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:13:36 +0000
Subject: [PATCH] media: iris: Fix fps calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-iris-v1-1-6242a8c82ff7@chromium.org>
X-B4-Tracking: v=1; b=H4sIAA8J7WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nj3cyizGJdy8SUlKQUI/PUNHMzJaDSgqLUtMwKsDHRsbW1AF8mgcJ
 WAAAA
X-Change-ID: 20251013-iris-9addbd27ef76
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

iris_venc_s_param() uses do_div to divide two 64 bits operators, this is
wrong. Luckily for us, both of the operators fit in 32 bits, so we can use
a normal division.

Now that we are at it, mark the fps smaller than 1 as invalid, the code
does not seem to handle them properly.

The following cocci warning is fixed with this patch:
./platform/qcom/iris/iris_venc.c:378:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead

Fixes: 4ff586ff28e3 ("media: iris: Add support for G/S_PARM for encoder video device")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 099bd5ed4ae0294725860305254c4cad1ec88d7e..1234c61d9e44c632b065a5c44d3290f6e1491892 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -371,11 +371,10 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
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

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-iris-9addbd27ef76

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


