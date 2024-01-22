Return-Path: <linux-media+bounces-3967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6039835D36
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 09:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E015B26F56
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 08:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1303D0A0;
	Mon, 22 Jan 2024 08:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndoA3sQ0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD4B3C697
	for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705913253; cv=none; b=uBMxslrrh9/EiGKAoU8jgsHKr+PHoDRiu7Y/wxwLhZCAZf7MGVRWc3bjlk687bIcmsrStwG9UJzdNe49qp+T5f+Zz8Nlx+Q1rKJmeXHOog2boV7UszxjemNRMq6JdvZ6QYP1IRosRu3Si1J7z45KSoRovjNm/0EKVDDu9KVIfqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705913253; c=relaxed/simple;
	bh=rE3sB0GjrGPFE7JauoLtOc/n7sCA+d8vNW1jXYqT+pU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jdJc/eowBTXXUjQnLv4wmoK5JrZewyy8z9hCdTJY0h6k8xhTF2u2errvAue/EM41+iL729KkEhxD5UWHIYvLMSjKNRRKhgZmN5fBwQKsVCU6L7jPbJYWU/R7pCWjvzcXv2yK/Y8ZxFi4CkeBZXj0EiAM9bdugQO/LHOnqKhaJVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndoA3sQ0; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e7e55c0f6so3006075e87.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 00:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705913249; x=1706518049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAKH1Rh64tvqkxawFp0eVPkTup3ob02eY3wJbwsR52U=;
        b=ndoA3sQ0wDwc9yNN4tG3/fG2QKgor+u9HddiY9sMD8KnIbmCD40QaN299ejtscI5Vh
         8WUCFUL4Q32RVnkGM2LsGdw9KMPlm6YVhtm/Y+SgNdD5d3Oz13++3EbGZUK5tKhXlS5R
         UGmmC/SeISfKs8/dkmNNtpqiabciOcFv/LDqlQqRXXU5WnI13RmEAacU6FCJt4EWwQMJ
         ZgxSV4orcTX4Kt8SOWkQl76Bmo0iZZNoRNWfg/dkbUiCrrYBelysSt6aWnC2BuhP+SrQ
         folUN/vGKkgkBdAER3uuuGxIAjMbxOZVvtUhyIYoI53tEa0y+HOVMftDNJwfMySlNTlU
         eiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705913249; x=1706518049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAKH1Rh64tvqkxawFp0eVPkTup3ob02eY3wJbwsR52U=;
        b=CfLqcr+dc/OYQvIoWKeN7K0CByFvQiRIho0FHIu87j2CgMXwqFFggshJo9zNzNeIA9
         zBR60WrUkoRUq7odc0Fa1lHvr/E+u5/VbLs2/qYyhavQOFYNNF6b86auUxiBsNEotzw2
         ihJWwwdCX2C23AIddHjox/qBlzA6tQeB43ADVWC4naMK5T4rsAVVAHGDZ5mkiwiuq5yG
         I/iVNwdwj586lAr0K/zfyaqkOErfnhQgG2/mjh8Wj1fN8Jye2xMwoIJohVV/KF3DTDOV
         1kt5AXIQrJRGXves2T+66MBinI5tGh0oNeB7xmPUUe7Dj77NqONccl7qsK4RF/X4k/jb
         RZoA==
X-Gm-Message-State: AOJu0YyVHd7bVDPf8TgByhtss8ryt/0SYkPR5ul3I0znbBZ4SqkDha49
	ELU71HO3yR0XC6Y4XApIBh8WDYAWQ4Wqem+WWRNHCXh3HTvUR2WubZcRwASI8MI=
X-Google-Smtp-Source: AGHT+IHfEaQBIOFgJB+5p4vY8oMqDpTFUi/HC13a3ZpAuo6Q0KCqxUcL2zDYCcInSfC37F7CPxacAw==
X-Received: by 2002:a05:6512:3c8c:b0:50e:d1f9:ebe0 with SMTP id h12-20020a0565123c8c00b0050ed1f9ebe0mr614114lfv.2.1705913249649;
        Mon, 22 Jan 2024 00:47:29 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id b21-20020a17090630d500b00a2c4c23cd12sm13075462ejb.217.2024.01.22.00.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 00:47:29 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 22 Jan 2024 10:47:05 +0200
Subject: [PATCH v4 5/5] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240122-gdsc-hwctrl-v4-5-9061e8a7aa07@linaro.org>
References: <20240122-gdsc-hwctrl-v4-0-9061e8a7aa07@linaro.org>
In-Reply-To: <20240122-gdsc-hwctrl-v4-0-9061e8a7aa07@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-media@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2921; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Vk/itDO+Lfx/2A5RsJFS6owpFqpo96HTGoEN2vQw4oo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlriuVGw/R23nM4ftPZR0CdvkJ4dv64Da6oA9WK
 96wepF1DsqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZa4rlQAKCRAbX0TJAJUV
 VidJD/4zyhZuJ7ZOsHBa4UU8Jq/BAiGJv1LeEHcRLK8S9ZKuYLOC9/Oin9OJxSzdUK9hob033FN
 6+wwyXsCYKCgbsV99dAVITZ2UDpYYWkOaoGT8ajmqcdkgNBLE/sfA+aqDXTZfSOAg7df6NMdYyE
 oek/aEmXsrHDDJDc/dQpDQ701/Eo9CUiEOauVx0eTcuwYTfHKnZSP6v6XBoMus/m/hUbSIRx57a
 pcW8lH+USq6Il8oWkcV3H2kj90564ElJKkkTRBjfYttfkYWb5n2i0uni6P9HSYA9QrTRWBtGBOi
 M1nuAYyD4skwVE6wHcycYEKrNQGqcsEVLgHTGGw9t7xNu9ow2YLTubM/xHl5kAUrMbEvxAadkZH
 FCXULcoCvKsgYJwaKN79UHY4X8KzhC1m7hC5SVmiG+9tUAEmLnDQ3U7+De+vT+C0vpJn1vMyOwo
 foXCgzrKi6zr48YnPdcMeSH43ge+pCRQ+xH5qr93sIr13dsA6CakHCRKdBsoLL4dxRx9F904/D4
 Z2e1UlE5aHb7HSE14qE14q5bfAyLJ+GNEd8aH7IFnzbozhLZKUe9pXdf4GW1iqb8SSQKO27R546
 3QC0px+i8lCBfow12dLlcmRWVpYq7V25U2oZLmqu4BzuBkA48sLOatafpnihxYSzI77GFbZ0XN6
 vxYCs+6rFpyF0TQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Jagadeesh Kona <quic_jkona@quicinc.com>

Use dev_pm_genpd_set_hwmode API to switch the vcodec gdsc to SW/HW
modes at runtime based on requirement for venus V6 variants.

Before the GDSC HWCTL was available to the consumer, the venus driver
needed to somehow keep the power from collapsing while under the driver
control. The only way to do that was to clear the CORE_PWR_DISABLE bit
(in wrapper POWER_CONTROL register) and, respectively, set it back after
the driver control was completed. Now, that there is a way to switch the
GDSC HW/SW control back and forth, the CORE_PWR_DISABLE toggling in
vcodec_control_v4() can be dropped for V6 variants.

With newer implementation, the mode of vcodec gdsc gets switched only in
set_hwmode API and the GDSC should not be switched to HW control mode
before turning off the GDSC, else subsequent GDSC enable may fail, hence
add check to avoid switching the GDSC to HW mode before powering off the
GDSC on V6 variants.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index a1b127caa90a..55e8ec3f4ee9 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -412,10 +412,9 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
 	u32 val;
 	int ret;
 
-	if (IS_V6(core)) {
-		ctrl = core->wrapper_base + WRAPPER_CORE_POWER_CONTROL_V6;
-		stat = core->wrapper_base + WRAPPER_CORE_POWER_STATUS_V6;
-	} else if (coreid == VIDC_CORE_ID_1) {
+	if (IS_V6(core))
+		return dev_pm_genpd_set_hwmode(core->pmdomains[coreid], !enable);
+	else if (coreid == VIDC_CORE_ID_1) {
 		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
 		stat = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_STATUS;
 	} else {
@@ -451,9 +450,11 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
 
 		vcodec_clks_disable(core, core->vcodec0_clks);
 
-		ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
-		if (ret)
-			return ret;
+		if (!IS_V6(core)) {
+			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
+			if (ret)
+				return ret;
+		}
 
 		ret = pm_runtime_put_sync(core->pmdomains[1]);
 		if (ret < 0)
@@ -467,9 +468,11 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
 
 		vcodec_clks_disable(core, core->vcodec1_clks);
 
-		ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
-		if (ret)
-			return ret;
+		if (!IS_V6(core)) {
+			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
+			if (ret)
+				return ret;
+		}
 
 		ret = pm_runtime_put_sync(core->pmdomains[2]);
 		if (ret < 0)

-- 
2.34.1


