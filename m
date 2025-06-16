Return-Path: <linux-media+bounces-34967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD02CADB564
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F68716A449
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A284270ED9;
	Mon, 16 Jun 2025 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZTNid2kG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23102206B8
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087763; cv=none; b=mFqF++ha15dMOW7NF/ubwNfFyXwJQ76SpnrMqgkJHT57xRVrpuqrUyz9gbvLNhiQKlqCl6bIuv6DoeR83qSculGhpmUWYfPBvU8DLB8M/FYqw0ELFUetfAMfH4H+x8N+beXXuohNSRlAqb8pi8wpCH6SF7scyGMlZdGvNgWd1uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087763; c=relaxed/simple;
	bh=pnwKaxykfNl41aVSJ0fgQXHFHUyk5NTEvR8PclHUs2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qanDoqUqr3uyJnThzzYm3t2P9m4vZCJ7m5Re0LQIL6piJlN3Cj2bIgegbpSR0GhzQZFabAXifYQot2qVnKACJSL4dyeNk71z9pIxQrlYl4wSQsbdVNb69j9TnqI9J82ojtTKgScySpJ3YyXwIRA/Y1LmlzAvfLIqVAVLU2UKZC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZTNid2kG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so5247702e87.1
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 08:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087759; x=1750692559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMUfpPv+dKOq5nGqXppL/8SlSmSo+MNRFt4xE51N1U0=;
        b=ZTNid2kG4zqcEvyUL/hWbtfy9fOiKHVrhvXPfsU//3Psk9cQ2Ktu+E82jwPaR9dk1k
         BIJxf+DQZlQfZp1hZA4XYE8iGMDHDsRhWMDXtO9d5faEPifYT70gP8b5yLyCtHZt3AfI
         pm/iMMu6/rimtmbd1oJ+D/brBEXyJlue94G1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087759; x=1750692559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMUfpPv+dKOq5nGqXppL/8SlSmSo+MNRFt4xE51N1U0=;
        b=jKr5CM9QVxxvjv2LFjKbGJ7Xq9bLYn6yiIEbMx/Zcn+wORrVyxERCiaYDm0H4gLzSG
         JZhS2MJEKpZ2kycITshu7hOzN20js/8fYpWc8hIUnLC/m7eFIgzvDwE9CJChIDZii2Ib
         6o0m+GXM9EBQdVciqprK+4wP/ebcNHUkQy+EmtV1Zrvi0foCx8DQ5qcemv5jhF3U2Avo
         QioT47X4lETy0oOSgqwa82aeSrWSZFSFWhYIMZM6PdpHR4c2qqjaEdM6n9yUrJSrzkrR
         eyQ/w7A+CUCXlWwdZsK4pdtMLPiQtR3D1+wJUlTIA/SwkC+H4x8fyYUFNzi8QsQD7utu
         wESQ==
X-Gm-Message-State: AOJu0Yy5jLr20yIjNWitk3IMNaUKQ/qCJ4P/mSQgyg7iCOiFti46AcIT
	u8VJQnKNKCZkxRGwpGsaR2Kb4MOWiLjSu4DpdEGyFH4GBODTNYu6xT5lLbpPe90kZA==
X-Gm-Gg: ASbGnct6KDVeM2tXAGa5iEMstayt40ZDsVEEi4OhiWMgaj6CvD0wXL1h2tqZTL034Qx
	oB/cnreabL0trBBJqMS+XjwRU0TBjjBz0YrkrXEd17TD35CoIZ6V1cDG2TS/gFcAgCf8YLXMo+0
	/6x4SVe2w5KO+4Q5SC4fAnWk6NSWoi5XCy+6tux6WR4ClZp1KhQ9NhtPZ1RgQSXFIYexfSzstOh
	i9/qtiRwjvV3xNgfnU4ZZpofUAqvCZArsYVdMAHKtDrOewsVPOf1sU1mrcYuC3j6lq354ZuIlGb
	TTHGVt4NVFiNsQZRStbdgEzEkJm3p2ts8vyNkOWx0SI6NVqTJYV+UZ5sbKv1C/dBQLOjJedS6K+
	UB5kNf+lTF7Cy+FbY8GfRBPcctIakYm7U6e/EodxhTQ==
X-Google-Smtp-Source: AGHT+IFD7e6mqRIDzO29wojSrb1K2/2adoVUhXjbM4ngtgXAPyANGqcX+Ed9wMyzJi7Yviy9nzQ6+Q==
X-Received: by 2002:a05:6512:3b11:b0:553:2f33:ac0e with SMTP id 2adb3069b0e04-553b6f25d94mr2553688e87.41.1750087758806;
        Mon, 16 Jun 2025 08:29:18 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm1568020e87.31.2025.06.16.08.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:29:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:29:14 +0000
Subject: [PATCH v7 1/5] media: venus: vdec: Clamp parm smaller than 1fps
 and bigger than 240.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-test-v7-1-b8c0f98494fa@chromium.org>
References: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
In-Reply-To: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

The driver uses "whole" fps in all its calculations (e.g. in
load_per_instance()). Those calculation expect an fps bigger than 1, and
not big enough to overflow.

Clamp the value if the user provides a parm that will result in an invalid
fps.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5615-rb5
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h | 2 ++
 drivers/media/platform/qcom/venus/vdec.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index b412e0c5515a0916f6a8969ad3be01841e09edca..5b1ba1c69adba14c3560a4bc6d09435529f295a6 100644
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
index 99ce5fd41577284098dca54c7772da0691cf29a5..fca27be61f4b869840904cc0577949635bc63cab 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -481,11 +481,10 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
-		return -EINVAL;
-
+	us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
 	fps = (u64)USEC_PER_SEC;
 	do_div(fps, us_per_frame);
+	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;
 	inst->timeperframe = *timeperframe;

-- 
2.50.0.rc1.591.g9c95f17f64-goog


