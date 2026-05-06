Return-Path: <linux-media+bounces-60635-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMVWNSFV+2n+ZQMAu9opvQ
	(envelope-from <linux-media+bounces-60635-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:50:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1774DC96A
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 379213023BB5
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 14:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D56344D88;
	Wed,  6 May 2026 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceomNAkv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7DWSfjU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4493F20E9
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078921; cv=none; b=ZU5EeKpdeEN0wo0wwUT337/l5RCnYOG/LZP8tJf0PkCN/AIGkSErSBVd9xanhEm59uVgRTpWkeAouaftAnt5VI6b/ZaFeMUZrlKbzItXi5f39B/yioRdhHdp2Dxe+erEvhhz7EoTzegVtKzhxf3Zb1rXUIWpRjITcYnYRnxM8oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078921; c=relaxed/simple;
	bh=tjshc45sU4NDeKpBxwXJx7JcPp9DPCMPsWPxeYE+In0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYLB/Xx35q5dJPyjQIsPfiQyWgC1hLSJEuyfqxPlxuczIi8dlHNqGUbpxjFlo04ai2EuZ08qXIY25fklGceIE0imdnnKPdLk9TbPCipkDIynUZLDIt44SnS0ngIMeGeEJQwh3HeFZtj7rhNeSi9+c7/YEnjwtAr45UQvzjA0nB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceomNAkv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7DWSfjU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646C5JY33036347
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 14:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gBXTd60yitJVrz4Yyr33f4/s9WV5E4ilRPkk/RHgt1k=; b=ceomNAkvrfwJ+ir1
	F3t2WczOY3Rb0C5KI2HbPVv0ycR4hZyz1jM7+bywELz3ibvKHaoGxp2esjSKbzVp
	fpiMbdggtGspYTMq9CFN5sThX2ddGnHq0UYoNOWF3Qlu7wlmgGMF19MuDLXYJQfP
	Ux9NbtSHh/Xcel0jr6eGZpWZQxnrvgwCtrBn3lfWSRol95mhCLmKKQ6beRQL6HfE
	kRp7aajwX3aa8rYQY485Mcm/DCWL/+TVaaKFxfVpgNhY8pfeZTUkB67JGPdr+Br9
	XlJ81LF8b6j8kpAEIVteNDK1qIupbz6lezRLZNkjWx/60gIABoqpYZyo1cqaBwtX
	9+5lqg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf0mfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 14:48:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fc22424d9so15173268a91.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 07:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778078913; x=1778683713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gBXTd60yitJVrz4Yyr33f4/s9WV5E4ilRPkk/RHgt1k=;
        b=U7DWSfjUh65JlB48EegDeN0PHp9auOmEHqkVW2kKl6Agsd5hv4bHLWIgfTkbkcY0OG
         z0zbTAEKB78nO69Z/0OpuCPmEPtNAtEnylOtor+fRcBMCD2hpk5u6XNCeMEjpXGKj299
         jBIis6+l4hE59Skg7kBI+l+y7ENFntXL1oi9Py6mlGosqExqFpxLqHDVREDGylhd2tSP
         gzx+rpn9z37SkENp6m0tsxFCsfPHNjmKn1QK1YEpXzqRW2P+O1iIEyP3hbS1FHNa+rmO
         aGkUjsux/fF2z7eW2EMW8MwWVkIpgvT+pgExFV9uGfk0OAOQVyYfRBE3TnJAHmG6Ahm8
         RJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078913; x=1778683713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBXTd60yitJVrz4Yyr33f4/s9WV5E4ilRPkk/RHgt1k=;
        b=Y99MxSPV3XHedRBJWrTzdqf+kMOo6L5Wp2dePJBjPOxpybb10zsYCE5/bIb01ywdDZ
         +2ADKTcQrge8kuNtSO87qSc6X30k6V7DINjFNVzzKEMyvYDvw0/p5xHalebhLtVe47QM
         m63c+Ix+U36ewUQ6FgjDhHxUBSDoieHj+Pj7rG3EdJgFqRpGY92bhJb4ewdynu1dv0W9
         Fn0y3sEIEpNTqzGCvy/Za8yYL3/53tBJrYY/g1vuGrmzJvzJnRAS41PiXC4iQE94dVsw
         jj/wFuwnPOBNoqBxlsSkElcWuiZs/KKPZctODjUCC1acQVLiXxF3OBdAS5dCfDWOVYnh
         ShaQ==
X-Gm-Message-State: AOJu0YwqK0BFOmU3hxU7eM+jOoeG++2zNKqAgYWDXIV8AF3M31OoodCQ
	WRAOokTtn4/fEehmu5UunZPO93G546ogQ06BUHcveNyEce0CYP8DK5ysYgTI558AxTNFJ30OqxE
	Mk7a9Upvmhdo35xkrAH9NGa2GmwStTNkyusJ2pYCZnmvR1rlpMW63dvb0iSjkErxv6g==
X-Gm-Gg: AeBDies4AnpmsuyRcrZv5TLN0ZgImOlrNNyiKzfnPLRKeuEkvI5zCKLH+kcvih8Bgyr
	1hjrakU3Clx8JYJbl6XtF80CksUKhwmklJywL+6y78spUdQKY80qCry659lK6K5zJLAbLGSxygB
	2tNVqlTDLH/dZW+4sf0KEEpJ55/d5Yx8zyTLNSRABDWGzkQIQRPZJcIl2Qq4hXIL76q3u5KFoPz
	XFAvO5deQnZJe0/TouNQ+atmYY+Pqo5s3TP2ONtZHOX7UEGqGwb7oggHVPWIgKpi1187pLcSwlt
	lPT5IEZ+lxJjsMy7cE/9cYgvl+zevRHA0aoalt9EPg6ezFONy3pBHZi4pPIpqjy7FCxMFNn2zF6
	5UFRjGXrq4mR3eNxs1sbNi3MdHhuRqiwYzNYk20XY1iG453294MSixDlMooyp/qou
X-Received: by 2002:a17:90b:254d:b0:35e:57cf:c0ae with SMTP id 98e67ed59e1d1-365ab9c8160mr4155560a91.7.1778078912560;
        Wed, 06 May 2026 07:48:32 -0700 (PDT)
X-Received: by 2002:a17:90b:254d:b0:35e:57cf:c0ae with SMTP id 98e67ed59e1d1-365ab9c8160mr4155514a91.7.1778078911952;
        Wed, 06 May 2026 07:48:31 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4c28b1asm2713330a91.8.2026.05.06.07.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:48:31 -0700 (PDT)
Message-ID: <351f5afc-784d-4c1a-a386-199bd528723a@oss.qualcomm.com>
Date: Wed, 6 May 2026 20:18:23 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] media: iris: Use power domain type to look up
 pd_devs index
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
 <20260505-glymur-v4-9-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-9-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE0NSBTYWx0ZWRfX/znm600uTTRN
 BrLY7r6rlKcRYv7HOaS74zfW/wKKspaVtyn0JmCazbv+vz45u3lmGDOD82nlK+mfZL/qjbYiXEf
 OXHY+tSExw0Mb5fbm9VJISLDL6Mi1c887kIv+yZil1zjAFDhlYtk0x+MB9ZN3LphWtuEZfcvTyr
 sw2pQprTyHlkItkot1Zde/IJFAHr/P8sAtAWQV88qixMSDnzbJOnw/8idUZwO3v4AXXz0mrcOMi
 6cD5mi7ZUqOurQ6u61Y8F5EIn9T+BjZZu6cuoDbXZANd50+kfxJC5eKbX5JX1MhWYn3IABaps2A
 PDKmbNPMIu7Ul3lfVFVES07+pfXR4aZmFr6rhAf6HA5QIczKr0pOh8XJpC3hN204T4GJUamktfC
 WxvVTKB4t63mpOKorPlZzIoDkxzZGujn64eqtW+6Yj+akFJ/TK1vsMs0swqdC6vY2tIgXTl6I9B
 vTfb+RShSsay01cQQBg==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fb54c1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZJZrQh8Pd_IjRIY_cScA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: S520a617zXY5kyHtz5O_L--AafSHv3fi
X-Proofpoint-ORIG-GUID: S520a617zXY5kyHtz5O_L--AafSHv3fi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060145
X-Rspamd-Queue-Id: 4B1774DC96A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60635-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> The pmdomain_tbl was a array of strings holding only the power domain
> names. Callers had to pass a pd_devs[] pointer indexed directly by the
> platform_pm_domain_type enum value to iris_enable_power_domains() and
> iris_disable_power_domains().
> 
> A future platform may need to introduce a new enum value that aliases
> an existing one (e.g. IRIS_VCODEC1_POWER_DOMAIN aliasing the
> IRIS_VPP0_HW_POWER_DOMAIN on Glymur), which would break the assumption
> that enum values map 1:1 to pd_devs[] indices.
> 
> To fix this, replace the string array with a new struct platform_pd_data
> that pairs each power domain name with its platform_pm_domain_type. Add
> a helper iris_get_pd_index_by_type() that walks this table and returns
> the correct pd_devs[] index for a given type.
> 
> Update iris_enable_power_domains() and iris_disable_power_domains()
> to accept a platform_pm_domain_type instead of a struct device pointer.
> They now call the helper internally to resolve the index, removing the
> need for callers to do the index lookup themselves.
> 
> This prepares the driver for adding new platforms where power domain enum
> values cannot be used directly as pd_devs[] indices.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |  9 +++-
>   .../media/platform/qcom/iris/iris_platform_gen1.c  | 18 +++++---
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 24 ++++++----
>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 +-
>   drivers/media/platform/qcom/iris/iris_resources.c  | 44 +++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_resources.h  |  6 ++-
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      |  7 ++-
>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 52 ++++++++--------------
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 +++++-----
>   9 files changed, 116 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 30e9d4d288c6..7d59e6364e9d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -212,6 +212,12 @@ enum platform_pm_domain_type {
>   	IRIS_APV_HW_POWER_DOMAIN,
>   };
>   
> +struct platform_pd_data {
> +	enum platform_pm_domain_type *pd_types;
> +	const char **pd_names;
> +	u32 pd_count;
> +};
> +

<snip>

>   
> -int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
> +static int iris_get_pd_index_by_type(struct iris_core *core, enum platform_pm_domain_type pd_type)
>   {
> +	const struct platform_pd_data *pd_tbl;
> +	u32 pd_count, i;
> +
> +	pd_tbl = core->iris_platform_data->pmdomain_tbl;
> +	pd_count = core->iris_platform_data->pmdomain_tbl->pd_count;

pd_count can be dropped, use pd_tbl->pd_count instead.

with that fixed,

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

