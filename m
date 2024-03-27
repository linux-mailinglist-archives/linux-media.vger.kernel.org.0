Return-Path: <linux-media+bounces-7985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3615F88EDDC
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 19:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1B3D1F3A93B
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 18:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F3815382F;
	Wed, 27 Mar 2024 18:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FxyqU26U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B99015359E
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 18:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562954; cv=none; b=JGPxeIIrCzTVYMxPa5aHb1R6By9q7m8EO4GiCE+RMZ7xz/+DgkCvh87/Ry/aX/OqnUa+VMc93zjnGHbjmTr6wk/rh1gMs6tacWcLiHzFsQ2KeCHPcHIH/dIoONDa5DnqELOaAC1chqB8QZRomXZJzjU7S1BchjjBQVhfnYdWDmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562954; c=relaxed/simple;
	bh=gZuMEGLa8tjLrTt/r1nP1U/PhdOkjOKI49XZqbUqCao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DtQJlTkaIPQzzVI9+1MnfoEqy3a/9ft4HKVneE6cYCcCYV/FQyrVR3QZGDWYdZ6ozQwhhuOv/d0FVZvIIgTYLEGuty7CKCc77UAW+HhaV7JnQ8yHSnZiNUMcanSGLCaN6iSmfxwQx35Q2jU8dBVyVLTF9xQ0iPlacky8tltQ5sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FxyqU26U; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a4734ae95b3so15934466b.0
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 11:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562951; x=1712167751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uyg9cCjIBe5vwMzPvAWfPgo3MthJhgF+WNFlCLkOSMo=;
        b=FxyqU26UKWd3xQlHRoJ/+ceIQ/NiRzRJIJSw1iVSTHDPbiUlMpCBm/nLRAOARuGMQI
         8ByuuFXR+bH7YTzCpO/SfvogDVuH3GH42oQnB9XRJSegqo2+bxlKeAbT++O/ksHArmAw
         artRpV6l8iF1UhZKkcbKPYfSbTdK/bSTZshCOlBQ7jGV6vfHr1he8lu7p+5YtXzLE5x0
         H+nhL+AuV86F95NE9gW/w+QdvEVr4GBoYA06vazm8cQv1ZZUT4qgWdnRMpWXl26XLdxw
         Hsfmb0HV2G3Ng22nxb9xgwkzXRvyLLjOZy8Ql+T+NUr/P4NaNt9rXT6bFFVmvHpamWS0
         /11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562951; x=1712167751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uyg9cCjIBe5vwMzPvAWfPgo3MthJhgF+WNFlCLkOSMo=;
        b=IO27Q1FH8KPfvzDVKVKJ15PO3JacnRHDK66bVuWrnskqQN4lsNecUejMwud3+9PGtu
         80xb/5ekpVv/ODd1x9H32GPBVLZiHCo3STLl1n3EMR8QUWYMRGwOIc9EbtO4bnudfyCY
         NV9hrv+i9ElA7wR3g1+UHOHUyFzufF/rLDacdkj2sqOy8MojsjP3NoAXAyvvHikbgScT
         t5dAG06xoFaT+vBvUsbCC3i91kyNb5qyr5n9gjnF095A82geRi5oCHbbITW6KM2//kcN
         9mi+QEIA45UI7aXs4/mViqcl+NowE/fzkcz/Tu9UrWnsQeyQK+JM8gOPaExp5CGUaIw8
         60GA==
X-Forwarded-Encrypted: i=1; AJvYcCW6an+4JRO0F+DzvQynSRLfuGwB7WJho6nEOvF1aHJJXSdOb8oHbqc985PXisUCnHES6BJUzMZn9YulOzxl3PNGF0NVbYUk3PHNs6k=
X-Gm-Message-State: AOJu0YzZ7sf2HH7gS8Fus8oJzvhzSusCI3Ph8DZnQUkmcKNWSG496kZU
	FOTeg8Cq0k80K5SdsCVceTWfjwdaEtH1YaQa0OLx0TwdXDx15wx+DBOzCl0kOBo=
X-Google-Smtp-Source: AGHT+IFFlIFU/vyvYtRyfqCFRAFhIAHw5w84pme9DfSHL/4LWxh9PcAiJAtfBOMzzjCE3e7lRIWkCA==
X-Received: by 2002:a17:906:46ce:b0:a47:4ba1:5955 with SMTP id k14-20020a17090646ce00b00a474ba15955mr173976ejs.20.1711562950900;
        Wed, 27 Mar 2024 11:09:10 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:09:10 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:51 +0100
Subject: [PATCH v3 13/19] media: venus: pm_helpers: Remove pm_ops->core_put
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-13-79f23b81c261@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562924; l=3935;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=gZuMEGLa8tjLrTt/r1nP1U/PhdOkjOKI49XZqbUqCao=;
 b=YHVHS8hGzUNo7n0S3Ixu+Uh38s0NJda67wJFlykESRxI3MSOjUZUd29kFi0SaMjqPnoZ5y+IP
 SXX0vjXe0QVBWMesKUaNQ9QQRfqzB32tvnVRiAqPISLpizk4JXRe60J
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Without an OPP table and with vcodec_pmdomains_num (so, v1, v3 and
sdm845_legacy targets), core_put_v4 is a NOP, jut like core_put_v1.
Unify them!

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c       |  8 +++-----
 drivers/media/platform/qcom/venus/pm_helpers.c | 17 +----------------
 drivers/media/platform/qcom/venus/pm_helpers.h |  2 +-
 3 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 6bbb8153797c..5b18b1f41267 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -426,15 +426,14 @@ static int venus_probe(struct platform_device *pdev)
 err_core_deinit:
 	hfi_core_deinit(core, false);
 err_core_put:
-	if (core->pm_ops->core_put)
-		core->pm_ops->core_put(core);
+	vcodec_domains_put(core);
+
 	return ret;
 }
 
 static void venus_remove(struct platform_device *pdev)
 {
 	struct venus_core *core = platform_get_drvdata(pdev);
-	const struct venus_pm_ops *pm_ops = core->pm_ops;
 	struct device *dev = core->dev;
 	int ret;
 
@@ -452,8 +451,7 @@ static void venus_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
-	if (pm_ops->core_put)
-		pm_ops->core_put(core);
+	vcodec_domains_put(core);
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 3410039bb641..d717e150b34f 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -318,13 +318,8 @@ static int load_scale_v1(struct venus_inst *inst)
 	return ret;
 }
 
-static void core_put_v1(struct venus_core *core)
-{
-}
-
 static const struct venus_pm_ops pm_ops_v1 = {
 	.core_get = venus_clks_get,
-	.core_put = core_put_v1,
 	.load_scale = load_scale_v1,
 };
 
@@ -396,7 +391,6 @@ static int venc_power_v3(struct device *dev, int on)
 
 static const struct venus_pm_ops pm_ops_v3 = {
 	.core_get = venus_clks_get,
-	.core_put = core_put_v1,
 	.vdec_get = vdec_get_v3,
 	.vdec_power = vdec_power_v3,
 	.venc_get = venc_get_v3,
@@ -893,7 +887,7 @@ static int vcodec_domains_get(struct venus_core *core)
 	return ret;
 }
 
-static void vcodec_domains_put(struct venus_core *core)
+void vcodec_domains_put(struct venus_core *core)
 {
 	dev_pm_domain_detach_list(core->pmdomains);
 
@@ -968,14 +962,6 @@ static int core_get_v4(struct venus_core *core)
 	return 0;
 }
 
-static void core_put_v4(struct venus_core *core)
-{
-	if (legacy_binding)
-		return;
-
-	vcodec_domains_put(core);
-}
-
 int venus_core_power(struct venus_core *core, int on)
 {
 	struct device *dev = core->dev;
@@ -1123,7 +1109,6 @@ static int load_scale_v4(struct venus_inst *inst)
 
 static const struct venus_pm_ops pm_ops_v4 = {
 	.core_get = core_get_v4,
-	.core_put = core_put_v4,
 	.vdec_get = vdec_get_v4,
 	.vdec_put = vdec_put_v4,
 	.vdec_power = vdec_power_v4,
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.h b/drivers/media/platform/qcom/venus/pm_helpers.h
index 77db940a265c..3014b39aa6e3 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.h
+++ b/drivers/media/platform/qcom/venus/pm_helpers.h
@@ -11,7 +11,6 @@ struct venus_core;
 
 struct venus_pm_ops {
 	int (*core_get)(struct venus_core *core);
-	void (*core_put)(struct venus_core *core);
 
 	int (*vdec_get)(struct device *dev);
 	void (*vdec_put)(struct device *dev);
@@ -28,6 +27,7 @@ struct venus_pm_ops {
 
 const struct venus_pm_ops *venus_pm_get(enum hfi_version version);
 int venus_core_power(struct venus_core *core, int on);
+void vcodec_domains_put(struct venus_core *core);
 
 static inline int venus_pm_load_scale(struct venus_inst *inst)
 {

-- 
2.44.0


