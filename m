Return-Path: <linux-media+bounces-4934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF0084FE81
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 22:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E83AF1F2322B
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 21:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CE151004;
	Fri,  9 Feb 2024 21:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ySdP1GTe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D504F211
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 21:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707513025; cv=none; b=ceNXk4jDUXVwUrpymDtF86L/d56X4whw1ppA7bs9TO7P1VqxhpWhrnFBXwJoFQIRPnWgIT+HCK4m9kQbkfcTLYZeV+v5lSlIu+HDFLleSQIx1oUSbv6rq+f5FPnBFq4yjTTiK2UPSfoy0325k5VtauSSPuQ0lRV6o+dshr8b71M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707513025; c=relaxed/simple;
	bh=xmr9gBLALZZ4tCzhH3tzwTSX0EVNrOb18RsCpry8TQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q5z329ISFtGrejD6W00oeR1y/JyKFVpTOFHxRqoG5/x5OyFmxnBXqKGDTnuH+7JOOnIN4Tyn9k7lgVl941Egv1RTzBC5i3zVRS0sDAjL4dK/i0JMolT1K9DCr5MktUFhiiWOB4FkXA6366uLOS3H0ZVKdk9rDrPmN6N+dF5mCuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ySdP1GTe; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51178bbb5d9so1084982e87.2
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 13:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707513021; x=1708117821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFsyNvwxQilGz6zxZXhAEZJ3UdBMC1zpxUAmMEMQ0vg=;
        b=ySdP1GTee9qIBb82i6hVQjoMA4TKieaiB6Hw5nhkFAIhPj4z8jkrF+V9h2GBWhBz/0
         wRhZNFBKKOH73DDwvw/yc55FNuZyu9LGxlULyy9+lyTlovct0nmINdbD1DI4g7H5dnR6
         LT8w5RO6n/gyM3WeDMIwdgrR+r0OQfqwx3hOkcHNcHk6kBXRDETjJCKskhXik/KsWxlK
         gZxsEPG38R+RLtXHwG9PMUplyJhuSvQsnwiEGtnLvnWld66P72DVUnmuOiq62/mz4E+W
         KtmeirEexc69Yj7EKdXBBgxYj+LtPc4lXOpfLrxPWZF0QwneZTc9seHYATy/KIMncgNs
         AwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707513021; x=1708117821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFsyNvwxQilGz6zxZXhAEZJ3UdBMC1zpxUAmMEMQ0vg=;
        b=PXsGBJ5dpm62usgm5xkvWHar7sweyWzFB42kKNldkBPHpO/WMc6YR86QDreHMVqy7G
         yZ7rZDk06TKxPJS0rW1VK6CWoCfSDPKZZvQxvXS11WniIWYVuUe+z1GWlftIo6WlWhvk
         pZZbpPOlh/EUBAEk5N+KQrz8JJsHNdTjAa6ktlawmduEDvECzL+FmehHdKnT0WbPvvg4
         rD7MSL+7v1Y7BnviCH/m2CUUwjzDCHB/cOv/o9nxL8++EbhuYiGsfnkSALO3rZD2Z+mG
         ODupa3oXU/ODLSnZ1PvdaLs2Be6H3ruQNri4oxcaR0SC4jRTmWNS2TgDltu3NaQqkdTm
         08+g==
X-Forwarded-Encrypted: i=1; AJvYcCUYONvvH3nqxms1k6foBG/nEvoVnvey8TRiA1Ke1xzl8YIBJnHvOIBW4Ov8QLvinU3mu/vCQsjx99qztzuh65u2HxCjaoYnAZBbBfM=
X-Gm-Message-State: AOJu0YyL14Y364Icy1BJbqANLy5DDrtkydGncYWajxHv0g3AAH2Tgpm+
	V5mA751cIB9St5E9Y//Ez1lPU+2Hr2rog/t2Gmb+S4aVFqvo/mAEIwuuuYhOc1E=
X-Google-Smtp-Source: AGHT+IH5m6Adda+lr4r8RqsH5XXoU3LKMfPcMTVpNY8oF3akchcnqTu6j/lvK7FFqJPKmaL7zKlX8g==
X-Received: by 2002:ac2:4243:0:b0:511:7fb5:91fc with SMTP id m3-20020ac24243000000b005117fb591fcmr138038lfl.20.1707513021249;
        Fri, 09 Feb 2024 13:10:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKO/zPhvMnpN6+uHTF30b9UESaSFB4bZ4gS38403aT0q+1mrhv8dT13hiJGJWoj1ozvWqP4pac0v9QBYBiyN2VZ0n4LTUJkFTOK+oc/Oa66alZU2VKzH/ct2bYwPDI/1N75GoJn94MUxmoTE2ri5x3g/K9W3Nkhbz7ZunXYtfZf14tPZh0GJJL/mq7stwyzLXzdoocAoIMaTmqlK02PtQ5ao59lx9bwPjy4Zr3zJ2Nv78zvEH+g0sGWdqTOdsw/dECzh3ZAhBUvg8qIKbwXh8lhc7C1VedGZVSG46ZBIpzd8MpF/l8XXMsL9MFpK1G/ByDYSJC/e6jRJu6G3n+KP0Sdb7thPNhkjIJ9mPb5kStv2O5AUVshlG1cyp7TrJ1bO5tuWCPPjffKHNqfJuwQeELVJFlonuDsuu6wEHUz+cUS68mPrR46FGz1WjFWO89+8OHb+eQAzCf5G9ZClhHQjXmIti30OgIT0jqI4jDD3Cll7yTF7EOmlj50SmLr5H26XuBcg==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id vo5-20020a170907a80500b00a3be3b27d0bsm1056517ejc.49.2024.02.09.13.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:10:20 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:10:03 +0100
Subject: [PATCH v2 19/20] media: venus: pm_helpers: Commonize venc_get()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-19-3dac84b88c4b@linaro.org>
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512986; l=3254;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=xmr9gBLALZZ4tCzhH3tzwTSX0EVNrOb18RsCpry8TQQ=;
 b=MwE+XQyOfpxkRSYew5l9uPJPp+xTAWAOlE0VUdIFsDi45PwmWNoRZ5WsueqGgFCumjHspTGlP
 OgMpCyCOFhfCl8/Gst+Hkaf/jwhKbL/R957iYMzifXJpYt4qzrhYuDH
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This function can be very easily commonized between the supported gens.
Do so!

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 19 -------------------
 drivers/media/platform/qcom/venus/pm_helpers.h |  1 -
 drivers/media/platform/qcom/venus/venc.c       |  9 +++++++--
 3 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index cf0794acf5d0..9df8f2292c17 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -363,13 +363,6 @@ static int vdec_power_v3(struct device *dev, int on)
 	return ret;
 }
 
-static int venc_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, 1);
-}
-
 static int venc_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -389,7 +382,6 @@ static int venc_power_v3(struct device *dev, int on)
 
 static const struct venus_pm_ops pm_ops_v3 = {
 	.vdec_power = vdec_power_v3,
-	.venc_get = venc_get_v3,
 	.venc_power = venc_power_v3,
 	.load_scale = load_scale_v1,
 };
@@ -785,16 +777,6 @@ static int vdec_power_v4(struct device *dev, int on)
 	return ret;
 }
 
-static int venc_get_v4(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	if (!legacy_binding)
-		return 0;
-
-	return vcodec_clks_get(core, dev, 1);
-}
-
 static void venc_put_v4(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -1092,7 +1074,6 @@ static int load_scale_v4(struct venus_inst *inst)
 static const struct venus_pm_ops pm_ops_v4 = {
 	.vdec_put = vdec_put_v4,
 	.vdec_power = vdec_power_v4,
-	.venc_get = venc_get_v4,
 	.venc_put = venc_put_v4,
 	.venc_power = venc_power_v4,
 	.coreid_power = coreid_power_v4,
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.h b/drivers/media/platform/qcom/venus/pm_helpers.h
index 4afc57dac865..cbf54e6c6eab 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.h
+++ b/drivers/media/platform/qcom/venus/pm_helpers.h
@@ -13,7 +13,6 @@ struct venus_pm_ops {
 	void (*vdec_put)(struct device *dev);
 	int (*vdec_power)(struct device *dev, int on);
 
-	int (*venc_get)(struct device *dev);
 	void (*venc_put)(struct device *dev);
 	int (*venc_power)(struct device *dev, int on);
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3ec2fb8d9fab..d17aeba74b49 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1557,8 +1557,13 @@ static int venc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->venc_get) {
-		ret = core->pm_ops->venc_get(dev);
+	/*
+	 * If the vcodec core clock is missing by now, it either doesn't exist
+	 * (8916) or deprecated bindings with pre-assigned core functions and
+	 * resources under the decoder node are in use.
+	 */
+	if (!core->vcodec_core_clks[1]) {
+		ret = vcodec_clks_get(core, dev, 1);
 		if (ret)
 			return ret;
 	}

-- 
2.43.0


