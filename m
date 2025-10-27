Return-Path: <linux-media+bounces-45638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E81C0C977
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 10:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5145419A4014
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 09:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839722E5B0E;
	Mon, 27 Oct 2025 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+5NXs2D"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A697A23BD1D
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761556065; cv=none; b=JFWRObMUhhTKc2UIzEjqDGDvczZ4s3SoBe/4Xi28S/AhzpVvgrHW2znqO2IUl/0FicW23IeJHWxqDPo0aL1h1axSMCfsH8WuvAiuGIfPc1DjZAMDHeVtXmZvUiWHTgibJHu0A9fRrlmidHB+XVS2BC1/cgDREHDpWNH3Hzf/iVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761556065; c=relaxed/simple;
	bh=/vRvrn62roSlhuavVwH0rzu6DCGWpOcIlr1UNW9fI1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSk6ikQM6r33Fep+TCrO8tX9HmlYjOZhTildm+acPbAA3qM0ZedynLfMkqDPox1fig5JzZGD8sQFdTiWEvlG5+gSNjGF1BxGkofAQZzFLtuORKtHT4dAKlN0FzXmAWnO31dmair0HQSRl66Kr9sfqHCBri2kxm23Jip0FEnE47M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+5NXs2D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8g8Ru885330
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 09:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W5ZeT9jU8GDiofYTcRqgDk8FhxPDOJL4EewqFtbBYgE=; b=Z+5NXs2Dqcw+68TY
	24SjiNdZAt170D8eS8R0DPt/E70xUzSxrZ51OEMz1a6wseAsqKSj3ev7m3T4Mblk
	MdFFMoFJ+VlDWdtvVfeLjkLB+t3BWEa8K4DvokkOMNsuZZEL/a33nDEZ/Oc7fGVY
	XPS/ntn/cKd5vKm+B09iJgJ0NopHwpyQJsSa2icK6iWN34QViHKlL2U+/6jjVL2s
	AgNPQm971YjU7LWVSlfk1xyC4SbxnOQX5E63+8OSmliCbMeFP9kf4EGYivWJfOoo
	rHvL66R1qMNPIFXBwTeeL6WsurEaZO45/DKnVzJLlu+wIPqyW9Uc/38TrCJg3yiN
	rvZzLQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p2q3xkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 09:07:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b62da7602a0so3148600a12.2
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 02:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761556062; x=1762160862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5ZeT9jU8GDiofYTcRqgDk8FhxPDOJL4EewqFtbBYgE=;
        b=RSfxdjVUBUFeJcxCvKJhp3nYjHlbfa8iyEpRcKNiBc17fGcQuxKKtrpxsdq4DsQ6dT
         CbRPqvYQ6iFeaYkehJfybTzOW+uyzyDqVqrG/gTIAZZFKnMjmtF3smPCJM7Dpi5pKawj
         zlG0IC6VkzjBD2aakgB0/n/i8b60dvZ6urdTiqcvMUee/T3Plg+a1jZ2UhEX6aAsP7q8
         Yf/VGKR3WJtShAd3agtpVcn15wUN87oyGeVUIjmf6pyATrg/tt9mnecdR2680JrYLqBj
         /00lbLSMt/Vvo78Q1Wn6r9MLa2d13kBh6ON4AOmgEZpzyy7DNOz/OH8MrSpoy44mvcTi
         3c4A==
X-Gm-Message-State: AOJu0YwsoLCwA07ocDzKtuDTadhh8ZMK10bs1Ou60L0q67mMCu1J7dbF
	MXBnXomyEmoQvTNiR+aXe4Kfp8DVHF2H+FQj0epVvzHe2/2lUf/4U9F7tjNBR9eK7F94fIkCctN
	Fe2+KkTTo1nL6yy+lxXK8eLgl5gBFtq8FfXP8sxYc5S20AbX0aik75tB10bZXKM2rPA==
X-Gm-Gg: ASbGncvnj6ZEwvy0Zh9osZZLoVFOdRt8m1i0Bv9kXgN6+z9hCZTA7WOk0oh3hMUyoZq
	kIv8jRFeKTv7NO9q8XKADFCMqUAKfPCSR8cHU7PXlHwiLAiIsdspwxO3N9CtKckKN1iKYo0Ba6v
	XXgMDXPsSPBy3Oyyp9w5fsZqK0jVFoogG0fuTTFMUAG3K2iOqD5Y1ILMOY3mkNmTW5NtC6ttvFb
	GbfhO/96dsr2fL5BOAmqZ6BQeQ9ahYtdvc4WfM1BoDm1AlIx2clMBRc23Q0vQGj22JNa+BfJ8Hf
	vXU0C6ZR047l6+yJkr0cLjd5kXT4QcRwWnVb1DtQxW5lP9fqQL9d0DU1SBH8X5cLBpFONm0q484
	sWeFhc1lF4ravFgryEUKb1Iuhl7KY+/c=
X-Received: by 2002:a17:902:d587:b0:269:a4ed:13c3 with SMTP id d9443c01a7336-290c9c8c7d8mr455053485ad.5.1761556061500;
        Mon, 27 Oct 2025 02:07:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZjV1HRyS1pcHET3pUYKHdxbaltlwFaB6CA/6iCAf2pR46RFdYJYAUFVT7UTDipYt19SJCZQ==
X-Received: by 2002:a17:902:d587:b0:269:a4ed:13c3 with SMTP id d9443c01a7336-290c9c8c7d8mr455052925ad.5.1761556060716;
        Mon, 27 Oct 2025 02:07:40 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40ac9sm74999105ad.71.2025.10.27.02.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 02:07:40 -0700 (PDT)
Message-ID: <7c188b49-f95d-5ea4-f278-3f1fef17c424@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:37:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/5] media: iris: Define AV1-specific platform
 capabilities and properties
Content-Language: en-US
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
 <20251017-av1_irisdecoder-v2-4-964a5478139e@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251017-av1_irisdecoder-v2-4-964a5478139e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QvpTHFyd c=1 sm=1 tr=0 ts=68ff365e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=fm3DjuHs9Q45othBYCMA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA4NCBTYWx0ZWRfX+FFNWmHC6A2H
 NqbDD+rZcQ1BhPq9VDbxx8YoGzwHJtW4S/iqUkwq8pXF66tRMMXB0QkJdoouxe83n7T179o98U9
 IyT4DqJ1gDqeQSxhsUBq5KeN1VqVo5+FbT4MjYE/p3cL3+w+ACl426hoDWXPgb3Z+BF+DZ3NsKt
 pJ+3OJplhSZb+QCeIKO4fgvGkaVV9G0LKqeOpmnWkbJnqSvusTkSVMjgjeMfbS+QbKJGq8++k1Q
 FnCgDW0xOGC9d8K3OoHI7Sndpy6/UjPl3/04uOj2cjyWKaxcPGkoEvgsvjhmnwouoonlVHKgOKs
 zDagW2/6m1CzwMC9gI+5J6Njq6tDyROkiqMy9WcDlj2ruvzc16wwMKahq+4t9GTv2Zq53skYFXW
 VONgcYO184UE54SV8fXMAOTrNPOz4g==
X-Proofpoint-GUID: LmCTHubTcxmnfPlNf3v17ir0wOWD2lAp
X-Proofpoint-ORIG-GUID: LmCTHubTcxmnfPlNf3v17ir0wOWD2lAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270084



On 10/18/2025 12:05 AM, Deepa Guthyappa Madivalara wrote:
> Defining platform specific capabilities specific to AV1 decoder.
> Set and subscribe to manadatory properties to firmware for AV1.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 ++
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 110 ++++++++++++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 ++
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++++
>  .../platform/qcom/iris/iris_platform_common.h      |  13 ++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 133 ++++++++++++++++++++-
>  .../platform/qcom/iris/iris_platform_sm8250.c      |   1 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
>  10 files changed, 296 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
> index 325d30fce5c99185b61ff989fbfd4de9a56762b2..5ef365d9236c7cbdee24a4614789b3191881968b 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
> @@ -42,6 +42,7 @@ enum iris_buffer_type {
>  	BUF_SCRATCH_1,
>  	BUF_SCRATCH_2,
>  	BUF_VPSS,
> +	BUF_PARTIAL,
>  	BUF_TYPE_MAX,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 754a5ad718bc37630bb861012301df7a2e7342a1..620c7e1bd273e25febd8ca70dd1dcfb0b862692b 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -98,6 +98,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return B_FRAME_QP_H264;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
>  		return B_FRAME_QP_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_AV1_PROFILE:
> +		return PROFILE_AV1;
> +	case V4L2_CID_MPEG_VIDEO_AV1_LEVEL:
> +		return LEVEL_AV1;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -185,6 +189,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
>  	case B_FRAME_QP_HEVC:
>  		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
> +	case PROFILE_AV1:
> +		return V4L2_CID_MPEG_VIDEO_AV1_PROFILE;
> +	case LEVEL_AV1:
> +		return V4L2_CID_MPEG_VIDEO_AV1_LEVEL;
>  	default:
>  		return 0;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index b51471fb32c70acee44c37f8e9dce0c6bc0b6ccc..3edb5ae582b49bea2e2408c4a5cfc0a742adc05f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -141,6 +141,9 @@ struct hfi_subscription_params {
>  	u32	profile;
>  	u32	level;
>  	u32	tier;
> +	u32	drap;
> +	u32	film_grain;
> +	u32	super_block;
>  };
>  
>  u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 4ce71a14250832440099e4cf3835b4aedfb749e8..86fa5ab02bfe3701e0c3dd38f1a9cadc88f5e4cd 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -10,6 +10,7 @@
>  
>  #define UNSPECIFIED_COLOR_FORMAT 5
>  #define NUM_SYS_INIT_PACKETS 8
> +#define NUM_COMV_AV1 18
>  
>  #define SYS_INIT_PKT_SIZE (sizeof(struct iris_hfi_header) + \
>  	NUM_SYS_INIT_PACKETS * (sizeof(struct iris_hfi_packet) + sizeof(u32)))
> @@ -121,6 +122,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
>  		case BUF_COMV:
>  		case BUF_NON_COMV:
>  		case BUF_LINE:
> +		case BUF_PARTIAL:
>  			return HFI_PORT_BITSTREAM;
>  		case BUF_OUTPUT:
>  		case BUF_DPB:
> @@ -380,6 +382,9 @@ static int iris_hfi_gen2_set_profile(struct iris_inst *inst, u32 plane)
>  	case V4L2_PIX_FMT_H264:
>  		profile = inst->fw_caps[PROFILE_H264].value;
>  		break;
> +	case V4L2_PIX_FMT_AV1:
> +		profile = inst->fw_caps[PROFILE_AV1].value;
> +		break;
>  	}
>  
>  	inst_hfi_gen2->src_subcr_params.profile = profile;
> @@ -409,6 +414,9 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst, u32 plane)
>  	case V4L2_PIX_FMT_H264:
>  		level = inst->fw_caps[LEVEL_H264].value;
>  		break;
> +	case V4L2_PIX_FMT_AV1:
> +		level = inst->fw_caps[LEVEL_AV1].value;
> +		break;
>  	}
>  
>  	inst_hfi_gen2->src_subcr_params.level = level;
> @@ -480,10 +488,12 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>  
>  static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
>  {
> -	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>  	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>  	u32 tier = inst->fw_caps[TIER].value;
>  
> +	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
> +							inst->fw_caps[TIER].value;
>  	inst_hfi_gen2->src_subcr_params.tier = tier;
>  
>  	return iris_hfi_gen2_session_set_property(inst,
> @@ -509,6 +519,56 @@ static int iris_hfi_gen2_set_frame_rate(struct iris_inst *inst, u32 plane)
>  						  sizeof(u32));
>  }
>  
> +static int iris_hfi_gen2_set_film_grain(struct iris_inst *inst, u32 plane)
> +{
> +	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	u32 film_grain;

u32 film_grain = inst->fw_caps[FILM_GRAIN].value;

> +
> +	film_grain = inst->fw_caps[FILM_GRAIN].value;
> +	inst_hfi_gen2->src_subcr_params.film_grain = film_grain;
> +
> +	return iris_hfi_gen2_session_set_property(inst,
> +						  HFI_PROP_AV1_FILM_GRAIN_PRESENT,
> +						  HFI_HOST_FLAGS_NONE,
> +						  port,
> +						  HFI_PAYLOAD_U32_ENUM,
> +						  &film_grain,
> +						  sizeof(u32));
> +}
> +
> +static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
> +{
> +	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	u32 super_block;
> +
> +	super_block = inst->fw_caps[SUPER_BLOCK].value;

u32 super_block = inst->fw_caps[SUPER_BLOCK].value;

> +	inst_hfi_gen2->src_subcr_params.super_block = super_block;
> +
> +	return iris_hfi_gen2_session_set_property(inst,
> +						  HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
> +						  HFI_HOST_FLAGS_NONE,
> +						  port,
> +						  HFI_PAYLOAD_U32_ENUM,
> +						  &super_block,
> +						  sizeof(u32));
> +}
> +
> +static int iris_hfi_gen2_set_opb_enable(struct iris_inst *inst, u32 plane)
> +{
> +	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	u32 opb_enable = iris_split_mode_enabled(inst);
> +
> +	return iris_hfi_gen2_session_set_property(inst,
> +						  HFI_PROP_OPB_ENABLE,
> +						  HFI_HOST_FLAGS_NONE,
> +						  port,
> +						  HFI_PAYLOAD_U32,
> +						  &opb_enable,
> +						  sizeof(u32));
> +}
> +

https://lore.kernel.org/linux-media/20251008-video-iris-ubwc-enable-v2-1-478ba2d96427@oss.qualcomm.com/
is adding the support for above.

>  static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_platform_data *pdata = inst->core->iris_platform_data;
> @@ -531,6 +591,9 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>  		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
>  		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
>  		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
> +		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
> +		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
> +		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
>  	};
>  
>  	if (inst->domain == DECODER) {
> @@ -544,12 +607,20 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>  			} else if (inst->codec == V4L2_PIX_FMT_VP9) {
>  				config_params = pdata->dec_input_config_params_vp9;
>  				config_params_size = pdata->dec_input_config_params_vp9_size;
> +			} else if (inst->codec == V4L2_PIX_FMT_AV1) {
> +				config_params = pdata->dec_input_config_params_av1;
> +				config_params_size = pdata->dec_input_config_params_av1_size;
>  			} else {
>  				return -EINVAL;
>  			}
>  		} else {
> -			config_params = pdata->dec_output_config_params;
> -			config_params_size = pdata->dec_output_config_params_size;
> +			if (inst->codec == V4L2_PIX_FMT_AV1) {
> +				config_params = pdata->dec_output_config_params_av1;
> +				config_params_size = pdata->dec_output_config_params_av1_size;
> +			} else {
> +				config_params = pdata->dec_output_config_params;
> +				config_params_size = pdata->dec_output_config_params_size;
> +			}

with
https://lore.kernel.org/linux-media/20251008-video-iris-ubwc-enable-v2-1-478ba2d96427@oss.qualcomm.com/,
this change will not be required.

>  		}
>  	} else {
>  		if (V4L2_TYPE_IS_OUTPUT(plane)) {
> @@ -598,6 +669,9 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
>  		break;
>  	case V4L2_PIX_FMT_VP9:
>  		codec = HFI_CODEC_DECODE_VP9;
> +		break;
> +	case V4L2_PIX_FMT_AV1:
> +		codec = HFI_CODEC_DECODE_AV1;
>  	}
>  
>  	iris_hfi_gen2_packet_session_property(inst,
> @@ -763,6 +837,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>  		change_param_size =
>  			core->iris_platform_data->dec_input_config_params_vp9_size;
>  		break;
> +	case V4L2_PIX_FMT_AV1:
> +		change_param = core->iris_platform_data->dec_input_config_params_av1;
> +		change_param_size =
> +			core->iris_platform_data->dec_input_config_params_av1_size;
> +		break;
>  	}
>  
>  	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
> @@ -845,6 +924,16 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>  				payload_size = sizeof(u32);
>  				payload_type = HFI_PAYLOAD_U32;
>  				break;
> +			case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
> +				payload[0] = subsc_params.film_grain;
> +				payload_size = sizeof(u32);
> +				payload_type = HFI_PAYLOAD_U32;
> +				break;
> +			case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
> +				payload[0] = subsc_params.super_block;
> +				payload_size = sizeof(u32);
> +				payload_type = HFI_PAYLOAD_U32;
> +				break;
>  			default:
>  				prop_type = 0;
>  				ret = -EINVAL;
> @@ -900,6 +989,11 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
>  			subscribe_prop_size =
>  				core->iris_platform_data->dec_output_prop_vp9_size;
>  			break;
> +		case V4L2_PIX_FMT_AV1:
> +			subcribe_prop = core->iris_platform_data->dec_output_prop_av1;
> +			subscribe_prop_size =
> +				core->iris_platform_data->dec_output_prop_av1_size;
> +			break;
>  		}
>  	}
>  
> @@ -1075,6 +1169,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
>  		return HFI_BUFFER_ARP;
>  	case BUF_VPSS:
>  		return HFI_BUFFER_VPSS;
> +	case BUF_PARTIAL:
> +		return HFI_BUFFER_PARTIAL_DATA;
>  	default:
>  		return 0;
>  	}
> @@ -1087,7 +1183,13 @@ static int iris_set_num_comv(struct iris_inst *inst)
>  	u32 num_comv;
>  
>  	caps = core->iris_platform_data->inst_caps;
> -	num_comv = caps->num_comv;
> +
> +	/*
> +	 * AV1 needs more comv buffers than other codecs.
> +	 * Update accordingly.
> +	 */
> +	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
> +				NUM_COMV_AV1 : caps->num_comv;
>  
>  	return core->hfi_ops->session_set_property(inst,
>  						   HFI_PROP_COMV_BUFFER_COUNT,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index bbfe7a0851ea94fb7041a868b4df8b2ec63bf427..9cc0989c67d74a9e051725e9ee571a2ab9160519 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -89,9 +89,18 @@ enum hfi_seq_header_mode {
>  #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
>  #define HFI_PROP_NO_OUTPUT			0x0300016a
>  #define HFI_PROP_BUFFER_MARK			0x0300016c
> +#define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
> +#define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
>  #define HFI_PROP_RAW_RESOLUTION		0x03000178
> +#define HFI_PROP_AV1_FILM_GRAIN_PRESENT		0x03000180
> +#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED	0x03000181
> +#define HFI_PROP_AV1_OP_POINT				0x03000182
> +#define HFI_PROP_OPB_ENABLE                 0x03000184
> +#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
> +#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
>  #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C

Pls maintain the order when adding new macro definitions.
This should go up.

>  #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
> +#define HFI_PROP_AV1_UNIFORM_TILE_SPACING	0x03000197
>  #define HFI_PROP_END				0x03FFFFFF
>  
>  #define HFI_SESSION_ERROR_BEGIN			0x04000000
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 2f1f118eae4f6462ab1aa1d16844b34e6e699f1e..eb3373f0ad4a1b26fb847db02449ec8d8cb3bdbb 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>  			return BUF_SCRATCH_2;
>  	case HFI_BUFFER_PERSIST:
>  		return BUF_PERSIST;
> +	case HFI_BUFFER_PARTIAL_DATA:
> +		return BUF_PARTIAL;
>  	default:
>  		return 0;
>  	}
> @@ -72,6 +74,7 @@ static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
>  	case HFI_BUFFER_DPB:
>  	case HFI_BUFFER_PERSIST:
>  	case HFI_BUFFER_VPSS:
> +	case HFI_BUFFER_PARTIAL_DATA:
>  		return true;
>  	default:
>  		return false;
> @@ -596,6 +599,10 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>  		inst->fw_caps[PROFILE_H264].value = subsc_params.profile;
>  		inst->fw_caps[LEVEL_H264].value = subsc_params.level;
>  		break;
> +	case V4L2_PIX_FMT_AV1:
> +		inst->fw_caps[PROFILE_AV1].value = subsc_params.profile;
> +		inst->fw_caps[LEVEL_AV1].value = subsc_params.level;
> +		break;
>  	}
>  
>  	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
> @@ -608,6 +615,11 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>  		iris_inst_change_state(inst, IRIS_INST_ERROR);
>  	}
>  
> +	if (inst->codec == V4L2_PIX_FMT_AV1) {
> +		inst->fw_caps[FILM_GRAIN].value = subsc_params.film_grain;
> +		inst->fw_caps[SUPER_BLOCK].value = subsc_params.super_block;
> +	}
> +
>  	inst->fw_min_count = subsc_params.fw_min_count;
>  	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>  	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
> @@ -711,6 +723,12 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
>  	case HFI_PROP_NO_OUTPUT:
>  		inst_hfi_gen2->hfi_frame_info.no_output = 1;
>  		break;
> +	case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
> +		inst_hfi_gen2->src_subcr_params.film_grain = pkt->payload[0];
> +		break;
> +	case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
> +		inst_hfi_gen2->src_subcr_params.super_block = pkt->payload[0];
> +		break;
>  	case HFI_PROP_QUALITY_MODE:
>  	case HFI_PROP_STAGE:
>  	case HFI_PROP_PIPE:
> @@ -841,6 +859,10 @@ static void iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
>  		subsc_params->profile = inst->fw_caps[PROFILE_H264].value;
>  		subsc_params->level = inst->fw_caps[LEVEL_H264].value;
>  		break;
> +	case V4L2_PIX_FMT_AV1:
> +		subsc_params->profile = inst->fw_caps[PROFILE_AV1].value;
> +		subsc_params->level = inst->fw_caps[LEVEL_AV1].value;
> +		break;
>  	}
>  
>  	subsc_params->pic_order_cnt = inst->fw_caps[POC].value;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 9aca70b4c0690f0d8d799e2a9976bd20d6bb8c94..19f0660f0388499ab71a1413b2c05f891bd5d511 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -100,6 +100,13 @@ enum platform_inst_fw_cap_type {
>  	LEVEL_H264,
>  	LEVEL_HEVC,
>  	LEVEL_VP9,
> +	PROFILE_AV1,
> +	LEVEL_AV1,
> +	TIER_AV1,
> +	DRAP,
> +	FILM_GRAIN,
> +	SUPER_BLOCK,
> +	ENH_LAYER_COUNT,
>  	INPUT_BUF_HOST_MAX_COUNT,
>  	OUTPUT_BUF_HOST_MAX_COUNT,
>  	STAGE,
> @@ -237,8 +244,12 @@ struct iris_platform_data {
>  	unsigned int dec_input_config_params_hevc_size;
>  	const u32 *dec_input_config_params_vp9;
>  	unsigned int dec_input_config_params_vp9_size;
> +	const u32 *dec_input_config_params_av1;
> +	unsigned int dec_input_config_params_av1_size;
>  	const u32 *dec_output_config_params;
>  	unsigned int dec_output_config_params_size;
> +	const u32 *dec_output_config_params_av1;
> +	unsigned int dec_output_config_params_av1_size;
>  	const u32 *enc_input_config_params;
>  	unsigned int enc_input_config_params_size;
>  	const u32 *enc_output_config_params;
> @@ -251,6 +262,8 @@ struct iris_platform_data {
>  	unsigned int dec_output_prop_hevc_size;
>  	const u32 *dec_output_prop_vp9;
>  	unsigned int dec_output_prop_vp9_size;
> +	const u32 *dec_output_prop_av1;
> +	unsigned int dec_output_prop_av1_size;
>  	const u32 *dec_ip_int_buf_tbl;
>  	unsigned int dec_ip_int_buf_tbl_size;
>  	const u32 *dec_op_int_buf_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 15a38b7122af6d978fac433e8c02b4da5c141e1a..600664b2aea88067a7f66a20beaacd42181f9532 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -64,6 +64,16 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>  		.set = iris_set_u32_enum,
>  	},
> +	{
> +		.cap_id = PROFILE_AV1,
> +		.min = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
> +		.max = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN),
> +		.value = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
>  	{
>  		.cap_id = PROFILE_VP9,
>  		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> @@ -147,6 +157,33 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>  		.set = iris_set_u32_enum,
>  	},
> +	{
> +		.cap_id = LEVEL_AV1,
> +		.min = V4L2_MPEG_VIDEO_AV1_LEVEL_2_0,
> +		.max = V4L2_MPEG_VIDEO_AV1_LEVEL_6_1,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_0) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_2) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_3) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_0) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_2) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_3) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_0) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_2) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_3) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_0) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_1) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_2) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_3) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_6_0) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_6_1),
> +		.value = V4L2_MPEG_VIDEO_AV1_LEVEL_6_1,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
>  	{
>  		.cap_id = TIER,
>  		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
> @@ -158,6 +195,53 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>  		.set = iris_set_u32_enum,
>  	},
> +	{
> +		.cap_id = TIER_AV1,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_TIER,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = DRAP,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_AV1_DRAP_CONFIG,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},

In the current design, this property would be set for even non-av1 case,
hope you checked that its OK and doesn't create any issue with other
codecs, same applies to TIER_AV1.

> +	{
> +		.cap_id = FILM_GRAIN,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_AV1_FILM_GRAIN_PRESENT,
> +		.flags = CAP_FLAG_VOLATILE,
> +	},
> +	{
> +		.cap_id = SUPER_BLOCK,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
> +	},
> +	{
> +		.cap_id = ENH_LAYER_COUNT,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_AV1_OP_POINT,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
>  	{
>  		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
>  		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> @@ -701,6 +785,19 @@ static const u32 sm8550_vdec_input_config_param_vp9[] = {
>  	HFI_PROP_LEVEL,
>  };
>  
> +static const u32 sm8550_vdec_input_config_param_av1[] = {
> +	HFI_PROP_BITSTREAM_RESOLUTION,
> +	HFI_PROP_CROP_OFFSETS,
> +	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> +	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
> +	HFI_PROP_PROFILE,
> +	HFI_PROP_LEVEL,
> +	HFI_PROP_TIER,
> +	HFI_PROP_AV1_FILM_GRAIN_PRESENT,
> +	HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
> +	HFI_PROP_SIGNAL_COLOR_INFO,
> +};
> +
>  static const u32 sm8550_venc_input_config_params[] = {
>  	HFI_PROP_COLOR_FORMAT,
>  	HFI_PROP_RAW_RESOLUTION,
> @@ -714,6 +811,12 @@ static const u32 sm8550_vdec_output_config_params[] = {
>  	HFI_PROP_LINEAR_STRIDE_SCANLINE,
>  };
>  
> +static const u32 sm8550_vdec_output_config_param_av1[] = {
> +	HFI_PROP_OPB_ENABLE,
> +	HFI_PROP_COLOR_FORMAT,
> +	HFI_PROP_LINEAR_STRIDE_SCANLINE,
> +};
> +
>  static const u32 sm8550_venc_output_config_params[] = {
>  	HFI_PROP_BITSTREAM_RESOLUTION,
>  	HFI_PROP_CROP_OFFSETS,
> @@ -737,11 +840,18 @@ static const u32 sm8550_vdec_subscribe_output_properties_vp9[] = {
>  	HFI_PROP_PICTURE_TYPE,
>  };
>  
> +static const u32 sm8550_vdec_subscribe_output_properties_av1[] = {
> +	HFI_PROP_PICTURE_TYPE,
> +	HFI_PROP_WORST_COMPRESSION_RATIO,
> +	HFI_PROP_WORST_COMPLEXITY_FACTOR,
> +};
> +
>  static const u32 sm8550_dec_ip_int_buf_tbl[] = {
>  	BUF_BIN,
>  	BUF_COMV,
>  	BUF_NON_COMV,
>  	BUF_LINE,
> +	BUF_PARTIAL,
>  };
>  
>  static const u32 sm8550_dec_op_int_buf_tbl[] = {
> @@ -806,11 +916,18 @@ struct iris_platform_data sm8550_data = {
>  		sm8550_vdec_input_config_param_vp9,
>  	.dec_input_config_params_vp9_size =
>  		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_input_config_params_av1 =
> +		sm8550_vdec_input_config_param_av1,
> +	.dec_input_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>  	.dec_output_config_params =
>  		sm8550_vdec_output_config_params,
>  	.dec_output_config_params_size =
>  		ARRAY_SIZE(sm8550_vdec_output_config_params),
> -
> +	.dec_output_config_params_av1 =
> +		sm8550_vdec_output_config_param_av1,
> +	.dec_output_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_param_av1),
>  	.enc_input_config_params =
>  		sm8550_venc_input_config_params,
>  	.enc_input_config_params_size =
> @@ -831,6 +948,9 @@ struct iris_platform_data sm8550_data = {
>  	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>  	.dec_output_prop_vp9_size =
>  		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>  
>  	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>  	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> @@ -900,10 +1020,18 @@ struct iris_platform_data sm8650_data = {
>  		sm8550_vdec_input_config_param_vp9,
>  	.dec_input_config_params_vp9_size =
>  		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_input_config_params_av1 =
> +		sm8550_vdec_input_config_param_av1,
> +	.dec_input_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>  	.dec_output_config_params =
>  		sm8550_vdec_output_config_params,
>  	.dec_output_config_params_size =
>  		ARRAY_SIZE(sm8550_vdec_output_config_params),
> +	.dec_output_config_params_av1 =
> +		sm8550_vdec_output_config_param_av1,
> +	.dec_output_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_param_av1),
>  
>  	.enc_input_config_params =
>  		sm8550_venc_input_config_params,
> @@ -925,6 +1053,9 @@ struct iris_platform_data sm8650_data = {
>  	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>  	.dec_output_prop_vp9_size =
>  		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>  
>  	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>  	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 8342a0b6f825b385192baedfc67c50bba7661470..0297756a3724181498ed8e5776dd5b872f1d4304 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -11,6 +11,7 @@
>  #include "iris_hfi_gen1_defines.h"
>  #include "iris_vpu_buffer.h"
>  #include "iris_vpu_common.h"
> +#include "iris_instance.h"

why is this change needed here?

Thanks,
Dikshita

>  
>  #define BITRATE_MIN		32000
>  #define BITRATE_MAX		160000000
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index d38d0f6961cd5cb9929e2aecbec7353dcc2d4a7d..05eec18f937a51d3c081d0f98a8ffa6bbd30d166 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -178,6 +178,7 @@ int iris_open(struct file *filp)
>  	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_1].list);
>  	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
>  	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
> +	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
>  	init_completion(&inst->completion);
>  	init_completion(&inst->flush_completion);
>  
> 

