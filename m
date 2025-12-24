Return-Path: <linux-media+bounces-49454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 310A7CDBB68
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 09:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0BC93034A0F
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 08:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E60E32F740;
	Wed, 24 Dec 2025 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYvEcW9k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MbpmRk2u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8B91A00F0
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 08:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766566645; cv=none; b=jZItDZxFwqbrlHdlAvl4NHjwm0HQRlWjFdYx/8+LOqmNATK6HcUF1exmwSAIJ6cGPprgCDkrbTyPkcFrPmGbh2YSOwFzYDVPWTvZbBJmY5kerCZv+Ggo0Pdt86BpBh2gzOmtgknLCTRxo5T2ZDfd0g7d8mLKBrmzwDVBs4SZRuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766566645; c=relaxed/simple;
	bh=1n0t3PmqciaFWCpPU8IXS/Yq1JqNg+AVk9HAeWY7Bgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jdhv3UFZ3JaUL2UPDYVfNQ0GFDL3abL6fu930e8h7toh8HWOexayovtAh0t8PeBENF3MO6muXgpN75E8QzzJJr01RuXH7fOeKxmjLVvsaGjJERWI9iKCiCJ36tk73V+QsdStLW9y3VuCCfzh+r8/3E3y066/x3oSOJnHeRxbTk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYvEcW9k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MbpmRk2u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8SjIn1207083
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 08:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YY2vZMGLYtMSNHn9qH/0CopeYQXkFGZwayfiSDsdyjE=; b=MYvEcW9khyfZVtdb
	dXQ0kTCzYLcWu56asyOY2ZB4OWZ0fEI+52XDKIcQ6Eyp8hfq2jtIt5NC4vVio436
	7XSQb+FGCFZ7U70gjKwI0YQ5eQkW9IyZbHUNkJtJyHr2/ZiNEHgnu5wKuLT5DwqF
	zAxQ0fu+KqYDB2wB5IqGqn0UzozPk5i2J+8CPSL1d/uuCWv8znNesn6sC6wwo7zZ
	vWpzTAM4ZmwPH4c9QUMpgwOz0LqjbUQqH9UsyD/CAM02u9sCOxfjWZ8qtfByYVq6
	644+Iwzw+izWBDmJBnUm3PzINXBmxlPdbxmZR/P8Lar4tg9p4KfCVQkN9nSivgqj
	nZdoxQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r1kn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 08:57:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a9fb6fcc78so5041791b3a.3
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 00:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766566641; x=1767171441; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YY2vZMGLYtMSNHn9qH/0CopeYQXkFGZwayfiSDsdyjE=;
        b=MbpmRk2u22W6MdsmyFU88VwVghkfd0PfsV1cmkujwVo0VLz+xn+HcnZ6FdpPJm5a1U
         GInq+32yQTVmQB+oXQDV6rpmU9jOcYCl7gGT1t2P20vGKb+SQBFJxzvtM7vNY8TGDbP7
         YWEUR8c2VhL2M7unkUmovlzeC+flcowhcdsZEWmcSvwz0kCfKhadRq+LpF9efOdVwN6p
         SRQsaaDNiwkOsbPvX1o2U2lD2tS7mae1hnhfR4VBqkW0b6AIHauKgviHvkYOziosAu9X
         psevlFzICXCVfD9pGe6RIA2eCgxhDNbEFo9eGW2dXK/OPkMwXJ6cZVs5lNeL1bv+CkgN
         5A4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766566641; x=1767171441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YY2vZMGLYtMSNHn9qH/0CopeYQXkFGZwayfiSDsdyjE=;
        b=OCs5LTvC3KqegLqMcBdyLYh3tCJ9ruogemAKqdBmvx9tzf5BO2VzDmh4nffsJ0LvTD
         n9WNaMLeXF5145FPL9mVkaizxyz7lCp3WW7JNBSAXmCXzgBDCHozQDAWTBUo6a/IB73+
         ZpYSHINGZWszL/t905lKMpHaBjo8Rhr8B2Ttdn/Cj1DFZ2uyWpKA8SwR6+kBXxO8jmGs
         69RInaXzxm9+HTxa+Q3ENmNkZSDA+/e30lkXUI+zCHNi6eiVRiPeM+MaWXBvRa56NgL6
         B4n8qqQxYWM0ep8p3Y3aiKVwM4GYoQm4D7ZV0IwPifv78ZtnLa4ISxayAzPBCHx0k8nZ
         ncZQ==
X-Gm-Message-State: AOJu0YwqXi3f+qN5hbWQpOLQPaTMWcaQLIenmCy01xUq4/veFqJ9oMEM
	BLXHeu8aykxsSA05j8pBKUBoihEtkS30DzKiveqehej5dB1OUANI898IrPPPJCbdH2LtkBaGBO1
	QWKFKILaWstVN5j2zF/riDixSW3Kob+yBJyy1G0ACa7bR2EvuKI4SuISbHX+LsxfYlA==
X-Gm-Gg: AY/fxX5WTMYbdpP+HzhTJmmphdF90AHtLyAHEfiOgZYalqDGicyBKZTOqAp/pAvDaoz
	xFIdQE/kCeS5Z6TNs2WJ723ciyfARViKW6pr86xGWAnrfIbULlQ4LjNjQbztuDmleyKIwRSD68r
	k73Yn+vm17jZZssDO/m9S1E7ZQTMruhXhKsnpzCb1dvACk2X6KXMLYwzvgX3pVhy0q5Aw7wg1Mq
	F5oEPyfSgrDqDaAQz+2KqAOuvtX3lpUzeZ80koEeuLNNSbXh7CcgAq+qmx7JdLgflmCZDJJHlaO
	HuqIqhkVOzvDXdfbqZwuQM5clvPBTOfYDQjpRTSmliAHMzJBGX9bfzwoecSUnEL3SZNyCh5pjwg
	HR8Fi/894VKDAwvVyU+y4JRCrIuvw0RBj7fTzl+UKGMo=
X-Received: by 2002:a05:6a00:4509:b0:7e8:4587:e8c1 with SMTP id d2e1a72fcca58-7ff6647983bmr14043754b3a.52.1766566641360;
        Wed, 24 Dec 2025 00:57:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEGeUs49rpRM60ET1MP4H3btdQu+rWmpwolNku2pFy8M1be+WSh8RXzumzSUrw20RJfSB8FQ==
X-Received: by 2002:a05:6a00:4509:b0:7e8:4587:e8c1 with SMTP id d2e1a72fcca58-7ff6647983bmr14043735b3a.52.1766566640677;
        Wed, 24 Dec 2025 00:57:20 -0800 (PST)
Received: from [10.204.101.164] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197f9asm15917291b3a.43.2025.12.24.00.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 00:57:20 -0800 (PST)
Message-ID: <07b1a76f-02dd-4973-841d-9ea9e6fb4147@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 14:27:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Add missing platform data entries for SM8750
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251218-iris-sm8750-fix-v1-1-9a6df5cd6fd3@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251218-iris-sm8750-fix-v1-1-9a6df5cd6fd3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D0koMRk3XtWgy9OuC7pEy3Gz1ZVR0pe_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3NyBTYWx0ZWRfXyhs/0dxhp3l6
 P4vRwvDNT9TDF347KRGBPL33f3I/i6xE6QYbQ3Zs9s5SkyWHhjS25Etuuo84zWQVJLU5eoNtmGd
 pT+I74HyyHFD6+qh1AujUs4OXuRLiRawfPHvWZ1kvnBXM/au9a1BF9QcMveihIBuluFHfZI5kQk
 hHOqc1UjTFKcnmafxBVYuQV6x27e4w/Y6eVEVZAMKy9JA3T/evVyXvHCDyHt/pjqJVv4WsqQbWH
 0HpwnxOB1NpE/mwnVpN+3yWaBh8d4SrpNJxKkxpbHbQsxoCJLwkKD790lll85yyh8N8arnQ33Su
 jN0jdYrmd05jGqo4wPeM6Hz/xhigGWXaXz8JsBsgTvOUIJhmulXFcGj/8Vkx/8OCnDR0tsVonwu
 naG1t/H2LZ7Zpt9n9uf+ieucTrgUg2tsOzmaXbRj//m+yToydLbQJLg1IlNNcLQ8sCNorRdM5zG
 oSWqxy9AsDexRQGxarQ==
X-Proofpoint-GUID: D0koMRk3XtWgy9OuC7pEy3Gz1ZVR0pe_
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694baaf2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4Q0S_CixsqQ5lHILDBkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240077



On 12/18/2025 12:24 PM, Dikshita Agarwal wrote:
> Two platform-data fields for SM8750 were missed:
> 
>    - get_vpu_buffer_size = iris_vpu33_buf_size
>      Without this, the driver fails to allocate the required internal
>      buffers, leading to basic decode/encode failures during session
>      bring-up.
> 
>    - max_core_mbps = ((7680 * 4320) / 256) * 60
>      Without this capability exposed, capability checks are incomplete and
>      v4l2-compliance for encoder fails.
> 
> Fixes: a5925a2ce077 ("media: iris: add VPU33 specific encoding buffer calculation")
> Fixes: a6882431a138 ("media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for encoder")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c1989240c248601c34b84f508f1b72d72f81260a..00d1d55463179429f2ae7554546dcbe4fb1431cc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -915,6 +915,7 @@ const struct iris_platform_data sm8750_data = {
>   	.get_instance = iris_hfi_gen2_get_instance,
>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu33_buf_size,
>   	.vpu_ops = &iris_vpu35_ops,
>   	.set_preset_registers = iris_set_sm8550_preset_registers,
>   	.icc_tbl = sm8550_icc_table,
> @@ -945,6 +946,7 @@ const struct iris_platform_data sm8750_data = {
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
>   	.max_core_mbpf = NUM_MBS_8K * 2,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
>   	.dec_input_config_params_default =
>   		sm8550_vdec_input_config_params_default,
>   	.dec_input_config_params_default_size =
> 

Reviewed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com

