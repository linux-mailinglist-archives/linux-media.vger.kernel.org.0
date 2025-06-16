Return-Path: <linux-media+bounces-34968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9922DADB56A
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B949216CB17
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22CE27D779;
	Mon, 16 Jun 2025 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fntgc+a8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37309258CF6
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087764; cv=none; b=dwrREYmEO/Suh4CfluecyzIvWXsCRYa4YI5tK5wt3q4fXZ8Ko54bJP537JUeJSe7TgjEt1wk+Ij07I4YPWmpP9ZhMULH4DxBWVmy0+gF0nh7Fc7FDyLm/lXNrNy1pw3M9oxp9PNqv5JJSGXipLP9FOwZGH0uRlpFyX0GPLw0xAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087764; c=relaxed/simple;
	bh=nJe/rCU0mM1LK6ZhEfAvqmM6ue4Q9Vd6jDTW9fx9UlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ju3/9afS3ITZ65961aU+HjN9w3/4VdEbS5uQBtURmdgE4fCaMBbSDYUVLFlMRRvBbjc3mtG1uJC9VDE9FeZFDS0Ha4FHogfCHCk2uo3F2+h6WeEMqFpMr86AyTDxBkdy5a9zx5DYTdpW8IGq14rttufTjXKbuet0YclpyHKWtEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fntgc+a8; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553b60de463so2856215e87.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087760; x=1750692560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tU/MOIKq84YnAfhWoL4YWtwA5Rdh3uTG/Wp8rz5grc0=;
        b=Fntgc+a8z5geufgs8sQoEQbGb/K+59HnfptcsL0592AYayiLkVrWQw75I19JSwYuN5
         kY3NRTR5wCMKwcXdDiQPmUp/Q8uDOsc+kp63l8Axa6LLPTR/eItMX3RHFcN9PkaiEDJ1
         erZdXwV8uzT0z+h8MZ1otW4QkQnIb3UvjI/2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087760; x=1750692560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tU/MOIKq84YnAfhWoL4YWtwA5Rdh3uTG/Wp8rz5grc0=;
        b=G6kGbczUbFadobwLj0u/xIEw0bvSnHQA7cZ4srqq4++s6PxWoFFyidZhKTQS0f7D3F
         pxfbC0cEgYvlvreAwFxaXrpGMxXmjFv8CfmhvFh1tT+MYO3pmbT6uSlGQESwftb8rJND
         76qlr5h+yNpVYXjWiiXPxqmPFZpoOw6S6e59l0xD++E4BEfUfsd0mDyQ7cjwGnOVyud3
         TbBk1eZCUOq54RvIwO0LYgQyWGq79QLStP98XqF1vL+nPQO76YGywYDoq8NNfPTG66HU
         KWzpd8FPnCvzz59JP/o8htEA80gRl4GBSeZmQIaGrFbZ+eU+M8/8LLfh8bY9qUUmMU9Q
         1Oqg==
X-Gm-Message-State: AOJu0YzgtjsEndutYhfQ7o0TNjiQ0aqBS+L+xdSS0fdtoK6yJm7UMatd
	l0vUKzeG5aKF0iJfVwbAnTk2vKOzDdsjzflhJS+euQyyXnhrpPeS+XmH+PG/R/FNgw==
X-Gm-Gg: ASbGncuaxJO68nCceYcbyuYN2MLMs33dzQgrjYfKZ6OvV2SXBnTfNdhSeUVHr0neR3t
	eqFZKr0p8yCsI9AlQsNNQ0FQnwwzy21j+zhQN9WfILvpqOh5Q61rMlpw7s9dtl1PuSQVhDXpKlK
	CUEG8P2JOUeI80mT9+Hjfu1BzHO5yoGDclXSdMhHaRg90yetUD3ZDxijDZiFP/Dtkypc6ITLhGH
	M+a1eXfk9W7d8c8wRqsXJPhKNzWB2z5muoGUZcEx8c7+0zs3PrNjjTCZe7Qvx0AtHfMLi1WYZj8
	PlhAJMCY1RvHsm8666gftEvS71MSCbZyZLC/i728YZN2FzWrJAB0wAhpkuTMGYYPGHJy7HlWv2E
	2nppBLqEfjP/ukmpz/+Dnjwu4xYhGmKIUlrgbu5Vgai4p8cpwknXh
X-Google-Smtp-Source: AGHT+IF9Hd3Wtj66G1qTf/FKk0SD1/kjIqCqNtZy8C7aM1FLVNBfFTvcQ0578pGYNs8i7deIw2reqQ==
X-Received: by 2002:a05:6512:b0a:b0:54f:bce6:63bd with SMTP id 2adb3069b0e04-553b6f62293mr2330891e87.54.1750087760319;
        Mon, 16 Jun 2025 08:29:20 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm1568020e87.31.2025.06.16.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:29:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:29:17 +0000
Subject: [PATCH v7 4/5] media: venus: venc: Make the range of us_per_frame
 explicit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-test-v7-4-b8c0f98494fa@chromium.org>
References: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
In-Reply-To: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Fps bigger than 0.000232829 fps, this fits in a 32 bit us_per_frame.
There is no need to do a 64 bit division here.

Also, the driver only works with whole fps.

Found with cocci:
drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 4979392aa20b6dc94895c7089878531b92b57754..13395aaf06bbb1f381d809c18be61c5d6da85723 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -412,8 +412,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	do_div(us_per_frame, timeperframe->denominator);
 
 	us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
+	fps = USEC_PER_SEC / (u32)us_per_frame;
 	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;

-- 
2.50.0.rc1.591.g9c95f17f64-goog


