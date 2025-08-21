Return-Path: <linux-media+bounces-40550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 761C5B2F484
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 11:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 001211CE1CFA
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227E22D46AB;
	Thu, 21 Aug 2025 09:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XzDtKrlf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C964B2797A5;
	Thu, 21 Aug 2025 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769697; cv=none; b=DJEPua2c27xloi5HLPEx1C6QIhPRoMAGl1oqbzhMqNBIsvIVdRYQIUUnufMx7/2XBnM7Pa3xewVB2HmqfK+bIP8sPyVHilvHp/BxGQy2THVY5b/bUOgW8iraUO4oZDZwKRpD0H7KnFeuqYze9IPWkB+mtyJ9X6tnK6hVO5O+PfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769697; c=relaxed/simple;
	bh=UQVO6N7adw0yAk/8xO9tJGI+/p8dNbC9LHEk2Znmfy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hJaf0Ietievao/3D16ny705r851/hAZWJd0/9ztyX3s64HNrEvhf087zaBsqvCXIuuzyoxuZDC6Oiv81O2TIc7PYqgEJb4fdufr0ibWbSvjoSsXnIs+TlzmoK0lgO163BEJsmzE3PUms7yTvF72aROFf2YA8LUAv2JsHNTd56yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XzDtKrlf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bDx1027108;
	Thu, 21 Aug 2025 09:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyJzaTdgmo+1GtlzA5hdtallp9EqJkR4eDWztKTpFVw=; b=XzDtKrlfEk1elitL
	wY09ANDZUJ76qTxmAfsZWjGBoCwZACMVFqE/IkdLl0/mVu0ipjpjpHy7bAA+6JxK
	fzbDCtW633J6gGzAJEBlts7/LYowolvPROeR/0fc38tX/+WdfPW/uhD9W5v4u9ND
	uoqRXj0QADN8Au+vm7Cq6GqQy/KYQcgpwBh+ZgiNesQsyd8nzfo/H4dmPAgqYmu7
	TOQLC4RgkxH5D7aT/ycNM1s1fRfaCum3RpL1m6DLx57gDFU3pUZHak2Y3a6Us1Dq
	JHr9wWoA0GDI/zy11opCmyJlM4SddgkUilB+Cb3PD5C6a4qQRcv/gwDMCorW5xfZ
	F15O2g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528vxs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 09:48:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57L9mBWW018376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 09:48:11 GMT
Received: from [10.50.10.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 02:48:08 -0700
Message-ID: <b277a521-acb8-00f7-19c7-32931cfdc181@quicinc.com>
Date: Thu, 21 Aug 2025 15:18:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: venus: firmware: Use correct reset sequence for
 IRIS2
Content-Language: en-US
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil
	<hverkuil@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250820-venus-iris2-no-tz-v1-1-9ebcc343195a@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250820-venus-iris2-no-tz-v1-1-9ebcc343195a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a6eb5c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=xVNrxXhrsQtHBxWYos8A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: hcWK-m61zkAJz5noYorrTl6AzUdmja_e
X-Proofpoint-ORIG-GUID: hcWK-m61zkAJz5noYorrTl6AzUdmja_e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5AEAwkv+0cab
 t3DhqmZvi1NIJjtG7FP/+YYYWvfI4NgkAxGL2eJPn07t9lLKFV4sYnJQf8mgPfdjOW4gVfzdDGw
 bBCiUUZBng7VDNWyGY3KaFPP+5dIMqh+KIkVtCJte5LQpMzgp3NN//Wk+e6vG5DEkP9d575lxf8
 6y8MDlu9XUjbRD9Jgts/vlWDg11QpYMq0xQHWpN3gwOH3PPFgSocE2L8Gyc/Dst1GihFxOioP4g
 lkfxL1oU3ZDyHhegJG7T43AZKi5zE59HXkHw9QUuLgDAyr2EYNl3Ab6g6/2/zJVCy13n4hNKuy0
 bYoUoC4eobLnHp70151piU1myHnGwVqb7DSEp21Zh0RSaveuIdZz0BaR7OnHjqQL20DhsRWdcxN
 b2/6V0gi4zR33P90Tyhw8xZxts8ROA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/20/2025 8:46 PM, Stephan Gerhold wrote:
> When starting venus with the "no_tz" code path, IRIS2 needs the same
> boot/reset sequence as IRIS2_1. This is because most of the registers were
> moved to the "wrapper_tz_base", which is already defined for both IRIS2 and
> IRIS2_1 inside core.c. Add IRIS2 to the checks inside firmware.c as well to
> make sure that it uses the correct reset sequence.
> 
> Both IRIS and IRIS2_1 are HFI v6 variants, so the correct sequence was used
> before commit c38610f8981e ("media: venus: firmware: Sanitize
> per-VPU-version").
> 
> Fixes: c38610f8981e ("media: venus: firmware: Sanitize per-VPU-version")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/firmware.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 66a18830e66dac2acbe11751a8c250876e20d795..4e2636b0536693a86dc51503d01dc2bca40b532a 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
>  	u32 fw_size = core->fw.mapped_mem_size;
>  	void __iomem *wrapper_base;
>  
> -	if (IS_IRIS2_1(core))
> +	if (IS_IRIS2(core) || IS_IRIS2_1(core))
>  		wrapper_base = core->wrapper_tz_base;
>  	else
>  		wrapper_base = core->wrapper_base;
> @@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
>  
> -	if (IS_IRIS2_1(core)) {
> +	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
>  		/* Bring XTSS out of reset */
>  		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
>  	} else {
> @@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	if (resume) {
>  		venus_reset_cpu(core);
>  	} else {
> -		if (IS_IRIS2_1(core))
> +		if (IS_IRIS2(core) || IS_IRIS2_1(core))
>  			writel(WRAPPER_XTSS_SW_RESET_BIT,
>  			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
>  		else
> @@ -181,7 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
>  	void __iomem *wrapper_base = core->wrapper_base;
>  	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
>  
> -	if (IS_IRIS2_1(core)) {
> +	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
>  		/* Assert the reset to XTSS */
>  		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
>  		reg |= WRAPPER_XTSS_SW_RESET_BIT;
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250815-venus-iris2-no-tz-f9b52f33c4d0
> 
> Best regards,

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Thanks,
Dikshita

