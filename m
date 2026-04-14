Return-Path: <linux-media+bounces-58728-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMVMG90O3mnRmQkAu9opvQ
	(envelope-from <linux-media+bounces-58728-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 11:54:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 041293F8479
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 11:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9E9930CA63C
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 09:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383F73CA487;
	Tue, 14 Apr 2026 09:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RN4fs6if";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYqI8wFT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A103B7760
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160154; cv=none; b=lCYhn74B/LhmDPMiVDjIoTCyKN+B7389vB8c6rMALSj7Ro9TbEUYKfBcEaaRECZMxeNI7XKmrFQOPt3fC7wwtYpT5ww+c6MFdmh1RUlybHv18kzkTzK1wf2GIfCzKcKL/dHMx8nIV8vJw90vRJHt7IsJ1x50eX9afv9DnwcWOE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160154; c=relaxed/simple;
	bh=wuR5JFSajf2hkwoeFulviUjvuO08ypSrDi52MURLwgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PjVHuzGOBzmUsIY/7HY7xy29MJ3TxNyaufV7H8PxmfiZTndPR/3gbBrQnZ7VtBix8gkYwq89Uv8REqBtnIIinQl5N4pMiioIXuzMo7pMUJhRXK165eemHcsYQDnV1y8YKoC6KUy0jxvCzCF/d5wfP157x6LXmd61w4Y3OGpDVlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RN4fs6if; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hYqI8wFT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6lxlp1478949
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 09:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MZiEsYnwchziA2wH1UdtccA4jEIltz7HwL+VNB9wT48=; b=RN4fs6ifLIv6rZsQ
	LoIAJ9rZxdiE/7u9kXiLMwxNmB8F9sODkK7wI2G4oqj2x1OV3Wueyi0HK4G42Y90
	NlKQEgtRFwCKpgCpcBngKB8OKBWlMVSStt+eEBfIrf8JRJ0KQuy7cdTNTonGNi2g
	f5tw7w6POQyJ3MyElq2NHQ1kJREiFhxeEv5JzYWg7bGXC2NZ5JMpJWVdIcDYVzxS
	/+RVVjJ/Jz2XW//wVq0ghOvm7DDFWE8HFNUpbvcv+L1s3FcwAIs+1iBcx8vrXp7A
	o1dGqWtY6BATjb8Xzu1bxudEsBJr7OecdfZzU7FU0NwUgTwSbgJ5kYfYn1jFLdEg
	EyoQXA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87j25uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 09:49:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a5bf7ee420so17465476d6.0
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 02:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160152; x=1776764952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZiEsYnwchziA2wH1UdtccA4jEIltz7HwL+VNB9wT48=;
        b=hYqI8wFTAGRnhFyT5BrIw0KD5RJkqexSv2BzxJwlGc8HVw9mM+Oi/OBodtV7YZT497
         4tk558HQFE5huHFdAOAB4/asGqD8/6JmAmY8cJJl+Tuf2CbKGmcoKierQlaOlR3LUb4D
         SaHHyfG0TyFyBBdd8u/OEJeCRZUmmCVy2Sxi/PPyZmRdhpnn2JDhRlJgImBsSpXYDDIU
         aIzhAl1w63OnX2fioEifhfCII+V2uylFuvcq2f+v94jIZCuVLbSW9KRel83YX5LJitoY
         Kl/Ta+CqhSh1OJYFaUHW+DrD827At5Jx65hXd0NMXwu5cwbn+UI68yM2STGY/UVzAnZU
         /ATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160152; x=1776764952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZiEsYnwchziA2wH1UdtccA4jEIltz7HwL+VNB9wT48=;
        b=sKL3E4+GfkHYkGSSEauJJYeQU994TJ6BlKhwquGMBAzZD9GWSf7C8KbrhaGLWnWX9D
         nj5it1wqgkMTtNaFgP9QJrx0p986+u58/De3XGw7vC6zJ+n9VRv6DAkiByL1vtg3LgGj
         b0xbl9tf/nJxxAv12JaB7zp+OMsQWdTkZ+TOkLupMfwVpnYdspyS2g+CVF9o30FxBgUH
         97ifmvX2Dz6CPxgxBQwK3k4iFYYGsHqup3/yVxEp86hv9xTV3Wo7nlR3lvHr1IvOxrP2
         e+35GsX3PEFUY/sE4pnfjJ5GxxTVH7oQKd/bzkaQC2qp9ojfDwv2uCymIo1u1eOMAOzg
         pKnw==
X-Gm-Message-State: AOJu0YyIYkd2J1uKWVW0YJmY0werHYI7rDyzTV1zVvVc7Xv6pWd+h/zW
	n9EM8t5EDT/mdTKvdPN+BX+oVZoGuqTDC6nG8TsLxp7Ja6ob/f0sXEJZkbIi8Zv2IiZQbLo9uLN
	NJxtwNVs+x70VW5ArdkKELWJVIc1z4BbqTi5evqnPLGS00A8OhiqEkGd5kFRfryf0nA==
X-Gm-Gg: AeBDiesUl9n2tiGv6xUJCHbPxeteIeGYIOa1LC0CO2PLdG8r5YPWjUG9C2o2uoglNV9
	vDjXpv3o42SVEfwM3GsvnyrqH+ZS/2msdnvr74rP+0K2yRcUjjh79lfsytOstMxTmGwS0SQStGR
	nUsTp7WPibKUI2WFaNAoz9p4fup/cjRC4YWHzxEu+p2LHrckkVNOFYgRLt3J8Is1klTGjXEEKpQ
	1zQcFbTnJo8DlM8MSr7+6W4J/M/NGT89dO7p9x/KYC2C9vAPe8DUhA3cZ1hTWsqvIzey5a9pwH/
	GUL58BvYGX0C1pcdfAhzhqDUCKHu3KZio7ermpTax+aoNzl/exes58o2yk0SMlia4UCnL8WDuhy
	lcgCcFR3777akoSg946mPaJHgxLvfD+bcDd+pGQ95k/yMifpIKjoddZ0emr4T8ebbW4YkW/opzZ
	gxJqNEKgIb/1rFcA==
X-Received: by 2002:a05:6214:21ea:b0:89a:5129:510f with SMTP id 6a1803df08f44-8ac85f82b45mr181121266d6.0.1776160151842;
        Tue, 14 Apr 2026 02:49:11 -0700 (PDT)
X-Received: by 2002:a05:6214:21ea:b0:89a:5129:510f with SMTP id 6a1803df08f44-8ac85f82b45mr181121026d6.0.1776160151365;
        Tue, 14 Apr 2026 02:49:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a44sm386708566b.52.2026.04.14.02.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:49:10 -0700 (PDT)
Message-ID: <1de1a366-a325-428e-9dcc-1333bb85ed82@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:49:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] media: iris: Add power sequence for Glymur
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-8-7d3d1cf57b16@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-8-7d3d1cf57b16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yQStqjBiur8sMaKB7xC7uxGZ-IkmZyDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MSBTYWx0ZWRfX7a+YpbPJmUeb
 zb3LqgBQF3cQaq46gq8BxxkDeDg+Dz4pWnhrKsBBzG/4bIlPPsZ3Yq1AmWHjWZV/ojNGfnRG6TN
 9aKHSnAG6VbBOy5vQD80pyNcMSzioyOZd1FdgzDU1YYD1WcP0jgzu3muWQjPchktr42ewwaCV7I
 qVaFjxft/Kic7dGmK2FIA/Ut9q0RRusn6axgBqBQ/F+yfJgsYZNwpzSdDSNf2i5yUhWbewXwBXH
 qxPssE4i6f2RBtsOHM3hcOjAMpExQIDuz2ilAdNjV+/9riF3vcS12UrgQmmPh5FBQ1L9tyu/tjo
 x58f7JBz4Z3cIcmIYHWMKEE8Yxm1tnskbyuxrYooWmUUa4Mks8DT96bxYSPDfXYnHeAl3+B6k6v
 d76FffHpu/I3G3TqWUGYM3eqP15A8/PCTRL+vA62O/OMwlN5Q7VeOmVnESqrxM13F6UKfZpAo95
 2F3YUEIRaSV1KENci/Q==
X-Proofpoint-ORIG-GUID: yQStqjBiur8sMaKB7xC7uxGZ-IkmZyDI
X-Authority-Analysis: v=2.4 cv=DrpmPm/+ c=1 sm=1 tr=0 ts=69de0d98 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=wrwf7AeaGIUVrLbmntoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58728-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 041293F8479
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 7:00 AM, Vishnu Reddy wrote:
> Add power sequence hooks for controller, vcodec and vcodec1. reuse the
> existing code where ever is possible. add vcodec1 power on and off code
> separately which has different power domains and clocks.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |   9 ++
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 123 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |   7 ++
>  4 files changed, 140 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 30e9d4d288c6..e3c1aff770dd 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -61,6 +61,9 @@ enum platform_clk_type {
>  	IRIS_VPP0_HW_CLK,
>  	IRIS_VPP1_HW_CLK,
>  	IRIS_APV_HW_CLK,
> +	IRIS_AXI_VCODEC1_CLK,
> +	IRIS_VCODEC1_CLK,
> +	IRIS_VCODEC1_FREERUN_CLK,
>  };
>  
>  struct platform_clk_data {
> @@ -208,6 +211,12 @@ enum platform_pm_domain_type {
>  	IRIS_CTRL_POWER_DOMAIN,
>  	IRIS_VCODEC_POWER_DOMAIN,
>  	IRIS_VPP0_HW_POWER_DOMAIN,
> +	/*
> +	 * On Glymur, vcodec1 power domain is at the same index in pd_devs[]
> +	 * as IRIS_VPP0_HW_POWER_DOMAIN. Alias it so that the Glymur power
> +	 * domain table is indexed correctly.
> +	 */
> +	IRIS_VCODEC1_POWER_DOMAIN = IRIS_VPP0_HW_POWER_DOMAIN,

This feels really fragile..

[...]

> +static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
> +{
> +	u32 value, pwr_status;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> +	pwr_status = value & BIT(4);
> +
> +	return pwr_status ? false : true;

return !pwr_status

Konrad

