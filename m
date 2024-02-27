Return-Path: <linux-media+bounces-6046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A149869BF1
	for <lists+linux-media@lfdr.de>; Tue, 27 Feb 2024 17:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 815A3B305FF
	for <lists+linux-media@lfdr.de>; Tue, 27 Feb 2024 16:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0024E1482E3;
	Tue, 27 Feb 2024 16:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="uYat35vs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B107146E8D
	for <linux-media@vger.kernel.org>; Tue, 27 Feb 2024 16:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709050309; cv=none; b=Z1SfVibvPLm3QEtKDk0nMKiI3yFmrRpXz8rA005X9BydjRcXwyRR1zq1d69/pBBIhAx/OXLqLgIAgvxA2ebVpj5J+d3AYiK5dHqSvIcLU3PV26a5MDQOLnkc/vbvOzX/yLXB4tfEMPiyA6y7qAzJJeuHGjwwriuj+AszvjGOkQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709050309; c=relaxed/simple;
	bh=cN4AYHn+uS9S7hzw6DBgJQQDkkWZiX2wW3ukLvakIQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvaXeEJi9DaxjXHbkU20+pFIIB1ey8MEUxvqhq4y99uLiSeLdiZSXnGQkz4Biohx/cfIuU6gD30LCy8SaTcb1IFc51gOeKKNf5+OC0BJllKv+D94NdSL++4pg36sO57lok1AmCYDF9tpWldyatpvd65tEFMi/w7k3d6tlAilaRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=uYat35vs; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33d754746c3so2991094f8f.1
        for <linux-media@vger.kernel.org>; Tue, 27 Feb 2024 08:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709050304; x=1709655104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kt0ExAldhQpCf2X6080uxjsitFeeoLPj3D8IL22E0W4=;
        b=uYat35vs5Wgnp7J2nLfTV11/cM9FNzhmq8/+GbRefyJEueBIup1eytId5kJ/3SAvkl
         WxnQillLgCEIPzA9PcynuHDghF5WRCtyatEw2Q7Dm6nQ+buh6uU86zeK/FlMglTQdMNs
         5nJlY5aKIih+qOzRcxF3WTO8QSOzPTUmtjFiIBk+9NiCd4q4MEzlpb6qxr4OyH9LhszP
         NWbZ+a7YgbbVquEQd2534BYaB9QRx1S/T8rkV4qZCPzc4XGnhkdbdKZNw9bZmVK9J84U
         CeM6BXk2AxBkAdwfPxXJeLSo4WHxrxcgRs0yTVkV4gUFCz28KqYAlWeFGZ+U4DnAcgcu
         Pz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709050304; x=1709655104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kt0ExAldhQpCf2X6080uxjsitFeeoLPj3D8IL22E0W4=;
        b=D5cpMd7ldaMkFwoHIdQ0+uTxHN4+HToOeb8xt6jN/HytfOSAa9zocwxrEpgR2i2Jaz
         0UnqDbX0Q6RSigsW7WX1g1dSHgEijm8aSU5iE8gNZE+SvaVWIV0ANyX0/D6LuIazpIXH
         u4rz98BwSiBaiyNBkk79BUYvv/vLxldfpo4Fsz61utvN1n/xvHAGiB/yrBK8XXYwDhUI
         95NxeW6YvBXNqkAjwd8rCV/aMMICuJOiuWxBcNTg7sPfyJ/vPMnRNtIIAFmCThgwGlCk
         xpSbtboaDVJ5iAPeM5Rq7SE5xSY4gbGwDVataOamBed9EYcqCIXvI7YiKXXIIUVWAc3Y
         d+2w==
X-Gm-Message-State: AOJu0YyC+s80PYaCaGkrlNfkrJPbpMbAP0kHR0d743GqEgmmF50HKhUc
	tbs7ujE4fkEe6m72X0DASoLaVjDViatM0NP2Sl4t99957t5j+qGla4uAazkD3O8=
X-Google-Smtp-Source: AGHT+IHd2iG/ukj9TSYRENHKjy/JLpH2cUN1ckiwR4HTx4lhORwnv8fiVHS/oeK8i33WByCLC6tXrw==
X-Received: by 2002:a05:6000:71c:b0:33d:4ee5:6037 with SMTP id bs28-20020a056000071c00b0033d4ee56037mr5290827wrb.29.1709050303827;
        Tue, 27 Feb 2024 08:11:43 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id o9-20020a5d4a89000000b0033df1dc39f0sm2031896wrq.4.2024.02.27.08.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 08:11:43 -0800 (PST)
Message-ID: <21b833cf-61c3-4fb5-8c55-492aac0fd3b6@freebox.fr>
Date: Tue, 27 Feb 2024 17:11:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
Content-Language: en-US
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media <linux-media@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Pierre-Hugues Husson <phh@phh.me>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
 <f6e68756-72a1-4c32-968d-3d6adaa153c9@linaro.org>
 <CAA8EJpq=G21h87W69_4U-BZ=Sa5VEs15Y-zE-G5x9VxVx4qjsA@mail.gmail.com>
 <81dc6452-4039-4eb4-92ba-df248215fca2@linaro.org>
 <b8325dbf-67c5-4898-bc23-ff093ae6e14a@freebox.fr>
 <87db77f7-fda4-4cf7-adfd-8545c40c3365@linaro.org>
 <10fe67af-0572-4faa-91c6-fce9c8f9dc92@linaro.org>
 <6342e92d-eed0-45c2-8f04-3779aa2e521d@freebox.fr>
 <4ab95e87-c912-469b-b8d4-be0cf0e4710b@linaro.org>
 <a8c5b27c-47a9-044a-78e8-51c67acf19a6@quicinc.com>
 <c6a9c20e-02d3-4334-badd-2efe5be9ce7e@freebox.fr>
 <d5abf142-3a2b-454c-660a-249c0fb25208@quicinc.com>
 <33382ecb-8a73-4d2f-96b1-8048df7a6414@freebox.fr>
 <3914555d-3c89-a5c5-2906-0bd24d0bf735@quicinc.com>
 <72741d2e-5165-4505-b079-d7b5d1491888@freebox.fr>
 <edb29faa-01b3-3b96-7c05-3378eb3af073@quicinc.com>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <edb29faa-01b3-3b96-7c05-3378eb3af073@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/02/2024 07:55, Vikash Garodia wrote:

> On 2/26/2024 9:25 PM, Marc Gonzalez wrote:
>
>> Errr, there is currently no existing node for msm8998-venus?
>
> My bad, i meant your initial node msm8998-venus, without migrating to v2.
>
>> With the proposed node above (based on msm8996-venus)
>> AND the proposed work-around disabling low-power mode,
>> decoding works correctly.
>
> Nice, lets fix the work-around part before migrating to v2. Could you share the
> configurations for VIDEO_SUBCORE0_GDSC and VIDEO_SUBCORE1_GDSC ?
> 
> If we see vendor code[1], sys power plane control is very much supported, so
> ideally we should get it working without the workaround
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/drivers/media/platform/msm/vidc/venus_hfi.c#L2223

OK, for easy reference, here are the proposed changes again:

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 2793cc22d381a..5084191be1446 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3000,6 +3000,56 @@ mdss_dsi1_phy: phy@c996400 {
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
+			qcom,venus-broken-low-power-mode;
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
index a712dd4f02a5b..ad1705e510312 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -585,6 +585,43 @@ static const struct venus_resources msm8996_res = {
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
+static const struct reg_val msm8998_reg_preset[] = {
+    { 0x80124, 0x00000003 },
+    { 0x80550, 0x01111111 },
+    { 0x80560, 0x01111111 },
+    { 0x80568, 0x01111111 },
+    { 0x80570, 0x01111111 },
+    { 0x80580, 0x01111111 },
+    { 0xe2010, 0x00000000 },
+};
+
+static const struct venus_resources msm8998_res = {
+	.freq_tbl = msm8998_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
+	.reg_tbl = msm8998_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
+	.clks = {"core", "iface", "bus", "mbus"},
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
@@ -891,6 +928,7 @@ static const struct venus_resources sc7280_res = {
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
+	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },



This patch is on top of v6.8-rc1
so the configurations for VIDEO_SUBCOREx_GDSC
are as defined in mainline.

#define VIDEO_SUBCORE0_CLK_SRC	51
#define VIDEO_SUBCORE1_CLK_SRC	52

#define VIDEO_TOP_GDSC		1
#define VIDEO_SUBCORE0_GDSC	2
#define VIDEO_SUBCORE1_GDSC	3

https://github.com/torvalds/linux/blob/master/drivers/clk/qcom/mmcc-msm8998.c#L2536-L2561

static struct gdsc video_top_gdsc = {
	.gdscr = 0x1024,
	.pd = {
		.name = "video_top",
	},
	.pwrsts = PWRSTS_OFF_ON,
};

static struct gdsc video_subcore0_gdsc = {
	.gdscr = 0x1040,
	.pd = {
		.name = "video_subcore0",
	},
	.parent = &video_top_gdsc.pd,
	.pwrsts = PWRSTS_OFF_ON,
};

static struct gdsc video_subcore1_gdsc = {
	.gdscr = 0x1044,
	.pd = {
		.name = "video_subcore1",
	},
	.parent = &video_top_gdsc.pd,
	.pwrsts = PWRSTS_OFF_ON,
};


	const u8			pwrsts;
/* Powerdomain allowable state bitfields */
#define PWRSTS_OFF		BIT(0)
/*
 * There is no SW control to transition a GDSC into
 * PWRSTS_RET. This happens in HW when the parent
 * domain goes down to a low power state
 */
#define PWRSTS_RET		BIT(1)
#define PWRSTS_ON		BIT(2)
#define PWRSTS_OFF_ON		(PWRSTS_OFF | PWRSTS_ON)
#define PWRSTS_RET_ON		(PWRSTS_RET | PWRSTS_ON)
	const u16			flags;
#define VOTABLE		BIT(0)
#define CLAMP_IO	BIT(1)
#define HW_CTRL		BIT(2)
#define SW_RESET	BIT(3)
#define AON_RESET	BIT(4)
#define POLL_CFG_GDSCR	BIT(5)
#define ALWAYS_ON	BIT(6)
#define RETAIN_FF_ENABLE	BIT(7)
#define NO_RET_PERIPH	BIT(8)


Should .pwrsts be PWRSTS_RET_ON instead of PWRSTS_OFF_ON?

Should .flags be HW_CTRL instead of 0?


Regards


