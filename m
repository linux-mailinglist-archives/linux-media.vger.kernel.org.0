Return-Path: <linux-media+bounces-7989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 664B088EDE7
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 19:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 878491C32F8F
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 18:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AC3154451;
	Wed, 27 Mar 2024 18:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R9QWhxvm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB3B154427
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 18:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562962; cv=none; b=btWk5JsRduFtxXepDSeJ82wMutknYjLHyJpAwFc85yQu814rVDVEObsj9TnyhzZJIHRWWuXJp3+3qhdVz68E/rBhGgcLmnTk1c5vB0uypOPGkvkqBLe770DA42g3ekinhMXgyX1p8tzGse0d97/s9HkGxiUTBUKVIePJvZCe6N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562962; c=relaxed/simple;
	bh=YPOM16vVGulFeYJxVS/bQNxn7NvNb50oyMZ+8/LRVgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MSz8v78cnT7UF9MP0PgVoTsGzxIcwGV/5w240LFc4IYOA+T4pyJgXyDymxsQO90q1yWokfOc0yv1iP+JNraf7HVi1XkgfAjEwZ7jUh2oKQ6wHQS4alY1bYBZODx+mxa5ykNwjKVrNgPAs2t3uUjZbaVCB1m9OryzqkMQUFxSRMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R9QWhxvm; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56bc5a3aeb9so127571a12.3
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562959; x=1712167759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viaDnL+jorLpEr4D5ysTfAL5WbtSuMoX3VxG9GbPUNs=;
        b=R9QWhxvmrEjvrSRoOMLxeL1heLMZCmEzE/UgAZp34Ohg5LJeIOsU8F2SboXF+IDAwE
         JgxBEmsCZucoFeC+TxyXRUmPr5q1t+8pPi6QPSzt5sA7LdDmKOpC1cGhmFtxbj8mwxD/
         lAJAwZexbLmBzBAYuHhMargWNgkiqiz0Sh8EsAj79ImO/Lrv7JDVDxT7mM7eSzS2qel6
         C5wFN89BH3B3lfKcHyrnHHl4NKidApSVaAMaPbZWWs2kL5OBlZhru/36uuCpn5cvyGR7
         RWGIo8RCqOVWY1PW7Rw/KG1FtgNP76almw+UVWNHYlrXCfyuRQEzKofMvl74EaYzvfso
         YGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562959; x=1712167759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=viaDnL+jorLpEr4D5ysTfAL5WbtSuMoX3VxG9GbPUNs=;
        b=Jmu6KKKGWr9Ot3Aw/etznooZW66Rq1I06CifOP3iMg5pH5Ld4jph654WmxAQx/tBLL
         gO0tU24X/oEorpwcGa8rNas5VTRbSwByoygltjpLqLdYqBa3IUt1i1o0cgom1YSxqsE9
         KpwIw/Kab9/XMD1DZ0RGIX3nblV00su8vWBvu7KiAE5VtNFgg3/4qKcG7ss3d2e9IX8C
         ZTlKykULTRsqd8DcN5nwsGy3paSl8s3wnj0fJGOacYybWDGDQB7rZuvcoTeE9ej0jb0J
         Wlgl2IJ5r3P2NAgVtcGPwFcaqW+OWYgdd8xhyPjT9F05Cb/8NSGGHTK2az/m6Vxq+Kr2
         BBRw==
X-Forwarded-Encrypted: i=1; AJvYcCWcJQBojy0B8FhIdfnJPNuAjYt5sDdHHnkkXuExQC0bNqfnZExSQ9E8CNFz3s/mJMSRcJpPOSmZFyoHDdS5zkbuyK/K8KvkuGXz39c=
X-Gm-Message-State: AOJu0YwMvkOJP3amNhZsHmO2TOwUpyofuB6f8wQXZ9Vyp094Q+Smyx3l
	IlCfdYhGj9h8FSpCPEf2faJWUDkHHrLq+7Aa6Iydbb76bqehdXBXzoaA/jvduYI=
X-Google-Smtp-Source: AGHT+IG/PjxCHswV8MvrfbQwwLAqPrtsUShHYsjN0mLDozARzVNLuuojODIfOriJYcf4wowFpY/Euw==
X-Received: by 2002:a17:907:7255:b0:a46:be3d:1ed8 with SMTP id ds21-20020a170907725500b00a46be3d1ed8mr184672ejc.54.1711562959250;
        Wed, 27 Mar 2024 11:09:19 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:09:18 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:55 +0100
Subject: [PATCH v3 17/19] media: venus: pm_helpers: Commonize vdec_get()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-17-79f23b81c261@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562924; l=4126;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=YPOM16vVGulFeYJxVS/bQNxn7NvNb50oyMZ+8/LRVgc=;
 b=7lvejkr6meg+gAXR22j3qf8VLzKNbxdPnlDC7PC8VF9sGYKtv7vvBC3PicIpDr9rDssyMPMbf
 kkhEFrSjp01BFvUOkzY0sY0ZA3yD6fYEVfMqRHpRUb8byEMW7BTbSd7
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This function can be very easily commonized between the supported gens.
Do so!

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 22 ++--------------------
 drivers/media/platform/qcom/venus/pm_helpers.h |  2 +-
 drivers/media/platform/qcom/venus/vdec.c       |  9 +++++++--
 3 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index ba5199d9e5c9..3818384bae10 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -125,7 +125,7 @@ static int core_clks_set_rate(struct venus_core *core, unsigned long freq)
 	return 0;
 }
 
-static int vcodec_clks_get(struct venus_core *core, struct device *dev, u8 id)
+int vcodec_clks_get(struct venus_core *core, struct device *dev, u8 id)
 {
 	char buf[13] = { 0 }; /* vcodecX_core\0 */
 
@@ -158,6 +158,7 @@ static int vcodec_clks_get(struct venus_core *core, struct device *dev, u8 id)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(vcodec_clks_get);
 
 static int vcodec_clks_enable(struct venus_core *core, u8 id)
 {
@@ -345,13 +346,6 @@ vcodec_control_v3(struct venus_core *core, u32 session_type, bool enable)
 		writel(1, ctrl);
 }
 
-static int vdec_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, 0);
-}
-
 static int vdec_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -394,7 +388,6 @@ static int venc_power_v3(struct device *dev, int on)
 }
 
 static const struct venus_pm_ops pm_ops_v3 = {
-	.vdec_get = vdec_get_v3,
 	.vdec_power = vdec_power_v3,
 	.venc_get = venc_get_v3,
 	.venc_power = venc_power_v3,
@@ -759,16 +752,6 @@ static int coreid_power_v4(struct venus_inst *inst, int on)
 	return ret;
 }
 
-static int vdec_get_v4(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	if (!legacy_binding)
-		return 0;
-
-	return vcodec_clks_get(core, dev, 0);
-}
-
 static void vdec_put_v4(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -1107,7 +1090,6 @@ static int load_scale_v4(struct venus_inst *inst)
 }
 
 static const struct venus_pm_ops pm_ops_v4 = {
-	.vdec_get = vdec_get_v4,
 	.vdec_put = vdec_put_v4,
 	.vdec_power = vdec_power_v4,
 	.venc_get = venc_get_v4,
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.h b/drivers/media/platform/qcom/venus/pm_helpers.h
index 7a55a55029f3..4afc57dac865 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.h
+++ b/drivers/media/platform/qcom/venus/pm_helpers.h
@@ -10,7 +10,6 @@ struct venus_core;
 #define POWER_OFF	0
 
 struct venus_pm_ops {
-	int (*vdec_get)(struct device *dev);
 	void (*vdec_put)(struct device *dev);
 	int (*vdec_power)(struct device *dev, int on);
 
@@ -27,6 +26,7 @@ const struct venus_pm_ops *venus_pm_get(enum hfi_version version);
 int venus_core_power(struct venus_core *core, int on);
 void vcodec_domains_put(struct venus_core *core);
 int venus_get_resources(struct venus_core *core);
+int vcodec_clks_get(struct venus_core *core, struct device *dev, u8 id);
 
 static inline int venus_pm_load_scale(struct venus_inst *inst)
 {
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 29130a9441e7..d127311100cd 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1788,8 +1788,13 @@ static int vdec_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->vdec_get) {
-		ret = core->pm_ops->vdec_get(dev);
+	/*
+	 * If the vcodec core clock is missing by now, it either doesn't exist
+	 * (8916) or deprecated bindings with pre-assigned core functions and
+	 * resources under the decoder node are in use.
+	 */
+	if (!core->vcodec_core_clks[0]) {
+		ret = vcodec_clks_get(core, dev, 0);
 		if (ret)
 			return ret;
 	}

-- 
2.44.0


