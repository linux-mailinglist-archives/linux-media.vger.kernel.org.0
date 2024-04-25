Return-Path: <linux-media+bounces-10120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BF68B26DC
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 18:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2F2C1F2205B
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 16:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D0214D44F;
	Thu, 25 Apr 2024 16:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="bdAp3dr+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C20131746
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714064004; cv=none; b=SaW5JGsQ5I3KHHZJeS3O/goPi88SZgjP7ZlEMrW0l0rpdAa+2nXwS61fHBJf10Tjt92lsiEWrsREjz66oJ3g3bCCtsZQeahSneJ9LYO1yYOhF9y+d+4WK93vbGbBhbenwxROnKsAHx6Z6Ci3VxhlAEbaH6v2ox2zhY65eDt1I+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714064004; c=relaxed/simple;
	bh=noq65oY+jgHp4OvoERTRW6Qf1bTd9Kwjb2fKfvZQ0I0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Jqd6+s6AbdOBKdms/WBPbNkXNb6xkqET3g33uciALeI2SOn44E4aHP6p5tUYo1QZXTOGTGnaxq8FUfIg67P2LYNgZbeut6kAFDJoDbnrecrlbtq97pDTqt6Xyfs3SqBEkGA512A79AvlDuO0b4FEZaCB5fokL2tCUhHzKFhaer0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=bdAp3dr+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41b51ee24f9so4577285e9.1
        for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 09:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714064000; x=1714668800; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkubzpW42FZ3X0uIBR5n+FKyh0t+HmkdY9GkED2U35Q=;
        b=bdAp3dr+CNvZI+GA6PFcXflHnBDvNTr43yL/ycHQauw0ghu5gCTKnETKwyXaDt4oLf
         WszgIcnJXdevKAbOMRaW7233Jlj2Sx5o836YBc/zdbqjwUfcoyNrxC/7IQtIAzkMSNXS
         Xg3aTbg3XyqIZKov/FFNPkusQmlQrLYbMG6auwpNM7nkMVnOWewEfquZBCJRkawMmQ7K
         7pAwBOdC1PHAD7/sSzfVbXsaKIEwKhRXWPnIqMZ2VqeoASaezZK7PccmUUO5yPV0zQLB
         4nNTtWsAjFp90M5mEQZ4eCnvs/nPzpehlkvqX77Repka+lnGwQBLALn/f4tWI0V9j2Lh
         3z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714064000; x=1714668800;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kkubzpW42FZ3X0uIBR5n+FKyh0t+HmkdY9GkED2U35Q=;
        b=DgXiJJTJVluU5llj2lHGnoMiNGnfXqV+4xD6SLrNWMQCEol9krf39ZAc6RgObG/3Ge
         F6UyAbCgWB7JmgpB/3v57NxGQrlLU3KHgV09Jl3jJW98Fa2Up3PllUPM7J6hxBEJe5m5
         WOEQH9pfLfp7z5/An2lwoJcHvUmYeFOTus68Q+JV2RS5MxTiy/7gLx9gdSlc4GLrsE5v
         oR6ae2tJb0qRm5BKEKsQi/+9emkEspGbJNpGrZGYtlMQ4UEOaFI6xzQfGjegbmGWX29f
         VrjOQeczvcEfRm5wthinjk1Ox27n/V5e5xwcAhpIn9IqODHQg2u0vEyuJCmQbJrySn5m
         +CVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/HfMiiYwmZf5L4zrHz4v3UZ3AoJ/hhE42nk3hqFby46EQPb0ApTdaIkXJhSkUX319zHfvGwLK+uxnpCAWYg/5orPO8plj010uXgk=
X-Gm-Message-State: AOJu0YxX2lSI23gplv8gd5z+3PJmgBSLsMcJmkks1cUKTBRuOfzeBt7m
	eE6P8nlyKC3bIlBjHKEF6fZsBssKEPLz4g9hugUMdnAeZdNSfkBVp8sXzgeze6E=
X-Google-Smtp-Source: AGHT+IEV2lpAbZh/xzq1vceg1C+Iitsk8eQcbd4VvCzoDr2qfORG7PUveU0qztyTfsEtWV0jdryaOQ==
X-Received: by 2002:a05:600c:3b0c:b0:41b:4506:9fd with SMTP id m12-20020a05600c3b0c00b0041b450609fdmr325468wms.6.1714064000188;
        Thu, 25 Apr 2024 09:53:20 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id j2-20020a05600c1c0200b0041ac3e13f1esm9751481wms.37.2024.04.25.09.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 09:53:19 -0700 (PDT)
Message-ID: <df6859ec-9fe1-4768-987e-cdb14a887b9c@freebox.fr>
Date: Thu, 25 Apr 2024 18:53:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [RFC PATCH v1] media: venus: add msm8998 support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Based on similar msm8996 code.

---
 arch/arm64/boot/dts/qcom/msm8998.dtsi    | 49 ++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.c | 42 ++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 4dfe2d09ac285..67b8374ddf02f 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3010,6 +3010,55 @@ mdss_dsi1_phy: phy@c996400 {
 			};
 		};
 
+		venus: video-codec@cc00000 {
+			compatible = "qcom,msm8998-venus";
+			reg = <0x0cc00000 0xff000>;
+			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&mmcc VIDEO_TOP_GDSC>;
+			clocks = <&mmcc VIDEO_CORE_CLK>,
+				 <&mmcc VIDEO_AHB_CLK>,
+				 <&mmcc VIDEO_AXI_CLK>,
+				 <&mmcc VIDEO_MAXI_CLK>;
+			clock-names = "core", "iface", "bus", "mbus";
+			iommus = <&mmss_smmu 0x400>,
+				 <&mmss_smmu 0x401>,
+				 <&mmss_smmu 0x40a>,
+				 <&mmss_smmu 0x407>,
+				 <&mmss_smmu 0x40e>,
+				 <&mmss_smmu 0x40f>,
+				 <&mmss_smmu 0x408>,
+				 <&mmss_smmu 0x409>,
+				 <&mmss_smmu 0x40b>,
+				 <&mmss_smmu 0x40c>,
+				 <&mmss_smmu 0x40d>,
+				 <&mmss_smmu 0x410>,
+				 <&mmss_smmu 0x411>,
+				 <&mmss_smmu 0x421>,
+				 <&mmss_smmu 0x428>,
+				 <&mmss_smmu 0x429>,
+				 <&mmss_smmu 0x42b>,
+				 <&mmss_smmu 0x42c>,
+				 <&mmss_smmu 0x42d>,
+				 <&mmss_smmu 0x411>,
+				 <&mmss_smmu 0x431>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+
+			video-decoder {
+				compatible = "venus-decoder";
+				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
+				clock-names = "core";
+				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
+				clock-names = "core";
+				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
+			};
+		};
+
 		mmss_smmu: iommu@cd00000 {
 			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
 			reg = <0x0cd00000 0x40000>;
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index ce206b7097541..42e0c580e093d 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -587,6 +587,47 @@ static const struct venus_resources msm8996_res = {
 	.fwname = "qcom/venus-4.2/venus.mbn",
 };
 
+static const struct freq_tbl msm8998_freq_table[] = {
+	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
+	{  972000, 520000000 },	/* 4k UHD @ 30 */
+	{  489600, 346666667 },	/* 1080p @ 60 */
+	{  244800, 150000000 },	/* 1080p @ 30 */
+	{  108000,  75000000 },	/* 720p @ 30 */
+};
+
+/*
+ * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
+ */
+static const struct reg_val msm8998_reg_preset[] = {
+	{ 0x80124, 0x00000003 },
+	{ 0x80550, 0x01111111 },
+	{ 0x80560, 0x01111111 },
+	{ 0x80568, 0x01111111 },
+	{ 0x80570, 0x01111111 },
+	{ 0x80580, 0x01111111 },
+	{ 0x80588, 0x01111111 },
+	{ 0xe2010, 0x00000000 },
+};
+
+static const struct venus_resources msm8998_res = {
+	.freq_tbl = msm8998_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
+	.reg_tbl = msm8998_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
+	.clks = { "core", "iface", "bus", "mbus" },
+	.clks_num = 4,
+	.vcodec0_clks = { "core" },
+	.vcodec1_clks = { "core" },
+	.vcodec_clks_num = 1,
+	.max_load = 2563200,
+	.hfi_version = HFI_VERSION_3XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-4.4/venus.mbn",
+};
+
 static const struct freq_tbl sdm660_freq_table[] = {
 	{ 979200, 518400000 },
 	{ 489600, 441600000 },
@@ -893,6 +934,7 @@ static const struct venus_resources sc7280_res = {
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
+	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
-- 
2.34.1

