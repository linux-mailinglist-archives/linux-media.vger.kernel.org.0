Return-Path: <linux-media+bounces-27665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5852A53F64
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 01:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C9DB16EACA
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 00:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8223D3DBB6;
	Thu,  6 Mar 2025 00:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oMS+/gaa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8184C1F95C
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 00:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741222341; cv=none; b=QQP015wFrj4A1fRHn9LLbF15hgR8rxSFGpazfQ1HuxgiQMPOoccasJB2cNFx4jr7WkSFImJWvzRxn2ISoJod7T6j+z8ZFq4/kZ0K7XXcNr7fHC8gXmEsboGGQ1y3tflK8Wepj5E19nmQA6owtinNJ8qf0uElJ2ncEJk3S6DmtRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741222341; c=relaxed/simple;
	bh=Tjip/ad+SPUgz0IlY8he0t9q6LTni/sLlgD346oWw8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cNZ3skXqSlxB92h0UhW0zy2rxHiRUZyNUj/oB01XgMXUkAkvSVs8aIHWToiUq5ibKqduD4iE+OmgfeeoiLpERKQe3uASYG5qV9itioewGRatSrMKwOqQ2XNR0YS6GPxt3vI4bzccOqlZul5suB5bluaF3HbO41VUgE1MhSq46lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oMS+/gaa; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bdc607c3fso218355e9.3
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 16:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741222337; x=1741827137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtQSEnTxKwLGrerPU5Pktc/xc4dhaexJ2IEbSXCV0fs=;
        b=oMS+/gaa7xXhkit9xKt+mKscmDJXMsXWjtjvrJ5xmOTrA41BO7e1QxA1RSKZTgTJtK
         mEKJylQcfak8ykcNNJ/gTA5unmkKd3QeLs+5yhv52tU1eg1el+MNtc2bDyWS7jXSyCwV
         2uj8d8XYvaDIyz0D+T+ej6foUqA9MlKDV1648bAVyaF3WCUlEzDZpcnmOpLiksNifXps
         OlHnQrm/SburgsqXi4/IFkCyJUXUTEo9q/XVneWzd8WiPIf/TeyAdtfjUNnJD3MNGWmH
         E4+mQLNYK1lB+ZNWzSClotmEKse55OgNFpk2mOkHW5iVDspjr2Ou0Gr9QXhWzMCQVfno
         djvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741222337; x=1741827137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtQSEnTxKwLGrerPU5Pktc/xc4dhaexJ2IEbSXCV0fs=;
        b=FzFCH3h7unRhWTTdQvztkTqwsPtVjKkZalMD9r1BnyC+1wa3n3yWEATZXffk2Dw2hF
         3TT6zgi/gbBdOAVzQgu7bUNxI0Rjl8SOzHi9s+bRNnRHJV0csUz6hc5kQyL0hKaRAwrW
         qTd4znlHTuZPZ5TI5JKbWWE+gVuxd5HUlJI3Ms69DRvvAsjhjBBm7zx5RAWknOokw5fz
         tYjGzbwf5qEwk8IefeQDp1LbzirqJUdX0jkITvaNElNx8riyxjdCfmMGaoebd1a29HDD
         +Nxvk+0cIa76zjCAmqq7Oj8NkM8NWvPsZ7u8fod2ru1PQPvpZ/S+mUDpx2F2xgjfC47Y
         iHxA==
X-Forwarded-Encrypted: i=1; AJvYcCW6n4OUND7vdZiwu8MAKWLd6tOl6DJ5r9uedcZCeFfohdT4OhLhcd25qSwsvtxlVSzK0wc7mI5AIn+wuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlj8Jfnye08lVTSu96h569xXmMZ70Rm1MYYJ/VslTOa/B9dMb8
	W9CX15MDuAHKBUQYOuFB/To27KWnuuPn/FIdSGsDwcxa5HppdURLDzrXcwdcWn4=
X-Gm-Gg: ASbGncur/37D/0JvhmNtk8n3pHFfYTunB7BoUDtqBdSdnTTYT/zNsa1Oxeynzby+CSc
	alvyk7CNslmzzOWnThNy/9OX7CmCMcwJsz/2yt2u0xR5i/DqGewRvObeLNnGwX6WD8oE0nnphkn
	wD7iBYkRZnqFGsA9O2TFYJrou6EF/STAuuFQV2cIl8HOIj/R2zgKhCntSw3Azv51JbjCJskBXOL
	7d4OzMijJnAznMEtEXqs1DgFYe+N1IUYM3cbXe8JkGNCSOYGJCIE66zFWCZ3ISrc6jDiTYPtNJD
	lJiFIgS9UgqD5cjl6/48/zpcLeq3mIByrGNaNYSVtdrClMChltIIXSrUsIQo/NINBZdy04bhrpQ
	hmkl0dH8Dbw==
X-Google-Smtp-Source: AGHT+IH7lVvepjt/pTD5dyqr25GUGFKsbWSSMtDI6B6LGkC7FjYCPzBcVv0YcssF4IE1NL6kjLGGTA==
X-Received: by 2002:a05:600c:5112:b0:439:a1ad:6851 with SMTP id 5b1f17b1804b1-43bd2ae1663mr35394055e9.23.1741222336504;
        Wed, 05 Mar 2025 16:52:16 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8dad73sm3048585e9.19.2025.03.05.16.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 16:52:15 -0800 (PST)
Message-ID: <927e9a50-d46d-47ee-8edd-bef3f9894093@linaro.org>
Date: Thu, 6 Mar 2025 00:52:13 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/12] media: iris: Set mandatory properties for HEVC
 and VP9 decoders.
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, quic_vgarodia@quicinc.com,
 quic_abhinavk@quicinc.com, mchehab@kernel.org
Cc: hverkuil@xs4all.nl, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-4-quic_dikshita@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250305104335.3629945-4-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2025 10:43, Dikshita Agarwal wrote:
> Subscribe and set mandatory properties to the firmware for HEVC and VP9
> decoders.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   .../platform/qcom/iris/iris_hfi_common.h      |  1 +
>   .../qcom/iris/iris_hfi_gen1_command.c         |  4 +-
>   .../qcom/iris/iris_hfi_gen2_command.c         | 83 +++++++++++++++++--
>   .../qcom/iris/iris_hfi_gen2_response.c        |  7 ++
>   .../platform/qcom/iris/iris_platform_common.h | 16 +++-
>   .../platform/qcom/iris/iris_platform_sm8250.c |  4 +-
>   .../platform/qcom/iris/iris_platform_sm8550.c | 61 ++++++++++++--
>   7 files changed, 151 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index b2c541367fc6..9e6aadb83783 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -140,6 +140,7 @@ struct hfi_subscription_params {
>   	u32	color_info;
>   	u32	profile;
>   	u32	level;
> +	u32	tier;
>   };
>   
>   u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 1e774b058ab9..a160ae915886 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -784,8 +784,8 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
>   			iris_hfi_gen1_set_bufsize},
>   	};
>   
> -	config_params = core->iris_platform_data->input_config_params;
> -	config_params_size = core->iris_platform_data->input_config_params_size;
> +	config_params = core->iris_platform_data->input_config_params_default;
> +	config_params_size = core->iris_platform_data->input_config_params_default_size;
>   
>   	if (V4L2_TYPE_IS_OUTPUT(plane)) {
>   		for (i = 0; i < config_params_size; i++) {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index a3ebcda9a2ba..5b4c89184297 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -192,7 +192,7 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst)
>   						  sizeof(u64));
>   }
>   
> -static int iris_hfi_gen2_set_bit_dpeth(struct iris_inst *inst)
> +static int iris_hfi_gen2_set_bit_depth(struct iris_inst *inst)
>   {
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>   	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> @@ -407,6 +407,23 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst)
>   						  sizeof(u64));
>   }
>   
> +static int iris_hfi_gen2_set_tier(struct iris_inst *inst)
> +{
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	u32 tier = inst->fw_caps[TIER].value;
> +
> +	inst_hfi_gen2->src_subcr_params.tier = tier;
> +
> +	return iris_hfi_gen2_session_set_property(inst,
> +						  HFI_PROP_TIER,
> +						  HFI_HOST_FLAGS_NONE,
> +						  port,
> +						  HFI_PAYLOAD_U32_ENUM,
> +						  &tier,
> +						  sizeof(u32));
> +}
> +
>   static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
>   {
>   	struct iris_core *core = inst->core;
> @@ -418,7 +435,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>   		{HFI_PROP_BITSTREAM_RESOLUTION,       iris_hfi_gen2_set_bitstream_resolution   },
>   		{HFI_PROP_CROP_OFFSETS,               iris_hfi_gen2_set_crop_offsets           },
>   		{HFI_PROP_CODED_FRAMES,               iris_hfi_gen2_set_coded_frames           },
> -		{HFI_PROP_LUMA_CHROMA_BIT_DEPTH,      iris_hfi_gen2_set_bit_dpeth              },
> +		{HFI_PROP_LUMA_CHROMA_BIT_DEPTH,      iris_hfi_gen2_set_bit_depth              },
>   		{HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT, iris_hfi_gen2_set_min_output_count       },
>   		{HFI_PROP_PIC_ORDER_CNT_TYPE,         iris_hfi_gen2_set_picture_order_count    },
>   		{HFI_PROP_SIGNAL_COLOR_INFO,          iris_hfi_gen2_set_colorspace             },
> @@ -426,11 +443,25 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>   		{HFI_PROP_LEVEL,                      iris_hfi_gen2_set_level                  },
>   		{HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
>   		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
> +		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
>   	};
>   
>   	if (V4L2_TYPE_IS_OUTPUT(plane)) {
> -		config_params = core->iris_platform_data->input_config_params;
> -		config_params_size = core->iris_platform_data->input_config_params_size;
> +		if (inst->codec == V4L2_PIX_FMT_H264) {
> +			config_params = core->iris_platform_data->input_config_params_default;
> +			config_params_size =
> +				core->iris_platform_data->input_config_params_default_size;
> +		} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +			config_params = core->iris_platform_data->input_config_params_hevc;
> +			config_params_size =
> +				core->iris_platform_data->input_config_params_hevc_size;
> +		} else if (inst->codec == V4L2_PIX_FMT_VP9) {
> +			config_params = core->iris_platform_data->input_config_params_vp9;
> +			config_params_size =
> +				core->iris_platform_data->input_config_params_vp9_size;
> +		} else {
> +			return -EINVAL;
> +		}
>   	} else {
>   		config_params = core->iris_platform_data->output_config_params;
>   		config_params_size = core->iris_platform_data->output_config_params_size;
> @@ -600,8 +631,21 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>   		return 0;
>   	}
>   
> -	change_param = core->iris_platform_data->input_config_params;
> -	change_param_size = core->iris_platform_data->input_config_params_size;
> +	if (inst->codec == V4L2_PIX_FMT_H264) {
> +		change_param = core->iris_platform_data->input_config_params_default;
> +		change_param_size =
> +			core->iris_platform_data->input_config_params_default_size;
> +	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +		change_param = core->iris_platform_data->input_config_params_hevc;
> +		change_param_size =
> +			core->iris_platform_data->input_config_params_hevc_size;
> +	} else if (inst->codec == V4L2_PIX_FMT_VP9) {
> +		change_param = core->iris_platform_data->input_config_params_vp9;
> +		change_param_size =
> +			core->iris_platform_data->input_config_params_vp9_size;
> +	} else {
> +		return -EINVAL;
> +	}

I'm not a massive fan of multi-clause if/elses - in this particular case 
this will grow and grow into something very sprawling.

Grateful if you'd switch() this.

>   
>   	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
>   
> @@ -648,6 +692,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>   				payload_size = sizeof(u32);
>   				payload_type = HFI_PAYLOAD_U32;
>   				break;
> +			case HFI_PROP_LUMA_CHROMA_BIT_DEPTH:
> +				payload[0] = subsc_params.bit_depth;
> +				payload_size = sizeof(u32);
> +				payload_type = HFI_PAYLOAD_U32;
> +				break;
>   			case HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT:
>   				payload[0] = subsc_params.fw_min_count;
>   				payload_size = sizeof(u32);
> @@ -673,6 +722,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>   				payload_size = sizeof(u32);
>   				payload_type = HFI_PAYLOAD_U32;
>   				break;
> +			case HFI_PROP_TIER:
> +				payload[0] = subsc_params.tier;
> +				payload_size = sizeof(u32);
> +				payload_type = HFI_PAYLOAD_U32;
> +				break;
>   			default:
>   				prop_type = 0;
>   				ret = -EINVAL;
> @@ -709,8 +763,21 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
>   		subscribe_prop_size = core->iris_platform_data->dec_input_prop_size;
>   		subcribe_prop = core->iris_platform_data->dec_input_prop;
>   	} else {
> -		subscribe_prop_size = core->iris_platform_data->dec_output_prop_size;
> -		subcribe_prop = core->iris_platform_data->dec_output_prop;
> +		if (inst->codec == V4L2_PIX_FMT_H264) {
> +			subcribe_prop = core->iris_platform_data->dec_output_prop_avc;
> +			subscribe_prop_size =
> +				core->iris_platform_data->dec_output_prop_avc_size;
> +		} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +			subcribe_prop = core->iris_platform_data->dec_output_prop_hevc;
> +			subscribe_prop_size =
> +				core->iris_platform_data->dec_output_prop_hevc_size;
> +		} else if (inst->codec == V4L2_PIX_FMT_VP9) {
> +			subcribe_prop = core->iris_platform_data->dec_output_prop_vp9;
> +			subscribe_prop_size =
> +				core->iris_platform_data->dec_output_prop_vp9_size;
> +		} else {
> +			return -EINVAL;
> +		}

Same here, this code will be neater IMO as a swtich statement as it 
grows with new codecs.

>   	}
>   
>   	for (i = 0; i < subscribe_prop_size; i++)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 809bf0f238bd..6846311a26c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -580,6 +580,7 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>   	}
>   
>   	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
> +	inst->fw_caps[TIER].value = subsc_params.tier;
>   
>   	if (subsc_params.bit_depth != BIT_DEPTH_8 ||
>   	    !(subsc_params.coded_frames & HFI_BITMASK_FRAME_MBS_ONLY_FLAG)) {
> @@ -664,6 +665,9 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
>   		inst_hfi_gen2->src_subcr_params.crop_offsets[0] = pkt->payload[0];
>   		inst_hfi_gen2->src_subcr_params.crop_offsets[1] = pkt->payload[1];
>   		break;
> +	case HFI_PROP_LUMA_CHROMA_BIT_DEPTH:
> +		inst_hfi_gen2->src_subcr_params.bit_depth = pkt->payload[0];
> +		break;
>   	case HFI_PROP_CODED_FRAMES:
>   		inst_hfi_gen2->src_subcr_params.coded_frames = pkt->payload[0];
>   		break;
> @@ -682,6 +686,9 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
>   	case HFI_PROP_LEVEL:
>   		inst_hfi_gen2->src_subcr_params.level = pkt->payload[0];
>   		break;
> +	case HFI_PROP_TIER:
> +		inst_hfi_gen2->src_subcr_params.tier = pkt->payload[0];
> +		break;
>   	case HFI_PROP_PICTURE_TYPE:
>   		inst_hfi_gen2->hfi_frame_info.picture_type = pkt->payload[0];
>   		break;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 67204cddd44a..433ce9b00c68 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -174,14 +174,22 @@ struct iris_platform_data {
>   	u32 num_vpp_pipe;
>   	u32 max_session_count;
>   	u32 max_core_mbpf;
> -	const u32 *input_config_params;
> -	unsigned int input_config_params_size;
> +	const u32 *input_config_params_default;
> +	unsigned int input_config_params_default_size;
> +	const u32 *input_config_params_hevc;
> +	unsigned int input_config_params_hevc_size;
> +	const u32 *input_config_params_vp9;
> +	unsigned int input_config_params_vp9_size;
>   	const u32 *output_config_params;
>   	unsigned int output_config_params_size;
>   	const u32 *dec_input_prop;
>   	unsigned int dec_input_prop_size;
> -	const u32 *dec_output_prop;
> -	unsigned int dec_output_prop_size;
> +	const u32 *dec_output_prop_avc;
> +	unsigned int dec_output_prop_avc_size;
> +	const u32 *dec_output_prop_hevc;
> +	unsigned int dec_output_prop_hevc_size;
> +	const u32 *dec_output_prop_vp9;
> +	unsigned int dec_output_prop_vp9_size;
>   	const u32 *dec_ip_int_buf_tbl;
>   	unsigned int dec_ip_int_buf_tbl_size;
>   	const u32 *dec_op_int_buf_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 5c86fd7b7b6f..5f74e57f04fc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -137,9 +137,9 @@ struct iris_platform_data sm8250_data = {
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
>   	.max_core_mbpf = (8192 * 4352) / 256,
> -	.input_config_params =
> +	.input_config_params_default =
>   		sm8250_vdec_input_config_param_default,
> -	.input_config_params_size =
> +	.input_config_params_default_size =
>   		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
>   
>   	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> index 29bc50785da5..779c71885f51 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -254,9 +254,10 @@ static struct tz_cp_config tz_cp_config_sm8550 = {
>   	.cp_nonpixel_size = 0x24800000,
>   };
>   
> -static const u32 sm8550_vdec_input_config_params[] = {
> +static const u32 sm8550_vdec_input_config_params_default[] = {
>   	HFI_PROP_BITSTREAM_RESOLUTION,
>   	HFI_PROP_CROP_OFFSETS,
> +	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
>   	HFI_PROP_CODED_FRAMES,
>   	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
>   	HFI_PROP_PIC_ORDER_CNT_TYPE,
> @@ -265,6 +266,26 @@ static const u32 sm8550_vdec_input_config_params[] = {
>   	HFI_PROP_SIGNAL_COLOR_INFO,
>   };
>   
> +static const u32 sm8550_vdec_input_config_param_hevc[] = {
> +	HFI_PROP_BITSTREAM_RESOLUTION,
> +	HFI_PROP_CROP_OFFSETS,
> +	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> +	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
> +	HFI_PROP_PROFILE,
> +	HFI_PROP_LEVEL,
> +	HFI_PROP_TIER,
> +	HFI_PROP_SIGNAL_COLOR_INFO,
> +};
> +
> +static const u32 sm8550_vdec_input_config_param_vp9[] = {
> +	HFI_PROP_BITSTREAM_RESOLUTION,
> +	HFI_PROP_CROP_OFFSETS,
> +	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> +	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
> +	HFI_PROP_PROFILE,
> +	HFI_PROP_LEVEL,
> +};
> +
>   static const u32 sm8550_vdec_output_config_params[] = {
>   	HFI_PROP_COLOR_FORMAT,
>   	HFI_PROP_LINEAR_STRIDE_SCANLINE,
> @@ -274,11 +295,19 @@ static const u32 sm8550_vdec_subscribe_input_properties[] = {
>   	HFI_PROP_NO_OUTPUT,
>   };
>   
> -static const u32 sm8550_vdec_subscribe_output_properties[] = {
> +static const u32 sm8550_vdec_subscribe_output_properties_avc[] = {
>   	HFI_PROP_PICTURE_TYPE,
>   	HFI_PROP_CABAC_SESSION,
>   };
>   
> +static const u32 sm8550_vdec_subscribe_output_properties_hevc[] = {
> +	HFI_PROP_PICTURE_TYPE,
> +};
> +
> +static const u32 sm8550_vdec_subscribe_output_properties_vp9[] = {
> +	HFI_PROP_PICTURE_TYPE,
> +};
> +
>   static const u32 sm8550_dec_ip_int_buf_tbl[] = {
>   	BUF_BIN,
>   	BUF_COMV,
> @@ -322,19 +351,33 @@ struct iris_platform_data sm8550_data = {
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
>   	.max_core_mbpf = ((8192 * 4352) / 256) * 2,

I realise it's not in your changeset but....

mbpf - mega bytes per frame ?

What do these numbers capture and how do we validate them ?

Defines with meaning would be better

((MAX_BYTES_PER_THING * NUMBER_OF_LINES_OF_PIXELS) / SOME_ALIGNMENT ) * 2

or whatever it is those numbers ultimately capture.

> -	.input_config_params =
> -		sm8550_vdec_input_config_params,
> -	.input_config_params_size =
> -		ARRAY_SIZE(sm8550_vdec_input_config_params),
> +	.input_config_params_default =
> +		sm8550_vdec_input_config_params_default,
> +	.input_config_params_default_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
> +	.input_config_params_hevc =
> +		sm8550_vdec_input_config_param_hevc,
> +	.input_config_params_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
> +	.input_config_params_vp9 =
> +		sm8550_vdec_input_config_param_vp9,
> +	.input_config_params_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>   	.output_config_params =
>   		sm8550_vdec_output_config_params,
>   	.output_config_params_size =
>   		ARRAY_SIZE(sm8550_vdec_output_config_params),
>   	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
>   	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> -	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
> -	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
> -
> +	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
> +	.dec_output_prop_avc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
> +	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
> +	.dec_output_prop_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
> +	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
> +	.dec_output_prop_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>   	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>   	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,

---
bod

