Return-Path: <linux-media+bounces-24285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D35CA026E1
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 14:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6FB31885DD1
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 13:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6491DED79;
	Mon,  6 Jan 2025 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UJXIyOZD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A9D1DE8B4
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170817; cv=none; b=Qq0bgLtyKpExm7vZJC0ZdBtDSSngCN9bwsIJfMHMj8zNNgUNBtDhHK7c+uwx8RmTeIDkLlFNtLHvmIQ/B2W5NQVYEfq5JkQrkwSlCcKW6RfDR+C3HUgcWm76y+15VOs+6Y94t6Ci6B3NYcsUydSxw9LiQAFU2uwdJswZVzjdIOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170817; c=relaxed/simple;
	bh=MKfqw2WVGARyLQAOD8Mt7Dqo3jHse4EHvr4z1KQ2TkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9Gjgp2LWR87Nka2SnxiAEn+G73Zk0aXxBtT4zE6++b8vR1Fd/25uuAMFLmCQWQR3dO/+tPlCi9Lcqllq4wnagvLR9IwA1OLlm6TsqjFkVHVyNR5R3iIe14og5sjPyKxR3cyua6/DqCRruH0QuT1Njr3SnB7ea0doGujgH25+KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UJXIyOZD; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6f95d2eafso1403643785a.3
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 05:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736170813; x=1736775613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fr8YCqaCWwp/Be9W9ht5j9c8BF4MD3nNLHYL3KKI1+A=;
        b=UJXIyOZDLCqwwJcc9P3iK34i7mE2hQ8APvMppE4KuCMjHuxhaRwK6GuRp4+bDGKjJZ
         ZOhop9yxWZC5GTrcgVozLT41m3saXmDGHZhk7ndGgvVd6dVWLHZyl5Jlw/liCnUD7raZ
         i4B9g/Gp7Hwlu7ybTTcNiFmJaSNEL2D+BtBiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170813; x=1736775613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fr8YCqaCWwp/Be9W9ht5j9c8BF4MD3nNLHYL3KKI1+A=;
        b=NStP7tt5wMYIog5vq2Bo5HX/7xB3fzS2a4i0laTJCPbGTkC4bWesrVP1bQvFiRyPTu
         g0K0AQntIp6z7V1MutQHEy/zHusMSWJnMiBreyHE43I9zMdtlfy12oKTacjxKBv4NKMs
         chXJoUhxfhXoKqgNyd+Uykhsf5Nq9RbJeFv4pR+D2cIe95w9p4vFKgvppiIqzxmUeUoE
         5pzAgeocLTJzNPR4bi09zsHpJo50u+CtPHC3VAh1bg+XgkHN++vNZpm6pO8l+K5Bjc1C
         wvX3tzmcButxbEVdVIPZQFbthufjIdrCRuJRcEIi+xej0+R0wzp6eYASTVTiINlGKOmw
         Cxkg==
X-Gm-Message-State: AOJu0YyLFeUze6WPE7B34A4KAAE7/jatK9DE4uXR79PhlvdOakimpFgE
	+Tslezf0ylwFOWDXarjVGsvPDCtjs4XG3tWE+u2Fbq9UGLMldul9uI5etLeStw==
X-Gm-Gg: ASbGncsLV0uJaqfe+Y13HndiegANrCI6J9P0LUG6MdZkcSWjoJS8xyiYfHjai8dG1if
	8ntpn+vI3J4zLt3r4CE3lfH3BaHizhjDWB+YDgf4cXcDrqWhIsXjhEoWCLzXfS4gajF3x8qwuJB
	3DyNDU19NjxFqLWABZkBvmdiNEGGIqXrdkhfBsmcFx00Mp+Btdfdvokij4zdtmozixMVkKIlU1S
	U4oEXFhMAnaV4Ln+MmL6txgfHUE8xAsEwqy+oqPDbwWVz1+QSIBs54Vx94S3k41bmu+Xd3b37s5
	Uqq7VVkHFIuNMRw3JCibFVacZ/JUA4VBTIS/
X-Google-Smtp-Source: AGHT+IHcjB/Pb8QD204DXadECgJD3hF6JOTt0Wc101hAlBe7SX6FDrf39ifHgQZXoKerdzwzAWLNnA==
X-Received: by 2002:a05:620a:2805:b0:7b6:ed18:fe2 with SMTP id af79cd13be357-7b9ba79c187mr11546099885a.30.1736170813425;
        Mon, 06 Jan 2025 05:40:13 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac478d35sm1501861085a.90.2025.01.06.05.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:40:13 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 06 Jan 2025 13:40:11 +0000
Subject: [PATCH v4 5/6] media: venus: venc: Make the range of us_per_frame
 explicit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-fix-cocci-v4-5-3c8eb97995ba@chromium.org>
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

Found with cocci:
drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 8355bd59a5c2..5683a04bdc14 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -393,7 +393,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_outputparm *out = &a->parm.output;
 	struct v4l2_fract *timeperframe = &out->timeperframe;
-	u64 us_per_frame, fps;
+	u64 us_per_frame;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
 	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -414,14 +414,10 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
-
-	inst->fps = fps;
+	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
 	timeperframe->numerator = 1;
 	timeperframe->denominator = inst->fps;
 
-
 	return 0;
 }
 

-- 
2.47.1.613.gc27f4b7a9f-goog


