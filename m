Return-Path: <linux-media+bounces-7990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB3A88EDEB
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 19:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36D9A2A337D
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 18:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552EC154C1D;
	Wed, 27 Mar 2024 18:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HjsdU4os"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D081154BE9
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 18:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562965; cv=none; b=Pywys/ILfLpme1pnuv/whgURtJ0qrHEEmDaEXefNtQh7PbE7ZS24jexuy3L1RfAQxqodD6EOuwkoESfuFIgt3Xxrsd2/BMDCbC9Wde7ocTsQLUV844162BY+d0P164Z1jENexHUQpxfG+tnAyq+Aif4sqPhH7IW5SYpLDiSgkDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562965; c=relaxed/simple;
	bh=HSihMM2FSfP4d/9KhUbWIuto84CGubkUezGJaEyCTN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AE67nccEKkjT3bnez9CmS7VqHlVJ11I/+OMrIqWbYSjU7AD+zJubcYpyuLK1OY3S5elFzHhQnBDi/DweJlQp83bHB3/ad/9vDUBj03Tw8Teg02Vg8Id7sW/N+OAZK49b7EZaD4UGJTQ1WL2ZLTLfnT/Mgq4EeyVVrH06p+bB+Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HjsdU4os; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a4a393b699fso26170166b.0
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 11:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562962; x=1712167762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O86sooFnv+K6X9Hejn9ziW9o27GzAO8P1YZRBYqEbNs=;
        b=HjsdU4osuAap3VTzNY+nD+xkPAo+2LxA6xaC4hGLVsCIWrJg77WbEPqNGm1QTGebYi
         pJmksnbN3vfAcAba8swpz/0QOXVO+DGZ5/X7C4jWw803T8qg6KSQNgEZSNPlRPDMAqHt
         69OmC++MVA8XPA+XAXvvwbsuqdGj535lXWwGKy9DNX0rnR7324uM2eXKsuevXkJeBsHd
         lF8lN6EfNcJBkzrvE53JMNV3qLW1XbuoxdOnSNwFVJaaayNViPKfvve7FAtok4d44GwG
         789+uzM9+eeeNBLeE/TZlon2j7ewHVdt/hEho6NFqSvbiOICuHP5BezczG6EPbDYc+q5
         gLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562962; x=1712167762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O86sooFnv+K6X9Hejn9ziW9o27GzAO8P1YZRBYqEbNs=;
        b=mwh6XN7lF2SBZO57G8Fm033X0XLJHpIX/ZDZA4btt3rwDCk6WjM9fmOhDzy2+u4EnK
         G6zkaLdGwyI9m8nJ161T+ChvYqgL3Qga8UuPMGMmv3/EqQJVqFJRRWkIZHF7GsdWo8q/
         op5lkHXGCUo5c6fYyy2zd3GfIoxWDOLEj7Wn8mMZOUEeRMMVp82mXuvzeloqsJY6b1Am
         /TWrXUs35bBltA11caPa7/1PYQMk5bSzcONXlwkjdSLBwGFWnm8Ov9smurW6Wm3h2lHJ
         41ZsTfFyOhnjQzVx/1b6mMbKon/8A7IMbWGnDoFXGy4PgSvrrzTt/nwGr5Fn1Hf0HPjd
         Ay8g==
X-Forwarded-Encrypted: i=1; AJvYcCXC+S3OYHS+2rm5RegYjNk1onBIVG22rFkSLlEdFK8j9/wqcsSIMN4QP1/sgKhWafC/y1+59kiTpe/cQTNMnRfCSGfcZvWVpBsO3cI=
X-Gm-Message-State: AOJu0YyAs2JOg18AOTzvnf8kyNqKYtQeJdHiEbKILi9IDGk7+oxmFD/F
	e4riumBKQOigBQuDaxKFvq235cc9GyqnhVcj9At9aFAwFiLhvTA5SDnjp0ZlYbw=
X-Google-Smtp-Source: AGHT+IHHHaAzVexcQv+vgyswmvYjPMLnVGL4av0uBH5jefJwU/EuTt+IjPXJat5enkvHEKlDW0yNuw==
X-Received: by 2002:a17:906:b848:b0:a4e:d1b:efb1 with SMTP id ga8-20020a170906b84800b00a4e0d1befb1mr46999ejb.5.1711562962564;
        Wed, 27 Mar 2024 11:09:22 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:09:21 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:56 +0100
Subject: [PATCH v3 18/19] media: venus: pm_helpers: Commonize venc_get()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-18-79f23b81c261@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562924; l=3254;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HSihMM2FSfP4d/9KhUbWIuto84CGubkUezGJaEyCTN4=;
 b=5oClluLz0nikKafGz/9dpBvnpWLtRzWilUVYfbcWu+ygCGByvNuYCxjKzKJfWHiMjUr8VVIIr
 Jc0D6CuJqlKD1ULIpubAesWCcb8nhV+TbqHDR5xgk7fm+fMw+Difbfx
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
index 3818384bae10..5d174b83926b 100644
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
2.44.0


