Return-Path: <linux-media+bounces-7986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D853B88EDDF
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 19:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1665C1C32DC7
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 18:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B247A153BD2;
	Wed, 27 Mar 2024 18:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nLpe09sy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D788153823
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 18:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562956; cv=none; b=WQ0MTUcra5NazVTLPN8kOjGkrkuBN7CX+lNAduhoR0NExvrgJSHHxsl/bP9HrrX7rq5o6kaHGiGB4km3Wui0ID1X3MTo4jKvwlpwV/45nmoGje/5SU4aY8I/oVW/jDluCsZczqL9Q5J4OcCUTJoR9iBLrSmzXDKus0kFQ0JaCEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562956; c=relaxed/simple;
	bh=N/+DdFoVCHF23AQ+OjDZ00SaK75sELYmsLPOH0p2aT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PtfmK2BeAdTtkby3+8x0rDJaBNasnb53HPctvtYmcF5r/SsT6GBaD76bBgoCzFoUg0e2o+wAf9UzmNBwzsC5biwiqL0bb1vjDSpWAPRSyH5H6TxA9OXeCMu6fdLOoeVL0IvMuF9c2v2nQjJ2EJYUVepfOl2ZgaW1vVFnpneeVpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nLpe09sy; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56bdf81706aso154304a12.2
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 11:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562953; x=1712167753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/CQd/17iJ2kwXZI1u99C8d+fll4NuRn/euAOmsXPlU=;
        b=nLpe09syAhOCWd9tQd+MwornteZb8fNr5WtkOEhJGMVdkuksIVwiE0gddSqAuOe+1B
         gVL4sQE3VZj/f9sNWnSZcz6rmCvZ+6vF0Zgt//X+0KT/oxbro5QATKyq0DDgbi7I/67X
         ICc71XRNgOG9avnZ8+Aw+xWLbSNAL0QW0SiMqCN4UlXucWDnkZXqN3G4KHtzF5lEUveJ
         ZIIxIzD3uCNBYA6zjCPdQK0wt42Km/LXj0EZbymsC6Jw59Mb/vVcMGlQAYaofAjzJAy3
         m0lhGonDUAv7jG54pe6PgwYADePQ8Ojeov2GGT9uTI0BCAgCkAsv7YBcGFBk/AAilmrJ
         ln/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562953; x=1712167753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/CQd/17iJ2kwXZI1u99C8d+fll4NuRn/euAOmsXPlU=;
        b=t0Ytqzejem4tD14nkWJQ+RjJ3EYSd4bbT/PU39vWVahnKHlGT8giQL0awJmKHJM/mC
         4Qmi7lbpzH0iCM1xUhCVYUrLTj9GuisiLdgKKOX01m40HWR57rxTSGedUW+lei/yWJDD
         eZJnRPBpRGyxA7FUJbsO8vVFGpQ936rmdU6yB4jPu/Yk+gsy+qXGSvugx6WPNlgWxZmN
         txhtGX5U8BNlOMYZg2TKbBvc6UjJ+xwzM7ij46mkujWTpx623bCPMn9jU72bNybKOevs
         sRQda+YbyRia+oIq4CqL17nyHjVi6qrTwSITymjIgSGzm0w1AodXhNMmGLpkQrST4s5U
         TMPA==
X-Forwarded-Encrypted: i=1; AJvYcCUxmQ52DtF7J9cO/AOgFIzcE+zha5agXfXgFCKBelvRNzXnXL/CbmDP0NHL3JIfEv/dciEgx6EwupLmo7WK2XLPCvqCyU1tRKfYQ/Y=
X-Gm-Message-State: AOJu0YydzuS2wKIIT6TiQyUGSDASqvy9XAwr2tX2IhGKc0Pce/NuIYFE
	iYnzmGeFnTx60G5W5xrTpOT/ZUnmXzRDs/KrJt7rY34HyG61zn2APGQxQNVl05Q=
X-Google-Smtp-Source: AGHT+IFlkgzqIP+Q1UG8pVb70TSNRnC5zHkS+ExOzcbgp11+GWgEylpMe38xvrUC1mvRu+IwuYKU1Q==
X-Received: by 2002:a17:906:3c51:b0:a46:e595:f357 with SMTP id i17-20020a1709063c5100b00a46e595f357mr189730ejg.9.1711562953062;
        Wed, 27 Mar 2024 11:09:13 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:09:12 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:52 +0100
Subject: [PATCH v3 14/19] media: venus: core: Define a pointer to core->res
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-14-79f23b81c261@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562924; l=1808;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=N/+DdFoVCHF23AQ+OjDZ00SaK75sELYmsLPOH0p2aT4=;
 b=1gxBTxoz/cxrMX0RUDFm+MPnu8jLxtNwBQRjFbmiKwfrMWSZ2mUQ6GbUHNJot8qeaX5xQ5sw6
 0G9hX+ocBcYALouuYtXDuLwShrMO/8+6DguNAgv1Iz8Lb2t+ZwkTf/2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

To make the code more concise, define a new variable 'res' pointing to
the abundantly referenced core->res.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 5b18b1f41267..e61aa863b7f7 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -285,6 +285,7 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
 
 static int venus_probe(struct platform_device *pdev)
 {
+	const struct venus_resources *res;
 	struct device *dev = &pdev->dev;
 	struct venus_core *core;
 	int i, ret;
@@ -315,9 +316,11 @@ static int venus_probe(struct platform_device *pdev)
 	if (!core->res)
 		return -ENODEV;
 
+	res = core->res;
+
 	mutex_init(&core->pm_lock);
 
-	core->pm_ops = venus_pm_get(core->res->hfi_version);
+	core->pm_ops = venus_pm_get(res->hfi_version);
 	if (!core->pm_ops)
 		return -ENODEV;
 
@@ -325,8 +328,8 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < core->res->resets_num; i++) {
-		core->resets[i] = devm_reset_control_get_exclusive(dev, core->res->resets[i]);
+	for (i = 0; i < res->resets_num; i++) {
+		core->resets[i] = devm_reset_control_get_exclusive(dev, res->resets[i]);
 		if (IS_ERR(core->resets[i]))
 			return PTR_ERR(core->resets[i]);
 	}
@@ -337,7 +340,7 @@ static int venus_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
+	ret = dma_set_mask_and_coherent(dev, res->dma_mask);
 	if (ret)
 		goto err_core_put;
 

-- 
2.44.0


