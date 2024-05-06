Return-Path: <linux-media+bounces-10889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF808BD08B
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF60E1C2456D
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 14:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F941153583;
	Mon,  6 May 2024 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BEwhDDqT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E5A1534F9;
	Mon,  6 May 2024 14:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715006621; cv=none; b=shv8TDNxp+gx347w1PQi3Ua78GpQMFQC/mG7LnWn6u0i6GeDg8NIA02o0RLxHFb1kqfmpyJQ+Zt4Q8N8NLh6BaRhweZlUzHXK92bm5RCNgtJ0Ugz4btDo/n9vEaUOT/kbrMJWeEMx3uWU3ClMxCjJV4XRrduF5mJp0ZyS1SpAIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715006621; c=relaxed/simple;
	bh=y647dMzPrxRgvSF4A0OcIoVEWcf6Sx+yOBZLZfTDR3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dyQK3BHdZiNKEnut03nrr/lrpwR1vqhZ7XFVY8CpxT2CWR3qwrvDJzWOe3Goyv4IiPMdLAzH+dIbKLKGlEjetL7R6smhDEcLsVOgFvjKKoo5jnYEuLEZ1rhGxqstkPhJqPaoLgnl81Ze8wJHioQIVEKj62o+DBcis8muOuYVuAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BEwhDDqT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 446DvusS020742;
	Mon, 6 May 2024 14:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=g12AKeQZADDNahrrQPOiEakptlKeLPwOThbL5Jv4l8g=; b=BE
	whDDqT5vX9cQRNYC+6GErOyrAvRq8w+PfVx/qhb/t3nPUzsJ5U14DMSue/OK2SeC
	dE42PqDXF638rt2TcCbsqgCjn9sjqFMeJSrumUFbpLLv0cKy5n1baMHW+2b+qLn3
	UiT+Hi0HgVKel518e5g18EKrMG92ifzgEDnwHiT0vIJsQsyyRYDcSlhMYPD7uxZs
	IYpxqK51d0VrdCkoPBB9xc57fUad4otGK/6Ra/NK+rqCTLRAgu+JP9YD4uQVB0sk
	ZCAmxe6+E5tPicwCZAkSXWOMwxcG4A5R9tsa0c54BS7C4i8U/9BNr44DaMURM28e
	MJUUWxCj7pXUKSbR9fFg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xxwqdrgb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 14:43:33 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 446EhV9F007230
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 May 2024 14:43:31 GMT
Received: from [10.216.21.139] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 May 2024
 07:43:26 -0700
Message-ID: <803b267b-9171-8234-aa3a-fba0d738a64d@quicinc.com>
Date: Mon, 6 May 2024 20:13:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/3] media: venus: add msm8998 support
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
References: <72860c1d-7434-4be6-8c1d-9ea177602802@freebox.fr>
 <14bda891-5035-433c-888e-b3c330eeffaf@freebox.fr>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <14bda891-5035-433c-888e-b3c330eeffaf@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: K-3p3HzHPEijfjl9gscegYAPl73NYKGi
X-Proofpoint-GUID: K-3p3HzHPEijfjl9gscegYAPl73NYKGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_09,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2405060101


On 5/6/2024 7:17 PM, Marc Gonzalez wrote:
> From: Pierre-Hugues Husson <phhusson@freebox.fr>
> 
> Add the missing bits for msm8998 support.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/media/platform/qcom/venus/core.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index ce206b7097541..064120127cb86 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -554,6 +554,9 @@ static const struct venus_resources msm8916_res = {
>  	.fwname = "qcom/venus-1.8/venus.mbn",
>  };
>  
> +/*
> + * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blame/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8996-v3.dtsi#L403-414
> + */
There is no need to add the link to downstream code in comments. Please remove them.

Regards,
Vikash
>  static const struct freq_tbl msm8996_freq_table[] = {
>  	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
>  	{  972000, 520000000 },	/* 4k UHD @ 30 */
> @@ -587,6 +590,50 @@ static const struct venus_resources msm8996_res = {
>  	.fwname = "qcom/venus-4.2/venus.mbn",
>  };
>  
> +/*
> + * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi#L42-53
> + */
> +static const struct freq_tbl msm8998_freq_table[] = {
> +	{ 1944000, 465000000 },	/* 4k UHD @ 60 (decode only) */
> +	{  972000, 465000000 },	/* 4k UHD @ 30 */
> +	{  489600, 360000000 },	/* 1080p @ 60 */
> +	{  244800, 186000000 },	/* 1080p @ 30 */
> +	{  108000, 100000000 },	/* 720p @ 30 */
> +};
> +
> +/*
> + * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi#L29-37
> + */
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
> @@ -893,6 +940,7 @@ static const struct venus_resources sc7280_res = {
>  static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> +	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },

