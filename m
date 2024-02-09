Return-Path: <linux-media+bounces-4911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B00CF84FE36
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 22:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 764F5287DFD
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 21:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E210D25610;
	Fri,  9 Feb 2024 21:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5t7eATv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9141863A
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 21:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707512980; cv=none; b=OqRdCgxyPfcWmPP/EHKqfhifbdSdmRlaiVMZiTdi2mB/IlWF9fRjUweh+s4P6DXeNqi5f4d1QtLcBV3lkKnrSsAbz6SY3ZfoM6+VIvYTsHI7hPDiivDkT5IBcMLZ7r8TSRm55xSeY+pnFtiMsW2VfxNMNKjgftXXxbhG48CKX6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707512980; c=relaxed/simple;
	bh=4x/me5yeOEh7Kc0NCGCe3k/ewNhk7l+PTAXEKLbJtdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzuOEN7nk/yd4mN/465hHAEwU6Xt34HO1JPGs0nYvQAgR++jg8uykcDiJGVqsjej9A8XzsuspdFRBzTQ5C/4NJiN8rYFcHICSTD7EUUc+GJiozD8bxsAkL1h3/33DoqJSMOHWzdEj8WE7mAQBC7JlJq2nazBoUxAQUUuFEW1fJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o5t7eATv; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a389ea940f1so152479766b.3
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 13:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707512977; x=1708117777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clU3y8fBgJIxt4Cy2lqLbmum74KaZZM8VM+LPgiv+vQ=;
        b=o5t7eATvxhaZ/XquO4eAgkoflYx7zKCyysY2K4KKlDhoDBxv5BkuMmVN0Nq/OP4iko
         t8vHpJa/uryZ879JOxl7p9O29lG+fvMSB32am8vrEJB5c1br0PfGvM2UUHiRl3XmMYR1
         IJ0JCWkNLtf6AfMRDMhL8gR5lW0tRorZgE9IGEez4+0qnWjhIHLd+NI6dqSUJdGMLmvs
         wedzs0Ph5A/UO1pkYaTiElwv4sdR/nnTuWj1z1bKidcUerhhUMFoRagr5W9Pd7/JMz1m
         T3eEJkID6ssLHTV03uS3/RAVpquWD79IHiJia3ZRBZDGmAT19PbzzhlkxgO+o+RjYctt
         JUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707512977; x=1708117777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clU3y8fBgJIxt4Cy2lqLbmum74KaZZM8VM+LPgiv+vQ=;
        b=YNR5iggo44vd0KWFImGbcaSeWYNFqHShAqBcgS1hTHdLLQLkwh4JxZu7VZAqAGyvhk
         R7dDNSr0uHRUemLMWjFoqt26v+K9ulZ9HkoSUIeGeIHLQMHqzevUHMuARGRh+IWc7VyP
         rAk7I7AQ/Lk2AV72v0AOMD26izIPvAh+y7f17cwLBMzp1MQxvIRNs73i/RR302vHJRFK
         UKJR1ilc3fDu923B5DLMPaaOdmYOQOIVvRU3FjjJrPHWo6Mh8hHUwRLa6AKxmhOHe086
         oeEd/UQKf41dS7V95HM9wHmclhmc1WYuBqwfql8XN7KUp41T2M6uLQ+f/4jP0SPAlFDp
         uWxw==
X-Gm-Message-State: AOJu0YxDmDFvxKQdZW3PmAejXaNyN5/SZKrHEzPb4ggjtB/ViCZT8f9M
	ZlflIgS6ZXzU9Tp/n7AmspWkLC1qtyr0heais/yvvNmRx6k9DigTt4eGwJOO/E8=
X-Google-Smtp-Source: AGHT+IHzP+Vx814UZKik6txLthDwrUOGXXEAdY69dIQ5BK4YVYcz9T7m9182CwcJmk+k8CJWwZVKYA==
X-Received: by 2002:a17:906:cf8b:b0:a30:8c7e:5f7e with SMTP id um11-20020a170906cf8b00b00a308c7e5f7emr180181ejb.28.1707512976771;
        Fri, 09 Feb 2024 13:09:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwpQeaR0xOayGoUqOVl+6TXXrcArmTCNHHL34seMfomq81hBB0gbHB4UJ3DhbgmsHaCxbRpxYb9EiEQ94DeQXlgchLwv5IM0tzG2BNvpJwFHuZe19yFJfOGOA9fxuoDoh0+YJYomq99DAwc1hiplbcKYhvOcZw/8n/rpSRwZFOLF1Qj4VNL6tgvp5OX0CPqF6QYczqvoCocJfuk0OtOSbNkO1wqVQ62t3gB1eyDudxWqX3FDsKflAc5Iq1AU99q//UNQcHPJoRa1KLEtKY79aZ8zNVznmDoR0/D9J/VKUYxfna5N7xwvXVlnHHc61rNlYe25bG2VMc6jjbyAZQOyyE+sXXAavlKoxSJf5vAsSrdVDyIFTOaoE3Jod7OY78Lrhurg1xNHehtxEeOf4PS/iN+RgU4YJnQMakzhazxd4pPKe0YHlLC8Od8bHj3F9SfF3R2MJ8MpN8zhZo/wn/rAnXEx7fowRggbFLWdd0skbSiOzSmwrGz/xzbccj3+8LMD/7gw==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id cw3-20020a170907160300b00a381ca0e589sm1108516ejd.22.2024.02.09.13.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:09:36 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:09:23 +0100
Subject: [PATCH v2 02/20] media: venus: pm_helpers: Rename core_clks_get to
 venus_clks_get
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-2-fa090d7f1b91@linaro.org>
References: <20230911-topic-mars-v2-0-fa090d7f1b91@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-0-fa090d7f1b91@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512970; l=1211;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=4x/me5yeOEh7Kc0NCGCe3k/ewNhk7l+PTAXEKLbJtdg=;
 b=ojT8QqLG5zLEf1+mc3VVpVe+vhkE85IzgZfrLRyhsivN4LN1enTJW5ID6qrPtpAPMrWFc94yi
 9tWKxMksMSJDcaEVmxPgDTMQOf+vw8phD5WN5zD3vaFz0N49gR0QlZL
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

"core" is used in multiple contexts when talking about Venus, rename
the function to save on confusion.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 8bd0ce4ce69d..ac7c83404c6e 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -23,7 +23,7 @@
 
 static bool legacy_binding;
 
-static int core_clks_get(struct venus_core *core)
+static int venus_clks_get(struct venus_core *core)
 {
 	const struct venus_resources *res = core->res;
 	struct device *dev = core->dev;
@@ -294,7 +294,7 @@ static int core_get_v1(struct venus_core *core)
 {
 	int ret;
 
-	ret = core_clks_get(core);
+	ret = venus_clks_get(core);
 	if (ret)
 		return ret;
 
@@ -961,7 +961,7 @@ static int core_get_v4(struct venus_core *core)
 	const struct venus_resources *res = core->res;
 	int ret;
 
-	ret = core_clks_get(core);
+	ret = venus_clks_get(core);
 	if (ret)
 		return ret;
 

-- 
2.43.0


