Return-Path: <linux-media+bounces-6914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA9D879BB7
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 19:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73C671C232EF
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 18:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADFC1420B6;
	Tue, 12 Mar 2024 18:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K1VvGfZ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258E21419AA
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268763; cv=none; b=iYdS6kr/KvUXEoQpvvpsqy7lPedC5mf2w6Tk96dynHChHL8hj3rn0wPkbSp4Qqz3LZLYkCqnkebzY5qUx0gueL75LjqbTd/x+9uakTIb2DxaeUVUQxaWySEbpTKmlikpJd5D+H9LD+THn81ZipHPsSXdVWtZeSQ+bI8/7kUBJz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268763; c=relaxed/simple;
	bh=zGotLcPmIwuNzqG/4eCjmCYluzzzOQq5Pl6wKJCOSlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8A22xsXK5F5cN0lv/dAcfuvn4Z4du1bp/apylEeP496UZYuOfxW0++YDri42KtwUROnBB8ov8p2zun8i+zgPc0WCmTGgUCX1V60GoEgNLkEBixGGFVQ3sUrdqc66EvPCWxZumSsEiefl4h65GAp8RIrk8jmjKyJppl3O1QvOQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K1VvGfZ2; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d2fad80eacso54848501fa.2
        for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 11:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710268759; x=1710873559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZIDPVywQK4s+3iR/pEh+klmiFrap15ypdsgT9qps6A=;
        b=K1VvGfZ2FZCqVPHT5+tQ7PY6RQijBXZnInU/6N3ojdsx1f72kdtKEohKrj9SUmPeGC
         82moE09plBvyQvsTeyI7CKkieGHEZtdy/+CXAxk3ZdQ+u8gMcTOd9W1amjJBDayIZYlg
         5VUPzpDh/7M2zX0U1xpLJOGEw2Gw2H+B9UXt9x2VKv3/XcHD2a27P0v0ARdUmwpAiiGr
         2klmIYYKSGSj5Pg9wuqa8geZyBUbFnwVb5FnPw2QZxCyIQzyMorgFWRYcPFbzbYBlFJz
         gu3qoRU3dXq1OKsiDnn43Ru0NHWfDS1VvrK7WdTPM8AN1a73LDI5GN0s3wklH2wNJ6ah
         vAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710268759; x=1710873559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZIDPVywQK4s+3iR/pEh+klmiFrap15ypdsgT9qps6A=;
        b=bya3iFkMrpF8EG7ilD1HnuYPIe6wSdtxe3oUzjyEaPU2U1QR0Euug5TGyi0YELozA3
         2tnw+IjCVV/HkcCoPcyZRnF12Q8wFGXoWEBbvyHp3PdF3s2L9AcH0rq1nhdsGQCMZYKz
         8JESNgWyPDx2uha3hMBbnFIscUEw1bJLXp6lMHEUxHW0zLSVtq3zgtIlWYSlXv+lZyJs
         miLgzxOEVUP6vZqZpS1IheXd+7XPpf9HJGzxghppC/R69Dc3vBcOEd/dXd7blF5W2JJS
         NA4d6z3/+Aur6hP0ZL85AevBX7ug/Mi7bPeVTVEgdJPZURBn/RvVSSj19rbgYugfHxDr
         BOGQ==
X-Gm-Message-State: AOJu0YwWGk7YjUUi6O8eHuNzHLqQZDqbcrcTlCzsxgDRP8QAeiVYet96
	uW9xXbnHBIzSLRa/Omd9oagb31H31tCAZgAfaPAyz2JrZCMRLZ7sPaKM1hKLni/G+pxGQ/qvtTV
	nS1Y=
X-Google-Smtp-Source: AGHT+IE5iZ+xJ7DaKxzDCguYb7BHho5ugxZHKCD2W9fYDPBSXVLkcqqBPACKI0WOLLwl+KvlqFeRwg==
X-Received: by 2002:a2e:b711:0:b0:2d3:a096:cb83 with SMTP id j17-20020a2eb711000000b002d3a096cb83mr6274006ljo.51.1710268759261;
        Tue, 12 Mar 2024 11:39:19 -0700 (PDT)
Received: from [172.30.204.193] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id s38-20020a2ea726000000b002d435cdf2adsm1343047lje.111.2024.03.12.11.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 11:39:18 -0700 (PDT)
Message-ID: <bab5bea3-d99e-4389-b27d-1216446b93da@linaro.org>
Date: Tue, 12 Mar 2024 19:39:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Jeffrey Hugo <jhugo@codeaurora.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media <linux-media@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Pierre-Hugues Husson
 <phh@phh.me>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 <05285de6-ac5b-4f3b-953a-954c38b0dd2d@freebox.fr>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <05285de6-ac5b-4f3b-953a-954c38b0dd2d@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/29/24 17:24, Marc Gonzalez wrote:
> On 29/02/2024 16:32, Vikash Garodia wrote:
> 
>> On 2/27/2024 9:41 PM, Marc Gonzalez wrote:
>>
>>> On 27/02/2024 07:55, Vikash Garodia wrote:
>>>
>>>> On 2/26/2024 9:25 PM, Marc Gonzalez wrote:
>>>>
>>>>> Errr, there is currently no existing node for msm8998-venus?
>>>>
>>>> My bad, i meant your initial node msm8998-venus, without migrating to v2.
>>>>
>>>>> With the proposed node above (based on msm8996-venus)
>>>>> AND the proposed work-around disabling low-power mode,
>>>>> decoding works correctly.
>>>>
>>>> Nice, lets fix the work-around part before migrating to v2. Could you share the
>>>> configurations for VIDEO_SUBCORE0_GDSC and VIDEO_SUBCORE1_GDSC ?
>>>>
>>>> If we see vendor code[1], sys power plane control is very much supported, so
>>>> ideally we should get it working without the workaround
>>>> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/drivers/media/platform/msm/vidc/venus_hfi.c#L2223
>>>
>>> OK, for easy reference, here are the proposed changes again:
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>>> index 2793cc22d381a..5084191be1446 100644
>>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>>> @@ -3000,6 +3000,56 @@ mdss_dsi1_phy: phy@c996400 {
>>>   			};
>>>   		};
>>>   
>>> +		venus: video-codec@cc00000 {
>>> +			compatible = "qcom,msm8998-venus";
>>> +			reg = <0x0cc00000 0xff000>;
>>> +			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
>>> +			power-domains = <&mmcc VIDEO_TOP_GDSC>;
>>> +			clocks = <&mmcc VIDEO_CORE_CLK>,
>>> +				 <&mmcc VIDEO_AHB_CLK>,
>>> +				 <&mmcc VIDEO_AXI_CLK>,
>>> +				 <&mmcc VIDEO_MAXI_CLK>;
>>> +			clock-names = "core", "iface", "bus", "mbus";
>>> +			iommus = <&mmss_smmu 0x400>,
>>> +				 <&mmss_smmu 0x401>,
>>> +				 <&mmss_smmu 0x40a>,
>>> +				 <&mmss_smmu 0x407>,
>>> +				 <&mmss_smmu 0x40e>,
>>> +				 <&mmss_smmu 0x40f>,
>>> +				 <&mmss_smmu 0x408>,
>>> +				 <&mmss_smmu 0x409>,
>>> +				 <&mmss_smmu 0x40b>,
>>> +				 <&mmss_smmu 0x40c>,
>>> +				 <&mmss_smmu 0x40d>,
>>> +				 <&mmss_smmu 0x410>,
>>> +				 <&mmss_smmu 0x411>,
>>> +				 <&mmss_smmu 0x421>,
>>> +				 <&mmss_smmu 0x428>,
>>> +				 <&mmss_smmu 0x429>,
>>> +				 <&mmss_smmu 0x42b>,
>>> +				 <&mmss_smmu 0x42c>,
>>> +				 <&mmss_smmu 0x42d>,
>>> +				 <&mmss_smmu 0x411>,
>>> +				 <&mmss_smmu 0x431>;
>>> +			memory-region = <&venus_mem>;
>>> +			status = "disabled";
>>> +			qcom,venus-broken-low-power-mode;
>>> +
>>> +			video-decoder {
>>> +				compatible = "venus-decoder";
>>> +				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
>>> +				clock-names = "core";
>>> +				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
>>> +			};
>>> +
>>> +			video-encoder {
>>> +				compatible = "venus-encoder";
>>> +				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
>>> +				clock-names = "core";
>>> +				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
>>> +			};
>>> +		};
>>> +
>>>   		mmss_smmu: iommu@cd00000 {
>>>   			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
>>>   			reg = <0x0cd00000 0x40000>;
>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>> index a712dd4f02a5b..ad1705e510312 100644
>>> --- a/drivers/media/platform/qcom/venus/core.c
>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>> @@ -585,6 +585,43 @@ static const struct venus_resources msm8996_res = {
>>>   	.fwname = "qcom/venus-4.2/venus.mbn",
>>>   };
>>>   
>>> +static const struct freq_tbl msm8998_freq_table[] = {
>>> +	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
>>> +	{  972000, 520000000 },	/* 4k UHD @ 30 */
>>> +	{  489600, 346666667 },	/* 1080p @ 60 */
>>> +	{  244800, 150000000 },	/* 1080p @ 30 */
>>> +	{  108000,  75000000 },	/* 720p @ 30 */
>>> +};
>>> +
>>> +static const struct reg_val msm8998_reg_preset[] = {
>>> +    { 0x80124, 0x00000003 },
>>> +    { 0x80550, 0x01111111 },
>>> +    { 0x80560, 0x01111111 },
>>> +    { 0x80568, 0x01111111 },
>>> +    { 0x80570, 0x01111111 },
>>> +    { 0x80580, 0x01111111 },
>>> +    { 0xe2010, 0x00000000 },
>>> +};
>>> +
>>> +static const struct venus_resources msm8998_res = {
>>> +	.freq_tbl = msm8998_freq_table,
>>> +	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
>>> +	.reg_tbl = msm8998_reg_preset,
>>> +	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
>>> +	.clks = {"core", "iface", "bus", "mbus"},
>>> +	.clks_num = 4,
>>> +	.vcodec0_clks = { "core" },
>>> +	.vcodec1_clks = { "core" },
>>> +	.vcodec_clks_num = 1,
>>> +	.max_load = 2563200,
>>> +	.hfi_version = HFI_VERSION_3XX,
>>> +	.vmem_id = VIDC_RESOURCE_NONE,
>>> +	.vmem_size = 0,
>>> +	.vmem_addr = 0,
>>> +	.dma_mask = 0xddc00000 - 1,
>>> +	.fwname = "qcom/venus-4.4/venus.mbn",
>>> +};
>>> +
>>>   static const struct freq_tbl sdm660_freq_table[] = {
>>>   	{ 979200, 518400000 },
>>>   	{ 489600, 441600000 },
>>> @@ -891,6 +928,7 @@ static const struct venus_resources sc7280_res = {
>>>   static const struct of_device_id venus_dt_match[] = {
>>>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>>>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>>> +	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>>>   	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>>>   	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>>>   	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
>>>
>>>
>>>
>>> This patch is on top of v6.8-rc1
>>> so the configurations for VIDEO_SUBCOREx_GDSC
>>> are as defined in mainline.
>>>
>>> #define VIDEO_SUBCORE0_CLK_SRC	51
>>> #define VIDEO_SUBCORE1_CLK_SRC	52
>>>
>>> #define VIDEO_TOP_GDSC		1
>>> #define VIDEO_SUBCORE0_GDSC	2
>>> #define VIDEO_SUBCORE1_GDSC	3
>>>
>>> https://github.com/torvalds/linux/blob/master/drivers/clk/qcom/mmcc-msm8998.c#L2536-L2561
>>>
>>> static struct gdsc video_top_gdsc = {
>>> 	.gdscr = 0x1024,
>>> 	.pd = {
>>> 		.name = "video_top",
>>> 	},
>>> 	.pwrsts = PWRSTS_OFF_ON,
>>> };
>>>
>>> static struct gdsc video_subcore0_gdsc = {
>>> 	.gdscr = 0x1040,
>>> 	.pd = {
>>> 		.name = "video_subcore0",
>>> 	},
>>> 	.parent = &video_top_gdsc.pd,
>>> 	.pwrsts = PWRSTS_OFF_ON,
>>> };
>>>
>>> static struct gdsc video_subcore1_gdsc = {
>>> 	.gdscr = 0x1044,
>>> 	.pd = {
>>> 		.name = "video_subcore1",
>>> 	},
>>> 	.parent = &video_top_gdsc.pd,
>>> 	.pwrsts = PWRSTS_OFF_ON,
>>> };
>>>
>>>
>>> 	const u8			pwrsts;
>>> /* Powerdomain allowable state bitfields */
>>> #define PWRSTS_OFF		BIT(0)
>>> /*
>>>   * There is no SW control to transition a GDSC into
>>>   * PWRSTS_RET. This happens in HW when the parent
>>>   * domain goes down to a low power state
>>>   */
>>> #define PWRSTS_RET		BIT(1)
>>> #define PWRSTS_ON		BIT(2)
>>> #define PWRSTS_OFF_ON		(PWRSTS_OFF | PWRSTS_ON)
>>> #define PWRSTS_RET_ON		(PWRSTS_RET | PWRSTS_ON)
>>> 	const u16			flags;
>>> #define VOTABLE		BIT(0)
>>> #define CLAMP_IO	BIT(1)
>>> #define HW_CTRL		BIT(2)
>>> #define SW_RESET	BIT(3)
>>> #define AON_RESET	BIT(4)
>>> #define POLL_CFG_GDSCR	BIT(5)
>>> #define ALWAYS_ON	BIT(6)
>>> #define RETAIN_FF_ENABLE	BIT(7)
>>> #define NO_RET_PERIPH	BIT(8)
>>>
>>>
>>> Should .pwrsts be PWRSTS_RET_ON instead of PWRSTS_OFF_ON?
>>>
>>> Should .flags be HW_CTRL instead of 0?
>>
>> Not completely sure on these configurations, but certainly both the
>> video_subcore0_gdsc and video_subcore1_gdsc should be configured in hardware
>> control mode in the gdsc configuration.
> 
> Jeffrey, Bjorn,
> 
> I'm trying to get mainline support for the msm8998 video decoder (venus).
> Apparently, there appears to be an issue with the multimedia clocks.
> 
> Do you remember why you chose PWRSTS_OFF_ON instead of PWRSTS_RET_ON?

Doing a quick reconnaissance against msm-4.4, PWRSTS_OFF_ON looks
very sane.

Moreover, PWRSTS_RET_ON very much only looks useful as a hack for
non-fully-implemented drivers (and that would indeed match the state
of our usb and pcie driver today) - it prevents GDSC shutdown, but
tells the PM framework that the registered power domain has collapsed

> 
> And why the HW_CTRL bit is not set?

HW_CTRL means "totally hand over the control of this GDSC to the
hardware" where "hardware" is very loosely defined..

Reading msm-4.4 again, it seems like we want HW_CTRL mode to be
enabled if and only if the low power property has been set through
the venus firmware interface.

More particularly, we don't want it to be there once we wanna shut
down Venus for good. This is being worked on by folks over at [1].

https://lore.kernel.org/linux-arm-msm/20240122-gdsc-hwctrl-v4-0-9061e8a7aa07@linaro.org/

Konrad

