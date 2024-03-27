Return-Path: <linux-media+bounces-7984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239A488EDD6
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 19:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0A5A29D9AC
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 18:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B1414EC62;
	Wed, 27 Mar 2024 18:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ou90ZX2i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AE01534ED
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 18:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562952; cv=none; b=YW6xhZVPeXOB7oBmDwLzBc5HRkmiMsHxrpFPjwBlGeAkmOAC0BnNDblL2gayVrALWfbeZ79T9qi+xBOrUEK6020wE9xaPRCwO4di4icE4Us4XuqsgGEraRYHm/wy2HpSIFxvYJr2h0RFLcTPTUX+I91u/DkfC07EuzqLBFgW/Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562952; c=relaxed/simple;
	bh=uKZ6667EoCGildVfNWTzXSkSlQhMEph3V2H0e5o40v0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DsyMsPLC7TIomcksS6THoGfMOQaIAnCZ5+jF2AoFcfeMUsJA1WijcE2PH6CEa9NXVqUn47y7bubjJ9MLzHwolPW3I0J8s7rXJD1gZ4pT/ixuQlgAWG9R7CwK4AvEQ8ksA3soD8HNkNeq91geFyGdoIbcNpO1KHPri7sxDEizcdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ou90ZX2i; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d6fd3cfaceso350241fa.3
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 11:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562949; x=1712167749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VC6r/0UijU2j1avcMZoL5LKkgLhP+P1n2LhOJ6yQmQA=;
        b=ou90ZX2i8tNXP1FC48kTbXp2YGSwBtlDJyH/8CrmwGJCIyF0aWEzWomLIx2jYzTSwN
         XnOTFzIVkBvFLvMv9oxdT4Jyx5NNuscIeGKuLglOrbqKy5EuRXAUp5IRb3HnRUtDxDEE
         1nB9Hi6wfxhJBqHmxbiOzxY5mK0aZ0pgbDYWszDOJz9cFT52eY1/7MZUAWaQ2zYikX5f
         lpAJv6FCgIDngSEal74MvMqeHdnExuQvoB9GEIQu2JyYE9HKFYlECpxIIn9pxbqo51Lj
         tpdQibtkuddFm4Z2b75DrszP3QDr4jgwtknNabkBaJMr/5LntswwpYgBkTpz2VeDYupf
         23uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562949; x=1712167749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VC6r/0UijU2j1avcMZoL5LKkgLhP+P1n2LhOJ6yQmQA=;
        b=OqXz+uEYsdyktJVyOmkBIQWmhTqug8/tFehlParli0ifedxo3auLJQPxJgXOO1/4s3
         gPJIKT2XUqrBYaV2ZmATen4YiHEm+a8AraOuFhYXJjU7FjATcPs4SpFHhbkJql+7YJPu
         b+SpK31PXyfVycelJCf3BReoGdflIeVq/vsjAVl5HJHUimAJ7tWnZveS4fxauXtl1GlP
         YLyAoYSjGmSSI+7piDcUimRT1eDmCUnd33le2n/MgsLk5GABp6D15L0duSesSTvQcTPS
         II7PaFlKI3NoXTo7/nrl8M2QCzb41BJnUYf56poC3MHuADk8sjgOTr5G308vNutN+drh
         4KGA==
X-Forwarded-Encrypted: i=1; AJvYcCWa2bOK+dfQke83FrCVQtAKeh85zDQjvrVZsMmqzgy6SS2P0m/vapDvfasw02oaTThE0w6WBLyd6JMzrHjfUID9CNmCB5Czbcz1DL4=
X-Gm-Message-State: AOJu0YxlcPzI3EcrQHClvH4u9WHdyI+1I6mLiYpF1FFEHbcv1eTsBHnP
	ylOZu9+J5/d+50J/cmuy2nzZ2GK8+67zN1oqjxDh7GXK4T2aUEvZFrGBelng7DI=
X-Google-Smtp-Source: AGHT+IGGDeKs0PfcAcsWxWdT7br0kQgaVIMadaedgSZVIV7feZRWPe4mxQXnQjWiaxBXnI7xvrRCLQ==
X-Received: by 2002:a2e:9b17:0:b0:2d4:68ef:c714 with SMTP id u23-20020a2e9b17000000b002d468efc714mr675073lji.38.1711562948778;
        Wed, 27 Mar 2024 11:09:08 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:09:08 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:50 +0100
Subject: [PATCH v3 12/19] media: venus: pm_helpers: Commonize core_power
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-12-79f23b81c261@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562924; l=4717;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=uKZ6667EoCGildVfNWTzXSkSlQhMEph3V2H0e5o40v0=;
 b=ma4U0Iy0ZpQrWDyV1rJ2TKb1cU4VutbOcDmYdPTYqNxbaZsw7l3obqbemJmWoVPkwAVstytOc
 bZQ3lQMY/O/BWmENfUdqgNMk6ogLfYNfyHLt5g4fSTjFI2r/9xgXZDx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

core_power_v4 called with num_resets = 0 and core->pmdomains[0] == NULL
does exactly the same thing as core_power_v1. Unify them!

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c       | 21 +++++++--------------
 drivers/media/platform/qcom/venus/pm_helpers.c | 17 +----------------
 drivers/media/platform/qcom/venus/pm_helpers.h |  2 +-
 3 files changed, 9 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index b10d083b8b17..6bbb8153797c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -477,18 +477,15 @@ static void venus_core_shutdown(struct platform_device *pdev)
 static __maybe_unused int venus_runtime_suspend(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
-	const struct venus_pm_ops *pm_ops = core->pm_ops;
 	int ret;
 
 	ret = hfi_core_suspend(core);
 	if (ret)
 		return ret;
 
-	if (pm_ops->core_power) {
-		ret = pm_ops->core_power(core, POWER_OFF);
-		if (ret)
-			return ret;
-	}
+	ret = venus_core_power(core, POWER_OFF);
+	if (ret)
+		return ret;
 
 	ret = icc_set_bw(core->cpucfg_path, 0, 0);
 	if (ret)
@@ -503,8 +500,7 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 err_video_path:
 	icc_set_bw(core->cpucfg_path, kbps_to_icc(1000), 0);
 err_cpucfg_path:
-	if (pm_ops->core_power)
-		pm_ops->core_power(core, POWER_ON);
+	venus_core_power(core, POWER_ON);
 
 	return ret;
 }
@@ -512,7 +508,6 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 static __maybe_unused int venus_runtime_resume(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
-	const struct venus_pm_ops *pm_ops = core->pm_ops;
 	int ret;
 
 	ret = icc_set_bw(core->video_path, kbps_to_icc(20000), 0);
@@ -523,11 +518,9 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (pm_ops->core_power) {
-		ret = pm_ops->core_power(core, POWER_ON);
-		if (ret)
-			return ret;
-	}
+	ret = venus_core_power(core, POWER_ON);
+	if (ret)
+		return ret;
 
 	return hfi_core_resume(core, false);
 }
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index ba63e6427eb9..3410039bb641 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -322,22 +322,9 @@ static void core_put_v1(struct venus_core *core)
 {
 }
 
-static int core_power_v1(struct venus_core *core, int on)
-{
-	int ret = 0;
-
-	if (on == POWER_ON)
-		ret = core_clks_enable(core);
-	else
-		core_clks_disable(core);
-
-	return ret;
-}
-
 static const struct venus_pm_ops pm_ops_v1 = {
 	.core_get = venus_clks_get,
 	.core_put = core_put_v1,
-	.core_power = core_power_v1,
 	.load_scale = load_scale_v1,
 };
 
@@ -410,7 +397,6 @@ static int venc_power_v3(struct device *dev, int on)
 static const struct venus_pm_ops pm_ops_v3 = {
 	.core_get = venus_clks_get,
 	.core_put = core_put_v1,
-	.core_power = core_power_v1,
 	.vdec_get = vdec_get_v3,
 	.vdec_power = vdec_power_v3,
 	.venc_get = venc_get_v3,
@@ -990,7 +976,7 @@ static void core_put_v4(struct venus_core *core)
 	vcodec_domains_put(core);
 }
 
-static int core_power_v4(struct venus_core *core, int on)
+int venus_core_power(struct venus_core *core, int on)
 {
 	struct device *dev = core->dev;
 	struct device *pmctrl = core->pmdomains ?
@@ -1138,7 +1124,6 @@ static int load_scale_v4(struct venus_inst *inst)
 static const struct venus_pm_ops pm_ops_v4 = {
 	.core_get = core_get_v4,
 	.core_put = core_put_v4,
-	.core_power = core_power_v4,
 	.vdec_get = vdec_get_v4,
 	.vdec_put = vdec_put_v4,
 	.vdec_power = vdec_power_v4,
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.h b/drivers/media/platform/qcom/venus/pm_helpers.h
index a492c50c5543..77db940a265c 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.h
+++ b/drivers/media/platform/qcom/venus/pm_helpers.h
@@ -12,7 +12,6 @@ struct venus_core;
 struct venus_pm_ops {
 	int (*core_get)(struct venus_core *core);
 	void (*core_put)(struct venus_core *core);
-	int (*core_power)(struct venus_core *core, int on);
 
 	int (*vdec_get)(struct device *dev);
 	void (*vdec_put)(struct device *dev);
@@ -28,6 +27,7 @@ struct venus_pm_ops {
 };
 
 const struct venus_pm_ops *venus_pm_get(enum hfi_version version);
+int venus_core_power(struct venus_core *core, int on);
 
 static inline int venus_pm_load_scale(struct venus_inst *inst)
 {

-- 
2.44.0


