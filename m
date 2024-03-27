Return-Path: <linux-media+bounces-7973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEDF88EDB1
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 19:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04F9629D8D3
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 18:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC22614F9D6;
	Wed, 27 Mar 2024 18:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cRVzc6bp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6162214EC7D
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 18:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562931; cv=none; b=HODkHxM6MDmLsDOX/6YuUwvRcrab+C0KngoBpGKUkLYEcpi/4SIrsFZXPo9rXfg0oqFNpuETPNAGdnf7NGrrmIDVbtn/dsfz8hv+GsZdZcqCZkh2OOq/H7Xyu0ikWDP3a02gg38fGGArjIpXN2liirPSwx2iGVU5AnMVb41DlEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562931; c=relaxed/simple;
	bh=RxQTdUpjK7n9jlqHzRTCj2QYKYXt/gcESZV0SsfqRQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZjYxdLy4cgxqxoPRuNJeRkd4MPYJgsElxFqUayvhgusBu/aeFbc7523luEM8K4YCKoIiE6/hGM2rimI3l5pIZd2/3jx5Bt7A2upHRvR3/v+uPWOTGTUnZTxu/FJAjF7kilb57BXYVuR0aZ/+ncjXuwL6JFiSAUmCoZqJ7gITxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cRVzc6bp; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d28051376eso811851fa.0
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 11:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562927; x=1712167727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufceKu2sjQInstNmRM4A4hKgkn0LCmoRG9xSwRpexAY=;
        b=cRVzc6bpjLTMhXAZy2T3jW4iSnrmGuct027Svrb1TPyGbkEjWXlbhIkFTGfSfF6UVb
         SAat3+pj1XxpO+M7D15GrgVrbynq5DrQTw+v74MX3/kshGyT3p96dw8W7ccTRMtxbVHm
         VbAYa0fpyMUO18L4vaO/dDQ3V1k7C/earcxtned+rMs0P92QlfKVJnIWU/LCA0WKiusZ
         q4DD3/tFzkvaz+DbGrwuH+n9cDaVm2ujX8V9u4xdwmLjCVvJb24P+q33XVFnrN4hvTW0
         eQpF90OeR31lDYKZzdIVm6EDEX8t+EUvcPEQh3iOhJrXlMmqHSSZJ7glRT+2KtvgIvSp
         6Qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562927; x=1712167727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufceKu2sjQInstNmRM4A4hKgkn0LCmoRG9xSwRpexAY=;
        b=kFMtpvb2i15L79uWpq5ZE0Rr1Cc/nuz5V/Dv2JmNi1G/ewITQjSxp0DzFhEm65/ZaD
         jhebJN/wHApifZzLDelA6KBwgtz4PhIe/9X+r3yW48z3ysX8afj5ioPvkB0jC5EY1A2v
         ZPNZu2paBkNl0FJue3J1YnwFwsRG588l2CE/DsKriHpWPvSuxL1cS54Ewl1D2DhA00Sf
         78lib8+BHdToOpcJF6ogRqVYgKXgqn3o3zgYyudglruwGEqBXzFjpfgFlVf6zR0ptO5O
         wfJRvdHSZiMCcn9zMTpJmG6iGkgqrMnwOdYe5g6ygzTZQLMTwOy/ZiVnU3HnqzZH7Q1H
         1IIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOF0pqZlgKIVet7A3Fu+RJRD6lceUWiHUYFIue9OsiwLwEgxL11mzAsWj6Wa/gzXY3E/N4tDvmDXLN75S+7CGQuG99ZAq/FSPuZh4=
X-Gm-Message-State: AOJu0Yz8YlsaER3VyE1qQmd5IHQbxI3dVm67WQw/BJtKPPx7+adsKbGG
	WIzDK3OCQM0AmF35q1nrxXVRQd9bTsjPeKs3iRXOWnQk0Ykw26lPQM01nhjcBqM=
X-Google-Smtp-Source: AGHT+IGtwkr+8FXBH5HawUs/22QbET/WVAMrziaPP/BiLHPGLePuqcrILJR9bIJkIOKHVJ4YhncSEg==
X-Received: by 2002:a2e:850f:0:b0:2d6:87d7:601 with SMTP id j15-20020a2e850f000000b002d687d70601mr685526lji.9.1711562927492;
        Wed, 27 Mar 2024 11:08:47 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:08:47 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:39 +0100
Subject: [PATCH v3 01/19] media: venus: pm_helpers: Only set rate of the
 core clock in core_clks_enable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-1-79f23b81c261@linaro.org>
References: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
In-Reply-To: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562923; l=1871;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=RxQTdUpjK7n9jlqHzRTCj2QYKYXt/gcESZV0SsfqRQs=;
 b=9QFcKbbpKNO5D0mYgcLuINzynNtodRw9SlT5GHRxCBjR91l65bNRlMOS4j/aThpH5CqLOiwJ9
 woEwXi6/F+8BxMC+95huEpVqeO0a4KECM7U87NHTSAuik16lBuWZcgS
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Commit c22b1a29497c ("media: venus: core,pm: Vote for min clk freq
during venus boot") intended to up the rate of the Venus core clock
from the XO minimum to something more reasonable, based on the per-
SoC frequency table.

Unfortunately, it ended up calling set_rate with that same argument
on all clocks in res->clks. Fix that using the OPP API.

Fixes: c22b1a29497c ("media: venus: core,pm: Vote for min clk freq during venus boot")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 502822059498..8bd0ce4ce69d 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -41,24 +41,23 @@ static int core_clks_get(struct venus_core *core)
 static int core_clks_enable(struct venus_core *core)
 {
 	const struct venus_resources *res = core->res;
-	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
-	unsigned int freq_tbl_size = core->res->freq_tbl_size;
-	unsigned long freq;
+	struct dev_pm_opp *opp;
+	unsigned long freq = 0;
 	unsigned int i;
 	int ret;
 
-	if (!freq_tbl)
-		return -EINVAL;
+	if (core->has_opp_table) {
+		opp = dev_pm_opp_find_freq_ceil(core->dev, &freq);
+		if (IS_ERR(opp))
+			return PTR_ERR(opp);
+		dev_pm_opp_put(opp);
 
-	freq = freq_tbl[freq_tbl_size - 1].freq;
+		ret = dev_pm_opp_set_rate(core->dev, freq);
+		if (ret)
+			return ret;
+	}
 
 	for (i = 0; i < res->clks_num; i++) {
-		if (IS_V6(core)) {
-			ret = clk_set_rate(core->clks[i], freq);
-			if (ret)
-				goto err;
-		}
-
 		ret = clk_prepare_enable(core->clks[i]);
 		if (ret)
 			goto err;

-- 
2.44.0


