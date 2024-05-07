Return-Path: <linux-media+bounces-11038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C29D68BE5B8
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78D2328B878
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 14:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84132161310;
	Tue,  7 May 2024 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AmYCOQHW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038611607A2;
	Tue,  7 May 2024 14:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715091495; cv=none; b=npkqXSGNVO6tA6XQLtfqv+281ukZ7DMFn/EnaGpYy8aFDQdG1ZsU1SW8FEKtwJgP31UlWbHqTh4YAjg0C+WlJT2y35YBMzqzU5m84e72cEshyU5a9rSx5/LUB3LD8iW/u654xFztxgkLSMxS7HHol5nsAbccU4oMcTRubQTpC0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715091495; c=relaxed/simple;
	bh=PDW/QaP3jSaNnV9YlzOt74iqoY5PBQglHHzpzQaGa0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VgpbdRgQ4w10k53QvG3RVwM+zVKN6Orum9CqYsanaRStNBbHYu/Y86wOHiHhMJ3CLHAIIN+YkoMWYCKQxegqLYMwIdq277sMVLP90VREz9+qZkzMlete9QeuIIcqS/dV6CPvN59Sf/XFpyOO4R2/aDAiIzS9B/MiZmDdx6Z68ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AmYCOQHW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447BPqa9006373;
	Tue, 7 May 2024 14:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=sCBxcEV86oLS5MKk6pPLJoRpeRn2LFX/W4vhUZwcWXo=; b=Am
	YCOQHWLExg+1dSbBwkigk+xcka3GlyrB81L075EsJyLCjPHF6pxh8FZkLwNhZcOc
	bDgfSNo+AZ6PSAYRijpYn7x68EQRnlgA9aVy7grDjeNDPSYumGwoPGOZIR2XxehH
	EQNQmC/xk2+xhZAneuJjB+l79MuvimDN+C+NCO4bOMX9vJVHqc7E+mu1OnBj+4js
	7UC2zter0NHZEUMqe5yDdmo5xwHyWaqwVFotaEQLQ/a7BnuIGY/kh/3cCckQ0rW/
	EqurQdAVFaaSZuO+5emagdlxq7SBPuRTwsMElJdBFHRWGZAEJnTgnbjp5RQ6xAh2
	aFl8jfjCCudA3QkqdfTA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyf9gh4hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 14:18:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 447EI4Zd026576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 14:18:04 GMT
Received: from [10.216.21.139] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 May 2024
 07:17:59 -0700
Message-ID: <d1d42534-2d0f-ccd8-1e1d-1a64a4947555@quicinc.com>
Date: Tue, 7 May 2024 19:47:55 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/3] media: venus: add msm8998 support
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Bryan O Donoghue
	<bryan.odonoghue@linaro.org>
CC: MSM <linux-arm-msm@vger.kernel.org>,
        linux-media
	<linux-media@vger.kernel.org>,
        DT <devicetree@vger.kernel.org>,
        "Pierre-Hugues Husson" <phhusson@freebox.fr>,
        Arnaud Vrac <avrac@freebox.fr>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
 <6df495c5-db26-431d-8ce1-8263a2a12b2f@freebox.fr>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <6df495c5-db26-431d-8ce1-8263a2a12b2f@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _CQqI3_IaORzFZ6DdnF-KTLU0a8HsQ8a
X-Proofpoint-GUID: _CQqI3_IaORzFZ6DdnF-KTLU0a8HsQ8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_08,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405070098


On 5/7/2024 3:00 PM, Marc Gonzalez wrote:
> From: Pierre-Hugues Husson <phhusson@freebox.fr>
> 
> Add the missing bits for msm8998 support.
> 
> Downstream vendor code for reference:
> 
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi#L42-53
> 
> qcom,load-freq-tbl =
> 	/* Encoders */
> 	<972000 465000000 0x55555555>, /* 4k UHD @ 30 */
> 	<489600 360000000 0x55555555>, /* 1080p @ 60 */
> 	<244800 186000000 0x55555555>, /* 1080p @ 30 */
> 	<108000 100000000 0x55555555>, /* 720p @ 30 */
> 	/* Decoders */
> 	<1944000 465000000 0xffffffff>, /* 4k UHD @ 60 */
> 	< 972000 360000000 0xffffffff>, /* 4k UHD @ 30 */
> 	< 489600 186000000 0xffffffff>, /* 1080p @ 60 */
> 	< 244800 100000000 0xffffffff>; /* 1080p @ 30 */
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/media/platform/qcom/venus/core.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index ce206b7097541..8b715cb7ab51a 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -587,6 +587,44 @@ static const struct venus_resources msm8996_res = {
>  	.fwname = "qcom/venus-4.2/venus.mbn",
>  };
>  
> +static const struct freq_tbl msm8998_freq_table[] = {
> +	{ 1944000, 465000000 },	/* 4k UHD @ 60 (decode only) */
> +	{  972000, 465000000 },	/* 4k UHD @ 30 */
> +	{  489600, 360000000 },	/* 1080p @ 60 */
> +	{  244800, 186000000 },	/* 1080p @ 30 */
> +	{  108000, 100000000 },	/* 720p @ 30 */
> +};
> +
> +static const struct reg_val msm8998_reg_preset[] = {
> +	{ 0x80124, 0x00000003 },
> +	{ 0x80550, 0x01111111 },
> +	{ 0x80560, 0x01111111 },
> +	{ 0x80568, 0x01111111 },
> +	{ 0x80570, 0x01111111 },
> +	{ 0x80580, 0x01111111 },
> +	{ 0x80588, 0x01111111 },
> +	{ 0xe2010, 0x00000000 },
> +};
> +
> +static const struct venus_resources msm8998_res = {
> +	.freq_tbl = msm8998_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
> +	.reg_tbl = msm8998_reg_preset,
> +	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
> +	.clks = { "core", "iface", "bus", "mbus" },
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
> @@ -893,6 +931,7 @@ static const struct venus_resources sc7280_res = {
>  static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> +	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

Regards,
Vikash

