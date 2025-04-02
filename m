Return-Path: <linux-media+bounces-29228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E55A78E52
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 14:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E85D018943A9
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 12:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA6823BCED;
	Wed,  2 Apr 2025 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rc9PnLR/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7880A23A58D
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 12:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596662; cv=none; b=u7NN71CsQvVGg1V6+y45Ns7WwIg8rJizdHsJpypx26pWMcqLjTIzSFeboP+TCLJlxyWjh4IVn2dZPS2X4wLq92aKWeEzcl5gtZYKKLOzAYM11LwCjunxXbEWOftqRD0vEzSeKeO8G6YfmGzg92yZGms92t+UdXKShDntNDN8Rxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596662; c=relaxed/simple;
	bh=bABY/WNuHuULundVfQJQv4yaRqhnbk98ZlSWhicYpz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iqbvHeNg8PuPBXtVMvxRK2CrtwKsrLpRfIrRqAHVwx5PVhFWmh+9twq5AMt4nr1+pKbTMtHsNEn7kTVBQh1oClfOIpww/u0/R+UqFqcdTlKNyAtHQWpm2CcpT+wl8RotBSieedbjQqXhUmCeiBJTl8tWCFOnW/KCrJKMbdHLmsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rc9PnLR/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3754184f8f.2
        for <linux-media@vger.kernel.org>; Wed, 02 Apr 2025 05:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743596659; x=1744201459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xVeLAbpwnli2t942OmYzCBSELCbKGbXXQnGN1GcV5M=;
        b=rc9PnLR/gUgnKidPK4ZKsHUNFnXzeCPAlEZfec3uQZqK2yiFuC5r8RyRy6nJxHqqee
         H/99KvZMeUt7wKHKFEFLWarX8CDLD6E8kqRm+AY0rX7+XF+BrWRTxFmZz6iK2rSzF/I4
         4qg9fSMfh1IbIe67xgFehgpvFWRXL4UXJcCYHmpINACeD62kGycSW2H2XZNL3Bkuy5LF
         W1ZfhOCHukPBI9rLZ+lRxtCH8EWVUSuwfGoiJwJDQP8CggvWKMXzdQ/tWbHnn/B4AIzH
         +ZhCkO4/jcXs4CaS5dWnBSjQeKm90kpj/4QqNZwkHKhmV68iduPsK+rktBvIvssLs8LP
         9lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596659; x=1744201459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xVeLAbpwnli2t942OmYzCBSELCbKGbXXQnGN1GcV5M=;
        b=HhzP5UP8PTLLwZLQ3liFU024q0eiRlxw2bg471l69oLVSVcvRIuhXxUYMbgEgluYuC
         nvENIzsIl5Z/dVRC+VVsMJNx2IebsBm0+PV0KwRl6dtnkhGj8t5Yug5vgaU5IUrhrYOk
         og/BTkzuhs2HjlNGlQEs7LeiAZAQlIA3XVCNsYVjGEIqtNQbep01RgPHMaTpBgxPUck2
         POKYDfXPwVf+Saow6eyg5o0lFpSr+mFPR/E4BiWknkQ1jjp9R05+pdnsiSbm4cYZ8ogw
         2jtwmzFxY7jTot9F9wk4auf1+fxdol5JnwNaot+MpOHFS2YkZg7TmvX3fenwQ80nb/LK
         1jzg==
X-Forwarded-Encrypted: i=1; AJvYcCVcpf3r/O0eAoJkawZeHuE7sscZJFqf1boF++nG5RU3o5a839lhTLFR7jia7UQXDwxPSshDIpMMhz+SlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPbfWoJ9VlzIca9TM/MtoQ6V1VeMISWy/b3cbzMWWJmkbzARwp
	FsIBiGWaK0LGamIFc2nj4D0dBW3c3D9a2qxFtloPiGvH21Vx8jzkYj66/ENspLY=
X-Gm-Gg: ASbGncsRZ5MUc6Q1zZ4HeTVWLA9H09Fimo65flcQqfGjl7gU+rg0wWPrhjWALfaILcb
	Fg3EfoD5lZPPLkEo5zCkQJVkj/8O9QZtLr8lbXSYL4YGKTpEoNim0mTPFc6z9M6w4BktMvHb0v9
	qQAFt1BPxPepQa+7ODvyghSkIgJOp7yGsmX4wZZKxSUCyZsYOwECl1P+YOU6nk/Nh1AzS3nd0rM
	iMhvzmUIkemL1eFS93lWHQNDqdCJ0x7fJZrEO9w/o63lO2Gif6jmIAE44nkK61osPHanyhyTIh/
	XbcOXAte2gzzoptx7Mhlv33IyLDqSndqtpY0iuJfKiH2aWrxVLax8ZjFwEx+MHiuCXagFy6fZeL
	2gmfKqyM+Ig==
X-Google-Smtp-Source: AGHT+IH/sQL1nmUqtLknA+xuOc7QjAyUlZ5yXz2OgITYTy5u49Yu2BaeAaclCixFEeAtOjKS2XMsVg==
X-Received: by 2002:a05:6000:430d:b0:39c:2665:2bfc with SMTP id ffacd0b85a97d-39c26652d7bmr5094266f8f.52.1743596658777;
        Wed, 02 Apr 2025 05:24:18 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60ccc66sm19418675e9.24.2025.04.02.05.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:24:18 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 02 Apr 2025 13:24:15 +0100
Subject: [PATCH v3 2/2] media: MAINTAINERS: Add myself to iris Reviewers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-2-2b2434807ece@linaro.org>
References: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-0-2b2434807ece@linaro.org>
In-Reply-To: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-0-2b2434807ece@linaro.org>
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

There's some crossover between venus and iris, I'd like to help out with
the reviews for iris to ensure we keep upstream chugging along.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d03530f3298703c5f3d025010511451f878f822..4e321a5be68517605f4fc1e8f1b2deb1b755c41b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19529,6 +19529,7 @@ QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
 M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
 R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
+R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

-- 
2.49.0


