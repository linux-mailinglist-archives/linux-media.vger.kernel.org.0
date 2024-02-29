Return-Path: <linux-media+bounces-6162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ADD86CF09
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 17:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B03BC285546
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 16:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0684AEE6;
	Thu, 29 Feb 2024 16:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="vyaigKW/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10F5160626
	for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709223871; cv=none; b=sLzknjFJmBthfIyu0ynE72GfbxUpWNfyR+XR6q+J/XxYRUhTy3uM0RVyMrOKa/XludNlDsVWWzdU7lf0gYvFwod+HN6HJ2dzD+UNsXtUtWTqNTmmG/Gqa1XpFYiuxoM/PrIS3aPCP1o0rCR3S3Oe9Q2F6Mf7g1KkcZz/M65x2J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709223871; c=relaxed/simple;
	bh=ws2ANdPZTsE6PwaihBFsM3BsNrxv4qsbcmjqHDf0ZcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o6SMXmAkx4zOWaGKmftTmS6KykpDOosxgngm7doeS79FbaOAUpDYFY/jfNSl4CrHYTU21Gdd2QA4CY2uRtme5K35f7DqkKpN5pkIrAWCrw/GDnlN+gJ5Ge1BSgNdtFKPyaHhley7Ar1kEfuOtod9mUD53Mxw4z3JFUEs/9nfvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=vyaigKW/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-512f54fc2dbso933103e87.1
        for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 08:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709223867; x=1709828667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M6NAE83DmjKaLDXnZPH6T8IDGWMAB63VLwoM0G61vV0=;
        b=vyaigKW/pE+EQCGJDCzxzxkR3dlB3ZdSmVrsjyscCA9ZXHDxA2Z4f/hU8Gl0jmWrWe
         YDLn9P3iMxWyEodl/A3fHEMFvfhyHBOA7w0pIS2DNAfGuwPCegibTni6ePhLBaCabxig
         3Zb//c0G9f+8lc715uSwAu0MPgWmGtEgRf8Y8f6vzaUSb5PoO8hjLz5HQ5ZpMHFWYdQI
         f+OlzgSsEvy7U9vXJtcWIjpOAbIhk74AR+rTWV2Kf+DPHzxeQVn9zTZOuAMNmcTGT5Gg
         8JofBrXQO56ZRCIMnx0/w595dzBpuyA01pTdZk2old/817ytg3mG0TFM0yw5djwVWhtz
         vBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709223867; x=1709828667;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M6NAE83DmjKaLDXnZPH6T8IDGWMAB63VLwoM0G61vV0=;
        b=p/eJXeI6jfm6/mIIA9SrOvHj+8TJx0jbJD6EfttGo2OYTb5rTgasmpfHlX3zYgRoWs
         EMzV/yINqDPLDjXR2Dof6wCAt3d6cFtLze/jLnaQJlBcOSBMgNZhQVPNOePANG7a6LsR
         bIgf6TzTw9JXI7ZNBygHrsw+/Tza3iB2SRUaFAk47vEr9p5rXYaDNx/6CT16e+cBEPad
         T6wScRpuchZlW0zmV2zVD283bi/zibf+Ih4N5wsp0Ns1fyPg6W9s66LzrHjAmaLH4F4O
         PNn88TpHyn2NIpZQDNF/DT69D0PMir3OL4f5NoIQ6TEN12x/EsTMZxFF35IzCewc2Dpd
         X2mw==
X-Gm-Message-State: AOJu0Yzd0fg8CT5FxZbyY9fkmufChE2Oqglb+owAGZZ+o8Qfr2AuA/lx
	7LbC6mVBoqMTMFjmXNQLzwv/sBIyIgOrHnlRY6jtp2tZ1MqiYvnxPc0tznwRjj8=
X-Google-Smtp-Source: AGHT+IEEKitBL7aEslHb1Km2MAHVufii8zrZJdCW4SNjHOMCtNS8WwBdth3Ho5wwbvdevAwGo9WmGA==
X-Received: by 2002:a19:2d11:0:b0:513:ed7:32a1 with SMTP id k17-20020a192d11000000b005130ed732a1mr1651221lfj.69.1709223866772;
        Thu, 29 Feb 2024 08:24:26 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c358700b00412b6fbb9b5sm4368635wmq.8.2024.02.29.08.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 08:24:26 -0800 (PST)
Message-ID: <05285de6-ac5b-4f3b-953a-954c38b0dd2d@freebox.fr>
Date: Thu, 29 Feb 2024 17:24:24 +0100
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
 Jeffrey Hugo <jhugo@codeaurora.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media <linux-media@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Pierre-Hugues Husson
 <phh@phh.me>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
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
 <21b833cf-61c3-4fb5-8c55-492aac0fd3b6@freebox.fr>
 <8170522f-b813-19a4-3f85-f2880809d9a5@quicinc.com>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <8170522f-b813-19a4-3f85-f2880809d9a5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/02/2024 16:32, Vikash Garodia wrote:

> On 2/27/2024 9:41 PM, Marc Gonzalez wrote:
>
>> On 27/02/2024 07:55, Vikash Garodia wrote:
>>
>>> On 2/26/2024 9:25 PM, Marc Gonzalez wrote:
>>>
>>>> Errr, there is currently no existing node for msm8998-venus?
>>>
>>> My bad, i meant your initial node msm8998-venus, without migrating to v2.
>>>
>>>> With the proposed node above (based on msm8996-venus)
>>>> AND the proposed work-around disabling low-power mode,
>>>> decoding works correctly.
>>>
>>> Nice, lets fix the work-around part before migrating to v2. Could you share the
>>> configurations for VIDEO_SUBCORE0_GDSC and VIDEO_SUBCORE1_GDSC ?
>>>
>>> If we see vendor code[1], sys power plane control is very much supported, so
>>> ideally we should get it working without the workaround
>>> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/drivers/media/platform/msm/vidc/venus_hfi.c#L2223
>>
>> OK, for easy reference, here are the proposed changes again:
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> index 2793cc22d381a..5084191be1446 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> @@ -3000,6 +3000,56 @@ mdss_dsi1_phy: phy@c996400 {
>>  			};
>>  		};
>>  
>> +		venus: video-codec@cc00000 {
>> +			compatible = "qcom,msm8998-venus";
>> +			reg = <0x0cc00000 0xff000>;
>> +			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
>> +			power-domains = <&mmcc VIDEO_TOP_GDSC>;
>> +			clocks = <&mmcc VIDEO_CORE_CLK>,
>> +				 <&mmcc VIDEO_AHB_CLK>,
>> +				 <&mmcc VIDEO_AXI_CLK>,
>> +				 <&mmcc VIDEO_MAXI_CLK>;
>> +			clock-names = "core", "iface", "bus", "mbus";
>> +			iommus = <&mmss_smmu 0x400>,
>> +				 <&mmss_smmu 0x401>,
>> +				 <&mmss_smmu 0x40a>,
>> +				 <&mmss_smmu 0x407>,
>> +				 <&mmss_smmu 0x40e>,
>> +				 <&mmss_smmu 0x40f>,
>> +				 <&mmss_smmu 0x408>,
>> +				 <&mmss_smmu 0x409>,
>> +				 <&mmss_smmu 0x40b>,
>> +				 <&mmss_smmu 0x40c>,
>> +				 <&mmss_smmu 0x40d>,
>> +				 <&mmss_smmu 0x410>,
>> +				 <&mmss_smmu 0x411>,
>> +				 <&mmss_smmu 0x421>,
>> +				 <&mmss_smmu 0x428>,
>> +				 <&mmss_smmu 0x429>,
>> +				 <&mmss_smmu 0x42b>,
>> +				 <&mmss_smmu 0x42c>,
>> +				 <&mmss_smmu 0x42d>,
>> +				 <&mmss_smmu 0x411>,
>> +				 <&mmss_smmu 0x431>;
>> +			memory-region = <&venus_mem>;
>> +			status = "disabled";
>> +			qcom,venus-broken-low-power-mode;
>> +
>> +			video-decoder {
>> +				compatible = "venus-decoder";
>> +				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
>> +				clock-names = "core";
>> +				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
>> +			};
>> +
>> +			video-encoder {
>> +				compatible = "venus-encoder";
>> +				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
>> +				clock-names = "core";
>> +				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
>> +			};
>> +		};
>> +
>>  		mmss_smmu: iommu@cd00000 {
>>  			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
>>  			reg = <0x0cd00000 0x40000>;
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index a712dd4f02a5b..ad1705e510312 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -585,6 +585,43 @@ static const struct venus_resources msm8996_res = {
>>  	.fwname = "qcom/venus-4.2/venus.mbn",
>>  };
>>  
>> +static const struct freq_tbl msm8998_freq_table[] = {
>> +	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
>> +	{  972000, 520000000 },	/* 4k UHD @ 30 */
>> +	{  489600, 346666667 },	/* 1080p @ 60 */
>> +	{  244800, 150000000 },	/* 1080p @ 30 */
>> +	{  108000,  75000000 },	/* 720p @ 30 */
>> +};
>> +
>> +static const struct reg_val msm8998_reg_preset[] = {
>> +    { 0x80124, 0x00000003 },
>> +    { 0x80550, 0x01111111 },
>> +    { 0x80560, 0x01111111 },
>> +    { 0x80568, 0x01111111 },
>> +    { 0x80570, 0x01111111 },
>> +    { 0x80580, 0x01111111 },
>> +    { 0xe2010, 0x00000000 },
>> +};
>> +
>> +static const struct venus_resources msm8998_res = {
>> +	.freq_tbl = msm8998_freq_table,
>> +	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
>> +	.reg_tbl = msm8998_reg_preset,
>> +	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
>> +	.clks = {"core", "iface", "bus", "mbus"},
>> +	.clks_num = 4,
>> +	.vcodec0_clks = { "core" },
>> +	.vcodec1_clks = { "core" },
>> +	.vcodec_clks_num = 1,
>> +	.max_load = 2563200,
>> +	.hfi_version = HFI_VERSION_3XX,
>> +	.vmem_id = VIDC_RESOURCE_NONE,
>> +	.vmem_size = 0,
>> +	.vmem_addr = 0,
>> +	.dma_mask = 0xddc00000 - 1,
>> +	.fwname = "qcom/venus-4.4/venus.mbn",
>> +};
>> +
>>  static const struct freq_tbl sdm660_freq_table[] = {
>>  	{ 979200, 518400000 },
>>  	{ 489600, 441600000 },
>> @@ -891,6 +928,7 @@ static const struct venus_resources sc7280_res = {
>>  static const struct of_device_id venus_dt_match[] = {
>>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>> +	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>>  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>>  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
>>
>>
>>
>> This patch is on top of v6.8-rc1
>> so the configurations for VIDEO_SUBCOREx_GDSC
>> are as defined in mainline.
>>
>> #define VIDEO_SUBCORE0_CLK_SRC	51
>> #define VIDEO_SUBCORE1_CLK_SRC	52
>>
>> #define VIDEO_TOP_GDSC		1
>> #define VIDEO_SUBCORE0_GDSC	2
>> #define VIDEO_SUBCORE1_GDSC	3
>>
>> https://github.com/torvalds/linux/blob/master/drivers/clk/qcom/mmcc-msm8998.c#L2536-L2561
>>
>> static struct gdsc video_top_gdsc = {
>> 	.gdscr = 0x1024,
>> 	.pd = {
>> 		.name = "video_top",
>> 	},
>> 	.pwrsts = PWRSTS_OFF_ON,
>> };
>>
>> static struct gdsc video_subcore0_gdsc = {
>> 	.gdscr = 0x1040,
>> 	.pd = {
>> 		.name = "video_subcore0",
>> 	},
>> 	.parent = &video_top_gdsc.pd,
>> 	.pwrsts = PWRSTS_OFF_ON,
>> };
>>
>> static struct gdsc video_subcore1_gdsc = {
>> 	.gdscr = 0x1044,
>> 	.pd = {
>> 		.name = "video_subcore1",
>> 	},
>> 	.parent = &video_top_gdsc.pd,
>> 	.pwrsts = PWRSTS_OFF_ON,
>> };
>>
>>
>> 	const u8			pwrsts;
>> /* Powerdomain allowable state bitfields */
>> #define PWRSTS_OFF		BIT(0)
>> /*
>>  * There is no SW control to transition a GDSC into
>>  * PWRSTS_RET. This happens in HW when the parent
>>  * domain goes down to a low power state
>>  */
>> #define PWRSTS_RET		BIT(1)
>> #define PWRSTS_ON		BIT(2)
>> #define PWRSTS_OFF_ON		(PWRSTS_OFF | PWRSTS_ON)
>> #define PWRSTS_RET_ON		(PWRSTS_RET | PWRSTS_ON)
>> 	const u16			flags;
>> #define VOTABLE		BIT(0)
>> #define CLAMP_IO	BIT(1)
>> #define HW_CTRL		BIT(2)
>> #define SW_RESET	BIT(3)
>> #define AON_RESET	BIT(4)
>> #define POLL_CFG_GDSCR	BIT(5)
>> #define ALWAYS_ON	BIT(6)
>> #define RETAIN_FF_ENABLE	BIT(7)
>> #define NO_RET_PERIPH	BIT(8)
>>
>>
>> Should .pwrsts be PWRSTS_RET_ON instead of PWRSTS_OFF_ON?
>>
>> Should .flags be HW_CTRL instead of 0?
>
> Not completely sure on these configurations, but certainly both the
> video_subcore0_gdsc and video_subcore1_gdsc should be configured in hardware
> control mode in the gdsc configuration.

Jeffrey, Bjorn,

I'm trying to get mainline support for the msm8998 video decoder (venus).
Apparently, there appears to be an issue with the multimedia clocks.

Do you remember why you chose PWRSTS_OFF_ON instead of PWRSTS_RET_ON?

And why the HW_CTRL bit is not set?

In 96893e101eb294bced8358fbd48cbac175977aa4
"clk: qcom: Put venus core0/1 gdscs to hw control mode"
Sricharan set the HW_CTRL bit in venus_core0_gdsc & venus_core1_gdsc
for msm8996. A priori, it is required for msm8998 as well.

Same deal with 196eb928525579
"clk: qcom: mmcc-sdm660: Add hw_ctrl flag to venus_core0_gdsc"

Regards



