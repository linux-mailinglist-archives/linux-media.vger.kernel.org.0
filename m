Return-Path: <linux-media+bounces-29036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94240A7618E
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF6857A2B1D
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1B71D63E8;
	Mon, 31 Mar 2025 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k4PmS5Xk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3161DE2CE
	for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409427; cv=none; b=DMBDWh1pvLyrxH+vRfHsdPxaPlhPd8SFg+ZNP1UA1GJoTjUVr+Xf01ElrnNUxrVa1SsgRnFm4SNYq1ZuM85/1SBI1Uarx4G7YxzkxOdniP/ZES9/GFFW2nUI8zxgczDWn/N3j8aLQC9kEMjK4TH6K1Q3gKDWkTJrHQIoWDqqvuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409427; c=relaxed/simple;
	bh=IWIzqWTJerFVGDEJ6dyCfjqxawUtXxEZNgAVar0xfxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4Pey050GeuhqgRai1lvxlUHMT4dG26/Il7h7WcMRvZ1ZECGxf2gkWFD/K60TAYBxEMLSqVAYTW5zUY+/3YKfVwgk8NR+iqYUeD07P17+Aqhkf3/g41y3kxB8l5+eAZW3xlg29wZ6egUN26Y3pVULPWAG464lOHOSiPdHlgAPRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k4PmS5Xk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3996af42857so3371815f8f.0
        for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 01:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743409423; x=1744014223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8WDq1ZGnO/CqUh+Nw2fu1DlW08+1Zb/2+tzpoO0cZg=;
        b=k4PmS5XkykKpXzrOoexzKUVW5fr0oskxEcL9/hohzaCgaYL2+0BFRubMCLL7Q60l58
         r9j+4tOHYeSh3D2Iw/UIWPvJw/4mB4mkGnyvzmqlrale9qh6AWbFy7qn/1gR1vDMAZm8
         zYma8n/g97W1UDErTsL5iwOVvgwD6st1GdwNoSxzUUzrmRLFSs//X+dmP8rJ6Rc/ce8E
         jtCaJtxABMpFAdXCxb6JfXYqamViqw53OqwwC7ExUDVhDkjIo4bjlSPBdpZqa8mN9fry
         OsufUvh5W4gQjeHQuwKS/PPqJYAE/slqovwOW2gdFsmCWN8Rg7Gv472h3OLQVsgt8El/
         WdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409423; x=1744014223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8WDq1ZGnO/CqUh+Nw2fu1DlW08+1Zb/2+tzpoO0cZg=;
        b=ZCg6CkFEHrNFZdj3bx1gchmMik6Bdfbt0T21uo6kzFsHNKf3bFigH3pajJ9pr5cyvN
         HJzFEIs2liL7+GXpGOn9Leuqme2WgsJ7USoNg0jo/Kf8fui1GTRPOKfpgmn7ZQCWrIwW
         kNGtBfvncmvX07CWLvHJUcIF48Pa1cWaUC30eu4ZXXT1aC4IYUNSOIstrKDBogKgqKET
         XXlgHIJag5bkBggqaGJ2nDlCLiGpBhN05Dce2A86fmIQVzugfSv8y5oyxbxSOIl1gKUL
         UkaA0tnJwmjQW6SJzNT6rXuniyPWDALU4zJyskY7iwBbvvtehjjA9yq+ROXBK/rfWYJ1
         R+QA==
X-Forwarded-Encrypted: i=1; AJvYcCUYr4WcSCJmIZ+FRfx952/6wX9fbf1QShVujL3zNNVIoP4UoQoIXEC+wEP8F2dnodBiq5zz6HeZIU1hIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLdrT54OsjKuK91ViA/7QnM+1h54NoaSkhuhV+0eawmpMaS9vQ
	FruTrUb0TRT48FMu4S+1jXbWbxtfIEMqDSwv2LJ6bStRctt0HeXXTrg5MIjbHpc=
X-Gm-Gg: ASbGncuISoJ72xF38GWf0Mr9Ze9t/l9T+FTj1ba1U0hPr1qt11C/myySvALqPA4YULn
	+S9HUjaR6t/0OR+iKmxczDGksKbM0xJp2oFc+N0RAhtLhCZkeRSRarjbaWKmunNA2XdJbpCFkkz
	PqlUPlFkPpQcVAzlHRA1FzhsMEl8ufzD9GJbT4dtS+On0wkTVuDIRnhesy5C/CuHBFHLYBvyjrd
	X5tz9hFxNXofy0qi+Y+OOJSTbSgdkVqvvz2BNAfYo5SssBwFHHTsN0RaRDCoQV1SUj2vIYPT+qj
	8nGFsg1I9DPeW/ZDn/5K0wiB4bBERh4dI/6OJw/IOFjd/1wQ0aSTgaYPUkajvmKcFqwc/UrUY+5
	CAwaK0zzwHg==
X-Google-Smtp-Source: AGHT+IEPliOGLXJ/ttkcUzPpUn/BmzsjWXM+S+SYmgYzau37T5+RA34Y6WBFtgNUEKvYobw7wxOI9A==
X-Received: by 2002:a05:6000:2a8:b0:391:3156:6be with SMTP id ffacd0b85a97d-39c11b7dae8mr6742640f8f.7.1743409423178;
        Mon, 31 Mar 2025 01:23:43 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a8e0asm10520079f8f.101.2025.03.31.01.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:23:42 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 31 Mar 2025 09:23:35 +0100
Subject: [PATCH v2 2/2] media: MAINTAINERS: Add myself to iris Reviewers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-2-036222fa383a@linaro.org>
References: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org>
In-Reply-To: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org>
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
index 9571d042c7f4f7d3b0eb3e627f3b5ae20cf52e99..02da7a074541862bbc9da442f8380794ab5af87f 100644
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


