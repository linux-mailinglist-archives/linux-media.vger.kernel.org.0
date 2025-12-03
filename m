Return-Path: <linux-media+bounces-48117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3F6C9DBE8
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 05:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0AB2E4E0307
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 04:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF141275B03;
	Wed,  3 Dec 2025 04:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKVTn4ji";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUZtkysL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390CE2459F7
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 04:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764736141; cv=none; b=rPmGv5HgcY9hkf83ZzmHMMVakTsoyspQ7wAOS75ZDqy8KhkBZkKJpLEv4QGTw39oadStXA39GKADd/pTK5zH101CvMc1wNylvhMShNNQBzWHqXIOBFQbbQZxuR4C/qbPGSmNV0lYjVNfIyyTfxeX3NirjBM2D8i9BEMoRYk7jEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764736141; c=relaxed/simple;
	bh=oRbEcIVNgp6kdKeZgYHatnKVbqvIZH8iYCVLe89adTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BqgX0WkO11Y8Q4nR7jdS+eAGAoBSo4JnXcjHy0qyrPdRBy/VQt0C8WOHLUPzkmG+/k6QRA4EjGMThSaA+03+j2pQkbCPT200/5DQ/MO/o2opDnxuUjAIeRrvtIk3UGCQezPWe2o1697fIEeELYJqFf+jQj0igevEPC5a58jVYPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKVTn4ji; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUZtkysL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2IR195385540
	for <linux-media@vger.kernel.org>; Wed, 3 Dec 2025 04:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytwgMZhYN8h1S8Ejyk86/SZe3w9e7WeFvjkgK8xE0bc=; b=ZKVTn4jiKxMXAlYR
	S7/BpDF0ZvOrf0i+EwAPiMxZv8MoioSEDs6zp4ToElL7ZJN6n6/F4eLxLZd+UmCG
	AOQr+LWF7ioyQ2hqLOIOG5gC1hkHhc32hHyQubtWOsmZKEMigbP1/mu3s4y3fBCo
	JOCHJvLgnbKdNfyh4BgAlOTNqU2t6NNZOXpfI69x/hFMD0++XkT7eHkR/Pa96s5j
	HQdF4K6V0Vy5pe4U+beOZG4cS6PrZW0pFCUhQ/pD7LNWTeEGZrMkjfGt5fMC5z/z
	LPUuDr6Tzpj7LzV6MEwjvJCnerj8XLaHxW4fz5KFSeG7K//uuf2EHrr7VZHSjFAp
	YFux7g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at5db1gn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 04:28:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3416dc5754fso11308911a91.1
        for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 20:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764736136; x=1765340936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytwgMZhYN8h1S8Ejyk86/SZe3w9e7WeFvjkgK8xE0bc=;
        b=OUZtkysL9fkIgEg4JuqZtWsmqhlLXcnrDafdnsA0FYwtx2+lZefOObEyGiio17Fv70
         L9VGtXQV2hiVsRuFALYAaHhXHsq482uaJ0RJdM66gKqjObPKPXllWEcB4njZfD9MGU46
         XefKsTTMKJk9t7ueYE/0sUWppL8GSFav1fnPL/Yp6tp3mYocXbldjIWFVGhmK4p5WJh0
         ldAfXqW5HRFN5hb4xYKitmXMuInBPODv330YHJB9G/902hUMCmEw5sBr4r6orw0lm6sn
         SYejfj8Sx0rIMoLqhgddTfPmtpEKUm3kEnXKpWbeRJVz742ZE3/Q8ouNXtgomS/6HnTe
         CdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764736136; x=1765340936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytwgMZhYN8h1S8Ejyk86/SZe3w9e7WeFvjkgK8xE0bc=;
        b=GMkTBp8oAB2tqt7JqGDiQ/z5zYOyxO0F6JMYBoGPelE6N1cdDFDxZePmusU4gxqwSX
         sBdaYl7/fg3ZDyVHfTnQF5hZt8r/oDXKvK+TYgQesXrt5yM27RFaCln0j0zzOIrs3MoH
         AVUgqPrbkJmEug7r5eJqpDMVCJFtiLOHEoY+lsP0ORQSdnYM/8PKNVuzhfCF3LWTgFiL
         cSLDs9s9r5eqn85aR2H66sqzm7CHt/QPzVaY8CedE5i43NeqaC4xQZr71WIB5FB1Ciuz
         DSsx8J2BZtkcbsHUREh/aUvaBUFhhfU2NQaqY6FQFcWIjVgvxCRqKDEqxstllj4HRu/A
         BJ+A==
X-Forwarded-Encrypted: i=1; AJvYcCVowP1nEKr0YwxLJlExE74Qgxvy0OPezzxd9nWhWIf/02R0DlhVxd14p++xdqQHtqn4ZktPw5xttG9Ymw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztIMjlI7o1T3zf6Dml0dXoKJzC4IKuQ2CLApc8tVjfmI+EVWg5
	Wg3syy8ByWrSExgHHIwFfingkO/CH0SXHlQnw1tUf1H2lhp5cegzaqVGJhgvk+WkZSsqRpK+q72
	maFDCty4YtPD6fDX6jAsV/1Xe9asvEWSKOrHxqJj6xyb1jVsTpduZvFtVHOmnDcwTnA==
X-Gm-Gg: ASbGnctmanpsMMHw5Tz6vm23Yr1M0A9wtq/h8rDM5e6GaxHQTH0vKCuRhG6PhrNM40F
	M9Vvb77A4jKVBCviNfMuI1eKp4w1Km3vtsQDxJ32VictXxfsyB9cNQiLnjEaq06SzpCBnAS79/n
	NgVFgdzgv6dDSD2aPql3VME/BRGBQo0RVJvIUG8ncpINtTeg+MIXvBd0AVOMBib4zhwn5B5ze4i
	PxFXovS4thRib+v+uyOxi7UW1UH4wpS+J7fhXpY16qVUnMKyEPU8qnvxfOPVBiMnQYJBmCQZFFv
	3Q1OenNAgCWtpFhI8rPZElGInFRB0qt3e6JStdEMLKYnBvkzJAGbYG0doOM86Xj2gSSZaCWAoaV
	XeF0i9sIWH3Ft/gPhKwBjPtbOasbrSmnOrA/mQcKHQA==
X-Received: by 2002:a17:90b:5143:b0:340:bb51:17eb with SMTP id 98e67ed59e1d1-34912607f64mr1252788a91.15.1764736135892;
        Tue, 02 Dec 2025 20:28:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwx3dQOPn7uxPtNDmZvLbp74kT1q9MGub+BZ18moeO+R8QXAIF1z+wtqyP35cD7r3A1gURLQ==
X-Received: by 2002:a17:90b:5143:b0:340:bb51:17eb with SMTP id 98e67ed59e1d1-34912607f64mr1252743a91.15.1764736135341;
        Tue, 02 Dec 2025 20:28:55 -0800 (PST)
Received: from [10.0.0.3] ([106.222.234.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912d175bdsm254867a91.11.2025.12.02.20.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 20:28:54 -0800 (PST)
Message-ID: <747f661f-1be3-59d3-0cec-71bb6a6e2fa6@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 09:58:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/4] media: qcom: iris: Add intra refresh support for gen1
 encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
 <20251127-batch2_iris_encoder_enhancements-v1-1-5ea78e2de2ae@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251127-batch2_iris_encoder_enhancements-v1-1-5ea78e2de2ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1ZGO2xlh-nncoQAG2oAgfpIVgBNcbe3c
X-Proofpoint-GUID: 1ZGO2xlh-nncoQAG2oAgfpIVgBNcbe3c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAzMiBTYWx0ZWRfX9TVHduD0rLWb
 1jdcilJiecBUnJNXcufl3/0ptGdp+oUNrlmJqcUs7TPbuvRpg82l1t370ZRzGdX5BYTp2JOHURb
 NXQ6Y1pHbr9qIAK6zezNKTs6F66aqO06XUYA5CTlOtUJUZWBKCquaQbvXAGgbeyW7MowM2bJRPO
 WjNQr4rb1Dy8fm/R7EreAIMPAbTf8Zp+1q60aJfycNGoS3+yQlDPGzYeR2YWqbLtEbqFQKu45ZA
 ax2MON/gbA5iH8W0IG7lLiRw2cCwCO2Ug0pBzetTegtFW/RTHe54vEvj9CPlgnJTAyTZqjkmZqV
 bzy/JtRjviIj9MHbcaTGReAmaNyDVsNeTtKJ0mtKw6F2yof4khKY4noq6CB5HZTVq2eK1srKt8k
 5qQgX3LmyTvWgbp4YkNL3Z78c0G1IQ==
X-Authority-Analysis: v=2.4 cv=VoMuwu2n c=1 sm=1 tr=0 ts=692fbc89 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fQrT7HkFwVlTC8MbpnvDjA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4WFqAtl7KJYln3AVwwUA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030032



On 11/27/2025 1:14 PM, Wangao Wang wrote:
> Add support for intra refresh configuration on gen1 encoder by enabling
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
> V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.
> 
> Key changes:
> Added intra refresh capability for gen1 encoder.
> Implemented handler for intra refresh period and type.
> Defined HFI property and structure for gen1.
> Renamed iris_set_ir_period_gen2() for gen2 to keep implementation separate.

No need to explain the code in commit text.

> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 36 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 +++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 13 ++++++++
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 19 ++++++++++++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  2 +-
>  6 files changed, 78 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 1910aa31a9b9218e9423f2916aa40b85185f0dfb..cdf38c285b9133f20bdb9bc3dd0f5e916d3ed7f8 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -962,7 +962,41 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  					     &hfi_val, sizeof(u32));
>  }
>  
> -int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct v4l2_pix_format_mplane *fmt = &inst->fmt_dst->fmt.pix_mp;
> +	u32 ir_period = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_intra_refresh hfi_val;
> +
> +	if (!ir_period)
> +		return -EINVAL;
> +
> +	if (inst->fw_caps[IR_TYPE].value ==
> +			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) {
> +		hfi_val.mode = HFI_INTRA_REFRESH_RANDOM;
> +	} else if (inst->fw_caps[IR_TYPE].value ==
> +			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC) {
> +		hfi_val.mode = HFI_INTRA_REFRESH_CYCLIC;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	hfi_val.mbs = fmt->width * fmt->height;
> +	hfi_val.mbs /= 16 * 16;
> +	if (hfi_val.mbs % ir_period)
> +		hfi_val.mbs++;
> +	hfi_val.mbs /= ir_period;

Can we have some comment here to explain what is this calculation for?

> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &hfi_val, sizeof(hfi_val));
> +}
> +
> +int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>  	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 9518803577bc39f5c1339a49878dd0c3e8f510ad..a0d5338bdc910bd30407132e8b700c333ad74e4c 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -34,7 +34,8 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> -int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 52da7ef7bab08fb1cb2ac804ccc6e3c7f9677890..4d9632ba86bc8f629cee6d726eb44efcdeba2475 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -685,6 +685,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
>  		packet->shdr.hdr.size += sizeof(u32) + sizeof(*plane_actual_info);
>  		break;
>  	}
> +	case HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH: {
> +		struct hfi_intra_refresh *in = pdata, *intra_refresh = prop_data;
> +
> +		intra_refresh->mode = in->mode;
> +		intra_refresh->mbs = in->mbs;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
> +		break;
> +	}
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 42226ccee3d9b9eb5f793c3be127acd8afad2138..04c79ee0463d7f32a2042044fe4564718cc01561 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -139,6 +139,14 @@
>  #define HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL		0x2005003
>  #define HFI_PROPERTY_PARAM_VENC_RATE_CONTROL			0x2005004
>  #define HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2		0x2005009
> +
> +#define HFI_INTRA_REFRESH_NONE			0x1
> +#define HFI_INTRA_REFRESH_CYCLIC		0x2
> +#define HFI_INTRA_REFRESH_ADAPTIVE		0x3
> +#define HFI_INTRA_REFRESH_CYCLIC_ADAPTIVE	0x4

HFI_INTRA_REFRESH_ADAPTIVE and HFI_INTRA_REFRESH_CYCLIC_ADAPTIVE are not
being used, do we need these macros here?

> +#define HFI_INTRA_REFRESH_RANDOM		0x5
> +
> +#define HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH			0x200500d
>  #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
>  #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
>  #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
> @@ -447,6 +455,11 @@ struct hfi_framerate {
>  	u32 framerate;
>  };
>  
> +struct hfi_intra_refresh {
> +	u32 mode;
> +	u32 mbs;
> +};
> +
>  struct hfi_event_data {
>  	u32 error;
>  	u32 height;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index 34cbeb8f52e248b6aec3e0ee911e14d50df07cce..e7645bd60eb46785e0110a34f3257f7c37bbfca5 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -230,6 +230,25 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT,
>  		.set = iris_set_qp_range,
>  	},
> +	{
> +		.cap_id = IR_TYPE,
> +		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
> +		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
> +		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) |
> +			BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC),
> +		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = IR_PERIOD,
> +		.min = 0,
> +		.max = INT_MAX,

is this value correct? please recheck.

Thanks,
Dikshita

> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_ir_period_gen1,
> +	},
>  };
>  
>  static struct platform_inst_caps platform_inst_cap_sm8250 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index a2025d32b3235aaff25793ba77db143000e54bae..b3425dcea22ceadbd56021e5859a24134100d5df 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -635,7 +635,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  		.value = 0,
>  		.flags = CAP_FLAG_OUTPUT_PORT |
>  			CAP_FLAG_DYNAMIC_ALLOWED,
> -		.set = iris_set_ir_period,
> +		.set = iris_set_ir_period_gen2,
>  	},
>  };
>  
> 

