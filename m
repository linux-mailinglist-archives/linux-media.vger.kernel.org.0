Return-Path: <linux-media+bounces-4927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A1684FE68
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 22:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B74411C2179A
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 21:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC0E3E485;
	Fri,  9 Feb 2024 21:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qC+7pgNL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473A33DB89
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 21:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707513013; cv=none; b=K84IBVFUYpcoLSie79yQZVpJsdK7gmF/Ys3jM090SWIJZ0Gup/9YBl7IF9whjo43bgDB/CrVIzW3yRxQDCnxy1WuBKU36V1rdwdumHm4H0KCSkFhUpFe9YcGllf4XJIcNFOfzHznOLsaso1wX6/sz9fetq3iK9g+1oe4qkaLPKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707513013; c=relaxed/simple;
	bh=/kFnbapgubNRtfX1KEblqNgRWZdEMPDSWK83uPCG7ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sgv0yKvXQhLazbNegipbCzA7xVOa4y2A5aCJsGJG1M0wWOoHXpRlWG/f35HQ15/k5b+LGr7nxz85SkSRKUnCycw2D+n0yKeQ4/pJtybR2u8fTGW//GN0BcDzgquGl3UyLyt1tsgvUxfyuzMcM9B8S5iZaD9SXLPwGdmeZ702veQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qC+7pgNL; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-511616b73ddso2311984e87.0
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 13:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707513009; x=1708117809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8GIqzjr5F0muhdfu+nSlnTYCrXU9jfYOiTVyQ6Sb9U=;
        b=qC+7pgNL2hqTjlyL0taRYFtGe700EWUItg4BXiyX93XWpv1eemsCeLdlJrWgk1WA+y
         B+yXAwliaTjSYMldnkhxlAZWZjzDCIIE9zohzoAXL3ibCGXhlpjNtHdY/AujqE/g779l
         qZSifBUe5tFfLm9eIiNUqvfr5DrFzDbATFcFrvRGVc1abnBwdKzNVEqKTeX0NRfctXdu
         ds5jtJcw+jJ2Pc208J3tv7k4mrR8PrasoWlwQYbg600B3gWxXWr5Wgx2G1A5BeV2TYMZ
         KEdh3B6Gf3KssYdELpBDWlb0f8jH4kviPjRS0tEEEFhb9EaTl2E0vlWTF9sZZgh/heMN
         uGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707513009; x=1708117809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8GIqzjr5F0muhdfu+nSlnTYCrXU9jfYOiTVyQ6Sb9U=;
        b=M/4/UHYcrY12orD774/mmrzv6HniMSWB1B3ZNUfZK9EoG9k20lIQ4T8yFHijikR5vj
         pw94WQ006wIwpm0h6At37QyHBFNHvEG6S0w5RqrVk46dmdtuAMmA4B9X8uGBOb4aRP8j
         3R3PDIO0DN6yhKr7Psr9QgqaI0NJ7Ei7P3uNF1HGkDw2JDR2KCO7PANEeDNvcg53V6MP
         h0aCDcdOTr4uhFbI50axB1KYUQiIiQ6KyuryqvEfd4k+eYE99Yi/SYD6YsGe5PRQZ6lc
         WkbWuY+g0DqATDk8hAZnMmhMWWIKDZ8CALNOHaoi36q6GNkn4TwQZEf70Bq0OVPg3rgY
         Y66w==
X-Gm-Message-State: AOJu0Yzz0djQe9LpencLC2PSILKLv3sCnEhpFKNfI9GRjiWXVpFRB08E
	yUOAOCjJQUqyiqEKVjc0AMKo88iotR2DXDNvhixSD8wvToYdHgU6H15Lf2QfCt4=
X-Google-Smtp-Source: AGHT+IFXV3KzQwy58rEP2blWOY14Ikqpib0euEGzIkKjV/J4kBP2N2s4twAQCqgmVWtRV1Jq+SXPXg==
X-Received: by 2002:a19:ee09:0:b0:511:494b:c483 with SMTP id g9-20020a19ee09000000b00511494bc483mr118496lfb.31.1707513009461;
        Fri, 09 Feb 2024 13:10:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoFd23U02RRkhlYViO40gpOFYMCnq7G/cfZ0MZFVFnjHbrNv11wygCqcW+U/f8KFUpjBx8RaHsNERMwGIRWJp00rpzbtxi/MNYPSQ4wpHFIB3hbnIhJV24O7JbN6XT1T31RFaQoOfbb9R6/68uiw/yMqH+EzS2WlOygEGsAqUefY/p1v44PW/dffgdwVqQ3A6UxiQdBHJEmTzMoB0UtYruPdqOTc2UPWbL6vPL8LtalR2mukGZorQ9XUzi01PNhup3ZLlXhCu72g+hbZc33Fc9aDf7AaVjg9vEErr/gxJAPOudKqQuYm/fyItv2AD3F1E4pPWuLF0sXmf3hGEttM/6H5RuHQGr9QaYdDt2nvaUelta2QAhWDU91EiuRf3YNpz7NpEFKUW8nydd9BI73GVchzYddFVga0iRPlA/U8vbF8Zzea8FNvAzkiyyG6RFmNsJkf6BHzmafw9IQ+ts5GE+eSohjm6pWNqBjacWVBDzkarqcoIl215LF6Y1kpG+yabohg==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id vo5-20020a170907a80500b00a3be3b27d0bsm1056517ejc.49.2024.02.09.13.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:10:08 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:09:56 +0100
Subject: [PATCH v2 12/20] media: venus: core: Remove cp_start
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-12-3dac84b88c4b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512986; l=3274;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=/kFnbapgubNRtfX1KEblqNgRWZdEMPDSWK83uPCG7ls=;
 b=XjNO/TzZnniFSFa+959SHOc3p3ge3qqR+DGSwZyLfroBs3WCkm3oMoczUsS1gsC6BlPMDBGTZ
 xYIgwPIWAcrCFu2HvHqfMCDbLcyvH6GxscR+pstT5S2CYm526//SOmR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

It's hardcoded to be zero. Always. Ever since msm-3.10. Or maybe
even before. Remove it!

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c     | 4 ----
 drivers/media/platform/qcom/venus/core.h     | 1 -
 drivers/media/platform/qcom/venus/firmware.c | 3 +--
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 06b78e98cebd..65a9e815e6ba 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -647,7 +647,6 @@ static const struct venus_resources sdm660_res = {
 	.vcodec_clks_num = 1,
 	.max_load = 1036800,
 	.hfi_version = HFI_VERSION_3XX,
-	.cp_start = 0,
 	.cp_size = 0x79000000,
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x28000000,
@@ -716,7 +715,6 @@ static const struct venus_resources sdm845_res_v2 = {
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50,
 	.dma_mask = GENMASK(31, 29) - 1,
-	.cp_start = 0,
 	.cp_size = 0x70800000,
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
@@ -760,7 +758,6 @@ static const struct venus_resources sc7180_res = {
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50,
 	.dma_mask = GENMASK(31, 29) - 1,
-	.cp_start = 0,
 	.cp_size = 0x70800000,
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
@@ -869,7 +866,6 @@ static const struct venus_resources sc7280_res = {
 	.vpu_version = VPU_VERSION_IRIS2_1,
 	.num_vpp_pipes = 1,
 	.dma_mask = GENMASK(31, 29) - 1,
-	.cp_start = 0,
 	.cp_size = 0x25800000,
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index b1d0687d294f..9dacf533c7ad 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -80,7 +80,6 @@ struct venus_resources {
 	const enum vpu_version vpu_version;
 	const u8 num_vpp_pipes;
 	const u32 max_load;
-	const u32 cp_start;
 	const u32 cp_size;
 	const u32 cp_nonpixel_start;
 	const u32 cp_nonpixel_size;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index fe7da2b30482..16e578780be7 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -245,7 +245,6 @@ int venus_boot(struct venus_core *core)
 	if (core->use_tz && res->cp_size) {
 		/*
 		 * Clues for porting using downstream data:
-		 * cp_start = 0
 		 * cp_size = venus_ns/virtual-addr-pool[0] - yes, address and not size!
 		 *   This works, as the non-secure context bank is placed
 		 *   contiguously right after the Content Protection region.
@@ -253,7 +252,7 @@ int venus_boot(struct venus_core *core)
 		 * cp_nonpixel_start = venus_sec_non_pixel/virtual-addr-pool[0]
 		 * cp_nonpixel_size = venus_sec_non_pixel/virtual-addr-pool[1]
 		 */
-		ret = qcom_scm_mem_protect_video_var(res->cp_start,
+		ret = qcom_scm_mem_protect_video_var(0,
 						     res->cp_size,
 						     res->cp_nonpixel_start,
 						     res->cp_nonpixel_size);

-- 
2.43.0


