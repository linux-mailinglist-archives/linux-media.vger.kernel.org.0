Return-Path: <linux-media+bounces-60642-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKZ0JqNc+2mUaAMAu9opvQ
	(envelope-from <linux-media+bounces-60642-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:22:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 881384DD188
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 214243048F2C
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 15:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE4F48BD3B;
	Wed,  6 May 2026 15:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/VwO3gu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a76mmv1j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6FB47AF68
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 15:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080553; cv=none; b=gVn1U7T58ew6uk9w1Soo8PlvG9HqU5x+96cGajsA5hX2JaYgYAbxNLCDicBEYUOnluQC/pbTAvuhV+5FEF7BPZEipWaxACPK39pJQ3af2mp+yXDtTNN9dQe/jX4aX9bnMeyqQJg3+mxxzYs2OjScQsde9UKT+vRkhDA/U8SE0DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080553; c=relaxed/simple;
	bh=RhXRCgMNScIf77wnkS151xUmWJL1ppbZupG/e8th0Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r/GUHNjvkZC8BJ0HY1ScPiNTHMUMRYEmBK6uRo5j51V3aQWjYWk2TQ2jzjAPeNSGMhDj3H5JABw9t6DwagxMBKeBRokRyRAIjAj5SDTzGgK6MaJfs8FdU7iqwxqGUdMJ78VbEoZLlN65FiY+6rvcrxiY+uO6RHZ4b03EJtR4e5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/VwO3gu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a76mmv1j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A4giI3524219
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 15:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/4qDhc3xqA5oi78owxsgPypqoMvOhzYxv2FjuGz/0A=; b=n/VwO3guoR+gbKM1
	vb0fnDr6mJk5eh7Iu4Pb2rehc1/6B0SVyZwPzmokdVjmrT8XUkkGo1LD2LUHZ04Q
	tG22UnrMqoEzNOZApoH3mapGqv5Hwee9CyqQpytgakTfwbG0E+whoET0gqlMKs3s
	mO4SRSIPPrKdkw7EbeZRx3Ux744J6zKBgWNIqNq1/QTcrvDfBQ8+NCukHkeiGaIT
	kTCgHg/Gxc0+jtAASUiSJaDqXNiCYxQTu1P8B6VDmSyD/TRPbwHzl5OjVx1oSLlr
	dLOwLeqlm3Wa3ldEbRcqqdmHu5amea0mG1rREAEc3q+ePIZY7VH0yw+/+5839/Md
	Oly30Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jws56y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 15:15:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35e56ed5d5bso1332677a91.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778080548; x=1778685348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/4qDhc3xqA5oi78owxsgPypqoMvOhzYxv2FjuGz/0A=;
        b=a76mmv1jqYRv5tEMLtRZgwP+sEyFnT7uag5eD3+TVweFMbOY0KF+rsNiRNHpBrJdqS
         0gpwXmiqj+M0RZqMTbsQYILISJxR4cgkZw+t7bQ8tn2Ys34RtklFZhu2dDEzLKaetXnh
         9OZ4+EtlRQekqgbNVJ1Wb3SXTaGmbWo+O9RGpRZ+95Ti7ZeqpAIePL0cqA7ZGHnjRN7r
         INehhDIqrWhIOE1pjnUZSusm06H1U7Ew9ATFpm1CBucCqkPwGWK+7v/10JOl2aNNK0wx
         5cOIqqUsHsG051Bl+/JvufEKcjAVu6TM6w1zfEw2ocwXdFRnrqrwY7wfufeXMMPO2d6n
         3qNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080548; x=1778685348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/4qDhc3xqA5oi78owxsgPypqoMvOhzYxv2FjuGz/0A=;
        b=mureh51Xl4lFzxTnPfh8+Yqzxfak6oVkHhcqAZLgOr8qhTB7YGAQOvOk66D0Khhg69
         c5DL8MHUKjngmT/k4EgH76ILY+KF0V6M6QNE4rVA9LdqC1bZ9a+gQGtyZ1nKT3xr/Ygh
         y97XhQi1Z4MG6VWzFyufJ8dQ3VZslMVzKuaHh4+ks2scT+dYt6Cu87V6kdYxG3I2Qd0q
         TNXTteMKdN43Dk8ET2dWUUsiTmZAD0BtreeRuNTvT8HmuO9/H05Y/Oals6YOF1/4dvxg
         B6EJiGYPmXHEzT8zWBmRJazN2daNS6kytKuoSzKzHubsC35fTK8x5z7SfBF3mDFS+y7S
         6sgQ==
X-Gm-Message-State: AOJu0Yzv1a2Kuz5huTHbmQP1ZP+EqSDRXsyoAyo0XrSRSVk2VqgxC/0F
	Rm8B4PMc/iufglK0eEVdyJaJ0Z/gagyZOH7GMtTPH/lAZAEMVrsHYw9eVpZXhrBaD05ZXJWAyX2
	3pShj9aUmOu41kM9lCmyTSpF7erms5RsIazLVheg3EEFPO6QrzaVSUSME8gStQVadOg==
X-Gm-Gg: AeBDieuZfL9T3ALeGZsGztU2c1AW7lWYvUYJwST2dehq/2W/kD6ZxzXVx1Ha4v+UzSg
	da70O0dJEh9ixBYKWpTmFKjo4Nb60KDi3QTbbu3TSddsATjTtNI6951IvwGaryt1kAuV9CVi0ih
	WyOesmNaRU6mpi1C1nuZt+dm/LZVuzYP1/6TnVFijKPwwpAo2R48AxdxTspdCbq+Dl3LUDJ9I+D
	c8FA8FFSUNKINgZoK+yOQY9TH3VfAh/jZ2XxDP33YAlfY2ygXM5iy4fHHcGNHG34ZkgldYQjUWh
	vEhT/xcvS62Ld/abBDFyOpUxVDwEAKSNEWX4f2qElxujaWacudtnoc9226jJdJ/5rAxj2wRk2Ic
	mp90wZnCcLKUWOnEsJL0XgrEDDJGwfj4vZSjNFbsjytPPLkVZhmNLsowTb62v2MpF
X-Received: by 2002:a17:90a:e7d1:b0:35f:bc9f:e1b6 with SMTP id 98e67ed59e1d1-365a96b6eb6mr2734366a91.1.1778080547426;
        Wed, 06 May 2026 08:15:47 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d1:b0:35f:bc9f:e1b6 with SMTP id 98e67ed59e1d1-365a96b6eb6mr2734310a91.1.1778080546676;
        Wed, 06 May 2026 08:15:46 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4f70e8asm4011790a91.11.2026.05.06.08.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:15:46 -0700 (PDT)
Message-ID: <734e8ad0-54e0-4fcd-a3b4-8e99fb521ea1@oss.qualcomm.com>
Date: Wed, 6 May 2026 20:45:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] media: iris: Add power sequence for Glymur
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-10-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-10-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4CaKgnS c=1 sm=1 tr=0 ts=69fb5b24 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4ZKAssT4AknkAVwkBooA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1MCBTYWx0ZWRfXxtdJrbi3WtDM
 OwCzOT9x1PP5BNTgh9WxJG0UY846IV+A9N0KjqC21LQi0KXEcA0Q1EgqfNA4sDiGTbWMBPsuJYa
 OKzzkqT44O0oB32Clohw2ZM+3AktbfEEHqdS88rPCJ/1dJVverAxAWFY5wM297ORKsismdropr5
 mefZSe/j4fLliaIQL0mLVNg8qvAo/TrruBIBD/aiTGNuQUFzJklDquC7eE+iJ85e3dKe69LnA82
 QVXCOWyiF2bq4y8AsHa8a5xwyXigGHeneik/vR7rTmd/4rd8/qI3oRyQVdn15WqKWR0NzfzICa6
 4LouFmbWHL9bK7jAoDk/eKNQ48KEL4JXDTqAd6/Ac2wvETrpCfM9+Nkr1bWjIQFMoCyGj188YJQ
 Qpcemd8WSw4EWDipNEDZBB2CGekqYHARdYKcbco+vHcpRNBTaUsLSsR59+68wcezb/sHRZ+DSJ4
 LWmiZq5Ax+yrXDzpctg==
X-Proofpoint-GUID: VRbgmqD6XcG4FJPD9h2covZ18a36vL5E
X-Proofpoint-ORIG-GUID: VRbgmqD6XcG4FJPD9h2covZ18a36vL5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060150
X-Rspamd-Queue-Id: 881384DD188
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60642-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> Glymur has a secondary video codec core (vcodec1), equivalent to the
> primary core (vcodec0), but with independent power domains, clocks,
> and reset lines. Reuse the existing code wherever possible and add
> power sequence for vcodec1.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |   4 +
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 137 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>   .../platform/qcom/iris/iris_vpu_register_defines.h |   7 ++
>   4 files changed, 149 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 7d59e6364e9d..8995136ad29e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -61,6 +61,9 @@ enum platform_clk_type {
>   	IRIS_VPP0_HW_CLK,
>   	IRIS_VPP1_HW_CLK,
>   	IRIS_APV_HW_CLK,
> +	IRIS_AXI_VCODEC1_CLK,
> +	IRIS_VCODEC1_CLK,
> +	IRIS_VCODEC1_FREERUN_CLK,
>   };
>   
>   struct platform_clk_data {
> @@ -210,6 +213,7 @@ enum platform_pm_domain_type {
>   	IRIS_VPP0_HW_POWER_DOMAIN,
>   	IRIS_VPP1_HW_POWER_DOMAIN,
>   	IRIS_APV_HW_POWER_DOMAIN,
> +	IRIS_VCODEC1_POWER_DOMAIN,
>   };
>   
>   struct platform_pd_data {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 13fbb21c2182..0d0a239f9feb 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -27,6 +27,16 @@ static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>   	return pwr_status ? false : true;
>   }
>   
> +static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
> +{
> +	u32 value, pwr_status;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> +	pwr_status = value & BIT(4);

define these bits position

#define VCODEC0_POWER_STATUS BIT(1)
#define VCODEC1_POWER_STATUS BIT(4)

with this,

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

