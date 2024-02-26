Return-Path: <linux-media+bounces-5977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2719F867B0B
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 17:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0BE5B3066C
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 15:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312E2129A91;
	Mon, 26 Feb 2024 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="S14TVcck"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76658592F
	for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 15:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708962950; cv=none; b=kMy1tetOnt2UEGb/JtkHdyCmJR+BFSp11iP00IkW6DnyJvMSxhy8S5m84x9BPo/49qQ01rYQv1dRA0F+Fw+TAN6XY77b3EYQPD4luk6n4DyQ19U9L02nwswXS5igaUGA3TY/UuEaUyqZVTdjxQHnSmc9uocUPggIKIi5XIbMZgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708962950; c=relaxed/simple;
	bh=xSKJkeNJ7My/h0OK3FIsT+X1Zh0A1TaHIeeUxjudO8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iCY5X9+61C4gpZVwuoxND4rZQ+//6TRZUuRik0V8B7ihjhLpLNW2xaa8ckmilDLlBKUKXFNaNzUAWZ8wnkAmmB0UQzYEABzVGvcD4p6UeKdwtsKCNykDDsH/qPFRqc+I8Fe3usGWCucsB0eR4CMw7swy2KFhkdXwjOKHEch+XiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=S14TVcck; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d26227d508so35729571fa.2
        for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 07:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1708962945; x=1709567745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/c5Myhx1syvnzb0/V++FcuymO5PHuhI5ae7ZNjJt6A=;
        b=S14TVcckbYny4Z0fiCy+yksY8HTNkRGpJ76VYWi9lQNf5ZuMHtpvTI8Ayzz2CikQO1
         5qsL5X0CtuYyv3EmXQp5DawiUSg+ollASuor7RihiUrE9jQPwM3TAe8jX1OjkePy5VL4
         Ft6md8dJ3dR8lHYqwuAEAhSt5fFX40kbM6XNJ97ciX6wb9rcynH9Wtd1QmlX0Wrct3Y7
         5ifWOmT+H5BPPeOaP+ezMX7ME0ef7DLIReBcYEnWnKl/5o/HLkeB9hWC3UVaxDYUJyci
         P2CKusv6qhtikHjRglMLRJCn5fNSMb7vPp/rmeiIDK+lGH20IC6XpBmqHBhQk8oYSL6n
         bfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708962945; x=1709567745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/c5Myhx1syvnzb0/V++FcuymO5PHuhI5ae7ZNjJt6A=;
        b=SJ87g8BhD7vnVVtqQrYqOGjGP+T8Qx4ih0ubv3rChMQD8clrrLoQp22wvyRTO092dO
         Eqtim43sTCvEyCmjNNTRof+4M6TOu7mbsmBUM7c8h5YT6QLdBTbBujM8zUMU8sROgfnC
         1zxqdFCDIhSHCH383lcX90m90fLiSUicoxRj7nnz4hMM8y658IbCx7ubCRZxpi9gkr44
         DArqjisuirwa6YpThR6gTj1B+BOTJ0yMQU+cKNBBduSWxE9CvnwYjKsyNPWsARytX0Pi
         CezERThb/V1FeIyIGB7VD7tl2+kHutfX7YhTNMz00JTC8gwkASAmoG4QYPmw8nJVJvUT
         MmFA==
X-Forwarded-Encrypted: i=1; AJvYcCVckiMrq4rJH+zVCEX3lH91yty2i1lMV3tLu63a/Y0D443G3NSv9zIqYpqFgjayy4+hVadbkpXXnCHRDmLujU52XsUEysl5nsE9/Kc=
X-Gm-Message-State: AOJu0YzRbuVxldb3bFMzahjDZqdNrxd/nDjJRKtpDgMB0AOZ9TK0W6P9
	gw3qqSHwxvLlhsEWcw5bZ2AnpXiBiRxL5uQNvMZSzmgZkikQTaF14Wx3Njxjta4=
X-Google-Smtp-Source: AGHT+IGxRD52WeCXZXX9Q0r0Rmvm4Ap0pMKxDEs6XtU/YLU6PhPRAWKZCa9A/bMSqXqKrcCZoxPibA==
X-Received: by 2002:a2e:2c14:0:b0:2d2:2e6b:dd5 with SMTP id s20-20020a2e2c14000000b002d22e6b0dd5mr4183736ljs.39.1708962944990;
        Mon, 26 Feb 2024 07:55:44 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id m9-20020a05600c4f4900b00412a013817esm6730829wmq.7.2024.02.26.07.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 07:55:44 -0800 (PST)
Message-ID: <72741d2e-5165-4505-b079-d7b5d1491888@freebox.fr>
Date: Mon, 26 Feb 2024 16:55:43 +0100
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: DT <devicetree@vger.kernel.org>, linux-media
 <linux-media@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phh@phh.me>
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
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <3914555d-3c89-a5c5-2906-0bd24d0bf735@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/02/2024 15:30, Vikash Garodia wrote:

> On 2/26/2024 6:39 PM, Marc Gonzalez wrote:
>
>> On 23/02/2024 14:48, Vikash Garodia wrote:
>>
>>> On 2/20/2024 8:15 PM, Marc Gonzalez wrote:
>>>
>>>> On 20/02/2024 14:53, Vikash Garodia wrote:
>>>>
>>>>> msm8998 supports configuring the VCodec (venus core0) GDSC in HW power control
>>>>> mode. Could you please check and confirm if the driver is configuring only the
>>>>> VCodec GDSC and not the venus GDSC. Look for the attribute
>>>>> "qcom,support-hw-trigger" in vendor dt file.
>>>>
>>>> [ Vendor DTS for easy reference: ]
>>>> [ https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998.dtsi ]
>>>>
>>>> In the queue, we have a patch enabling the Venus Decoder (VDEC) in mainline.
>>>> (It is using the previously proposed "qcom,no-low-power" mechanism, but that
>>>> might not be necessary, if I understand correctly?)
>>>>
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>>>> index 2793cc22d381a..5084191be1446 100644
>>>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>>>> @@ -3000,6 +3000,56 @@ mdss_dsi1_phy: phy@c996400 {
>>>>  			};
>>>>  		};
>>>>  
>>>> +		venus: video-codec@cc00000 {
>>>> +			compatible = "qcom,msm8998-venus";
>>>> +			reg = <0x0cc00000 0xff000>;
>>>> +			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
>>>> +			power-domains = <&mmcc VIDEO_TOP_GDSC>;
>>>> +			clocks = <&mmcc VIDEO_CORE_CLK>,
>>>> +				 <&mmcc VIDEO_AHB_CLK>,
>>>> +				 <&mmcc VIDEO_AXI_CLK>,
>>>> +				 <&mmcc VIDEO_MAXI_CLK>;
>>>> +			clock-names = "core", "iface", "bus", "mbus";
>>>> +			iommus = <&mmss_smmu 0x400>,
>>>> +				 <&mmss_smmu 0x401>,
>>>> +				 <&mmss_smmu 0x40a>,
>>>> +				 <&mmss_smmu 0x407>,
>>>> +				 <&mmss_smmu 0x40e>,
>>>> +				 <&mmss_smmu 0x40f>,
>>>> +				 <&mmss_smmu 0x408>,
>>>> +				 <&mmss_smmu 0x409>,
>>>> +				 <&mmss_smmu 0x40b>,
>>>> +				 <&mmss_smmu 0x40c>,
>>>> +				 <&mmss_smmu 0x40d>,
>>>> +				 <&mmss_smmu 0x410>,
>>>> +				 <&mmss_smmu 0x411>,
>>>> +				 <&mmss_smmu 0x421>,
>>>> +				 <&mmss_smmu 0x428>,
>>>> +				 <&mmss_smmu 0x429>,
>>>> +				 <&mmss_smmu 0x42b>,
>>>> +				 <&mmss_smmu 0x42c>,
>>>> +				 <&mmss_smmu 0x42d>,
>>>> +				 <&mmss_smmu 0x411>,
>>>> +				 <&mmss_smmu 0x431>;
>>>> +			memory-region = <&venus_mem>;
>>>> +			status = "disabled";
>>>> +			qcom,no-low-power; /*** WORK AROUND LOW-POWER ISSUE ***/
>>>> +
>>>> +			video-decoder {
>>>> +				compatible = "venus-decoder";
>>>> +				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
>>>> +				clock-names = "core";
>>>> +				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
>>>> +			};
>>>> +
>>>> +			video-encoder {
>>>> +				compatible = "venus-encoder";
>>>> +				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
>>>> +				clock-names = "core";
>>>> +				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
>>>> +			};
>>>> +		};
>>>> +
>>>>  		mmss_smmu: iommu@cd00000 {
>>>>  			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
>>>>  			reg = <0x0cd00000 0x40000>;
>>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>>> index a712dd4f02a5b..ad1705e510312 100644
>>>> --- a/drivers/media/platform/qcom/venus/core.c
>>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>>> @@ -585,6 +585,43 @@ static const struct venus_resources msm8996_res = {
>>>>  	.fwname = "qcom/venus-4.2/venus.mbn",
>>>>  };
>>>>  
>>>> +static const struct freq_tbl msm8998_freq_table[] = {
>>>> +	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
>>>> +	{  972000, 520000000 },	/* 4k UHD @ 30 */
>>>> +	{  489600, 346666667 },	/* 1080p @ 60 */
>>>> +	{  244800, 150000000 },	/* 1080p @ 30 */
>>>> +	{  108000,  75000000 },	/* 720p @ 30 */
>>>> +};
>>>> +
>>>> +static const struct reg_val msm8998_reg_preset[] = {
>>>> +    { 0x80124, 0x00000003 },
>>>> +    { 0x80550, 0x01111111 },
>>>> +    { 0x80560, 0x01111111 },
>>>> +    { 0x80568, 0x01111111 },
>>>> +    { 0x80570, 0x01111111 },
>>>> +    { 0x80580, 0x01111111 },
>>>> +    { 0xe2010, 0x00000000 },
>>>> +};
>>>> +
>>>> +static const struct venus_resources msm8998_res = {
>>>> +	.freq_tbl = msm8998_freq_table,
>>>> +	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
>>>> +	.reg_tbl = msm8998_reg_preset,
>>>> +	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
>>>> +	.clks = {"core", "iface", "bus", "mbus"},
>>>> +	.clks_num = 4,
>>>> +	.vcodec0_clks = { "core" },
>>>> +	.vcodec1_clks = { "core" },
>>>> +	.vcodec_clks_num = 1,
>>>> +	.max_load = 2563200,
>>>> +	.hfi_version = HFI_VERSION_3XX,
>>>> +	.vmem_id = VIDC_RESOURCE_NONE,
>>>> +	.vmem_size = 0,
>>>> +	.vmem_addr = 0,
>>>> +	.dma_mask = 0xddc00000 - 1,
>>>> +	.fwname = "qcom/venus-4.4/venus.mbn",
>>>> +};
>>>> +
>>>>  static const struct freq_tbl sdm660_freq_table[] = {
>>>>  	{ 979200, 518400000 },
>>>>  	{ 489600, 441600000 },
>>>> @@ -891,6 +928,7 @@ static const struct venus_resources sc7280_res = {
>>>>  static const struct of_device_id venus_dt_match[] = {
>>>>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>>>>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>>>> +	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>>>>  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>>>>  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>>>>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
>>>>
>>>>
>>>>
>>>> @Vikash, are you saying that perhaps the DTS for video-codec@cc00000
>>>> needs to be written slightly differently?
>>>
>>>
>>> Certainly yes. For ex, in the clock list, i do not see the core clocks listed
>>> i.e clk_mmss_video_subcore0_clk and clk_mmss_video_subcore1_clk. You can refer
>>> the downstream video DT node [1] and then align it as per venus driver
>>> [1]
>>> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
>>
>> If I understand correctly (which is far from certain),
>> we should base the "qcom,msm8998-venus" DT node on
>> "qcom,sdm845-venus-v2" rather than "qcom,msm8996-venus" ?
>
> That's correct, but that's just another way to do the configuration. With the
> existing node, is video decode as well as encode working ?

Errr, there is currently no existing node for msm8998-venus?

With the proposed node above (based on msm8996-venus)
AND the proposed work-around disabling low-power mode,
decoding works correctly.

Encoding does not work, but it has never been used/tested on our device.

[h264_v4l2m2m @ 0xaaaaec9c44a0] Using device /dev/video1
[h264_v4l2m2m @ 0xaaaaec9c44a0] driver 'qcom-venus' on card 'Qualcomm Venus video encoder' in mplane mode
[h264_v4l2m2m @ 0xaaaaec9c44a0] requesting formats: output=NV12/yuv420p capture=H264/none
[h264_v4l2m2m @ 0xaaaaec9c44a0] output VIDIOC_REQBUFS failed: Invalid argument
[h264_v4l2m2m @ 0xaaaaec9c44a0] no v4l2 output context's buffers
[h264_v4l2m2m @ 0xaaaaec9c44a0] can't configure encoder
[vost#0:0/h264_v4l2m2m @ 0xaaaaec9c4160] Error while opening encoder - maybe incorrect parameters such as bit_rate, rate, width or height.

Regards


