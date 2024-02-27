Return-Path: <linux-media+bounces-6007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E7868969
	for <lists+linux-media@lfdr.de>; Tue, 27 Feb 2024 07:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC985B248D8
	for <lists+linux-media@lfdr.de>; Tue, 27 Feb 2024 06:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E49053813;
	Tue, 27 Feb 2024 06:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ENlMy7HO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFC437145;
	Tue, 27 Feb 2024 06:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709016977; cv=none; b=pMvWz4205SorvM8fH4ki2sCfiH5FlmE0WpC49onu1Fy4NtwtweePUJ5onDsEEbEEzhT3AUr9N3W9TOlQ3NmFbORaAm8ffnX4EMaSydrfRy9JDYsf7byxTAA7AQ0ldRs23IGjcCzU4vHoXlpyH9QV01qI0hJSRs+TJuWSoUnzvwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709016977; c=relaxed/simple;
	bh=kXRry81OuP/24J/2oXsixH8Q2p68JadOlSqN0b5HoRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WeMD2tI+marKS8MLK3uViqX6V0r6RFoOMb9m4sWcgPqqzCmtkK4KNMqF6aug5Z0lItIsXTyWNBkznEg8gsHqxM7TNkesU9LUB906WTIhlzeqthjd2IcDqu8dJ34nJE8uHLUAB0PvIZl2xWwrr8PKTCst4lOWRyCbcDKtd2E81LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ENlMy7HO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R3pmsk008355;
	Tue, 27 Feb 2024 06:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=zDBAYvp2VVYrwXjacy3bARGgknNQivKqgO2dFAVohpI=; b=EN
	lMy7HO3vYax+y9mJyeT3FmVkTLZJThcr0SmZjRQrp2Oj6WVs/2Hw2nr2bIK4Pt46
	I+ce/5s37n9Yo03m3WJgkajcuBw9Gm3wd+OnR/km83+mZEX8qoxZ7dXPZ5BdKhL2
	UtgvLR/mvK4ri/aOD4Iu5fvUuefwasFUpqZV7rlr8mWsKcYPDSSUIsNd1gJ+gn/O
	yzx4wP/Ew0+rEJK7T9kBJTHwC5dnE7N/tcm8ArDrxXfyrP229ZhXE+SEPemjOJis
	v2A0pg++PLZplgKG8tEby3qNu57N6ftLg3+lpow3DfJJ+PD33dBgSLkU8PhcsIos
	1s+9uIcZdBhCAsrja0RA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wh5078pgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 06:56:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41R6u6o5014603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 06:56:06 GMT
Received: from [10.216.23.235] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 22:56:01 -0800
Message-ID: <edb29faa-01b3-3b96-7c05-3378eb3af073@quicinc.com>
Date: Tue, 27 Feb 2024 12:25:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: DT <devicetree@vger.kernel.org>,
        linux-media
	<linux-media@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Stanimir
 Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Pierre-Hugues Husson <phh@phh.me>
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
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <72741d2e-5165-4505-b079-d7b5d1491888@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -LTwjiIvjPAyJNVbb-zajEsjOAbjM4tp
X-Proofpoint-GUID: -LTwjiIvjPAyJNVbb-zajEsjOAbjM4tp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270053


On 2/26/2024 9:25 PM, Marc Gonzalez wrote:
> On 26/02/2024 15:30, Vikash Garodia wrote:
> 
>> On 2/26/2024 6:39 PM, Marc Gonzalez wrote:
>>
>>> On 23/02/2024 14:48, Vikash Garodia wrote:
>>>
>>>> On 2/20/2024 8:15 PM, Marc Gonzalez wrote:
>>>>
>>>>> On 20/02/2024 14:53, Vikash Garodia wrote:
>>>>>
>>>>>> msm8998 supports configuring the VCodec (venus core0) GDSC in HW power control
>>>>>> mode. Could you please check and confirm if the driver is configuring only the
>>>>>> VCodec GDSC and not the venus GDSC. Look for the attribute
>>>>>> "qcom,support-hw-trigger" in vendor dt file.
>>>>>
>>>>> [ Vendor DTS for easy reference: ]
>>>>> [ https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998.dtsi ]
>>>>>
>>>>> In the queue, we have a patch enabling the Venus Decoder (VDEC) in mainline.
>>>>> (It is using the previously proposed "qcom,no-low-power" mechanism, but that
>>>>> might not be necessary, if I understand correctly?)
>>>>>
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>>>>> index 2793cc22d381a..5084191be1446 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>>>>> @@ -3000,6 +3000,56 @@ mdss_dsi1_phy: phy@c996400 {
>>>>>  			};
>>>>>  		};
>>>>>  
>>>>> +		venus: video-codec@cc00000 {
>>>>> +			compatible = "qcom,msm8998-venus";
>>>>> +			reg = <0x0cc00000 0xff000>;
>>>>> +			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +			power-domains = <&mmcc VIDEO_TOP_GDSC>;
>>>>> +			clocks = <&mmcc VIDEO_CORE_CLK>,
>>>>> +				 <&mmcc VIDEO_AHB_CLK>,
>>>>> +				 <&mmcc VIDEO_AXI_CLK>,
>>>>> +				 <&mmcc VIDEO_MAXI_CLK>;
>>>>> +			clock-names = "core", "iface", "bus", "mbus";
>>>>> +			iommus = <&mmss_smmu 0x400>,
>>>>> +				 <&mmss_smmu 0x401>,
>>>>> +				 <&mmss_smmu 0x40a>,
>>>>> +				 <&mmss_smmu 0x407>,
>>>>> +				 <&mmss_smmu 0x40e>,
>>>>> +				 <&mmss_smmu 0x40f>,
>>>>> +				 <&mmss_smmu 0x408>,
>>>>> +				 <&mmss_smmu 0x409>,
>>>>> +				 <&mmss_smmu 0x40b>,
>>>>> +				 <&mmss_smmu 0x40c>,
>>>>> +				 <&mmss_smmu 0x40d>,
>>>>> +				 <&mmss_smmu 0x410>,
>>>>> +				 <&mmss_smmu 0x411>,
>>>>> +				 <&mmss_smmu 0x421>,
>>>>> +				 <&mmss_smmu 0x428>,
>>>>> +				 <&mmss_smmu 0x429>,
>>>>> +				 <&mmss_smmu 0x42b>,
>>>>> +				 <&mmss_smmu 0x42c>,
>>>>> +				 <&mmss_smmu 0x42d>,
>>>>> +				 <&mmss_smmu 0x411>,
>>>>> +				 <&mmss_smmu 0x431>;
>>>>> +			memory-region = <&venus_mem>;
>>>>> +			status = "disabled";
>>>>> +			qcom,no-low-power; /*** WORK AROUND LOW-POWER ISSUE ***/
>>>>> +
>>>>> +			video-decoder {
>>>>> +				compatible = "venus-decoder";
>>>>> +				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
>>>>> +				clock-names = "core";
>>>>> +				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
>>>>> +			};
>>>>> +
>>>>> +			video-encoder {
>>>>> +				compatible = "venus-encoder";
>>>>> +				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
>>>>> +				clock-names = "core";
>>>>> +				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
>>>>> +			};
>>>>> +		};
>>>>> +
>>>>>  		mmss_smmu: iommu@cd00000 {
>>>>>  			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
>>>>>  			reg = <0x0cd00000 0x40000>;
>>>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>>>> index a712dd4f02a5b..ad1705e510312 100644
>>>>> --- a/drivers/media/platform/qcom/venus/core.c
>>>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>>>> @@ -585,6 +585,43 @@ static const struct venus_resources msm8996_res = {
>>>>>  	.fwname = "qcom/venus-4.2/venus.mbn",
>>>>>  };
>>>>>  
>>>>> +static const struct freq_tbl msm8998_freq_table[] = {
>>>>> +	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
>>>>> +	{  972000, 520000000 },	/* 4k UHD @ 30 */
>>>>> +	{  489600, 346666667 },	/* 1080p @ 60 */
>>>>> +	{  244800, 150000000 },	/* 1080p @ 30 */
>>>>> +	{  108000,  75000000 },	/* 720p @ 30 */
>>>>> +};
>>>>> +
>>>>> +static const struct reg_val msm8998_reg_preset[] = {
>>>>> +    { 0x80124, 0x00000003 },
>>>>> +    { 0x80550, 0x01111111 },
>>>>> +    { 0x80560, 0x01111111 },
>>>>> +    { 0x80568, 0x01111111 },
>>>>> +    { 0x80570, 0x01111111 },
>>>>> +    { 0x80580, 0x01111111 },
>>>>> +    { 0xe2010, 0x00000000 },
>>>>> +};
>>>>> +
>>>>> +static const struct venus_resources msm8998_res = {
>>>>> +	.freq_tbl = msm8998_freq_table,
>>>>> +	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
>>>>> +	.reg_tbl = msm8998_reg_preset,
>>>>> +	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
>>>>> +	.clks = {"core", "iface", "bus", "mbus"},
>>>>> +	.clks_num = 4,
>>>>> +	.vcodec0_clks = { "core" },
>>>>> +	.vcodec1_clks = { "core" },
>>>>> +	.vcodec_clks_num = 1,
>>>>> +	.max_load = 2563200,
>>>>> +	.hfi_version = HFI_VERSION_3XX,
>>>>> +	.vmem_id = VIDC_RESOURCE_NONE,
>>>>> +	.vmem_size = 0,
>>>>> +	.vmem_addr = 0,
>>>>> +	.dma_mask = 0xddc00000 - 1,
>>>>> +	.fwname = "qcom/venus-4.4/venus.mbn",
>>>>> +};
>>>>> +
>>>>>  static const struct freq_tbl sdm660_freq_table[] = {
>>>>>  	{ 979200, 518400000 },
>>>>>  	{ 489600, 441600000 },
>>>>> @@ -891,6 +928,7 @@ static const struct venus_resources sc7280_res = {
>>>>>  static const struct of_device_id venus_dt_match[] = {
>>>>>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>>>>>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>>>>> +	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>>>>>  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>>>>>  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>>>>>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
>>>>>
>>>>>
>>>>>
>>>>> @Vikash, are you saying that perhaps the DTS for video-codec@cc00000
>>>>> needs to be written slightly differently?
>>>>
>>>>
>>>> Certainly yes. For ex, in the clock list, i do not see the core clocks listed
>>>> i.e clk_mmss_video_subcore0_clk and clk_mmss_video_subcore1_clk. You can refer
>>>> the downstream video DT node [1] and then align it as per venus driver
>>>> [1]
>>>> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
>>>
>>> If I understand correctly (which is far from certain),
>>> we should base the "qcom,msm8998-venus" DT node on
>>> "qcom,sdm845-venus-v2" rather than "qcom,msm8996-venus" ?
>>
>> That's correct, but that's just another way to do the configuration. With the
>> existing node, is video decode as well as encode working ?
> 
> Errr, there is currently no existing node for msm8998-venus?
My bad, i meant your initial node msm8998-venus, without migrating to v2.
> 
> With the proposed node above (based on msm8996-venus)
> AND the proposed work-around disabling low-power mode,
> decoding works correctly.
Nice, lets fix the work-around part before migrating to v2. Could you share the
configurations for VIDEO_SUBCORE0_GDSC and VIDEO_SUBCORE1_GDSC ?

If we see vendor code[1], sys power plane control is very much supported, so
ideally we should get it working without the workaround
[1]
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/drivers/media/platform/msm/vidc/venus_hfi.c#L2223

> Encoding does not work, but it has never been used/tested on our device.
> 
> [h264_v4l2m2m @ 0xaaaaec9c44a0] Using device /dev/video1
> [h264_v4l2m2m @ 0xaaaaec9c44a0] driver 'qcom-venus' on card 'Qualcomm Venus video encoder' in mplane mode
> [h264_v4l2m2m @ 0xaaaaec9c44a0] requesting formats: output=NV12/yuv420p capture=H264/none
> [h264_v4l2m2m @ 0xaaaaec9c44a0] output VIDIOC_REQBUFS failed: Invalid argument
> [h264_v4l2m2m @ 0xaaaaec9c44a0] no v4l2 output context's buffers
> [h264_v4l2m2m @ 0xaaaaec9c44a0] can't configure encoder
> [vost#0:0/h264_v4l2m2m @ 0xaaaaec9c4160] Error while opening encoder - maybe incorrect parameters such as bit_rate, rate, width or height.

We can revisit the encoder failure once we have decode fixed without any workaround.

Regards,
Vikash

