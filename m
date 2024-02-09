Return-Path: <linux-media+bounces-4933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C07A584FE7C
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 22:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 810F8283D0E
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 21:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF204F611;
	Fri,  9 Feb 2024 21:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zaLCgF10"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A69F4D584
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 21:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707513023; cv=none; b=Inz5Lc6MWMJmsxky6Ij6BgAG3orTkcRYr1XY+Eaqxjt//5GqHMS1o5DucGNY22hd/lU6yk45iBJdSAH4GFlPV12dKvLl7J/Qw95i7mip4Spt/iAzcYscNEAMpWU1uEwqni34vF3mnw/UmmWe+YWmS9mP/U8PrOn19HzyU3+pDoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707513023; c=relaxed/simple;
	bh=j6RqB7qhdLQ/4O4liND2yJpb9uwEoUR3RICjb3kPkBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ndDfOCWqcsqYZUTuMBZr3hJKGTc/UGj6kHyZMdBPXTWiJckm16hVmjIPaDgNeOfJML5OyBFvECmNc3YcGxRQwiwZbYm8FNJSiaPpxkHnkMpVOaAJC7fFiybcZPKpySBts//3YL9XPTCNc9oVRh7SaBrf9eHtLifXk2vsHb6mt4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zaLCgF10; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-560c696ccffso4278297a12.1
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 13:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707513020; x=1708117820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=js2pEuzAV2nN8L7KReaasWsLTFytDhFcrYh7TQGAyMk=;
        b=zaLCgF10SoUcJpVrjbPlsxr2BftQgi9Kl0FsRFzKFb9Qt0xgAeTi6XZ0A1Vm/FWrku
         f6b2RLKzeiPIppiySgWamvlNt2r+YTWIgMNpsO0RlbmIswK3e78hGwE/L64rdkYxb5wH
         3LtnAvKzymyln1b0N183fqjsdaLfdOPI9RRrdW3sRIgxX9hF2zCng0TGREqz0HuqQD2O
         F0zfkLvf4Cr/rTu6G0BPgWwK2TiHwgoC9gkCT8h77eXm1BZ4TKOFfp91wNy5IiX49tEz
         WXyofReHQA+/7LX9YyCzZtzCfAoCUduwZtHM2xYNeSq2JIxuCNg2dvBjjFvqnp3izf90
         kV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707513020; x=1708117820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js2pEuzAV2nN8L7KReaasWsLTFytDhFcrYh7TQGAyMk=;
        b=v7LUQRKBDgGP7n3u/0ZvbWv24deKWnsl1Oiu2Xi3ELAyrL2xxl9SUWnI2EaXqGrTWC
         +zNATnXbvt4DeeKoaFeJsC2v86/XoHQF4u3UTmiCGYJZ+pmXBOylGI1x1KPeXeMmqH4s
         WtDCYekVg2QOFIj/mGZlFszbqVSr3Y4cMG3sPmLigXIQrfyZDcyALy0mjpTTztJl8v5I
         9cPL9MPMYgzqQTKcuvuA96ln02mWVqvGW9lHnkA3vel9ADYtIWUx4WZRiJhQZRXScr+a
         fpujAWw0pjNxLv62tjVY4ykkOdA0GulYCD82FxryHOIGhOGd8dzT/b5Zx/O7PMBbSHg6
         +mZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv5gXGEgZSy3YYWg8EYXzK7jYl6oAmVa9KvJdWS9NR77yXWQagvFW15MkH8WZ/8oa1PhCAF23ItZ4vJsRxN6hh7nO0s5YM4qUmVmQ=
X-Gm-Message-State: AOJu0YxLlmDno5WwXZYH2ig7dlon2o12aL4BorGwWMjTjP7V89Yk+fqk
	9dQPHvNtb/G4IR02tANQAJ4Til4Drn9skU2xhNfKbezxO5GffKR5Kkr7RkWn8Mw=
X-Google-Smtp-Source: AGHT+IEbaYD180/1YWnZfYBOu4acFr+aUCsPsCkXwJANGBmdc0kktppCzoGX0W+52rZk5nA8+pjDHQ==
X-Received: by 2002:a17:907:9872:b0:a3b:dde8:6a57 with SMTP id ko18-20020a170907987200b00a3bdde86a57mr258546ejc.23.1707513019779;
        Fri, 09 Feb 2024 13:10:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPsj3/JL+m49YumWioOb6hwJ4PZyfKAxV5EBoHXLB5kuDoUHAT21d6q3TbKuDtpnSbNT5eti0yu8inmkuW8ZKWsGOB8MZnb0uZL4O6bOK42VPeszj8Nx5eLHUJApnynyPhSFx3aJG4J68M1X5JYcn+dXtmof8GcRQi+ChJXdlun1vgU4aYYnKuDlKD37dv9i4Y2Vftyt4A0iUX7A1jqGiSim/FhnEUO+udGIqK9Mjd/AXQ4jmpHvN+w56tUf1E2atIi75D/S2ck/2wk2B+tBTcLzYHANjLba98Gc/LhF6MMcHl25dPW0YZ8JEfgeYKXAm/mErnuwJE6zWDOY9XzWQEett5QI5qI2Wbizos8SeA3BWakMc1rdWozZKoUkK01Ue+y2zZkQzx4hhyMqBKBdxuCrqZvwyzw+aejGPstn0ukY4CN5GI/O/jSPo1FN0MjF60xxpaQzpKzn4sFOrFRxPRs5LbTapiszolVbeQPov7cy6+vRDV2+HPS/lnpOXCNuXLFg==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id vo5-20020a170907a80500b00a3be3b27d0bsm1056517ejc.49.2024.02.09.13.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:10:19 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:10:02 +0100
Subject: [PATCH v2 18/20] media: venus: pm_helpers: Commonize vdec_get()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-18-3dac84b88c4b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512986; l=4126;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=j6RqB7qhdLQ/4O4liND2yJpb9uwEoUR3RICjb3kPkBU=;
 b=9Y5pQbsbW/NkpOZZSBVKI4DPo8gIzWCYvTPJUpWCb0ma63WrBhZU1JhFW+k4Zm4FDhDj7S0kp
 Y0A4IGdL18fBYS2FcvBw1mtqr/tI+ssfAfheQykKMGtFBr2FBMYgYYh
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
index 1cbcffbc29af..cf0794acf5d0 100644
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
2.43.0


