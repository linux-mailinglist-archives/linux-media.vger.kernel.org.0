Return-Path: <linux-media+bounces-24642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BA6A0A287
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 10:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81CB416A7F8
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 09:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A0A199237;
	Sat, 11 Jan 2025 09:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bbKyHPHV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE041193409
	for <linux-media@vger.kernel.org>; Sat, 11 Jan 2025 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589335; cv=none; b=MXLM5US7VCT3IaEbQhcv4ReNQdvJbbMZZ4jtMFPTIsWIR6mC82ONz5GzT7xUqUtiZB7YTHC4pTtwBDD+7mergqslZ5uklJ4z+rOdLwikIlQ4RQhws+JkCMWNsiaTwum28eKw+dY95POui5ybVUm5VotDtMV81WJTrvoKYqSJeXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589335; c=relaxed/simple;
	bh=jFMkE+aUW4A2Tjf06APpBG1sAvp2ejflRJ8B5s0jBLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EvMylIobWCAbmJALgwYgx9hO65y7bFCdE8WSqM76rx6hs/wzGKEreoa2nLhjc9BkYVrMF7Yfgwxhc7RhCRCz6fzotun4c61ENoRsEb1JGwDaqWUsBCdzKjMb9ga28HAOUD4dqQwiJUSqHRE2ASgAkDAspbnURG99s5uW3Yp85zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bbKyHPHV; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b85d5cc39eso299299585a.3
        for <linux-media@vger.kernel.org>; Sat, 11 Jan 2025 01:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736589333; x=1737194133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3BoX2c5ZbHlzZ/xObQ8c1PFxHvs7MLN/22FFGinwVE=;
        b=bbKyHPHV+azn/fU4OTZ4UULuoo/8Wyomc7g3GS2WVI+rKoWrBv+wlq7KOXkn29VjqO
         IJEhnJ7jdxGh528esEr9B9DJsCQ3ro+yc5PLBqB5luxbq138kyLtWM+xFCrm954vwTmh
         tVQ66Er2TUZsKHcD7rKrUG6k1A18u9QTpPy4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736589333; x=1737194133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3BoX2c5ZbHlzZ/xObQ8c1PFxHvs7MLN/22FFGinwVE=;
        b=pPlXV9fqlAvC0raBEJ5M0FAczhvS2J0m79f8d8dK4dngnlaB2nCxYt8yrIqKZ4HsyO
         c28UKOcRPIHHjrXmKN2tpXZCB5ODWei8FsXQqquytO+3hxqlTL+XwrG7OFSvKGtPjOjo
         E7WaRfckmelTUS9j2LA/LxiD3v+nAZXhcK4xN4RpYsD8SAr7QMv1z3O9PB3v0okKkNwh
         Iqz6ZQIl/ANk1bWmCGB91mI0kaH6oXfgLvkA+2Wrr2jPjPMlT3qoNozOTv30SHAyafUN
         0baHbZYdAQ3jTXgNe4rapdJsMlWTn38XL6jNKt49ywgbg5Zd1sLBvsfWHGHzkRYcuWP0
         yf8g==
X-Gm-Message-State: AOJu0Yyr74lQz7niOQBJhkdAIvspWcbvGuvWzFapN2/ITmpVKZM6TjLh
	wTWYWk0DS4jT1TGSE3LA3QqT8OqVtnwxdkZeV6txlGuwIfJUJZ2WKtS/sr75Lg==
X-Gm-Gg: ASbGncvBkDVVpf0gw5LWRZNkmRxNaqpgBPOgCMjJ0T9B/H3fjUMVbGzah/q5Fs0e/bt
	UqlYqf/rpizqG+zJwFr7OLeloMjlQW5FC2bMr4kXyH3yJ/wZuc6Qwpgak7jqQtB3SkrjOkbenWD
	H/Xwo6Q4xGo9Lu3EHvV/iNgmUgNJNydrzGGyNQGdxEU/P86L1d+Sivx6XGv1pXrR+Sj+oFerewB
	c9RyMGCM3jCz9CxZsVmpFhDyBwX9bV4mACyzTGqLEhW7MEpr6dVb+r0BbM3dJMH2aIDMJljzDNL
	Xyg99x34Nix8tpQcQd1LqdbkCgS9EzmuNvCO
X-Google-Smtp-Source: AGHT+IHlflZapXB2U5EwdDsff9V9lka7ZWi7FvO7mOnx6N5gTF17d6mrdBuskWw0aArQ5dE890/KbQ==
X-Received: by 2002:a05:620a:2481:b0:7b6:ece3:825d with SMTP id af79cd13be357-7bcd9726520mr1906864685a.12.1736589332721;
        Sat, 11 Jan 2025 01:55:32 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce327b8besm267096785a.59.2025.01.11.01.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 01:55:31 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 11 Jan 2025 09:55:18 +0000
Subject: [PATCH v6 5/6] media: venus: venc: Make the range of us_per_frame
 explicit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-fix-cocci-v6-5-1aa7842006cc@chromium.org>
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

Fps bigger than 0.000232829 fps, this fits in a 32 bit us_per_frame.
There is no need to do a 64 bit division here.

Also, the driver only works with whole fps.

Found with cocci:
drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 17bec44c9825..2c1836712362 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -412,8 +412,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	do_div(us_per_frame, timeperframe->denominator);
 
 	us_per_frame = max(USEC_PER_SEC, us_per_frame);
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
+	fps = USEC_PER_SEC / (u32)us_per_frame;
 	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;

-- 
2.47.1.613.gc27f4b7a9f-goog


