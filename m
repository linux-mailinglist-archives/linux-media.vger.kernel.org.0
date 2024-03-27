Return-Path: <linux-media+bounces-7988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB0188EE1F
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 19:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79959B25802
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 18:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B16153BDE;
	Wed, 27 Mar 2024 18:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ShAPU6yN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BFA153BF0
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 18:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562960; cv=none; b=XekFgh5eBX56X5OCLIPr6cF6SArPh8RlbXW6G9twqGzKuPF/7JdjtUqZYjTObLJ9RfMksU/tHhO3qTDWfVtiT+ZthM1Sf6Vm3CjdM5EPqqTiDYii+1dC194qN1TV9buSLZ0gSXPedWKHjK9R+kfvG799Yfg+F0BmeoiKdQSC6Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562960; c=relaxed/simple;
	bh=rfeCKF0TDJxow2k4V6ytPA8cst5sc8C0h2kYpOgo/rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p1q9bs5RVk2mx2KaowGLxL9lR6VFXam40y0yhyguV+yH6lz43tt9KdZ91eTVS48vs1hm+gwJ0NCcCz2SnZlkAZhlBCcKd3m5+8iTbgBR/64os+tLNAwKg6QmYgt/3pd7At/Gj7E4Bw6gCuRaQMxqRWmeAB7deps3lG/0MHAk3A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ShAPU6yN; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a470d7f77eeso12797466b.3
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 11:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562957; x=1712167757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hgrsUJ/GR8AiL4ulZYMnT6DC/W7yW/8RHSfzLSDdCI=;
        b=ShAPU6yN8vndh/cLbeJZMqJoFHJCPKrvBd9UM0Wbzx52l2Evh60L+fvmVxn8YM0PmA
         SzGWV4JrQR5RJSmq8VVucJj4bGwuNGGxB5WHv2CCNiCmpA6lGmRUgjl3b79h9irIfYai
         5Xi2mEN2mhBuG3riDZuF3chWl9mV1hJae2KJzjHRlxlo4H49Ni1Pkdtzvn8uDx2T/V0e
         w/w85vyNOtKcgKm8GlwDOXkm0vfCmiRDtbPi7VIyn0jE/8SLqpiniBZ1zp9ApuCprjZu
         5IbFi0y5iLpm2Bvd71wFQ8Lw2+6zn+mtWx5MBaNSosHRf7x2h2hAkv3L9xGHV+quERlF
         xyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562957; x=1712167757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hgrsUJ/GR8AiL4ulZYMnT6DC/W7yW/8RHSfzLSDdCI=;
        b=bLDMVDpb7oRfg3gzKD8DjKKhtGnPc7qN5dgZAHOst03Ev8344WHZ2V5HA2PmlX29vQ
         bHc41uyj/gLC1VQOaCfVA8+d6n7D14Kbll0U0D6ILpVAs6TWIZDim+8gMT2cKtBpxGYT
         9azVHmAupaXEyKREQhwrW6a7zD/mMmZXMD9DbrY31l0UGNtkENKNb48wt1OS5voesWjk
         iEzardzyppcKtp4jC08VqEOHN/sI7nJr/jlsF9oeKF7zNN/k35hN1aY2kE4jT4uUYA8i
         DuUomI8F7uWbuKpOTManKC45VfvjunN0Hs/+XlBs7D6AfW1KP1d5VAym8UA8GbrxRLUq
         jeIw==
X-Forwarded-Encrypted: i=1; AJvYcCXPs81EO52i4Go7H1f4BUf5/0jkfiWroEdX9NRfrr8nBCwTy8kQE5fZ6hj9GL644ty3f5wUebnF24f87GF1vNQQXmFJXxG6IytRi0k=
X-Gm-Message-State: AOJu0Ywu77zZz9tUXNoZIwhWXzjTZha2q4lW6nhOfTf+7lrTQlVIIgSl
	c6pvd0dV1gr+s3ut9ccQCkb2hszxSg38zdDqBIr4wWW/tXF3b53QoipRCqPi6Sw=
X-Google-Smtp-Source: AGHT+IFOo4sFmtLzwbLXP0KtVDvk+1I6H0+uefuNN51KXyk92++u2x6hlx1B7phPd+BPI28GFR3vGA==
X-Received: by 2002:a17:907:7e94:b0:a4e:f44:f73e with SMTP id qb20-20020a1709077e9400b00a4e0f44f73emr258584ejc.13.1711562957265;
        Wed, 27 Mar 2024 11:09:17 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:09:16 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:54 +0100
Subject: [PATCH v3 16/19] media: venus: pm_helpers: Commonize getting
 clocks and GenPDs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-16-79f23b81c261@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562924; l=3311;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=rfeCKF0TDJxow2k4V6ytPA8cst5sc8C0h2kYpOgo/rw=;
 b=8KXAuuvGmO4WCVHnBLB5zdXP45qg+FE3jQHPKn1ZAnwRK5Q0Ij6puORMMO76D+9TTLNhNwuYI
 GEX9ukAJMclCBi0uqCujkCl83LSgnomFNnzTlQ3u89RbNnNUJPkwvEu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

As has been the story with the past few commits, much of the resource
acquisition logic is totally identical between different generations
and there's no good reason to invent a new function for each one.

Commonize core_get() and rename it to venus_get_resources() to be more
meaningful.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c       | 8 +++-----
 drivers/media/platform/qcom/venus/pm_helpers.c | 5 +----
 drivers/media/platform/qcom/venus/pm_helpers.h | 3 +--
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 1f4a86b1bd73..6914fa991efb 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -334,11 +334,9 @@ static int venus_probe(struct platform_device *pdev)
 			return PTR_ERR(core->resets[i]);
 	}
 
-	if (core->pm_ops->core_get) {
-		ret = core->pm_ops->core_get(core);
-		if (ret)
-			return ret;
-	}
+	ret = venus_get_resources(core);
+	if (ret)
+		return ret;
 
 	ret = dma_set_mask_and_coherent(dev, res->dma_mask);
 	if (ret)
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 583153bbb74e..ba5199d9e5c9 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -326,7 +326,6 @@ static int load_scale_v1(struct venus_inst *inst)
 }
 
 static const struct venus_pm_ops pm_ops_v1 = {
-	.core_get = venus_clks_get,
 	.load_scale = load_scale_v1,
 };
 
@@ -395,7 +394,6 @@ static int venc_power_v3(struct device *dev, int on)
 }
 
 static const struct venus_pm_ops pm_ops_v3 = {
-	.core_get = venus_clks_get,
 	.vdec_get = vdec_get_v3,
 	.vdec_power = vdec_power_v3,
 	.venc_get = venc_get_v3,
@@ -920,7 +918,7 @@ static int core_resets_reset(struct venus_core *core)
 	return ret;
 }
 
-static int core_get_v4(struct venus_core *core)
+int venus_get_resources(struct venus_core *core)
 {
 	struct device *dev = core->dev;
 	const struct venus_resources *res = core->res;
@@ -1109,7 +1107,6 @@ static int load_scale_v4(struct venus_inst *inst)
 }
 
 static const struct venus_pm_ops pm_ops_v4 = {
-	.core_get = core_get_v4,
 	.vdec_get = vdec_get_v4,
 	.vdec_put = vdec_put_v4,
 	.vdec_power = vdec_power_v4,
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.h b/drivers/media/platform/qcom/venus/pm_helpers.h
index 3014b39aa6e3..7a55a55029f3 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.h
+++ b/drivers/media/platform/qcom/venus/pm_helpers.h
@@ -10,8 +10,6 @@ struct venus_core;
 #define POWER_OFF	0
 
 struct venus_pm_ops {
-	int (*core_get)(struct venus_core *core);
-
 	int (*vdec_get)(struct device *dev);
 	void (*vdec_put)(struct device *dev);
 	int (*vdec_power)(struct device *dev, int on);
@@ -28,6 +26,7 @@ struct venus_pm_ops {
 const struct venus_pm_ops *venus_pm_get(enum hfi_version version);
 int venus_core_power(struct venus_core *core, int on);
 void vcodec_domains_put(struct venus_core *core);
+int venus_get_resources(struct venus_core *core);
 
 static inline int venus_pm_load_scale(struct venus_inst *inst)
 {

-- 
2.44.0


