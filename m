Return-Path: <linux-media+bounces-8930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BBE89DBC8
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 16:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11B371F2428C
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 14:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21EDA12FB16;
	Tue,  9 Apr 2024 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="uxM6x85y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B3012F59D
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 14:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712671762; cv=none; b=U/CcxCTXQNpCeYARPTMj1s4ePAt+gIotV+l23oCWPYXm7XoypBX4WBNRH7fTVThrrMLss1HD7hZ9qLOQd+hnQfINysDWf67VmV6FObC9AcrGg+GhCQ64JnQXeZmc+SJ01stT3YPSz8GMIo2bg/cvMYc5SN6Y1mS9iqfMrTYSbtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712671762; c=relaxed/simple;
	bh=wXSIz1XNSQBWcVEoaQe0KIgcoobtNfoVS+vSjhY3Dwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjQ4rNZKpGDn7V6SEaNT8uPlKZOO94BShtp78c2MTy/ASKLbnRpcP2BY+/StuqhXO0sx549BZbIB+uX5a53HdBJmpYidBIGUAh0u6t1JNR+xbFrsT+jHSFwmabUHn0X+2qeQmbOMGLAtLv9mU/5THaqsX4tyxIWB1WzKQoTv63k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=uxM6x85y; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a5199906493so561512766b.1
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 07:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1712671757; x=1713276557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gNoEcozys9YPJuzXOf6R2daB2g3fI19srJ6Eb/hPc7Y=;
        b=uxM6x85y30Gkvw5BG/U+IUSdjNqv6YW7GWUADKwBG5wXGYHZehOXoVg1QOIi8sAvzV
         m/x/xGBxoa35w3qsWy2JaTbx8ptIkBfArvkG524R2vSTI9JT93r4L2CpYKczXQSK9uVp
         Vmd+TUkUvFYUUbsT1F6p64LvZeSKN44f50qT0pJ+r5RFkJv7SfxTVCcx3OYc5PGY0xyK
         vNpKSd9lsR7n0Geq/sbiBnWAMyGG0OQo+zzIkL9rqm1KrVT0dTm5Jd5VrPOQTPWSg5y4
         MueottUz4G+zl0n8Gq8NExGcAO2zrpc9uiMbf8NCsMefhTXg1byUtVyvN7aiUNJ9tfN7
         7uCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712671757; x=1713276557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNoEcozys9YPJuzXOf6R2daB2g3fI19srJ6Eb/hPc7Y=;
        b=hLqy5A7L/MTs7c06Om3L4bS7+QxLzt2fhdfBeyzs+zPldkSAJ1qFdHEWzGtwqAVRvh
         B+TkyG5CAFZakzUYsV36OlK7x5qIHAhL2f0FctSZalmB2wjFgDzun0VXMCZ6Uccaoyau
         TsYXNPMqQIboUCjuZwDURGMAdfV3ryrfPIEGhNvUndjTvHdxxWynIm350hrDTC6mDusl
         EL9lHeEA/drjvlDsV2ASX47cWZBROjojwBwurzztBILrVrIs6sEX53s9bs/Ek39EfZwR
         UkeULlVEa5V6JK6ZRj5JblurCeq7v1faxNzpQ826MaYJal2p/GT+9I4kM2ImFaocUmA5
         XWCA==
X-Gm-Message-State: AOJu0YzujGnE54IACPgEMiSHDI2/svlNNMiULuxhZYGi4x7wFf3Q/tEQ
	1isNrwSmID3MDyMuDf1hmxjuBDBlZguC6D0CzbpiRmAQtJzN5w1MtZz4CCeDAxU=
X-Google-Smtp-Source: AGHT+IHCWiBUPw3K/FLoYZSs54At5NokuRELhZWJFBbJu9HO/oQa0VK5lXbQ0XuBrwoa0fLh6bkl+A==
X-Received: by 2002:a17:906:11da:b0:a51:a288:5af9 with SMTP id o26-20020a17090611da00b00a51a2885af9mr7469851eja.51.1712671756615;
        Tue, 09 Apr 2024 07:09:16 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id hx2-20020a170906846200b00a46dd1f7dc1sm5778147ejc.92.2024.04.09.07.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 07:09:16 -0700 (PDT)
Message-ID: <bd42242a-c7da-4ffe-abae-9d0fa52b75de@freebox.fr>
Date: Tue, 9 Apr 2024 16:09:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media <linux-media@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Pierre-Hugues Husson
 <phh@phh.me>, Marijn Suijten <marijn.suijten@somainline.org>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
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
 <c2ce34ce-d532-4039-bb9f-d4d1b2fb23b0@freebox.fr>
 <09bc9231-0e59-4cb2-a05f-02e2fcaf3d15@linaro.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <09bc9231-0e59-4cb2-a05f-02e2fcaf3d15@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2024 13:27, Bryan O'Donoghue wrote:

> On 08/04/2024 16:39, Marc Gonzalez wrote:
> 
>> On 29/02/2024 16:32, Vikash Garodia wrote:
>> 
>>> Not completely sure on these configurations, but certainly both the
>>> video_subcore0_gdsc and video_subcore1_gdsc should be configured in
>>> hardware control mode in the gdsc configuration.
>>
>> Still trying to land support for venus decoder on msm8998 in mainline.
>>
>> This is the patch I have at the moment:
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> index 4dfe2d09ac285..67b8374ddf02f 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> @@ -3010,6 +3010,55 @@ mdss_dsi1_phy: phy@c996400 {
>>   			};
>>   		};
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
>>   		mmss_smmu: iommu@cd00000 {
>>   			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
>>   			reg = <0x0cd00000 0x40000>;
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index ce206b7097541..42e0c580e093d 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -587,6 +587,47 @@ static const struct venus_resources msm8996_res = {
>>   	.fwname = "qcom/venus-4.2/venus.mbn",
>>   };
>>   
>> +static const struct freq_tbl msm8998_freq_table[] = {
>> +	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
>> +	{  972000, 520000000 },	/* 4k UHD @ 30 */
>> +	{  489600, 346666667 },	/* 1080p @ 60 */
>> +	{  244800, 150000000 },	/* 1080p @ 30 */
>> +	{  108000,  75000000 },	/* 720p @ 30 */
>> +};
>> +
>> +/*
>> + * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
>> + */
>> +static const struct reg_val msm8998_reg_preset[] = {
>> +	{ 0x80124, 0x00000003 },
>> +	{ 0x80550, 0x01111111 },
>> +	{ 0x80560, 0x01111111 },
>> +	{ 0x80568, 0x01111111 },
>> +	{ 0x80570, 0x01111111 },
>> +	{ 0x80580, 0x01111111 },
>> +	{ 0x80588, 0x01111111 },
>> +	{ 0xe2010, 0x00000000 },
>> +};
>> +
>> +static const struct venus_resources msm8998_res = {
>> +	.freq_tbl = msm8998_freq_table,
>> +	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
>> +	.reg_tbl = msm8998_reg_preset,
>> +	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
>> +	.clks = { "core", "iface", "bus", "mbus" },
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
>>   static const struct freq_tbl sdm660_freq_table[] = {
>>   	{ 979200, 518400000 },
>>   	{ 489600, 441600000 },
>> @@ -893,6 +934,7 @@ static const struct venus_resources sc7280_res = {
>>   static const struct of_device_id venus_dt_match[] = {
>>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>> +	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>>   	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>>   	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>>   	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
>> index f9437b6412b91..abdc578ce988e 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
>> @@ -945,6 +945,7 @@ static int venus_sys_set_default_properties(struct venus_hfi_device *hdev)
>>   			dev_warn(dev, "setting idle response ON failed (%d)\n", ret);
>>   	}
>>   
>> +	venus_fw_low_power_mode = false;
> 
> So instead of this workaround, @Vikash is asking for HW_CTRL similar to 
> what we have in 8996
> 
> 8996 has a top-level "magic" GDSC which 8998 doesn't appear to have.
> 
> I think the CXC stuff would still be valid.
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8998.c 
> b/drivers/clk/qcom/mmcc-msm8998.c
> index 1180e48c687ac..275fb3b71ede4 100644
> --- a/drivers/clk/qcom/mmcc-msm8998.c
> +++ b/drivers/clk/qcom/mmcc-msm8998.c
> @@ -2535,6 +2535,8 @@ static struct clk_branch vmem_ahb_clk = {
> 
>   static struct gdsc video_top_gdsc = {
>          .gdscr = 0x1024,
> +       .cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },
> +       .cxc_count = 3,
>          .pd = {
>                  .name = "video_top",
>          },
> @@ -2543,20 +2545,26 @@ static struct gdsc video_top_gdsc = {
> 
>   static struct gdsc video_subcore0_gdsc = {
>          .gdscr = 0x1040,
> +       .cxcs = (unsigned int []){ 0x1048 },
> +       .cxc_count = 1,
>          .pd = {
>                  .name = "video_subcore0",
>          },
>          .parent = &video_top_gdsc.pd,
>          .pwrsts = PWRSTS_OFF_ON,
> +       .flags = HW_CTRL,
>   };
> 
>   static struct gdsc video_subcore1_gdsc = {
>          .gdscr = 0x1044,
> +       .cxcs = (unsigned int []){ 0x104c },
> +       .cxc_count = 1,
>          .pd = {
>                  .name = "video_subcore1",
>          },
>          .parent = &video_top_gdsc.pd,
>          .pwrsts = PWRSTS_OFF_ON,
> +       .flags = HW_CTRL,
>   };
> 
> Can you give it a try ?


Looks like your patch DOES fix the issue!


References (mostly) for myself


static struct gdsc video_top_gdsc = {
	.gdscr = 0x1024,
	.cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },

static struct gdsc video_subcore0_gdsc = {
	.gdscr = 0x1040,
	.cxcs = (unsigned int []){ 0x1048 },

static struct gdsc video_subcore1_gdsc = {
	.gdscr = 0x1044,
	.cxcs = (unsigned int []){ 0x104c },


GDSCR = Globally Distributed Switch Controller Register

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8998.h

0x1024 = undocumented = MMSS_VIDEO GDSCR
0x1028 = MMSS_VIDEO_CORE_CBCR
0x1030 = MMSS_VIDEO_AHB_CBCR
0x1034 = MMSS_VIDEO_AXI_CBCR
0x1038 = MMSS_VIDEO_MAXI_CBCR
0x1040 = undocumented = MMSS_VIDEO_SUBCORE0 GDSCR
0x1044 = undocumented = MMSS_VIDEO_SUBCORE1 GDSCR
0x1048 = MMSS_VIDEO_SUBCORE0_CBCR
0x104c = MMSS_VIDEO_SUBCORE1_CBCR



On msm8996

static struct gdsc venus_gdsc = {
	.gdscr = 0x1024,
	.cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },

static struct gdsc venus_core0_gdsc = {
	.gdscr = 0x1040,
	.cxcs = (unsigned int []){ 0x1048 },

static struct gdsc venus_core1_gdsc = {
	.gdscr = 0x1044,
	.cxcs = (unsigned int []){ 0x104c },


https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/include/dt-bindings/clock/msm-clocks-hwio-8996.h

0x1028 = MMSS_VIDEO_CORE_CBCR = MMSS_VIDEO_CXO_CBCR
0x1030 = MMSS_VIDEO_AHB_CBCR
0x1034 = MMSS_VIDEO_AXI_CBCR
0x1038 = MMSS_VIDEO_MAXI_CBCR
0x1048 = MMSS_VIDEO_SUBCORE0_CBCR
0x104c = MMSS_VIDEO_SUBCORE1_CBCR


Registers of interest are mapped identically in msm8996 & msm8998.
Therefore, it makes sense for the code to be identical.


Regards


