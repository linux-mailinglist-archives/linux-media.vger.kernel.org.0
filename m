Return-Path: <linux-media+bounces-6154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6EB86CD12
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 16:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 491441F24FB3
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 15:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7118914601B;
	Thu, 29 Feb 2024 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WfObCw/A"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B5A1420CA;
	Thu, 29 Feb 2024 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709220787; cv=none; b=Ko/evPD03kVRp55KSZ6k7FstcZi0ta0hb9rYoIgtsbCCzezvY6Lb49vBCMrBlUXfwPYML3AlfOxJwkd8BFjCwJaKTlkJuoNoiFHzjAQywkGKRRmf21ycugQzwiW/8xrkgyhzdGbXiaDXpv1z30goOeUEiDknXVMbogDb416yru4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709220787; c=relaxed/simple;
	bh=C+NNxx/n94KJdNn3ZT9Zfbh8mjuyWtLvCXfnLNSy5ek=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kjPzkEUik3qi5Q0r220Icbj2PFnYcAYCFDbgn8RBPd0qu4B8r0ofm8MjGoOTy0i9ObAhlkk909uoLDXhERfA+cb5/zJY5aQ3RZo/1NSwISA821NPfBsTpJLiGtt0Oe1t5Lpb91+cvxniuQLNeH3WsD9asA1IkMikLyxXWc0e650=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WfObCw/A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41T5L4K8009844;
	Thu, 29 Feb 2024 15:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=65QVtY0zPGDIELTzSdKR/PiN7EX1UKkmMv2YLIlUvBc=; b=Wf
	ObCw/Al6fq76glL+4fybh6CQuO09TQyMi1ipFeh6liMFk777sb9Qx7SbYJuD+3YM
	DZ3GnK0PhFByI7Omdv3RR0eGNBgZTJ6LmouyYo8DrpI0qHg0hJAgggIPhQbwiEnn
	h6Mq7+L2rDBZKF/85bI3i96/Rcq1kqS/IvZqhaYQZ3Zqi5Lh4JikV7jTt6jI05ve
	fzQXV2O2ZA2uAVYUPE5K1PY/UlTE2qPZ+dOGBkLuCKe/o9XnoXEkuYrZM0QFmygU
	6YafUnprCnWplg1nPVDSPqtHi00vVayILZ5qfHb5khlmmQ6a0rxXV0NGjzbsrPKP
	U/4nUdHa+nvNiRnAnxeA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wjey3a4an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 15:32:52 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41TFWp6Z030940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 15:32:51 GMT
Received: from [10.216.47.47] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 29 Feb
 2024 07:32:48 -0800
Message-ID: <8170522f-b813-19a4-3f85-f2880809d9a5@quicinc.com>
Date: Thu, 29 Feb 2024 21:02:45 +0530
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
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: linux-media <linux-media@vger.kernel.org>,
        MSM
	<linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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
 <72741d2e-5165-4505-b079-d7b5d1491888@freebox.fr>
 <edb29faa-01b3-3b96-7c05-3378eb3af073@quicinc.com>
 <21b833cf-61c3-4fb5-8c55-492aac0fd3b6@freebox.fr>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <21b833cf-61c3-4fb5-8c55-492aac0fd3b6@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: asEKVavRAuWW7lNuSBNt5cW7lxyQSwq9
X-Proofpoint-GUID: asEKVavRAuWW7lNuSBNt5cW7lxyQSwq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_02,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402290119


On 2/27/2024 9:41 PM, Marc Gonzalez wrote:
> On 27/02/2024 07:55, Vikash Garodia wrote:
> 
>> On 2/26/2024 9:25 PM, Marc Gonzalez wrote:
>>
>>> Errr, there is currently no existing node for msm8998-venus?
>>
>> My bad, i meant your initial node msm8998-venus, without migrating to v2.
>>
>>> With the proposed node above (based on msm8996-venus)
>>> AND the proposed work-around disabling low-power mode,
>>> decoding works correctly.
>>
>> Nice, lets fix the work-around part before migrating to v2. Could you share the
>> configurations for VIDEO_SUBCORE0_GDSC and VIDEO_SUBCORE1_GDSC ?
>>
>> If we see vendor code[1], sys power plane control is very much supported, so
>> ideally we should get it working without the workaround
>> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/drivers/media/platform/msm/vidc/venus_hfi.c#L2223
> 
> OK, for easy reference, here are the proposed changes again:
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 2793cc22d381a..5084191be1446 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -3000,6 +3000,56 @@ mdss_dsi1_phy: phy@c996400 {
>  			};
>  		};
>  
> +		venus: video-codec@cc00000 {
> +			compatible = "qcom,msm8998-venus";
> +			reg = <0x0cc00000 0xff000>;
> +			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&mmcc VIDEO_TOP_GDSC>;
> +			clocks = <&mmcc VIDEO_CORE_CLK>,
> +				 <&mmcc VIDEO_AHB_CLK>,
> +				 <&mmcc VIDEO_AXI_CLK>,
> +				 <&mmcc VIDEO_MAXI_CLK>;
> +			clock-names = "core", "iface", "bus", "mbus";
> +			iommus = <&mmss_smmu 0x400>,
> +				 <&mmss_smmu 0x401>,
> +				 <&mmss_smmu 0x40a>,
> +				 <&mmss_smmu 0x407>,
> +				 <&mmss_smmu 0x40e>,
> +				 <&mmss_smmu 0x40f>,
> +				 <&mmss_smmu 0x408>,
> +				 <&mmss_smmu 0x409>,
> +				 <&mmss_smmu 0x40b>,
> +				 <&mmss_smmu 0x40c>,
> +				 <&mmss_smmu 0x40d>,
> +				 <&mmss_smmu 0x410>,
> +				 <&mmss_smmu 0x411>,
> +				 <&mmss_smmu 0x421>,
> +				 <&mmss_smmu 0x428>,
> +				 <&mmss_smmu 0x429>,
> +				 <&mmss_smmu 0x42b>,
> +				 <&mmss_smmu 0x42c>,
> +				 <&mmss_smmu 0x42d>,
> +				 <&mmss_smmu 0x411>,
> +				 <&mmss_smmu 0x431>;
> +			memory-region = <&venus_mem>;
> +			status = "disabled";
> +			qcom,venus-broken-low-power-mode;
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
> +				clock-names = "core";
> +				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
> +				clock-names = "core";
> +				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
> +			};
> +		};
> +
>  		mmss_smmu: iommu@cd00000 {
>  			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
>  			reg = <0x0cd00000 0x40000>;
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index a712dd4f02a5b..ad1705e510312 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -585,6 +585,43 @@ static const struct venus_resources msm8996_res = {
>  	.fwname = "qcom/venus-4.2/venus.mbn",
>  };
>  
> +static const struct freq_tbl msm8998_freq_table[] = {
> +	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
> +	{  972000, 520000000 },	/* 4k UHD @ 30 */
> +	{  489600, 346666667 },	/* 1080p @ 60 */
> +	{  244800, 150000000 },	/* 1080p @ 30 */
> +	{  108000,  75000000 },	/* 720p @ 30 */
> +};
> +
> +static const struct reg_val msm8998_reg_preset[] = {
> +    { 0x80124, 0x00000003 },
> +    { 0x80550, 0x01111111 },
> +    { 0x80560, 0x01111111 },
> +    { 0x80568, 0x01111111 },
> +    { 0x80570, 0x01111111 },
> +    { 0x80580, 0x01111111 },
> +    { 0xe2010, 0x00000000 },
> +};
> +
> +static const struct venus_resources msm8998_res = {
> +	.freq_tbl = msm8998_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
> +	.reg_tbl = msm8998_reg_preset,
> +	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
> +	.clks = {"core", "iface", "bus", "mbus"},
> +	.clks_num = 4,
> +	.vcodec0_clks = { "core" },
> +	.vcodec1_clks = { "core" },
> +	.vcodec_clks_num = 1,
> +	.max_load = 2563200,
> +	.hfi_version = HFI_VERSION_3XX,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.dma_mask = 0xddc00000 - 1,
> +	.fwname = "qcom/venus-4.4/venus.mbn",
> +};
> +
>  static const struct freq_tbl sdm660_freq_table[] = {
>  	{ 979200, 518400000 },
>  	{ 489600, 441600000 },
> @@ -891,6 +928,7 @@ static const struct venus_resources sc7280_res = {
>  static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> +	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
> 
> 
> 
> This patch is on top of v6.8-rc1
> so the configurations for VIDEO_SUBCOREx_GDSC
> are as defined in mainline.
> 
> #define VIDEO_SUBCORE0_CLK_SRC	51
> #define VIDEO_SUBCORE1_CLK_SRC	52
> 
> #define VIDEO_TOP_GDSC		1
> #define VIDEO_SUBCORE0_GDSC	2
> #define VIDEO_SUBCORE1_GDSC	3
> 
> https://github.com/torvalds/linux/blob/master/drivers/clk/qcom/mmcc-msm8998.c#L2536-L2561
> 
> static struct gdsc video_top_gdsc = {
> 	.gdscr = 0x1024,
> 	.pd = {
> 		.name = "video_top",
> 	},
> 	.pwrsts = PWRSTS_OFF_ON,
> };
> 
> static struct gdsc video_subcore0_gdsc = {
> 	.gdscr = 0x1040,
> 	.pd = {
> 		.name = "video_subcore0",
> 	},
> 	.parent = &video_top_gdsc.pd,
> 	.pwrsts = PWRSTS_OFF_ON,
> };
> 
> static struct gdsc video_subcore1_gdsc = {
> 	.gdscr = 0x1044,
> 	.pd = {
> 		.name = "video_subcore1",
> 	},
> 	.parent = &video_top_gdsc.pd,
> 	.pwrsts = PWRSTS_OFF_ON,
> };
> 
> 
> 	const u8			pwrsts;
> /* Powerdomain allowable state bitfields */
> #define PWRSTS_OFF		BIT(0)
> /*
>  * There is no SW control to transition a GDSC into
>  * PWRSTS_RET. This happens in HW when the parent
>  * domain goes down to a low power state
>  */
> #define PWRSTS_RET		BIT(1)
> #define PWRSTS_ON		BIT(2)
> #define PWRSTS_OFF_ON		(PWRSTS_OFF | PWRSTS_ON)
> #define PWRSTS_RET_ON		(PWRSTS_RET | PWRSTS_ON)
> 	const u16			flags;
> #define VOTABLE		BIT(0)
> #define CLAMP_IO	BIT(1)
> #define HW_CTRL		BIT(2)
> #define SW_RESET	BIT(3)
> #define AON_RESET	BIT(4)
> #define POLL_CFG_GDSCR	BIT(5)
> #define ALWAYS_ON	BIT(6)
> #define RETAIN_FF_ENABLE	BIT(7)
> #define NO_RET_PERIPH	BIT(8)
> 
> 
> Should .pwrsts be PWRSTS_RET_ON instead of PWRSTS_OFF_ON?
> 
> Should .flags be HW_CTRL instead of 0?
Not completely sure on these configurations, but certainly both the
video_subcore0_gdsc and video_subcore1_gdsc should be configured in hardware
control mode in the gdsc configuration.

Regards,
Vikash

