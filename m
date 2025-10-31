Return-Path: <linux-media+bounces-46050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB8FC237F2
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 08:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 231613B0E7C
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 07:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B25E31BC96;
	Fri, 31 Oct 2025 07:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H678zCAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kbdGWq9z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBA631D371
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 07:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761894449; cv=none; b=bbcoToRueaBYU0GIlqLt/2vndFvfqQF3OnbhFYc02b44UoudAzBDqmZEowFMNufj7glQjP+nkcN39Lkt+kwoXPBhfGaZ5ups9mfWPPQ0hTKrQqdU19pDGqjgW7596vIHYf9PPHMkKs8lcJffR09LtZdAi3pUUVpJluNfZmi54is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761894449; c=relaxed/simple;
	bh=ZxcXMVE8xN4IeU05v/z8dSpAk1rMX+uevUl2DBC7ofA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SNQ3Rk0BwocFipEWAwU+8KobgEK9ZG5EzauXN0Gl17rFI/Oh9COHXHxfBoMAbuXXJr4Anlazq9brkUGqTmqXUA0GGlv22yvhYsDJB3Qaf8/ydI8Eb/LSVhAM0aVuAWABJqWuS58cQponPMJlVSSPiKyLHSdPYBBWPsqeGtvOmuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H678zCAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kbdGWq9z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59ULrQ3k898142
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 07:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TCgcRF7pCUV20RbExg6CJ1ptqTw7+3uWzfDaCLXGZQ0=; b=H678zCAYGvyQ8uoA
	yekN9g6gkJMJZLY1ugd2mTf8wBcO44M4d1kZQqmkDuvXYS6Jbzjsohw/KEjOiWZa
	Evo5ONYBSjZ5I1vT7SE3uNyVxNNUdMvOV8tF8LlJV/jWuY7C7nhMyzlknCprIsz9
	rfKQdvtkO38f4pkBORplYx4QspsS/V5syPAhj5vvIp5FArVlubb5a/qs4y6EKz4g
	nyF+nY9R1sJNhh0cwTrHLyqdmWSe2s/RmJw+CWyigNf/16bfvAfdS4s4Y0HsOtJY
	fCvPu1zBiuFDqqqEL8ABywyAIRNlHFOsaPQCiI+5VN3V5XzZgnEPH3dyfuhLKfsZ
	Z2i9GA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4gb2156y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 07:07:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a2743995b2so3649790b3a.3
        for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 00:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761894446; x=1762499246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TCgcRF7pCUV20RbExg6CJ1ptqTw7+3uWzfDaCLXGZQ0=;
        b=kbdGWq9zMNXXGYb3nFvBtl7/65tDXh7L/qS5A+9F1nHQZOM3wjat57LjaW5OLbZ5F3
         J6TZZ8rmpwZJHGlpRLnWF0vrOvv/JFXRM4HDNX7xgh4RRg8upa7QCPJz8BXpQP/RgPrI
         JaTx36lP3Q25B4T3fnR7iueKvzgkQ2JaQxoASK+DonKWmqm3DXexwvRx1rOP60CMtoUo
         qamUKeslY321l0pTpvNGim/+Rn4MbuJRG9Z4ml8+7YQBwsebyAHFtu7iVe5FxL5uGbN4
         d1xVN40QUHbQK76/U6/ptl6lQ+oJVSliBUFtPxl8lXV4wQt2l0YkO/WurWJuM9N+7rdJ
         bcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761894446; x=1762499246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TCgcRF7pCUV20RbExg6CJ1ptqTw7+3uWzfDaCLXGZQ0=;
        b=K4slW+Ic+jM0fVRN6kjkSNJa2K54rt4bB1chsTeI1qrtnPhUuA6w7ZXZoE4mJxbQ/j
         wPRw8pT00KzLFOj2gjQB4j4T57IiKLVtchOgfx+vSYhwIj3R42bdf5uvGUo5LN6uquLm
         DdyM12x+K16Iz3rh5SCTM0rq6szVfr05qRUKAS/4eLOTRZilrIqRvNCSVgiFoVmeoZJq
         azJInUGzNXJGrzL9rcm6cKAXyI1i3vBHODTVAq9vSs753wpU8QtdgophjwiVz7koBW87
         eEUaVKp+SjWDQ/3fCt57KUgrISyarTm6Ytoc19lhjReWVFO5DLDeAsoIBl8sqjAvqrLY
         SwiA==
X-Gm-Message-State: AOJu0Yxda8fD2to182DBnVV2CBbnDLDmQFbfIOPPM9uLKBkvRxUzUOJX
	fAB8HllxF6OS9u/DY1Q2NK8tWTtmbzpRZGDh7xqM4bbnUsVSwB2Lh4fWzmI/tCkh9aCaZtqmO8H
	XQYMU5OAk4MI9JXZz/82c2tnOAQ65k4BkK5VQHcx4xP+n9whsOi9e1ApNARfx//Ogfw==
X-Gm-Gg: ASbGncuXAbQJjGXSfexNyqUERnWfWc11ztZMaMDFOcdGCQMxXXpd10UDmt8kVvZ7bic
	mSIPoV6sq/8gsENAcVR55eqFW5SH5Or6kxiG84GKCMa7xUJtD+3UHZDBz6Qc0e/WXRGG/n6sAJG
	Cx5gyfurpdUTuAKmgh1USjVpF/4Osp5LkJkX4tFYISiDSuhN56FpBIP7Q8h2BL3dFwwf95B/6z8
	DJNbSoNUQFepbnpdp8oDtkVoi2kyD1XWH5VacsfwZyj7kF5ejIeiQs4bAlUVlP/SFjgZs6cUAXf
	Jap+zQJk30gbiSJcezP24J8jVvv0k53F3hBUK09xQff+6qQhUUK0gNv5xf8FkS41+g7e3X0lvYL
	CQ3voYGW5M5nwiTreiYbD7DKslafLbpw=
X-Received: by 2002:a05:6a00:3e1f:b0:781:8680:3175 with SMTP id d2e1a72fcca58-7a7788ffd27mr3131028b3a.21.1761894445926;
        Fri, 31 Oct 2025 00:07:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1gqIuSX46I9cv82SCQXSnGBERXn2UygItSlULmI77GvaSGK+LpewAfCNl+01hxSxqgPT/JA==
X-Received: by 2002:a05:6a00:3e1f:b0:781:8680:3175 with SMTP id d2e1a72fcca58-7a7788ffd27mr3130981b3a.21.1761894445283;
        Fri, 31 Oct 2025 00:07:25 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db676f11sm1052641b3a.52.2025.10.31.00.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 00:07:24 -0700 (PDT)
Message-ID: <950010c2-4b86-7530-bb3a-c7997bfcef66@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 12:37:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/5] media: iris: Define AV1-specific platform
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
References: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
 <20251030-av1d_stateful_v3-v3-4-a1184de52fc4@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251030-av1d_stateful_v3-v3-4-a1184de52fc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=efswvrEH c=1 sm=1 tr=0 ts=6904602e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=SJrdC1_lA80DVDsO20YA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA2NCBTYWx0ZWRfXwRiqU6XcM2Kt
 fEdfS/A0gTzvhfUidcSYhA1IE9NL5hKZw3X0JZJL7Ky04znlbIFerTsqlpc5Ke3pHUVwNsxHgvL
 lk+5RtYQACAm9Ce/7HRThxQweA4H9NtvTABI1bCscJm/84gzDLIwuGOJNYckmljxypKeHi7HvRR
 vVHTqBROMrfEuVlK0i9N0Re/MifaTLBDaNQu1EHIJupozhOc6w8u6g2by/151vZ3uXYRErxxm2d
 4B+G7veeNZhxijYjtf/EWcGHoY2fTttbxK685pU1fOu5Ti6+zxDLUEnjGlTm4VReJ+repf4J/JB
 VmgL/ln+DTox9ozuszaJ1WiitWGgDQSOGQzdEU35Baa098SBt5sOWEIyswzPDZO15iKk4eArmpr
 0CyLTxjpvLnPK2r/D13NX3IKj3iTBQ==
X-Proofpoint-GUID: kpaFID3rSFC5JBPgWjpeuZSYkQeb4sM-
X-Proofpoint-ORIG-GUID: kpaFID3rSFC5JBPgWjpeuZSYkQeb4sM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310064



On 10/30/2025 12:30 PM, Deepa Guthyappa Madivalara wrote:
> Defining platform specific capabilities specific to AV1 decoder.
> Set and subscribe to manadatory properties to firmware for AV1.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 ++
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  94 ++++++++++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  10 +-
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++++
>  .../platform/qcom/iris/iris_platform_common.h      |  13 ++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 133 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
>  9 files changed, 279 insertions(+), 6 deletions(-)
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
> index 6a772db2ec33fb002d8884753a41dc98b3a8439d..ee99ba206b64bb3367d0a1cdd7634e3241f9ed83 100644
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
> @@ -496,10 +504,12 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
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
> @@ -525,6 +535,40 @@ static int iris_hfi_gen2_set_frame_rate(struct iris_inst *inst, u32 plane)
>  						  sizeof(u32));
>  }
>  
> +static int iris_hfi_gen2_set_film_grain(struct iris_inst *inst, u32 plane)
> +{
> +	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	u32 film_grain = inst->fw_caps[FILM_GRAIN].value;
> +
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
> +	u32 super_block = inst->fw_caps[SUPER_BLOCK].value;
> +
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
>  static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_platform_data *pdata = inst->core->iris_platform_data;
> @@ -548,6 +592,9 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>  		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
>  		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
>  		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
> +		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
> +		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
> +		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
>  	};
>  
>  	if (inst->domain == DECODER) {
> @@ -561,12 +608,20 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
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
>  		}
>  	} else {
>  		if (V4L2_TYPE_IS_OUTPUT(plane)) {
> @@ -615,6 +670,9 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
>  		break;
>  	case V4L2_PIX_FMT_VP9:
>  		codec = HFI_CODEC_DECODE_VP9;
> +		break;
> +	case V4L2_PIX_FMT_AV1:
> +		codec = HFI_CODEC_DECODE_AV1;
>  	}
>  
>  	iris_hfi_gen2_packet_session_property(inst,
> @@ -780,6 +838,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
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
> @@ -862,6 +925,16 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
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
> @@ -917,6 +990,11 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
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
> @@ -1092,6 +1170,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
>  		return HFI_BUFFER_ARP;
>  	case BUF_VPSS:
>  		return HFI_BUFFER_VPSS;
> +	case BUF_PARTIAL:
> +		return HFI_BUFFER_PARTIAL_DATA;
>  	default:
>  		return 0;
>  	}
> @@ -1104,7 +1184,13 @@ static int iris_set_num_comv(struct iris_inst *inst)
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
> index 3d56f257bc5620aacec2bb7e11253dc7c83b7db9..12b4c6517bf094e3e98332a1b2b70ac5a349b863 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -89,10 +89,18 @@ enum hfi_seq_header_mode {
>  #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
>  #define HFI_PROP_NO_OUTPUT			0x0300016a
>  #define HFI_PROP_BUFFER_MARK			0x0300016c
> +#define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
> +#define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
>  #define HFI_PROP_RAW_RESOLUTION		0x03000178
>  #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
> -#define HFI_PROP_OPB_ENABLE			0x03000184
> +#define HFI_PROP_AV1_FILM_GRAIN_PRESENT		0x03000180
> +#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED	0x03000181
> +#define HFI_PROP_AV1_OP_POINT				0x03000182
> +#define HFI_PROP_OPB_ENABLE                 0x03000184
> +#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
> +#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
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
> index 3b61723dbf27e9ba8d427686e44cf048a0ab7c5b..9ac5541f528741e45b31634230da44d53012e659 100644
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
> @@ -715,6 +812,12 @@ static const u32 sm8550_vdec_output_config_params[] = {
>  	HFI_PROP_LINEAR_STRIDE_SCANLINE,
>  };
>  
> +static const u32 sm8550_vdec_output_config_param_av1[] = {
> +	HFI_PROP_OPB_ENABLE,
> +	HFI_PROP_COLOR_FORMAT,
> +	HFI_PROP_LINEAR_STRIDE_SCANLINE,
> +};

why do you still need this new structure?
it is same as sm8550_vdec_output_config_params, please reuse.

Thanks,
Dikshita
> +
>  static const u32 sm8550_venc_output_config_params[] = {
>  	HFI_PROP_BITSTREAM_RESOLUTION,
>  	HFI_PROP_CROP_OFFSETS,
> @@ -738,11 +841,18 @@ static const u32 sm8550_vdec_subscribe_output_properties_vp9[] = {
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
> @@ -807,11 +917,18 @@ struct iris_platform_data sm8550_data = {
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
> @@ -832,6 +949,9 @@ struct iris_platform_data sm8550_data = {
>  	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>  	.dec_output_prop_vp9_size =
>  		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>  
>  	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>  	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> @@ -901,10 +1021,18 @@ struct iris_platform_data sm8650_data = {
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
> @@ -926,6 +1054,9 @@ struct iris_platform_data sm8650_data = {
>  	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>  	.dec_output_prop_vp9_size =
>  		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>  
>  	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>  	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
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

