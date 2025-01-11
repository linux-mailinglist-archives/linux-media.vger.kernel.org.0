Return-Path: <linux-media+bounces-24639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0D1A0A27E
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 10:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8F153AAC49
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 09:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813DC190665;
	Sat, 11 Jan 2025 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mzmvtG/6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9B818FDAE
	for <linux-media@vger.kernel.org>; Sat, 11 Jan 2025 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589329; cv=none; b=Wl6bpxqfrf8YqfcLH97BLifSe4g1KP20TxbExF8CZPKOOuDQdwzOU0KT+ppTfgxFX5Zv8m06AUPloP6qk8XIOesEwv5uJYyEECTtNw/u7V621TWdWUVmh2rwxUWGQ7oH9gVjdrZ9gKx6k+Twqw+WjP/OcBtVCbOwMjcPkRZjZuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589329; c=relaxed/simple;
	bh=wNqPLVCH3hrYmgRdcOul7vFmT8NC6JPiLWWSYrAMGoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0XyAz5zi1BLRvgdkCc6VfI+tRiWW8SS4mCUmOyhiocERGbvDlV2K3iuoq3Tx1bH2j17h3D713sbh3+arZEiefEF4WNnJckfFs0YYE+3FshNApbYgooAtD+DEu97Byufvy3C+ooDTXMXi5v5jR3CMkDFq7tqFE6PIDF4BZ+VAWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mzmvtG/6; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6d8e8445219so24168086d6.0
        for <linux-media@vger.kernel.org>; Sat, 11 Jan 2025 01:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736589327; x=1737194127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCQd+Ixr8eKIqoAvIvPqynaVVvGYXfmfSE/3mmNL7HE=;
        b=mzmvtG/6r8mK1zoH6VyrK6+xwRRAqfawlkHIsMszsUYLwvRYn/6TL6Qr61/nvx8rAs
         Gdd6cw9NSir9g7J/HgO8xO7qrQTrxXDEXPVfhXpquWrhuvR6ClZz03Lm7piHlXl+HFPd
         BDIm1RO4GnaeoAduoXWkj5W/YsYTt8+q8gCHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736589327; x=1737194127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCQd+Ixr8eKIqoAvIvPqynaVVvGYXfmfSE/3mmNL7HE=;
        b=kmZx8Sv6S88AAzB8b/8R7KCcyTH+MvZBe8yBjdWLXVv4rbdN3z5qpSyyoNMQqiBiZ4
         +HK5IJJo3r0NpmHrx8DxBGTAGetzzUIYCpmBycY3TjMFwHrD4vL3QEJvCoWvwzqRee+s
         qMt4sm8fg8Q8tyzdSvtFRyDmw+CDQGKBaGtL+IkEJrVDY1MhYNr2OWRH1ibyk7mYqHHl
         QNqJpEWC2b7Ky9mmRmXtH4+0Ge7PYX58njdlT1S71vPf27tnltYf9sk14eSnj0cPHlix
         28IkgbzazXMoQG2T/7KZfHS6+R4O5ej4G1L+ZqPQGtF6MxqupEMg74LOiYdk1Vcf+gA5
         4LEw==
X-Gm-Message-State: AOJu0YwvQt565NIxw1x7WXfU54gBeqrtkF4B5XkwCKs7rAsC+Hor30Ea
	S9pF4OZbf6iWpnY2IVBUse9HOuo1slfDS+OI0s9g7RYESPfO8E/Av6+z9LmsXA==
X-Gm-Gg: ASbGncu+tNSqwa/gYsiRMfFB6saGwaLCrl3xEcfy8Bjq+6cgTRWpODznTNtf9vM/ywk
	gAitoQKu224aHEv7QxzhFpjzQaWg+mWpU1VLuJm4nhO9TPUFlWPD+4SEnr0zO0zWxCggxWvqNkg
	Rti+/93fO2U88FihUDrz518NZBZSHs3oL6krnkIR3RnT7igIOi4KGShFrih8IV6uapK46Ohm8Mq
	HOJ+UHhSgztFXS9RzXKIX1a86US0tiEVyswYhy3U+iyxUrzU0hDH9XVFX6XRxY1eRiG0zz2xoQs
	Glj9kH/xRGyDoNUFPeoiHIatXZRj46JURID7
X-Google-Smtp-Source: AGHT+IHefNcjGKIvCVrBMfxFKkoA1dyzaoWQ3H4EQvH1E/W+4lJXoiyaYADeYG3+4FMKAC4ihgK0qA==
X-Received: by 2002:a05:6214:4111:b0:6d8:8416:9c54 with SMTP id 6a1803df08f44-6df9b1ed60bmr244663736d6.16.1736589326457;
        Sat, 11 Jan 2025 01:55:26 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce327b8besm267096785a.59.2025.01.11.01.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 01:55:25 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 11 Jan 2025 09:55:15 +0000
Subject: [PATCH v6 2/6] media: venus: vdec: Clamp parm smaller than 1fps
 and bigger than 240.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-fix-cocci-v6-2-1aa7842006cc@chromium.org>
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

The driver uses "whole" fps in all its calculations (e.g. in
load_per_instance()). Those calculation expect an fps bigger than 1, and
not big enough to overflow.

Clamp the value if the user provides a parm that will result in an invalid
fps.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h | 2 ++
 drivers/media/platform/qcom/venus/vdec.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 44f1c3bc4186..afae2b9fdaf7 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -28,6 +28,8 @@
 #define VIDC_RESETS_NUM_MAX		2
 #define VIDC_MAX_HIER_CODING_LAYER 6
 
+#define VENUS_MAX_FPS			240
+
 extern int venus_fw_debug;
 
 struct freq_tbl {
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 98c22b9f9372..c1d5f94e16b4 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -481,11 +481,10 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
-		return -EINVAL;
-
+	us_per_frame = max(USEC_PER_SEC, us_per_frame);
 	fps = (u64)USEC_PER_SEC;
 	do_div(fps, us_per_frame);
+	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;
 	inst->timeperframe = *timeperframe;

-- 
2.47.1.613.gc27f4b7a9f-goog


