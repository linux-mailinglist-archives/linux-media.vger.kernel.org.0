Return-Path: <linux-media+bounces-43516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34264BB20C1
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 01:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F1D319C6634
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 23:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CA726A0A7;
	Wed,  1 Oct 2025 23:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IM1nnlVx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C566A22ACE3;
	Wed,  1 Oct 2025 23:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759360065; cv=none; b=EeFzraV23udpEBA7zQ3FnB3OHrDRLlYE0OeE52C8KOvWfoCA1zHr5DC6qsnHchD+SyIXTFJiogyHucEOhebutO2CG8b33CETtsHVHi3KvAQsye6fJqOJfENAfj0bRQIuu1o8D4M+DXccesAK2QQpWIllnoMRmB5yd6wWKZfbli4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759360065; c=relaxed/simple;
	bh=KxJcX30mnG0E46oX2pNOhXBD2oKlAJEZZiUG3wPh8F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGTQFJXRaIAnbq9Tt3pAcu+XWDPecwhiBz7XQjyk2C14Iaq99x0X9MkJ8reSjklWMVTS3HKDTb0HK1FO27a5JYmUDlqJPMKxq4RhOJUPpSWYY0ijcSygzYcSLAa69WJkxStKElu2qVvywsJRbu1Ecp5Mbljcii+5K7R9f2P388Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IM1nnlVx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFFAC4CEF1;
	Wed,  1 Oct 2025 23:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759360065;
	bh=KxJcX30mnG0E46oX2pNOhXBD2oKlAJEZZiUG3wPh8F8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IM1nnlVxDSgDa3DsiaNPF3seerjSPiXl+Xg9ZMlnMQFIv+X9DwrchlVntMSNrJ5z1
	 qXGGgJvboS+ZAFcLXOgNn5uAQpr6r2c6FzbbGZGWkjLZ3OPV/ocYSy/xwNxw1bA+Wl
	 xV6K6xdntk49Pqt7MHhgd4EzNo/apJ+ZZDGmFAY57HxZWrp3dEhXWqNdzPIxV4S6rx
	 kzrLMe6AHWO2jFf+QO+c9lIyYz5dhpuFaRZPBIZyPr15xHpcndWP0N0IE1MXCyQEiE
	 xiNUE6Xyfp8t5FZhLnJqBPgbZsJVkUAO61HseF1/SYd/j136FP9iS5ryqKf1DfmyzO
	 RcD13uiQAGlcw==
Message-ID: <9424ac3b-4f7b-4cfb-ab0a-9f02bc490eae@kernel.org>
Date: Thu, 2 Oct 2025 00:07:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] media: iris: Define AV1-specific platform
 capabilities and properties
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
 <XPjDn68xCF4kVFGIO3pPL8hgTNPcS3hc9PYqf-RKsqQbQzmZhGM42-YibrjkccNHQGKzaMifOu2mG4L9eF3BdQ==@protonmail.internalid>
 <20251001-av1_irisdecoder-v1-4-9fb08f3b96a0@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251001-av1_irisdecoder-v1-4-9fb08f3b96a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2025 20:00, Deepa Guthyappa Madivalara wrote:
> Defining platform specific capabilities specific to AV1 decoder.
> Set and subscribe to manadatory properties to firmware for AV1.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
>   drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 ++
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 109 ++++++++++++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 ++
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++++
>   .../platform/qcom/iris/iris_platform_common.h      |  13 ++
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 133 ++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
>   9 files changed, 294 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
> index 325d30fce5c99185b61ff989fbfd4de9a56762b2..5ef365d9236c7cbdee24a4614789b3191881968b 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
> @@ -42,6 +42,7 @@ enum iris_buffer_type {
>   	BUF_SCRATCH_1,
>   	BUF_SCRATCH_2,
>   	BUF_VPSS,
> +	BUF_PARTIAL,
>   	BUF_TYPE_MAX,
>   };
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 754a5ad718bc37630bb861012301df7a2e7342a1..620c7e1bd273e25febd8ca70dd1dcfb0b862692b 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -98,6 +98,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>   		return B_FRAME_QP_H264;
>   	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
>   		return B_FRAME_QP_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_AV1_PROFILE:
> +		return PROFILE_AV1;
> +	case V4L2_CID_MPEG_VIDEO_AV1_LEVEL:
> +		return LEVEL_AV1;
>   	default:
>   		return INST_FW_CAP_MAX;
>   	}
> @@ -185,6 +189,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>   		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
>   	case B_FRAME_QP_HEVC:
>   		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
> +	case PROFILE_AV1:
> +		return V4L2_CID_MPEG_VIDEO_AV1_PROFILE;
> +	case LEVEL_AV1:
> +		return V4L2_CID_MPEG_VIDEO_AV1_LEVEL;
>   	default:
>   		return 0;
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index b51471fb32c70acee44c37f8e9dce0c6bc0b6ccc..3edb5ae582b49bea2e2408c4a5cfc0a742adc05f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -141,6 +141,9 @@ struct hfi_subscription_params {
>   	u32	profile;
>   	u32	level;
>   	u32	tier;
> +	u32	drap;
> +	u32	film_grain;
> +	u32	super_block;
>   };
> 
>   u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 4ce71a14250832440099e4cf3835b4aedfb749e8..e3a8b031b3f191a6d18e1084db34804a8172439c 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -10,6 +10,7 @@
> 
>   #define UNSPECIFIED_COLOR_FORMAT 5
>   #define NUM_SYS_INIT_PACKETS 8
> +#define NUM_COMV_AV1 18
> 
>   #define SYS_INIT_PKT_SIZE (sizeof(struct iris_hfi_header) + \
>   	NUM_SYS_INIT_PACKETS * (sizeof(struct iris_hfi_packet) + sizeof(u32)))
> @@ -121,6 +122,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
>   		case BUF_COMV:
>   		case BUF_NON_COMV:
>   		case BUF_LINE:
> +		case BUF_PARTIAL:
>   			return HFI_PORT_BITSTREAM;
>   		case BUF_OUTPUT:
>   		case BUF_DPB:
> @@ -380,6 +382,9 @@ static int iris_hfi_gen2_set_profile(struct iris_inst *inst, u32 plane)
>   	case V4L2_PIX_FMT_H264:
>   		profile = inst->fw_caps[PROFILE_H264].value;
>   		break;
> +	case V4L2_PIX_FMT_AV1:
> +		profile = inst->fw_caps[PROFILE_AV1].value;
> +		break;
>   	}
> 
>   	inst_hfi_gen2->src_subcr_params.profile = profile;
> @@ -409,6 +414,9 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst, u32 plane)
>   	case V4L2_PIX_FMT_H264:
>   		level = inst->fw_caps[LEVEL_H264].value;
>   		break;
> +	case V4L2_PIX_FMT_AV1:
> +		level = inst->fw_caps[LEVEL_AV1].value;
> +		break;
>   	}
> 
>   	inst_hfi_gen2->src_subcr_params.level = level;
> @@ -484,7 +492,8 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
>   	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>   	u32 tier = inst->fw_caps[TIER].value;
> 
> -	inst_hfi_gen2->src_subcr_params.tier = tier;
> +	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
> +							inst->fw_caps[TIER].value;
> 
>   	return iris_hfi_gen2_session_set_property(inst,
>   						  HFI_PROP_TIER,
> @@ -509,6 +518,56 @@ static int iris_hfi_gen2_set_frame_rate(struct iris_inst *inst, u32 plane)
>   						  sizeof(u32));
>   }
> 
> +static int iris_hfi_gen2_set_film_grain(struct iris_inst *inst, u32 plane)
> +{
> +	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	u32 film_grain;
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
>   static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
>   {
>   	const struct iris_platform_data *pdata = inst->core->iris_platform_data;
> @@ -531,6 +590,9 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>   		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
>   		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
>   		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
> +		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
> +		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
> +		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
>   	};
> 
>   	if (inst->domain == DECODER) {
> @@ -544,12 +606,20 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>   			} else if (inst->codec == V4L2_PIX_FMT_VP9) {
>   				config_params = pdata->dec_input_config_params_vp9;
>   				config_params_size = pdata->dec_input_config_params_vp9_size;
> +			} else if (inst->codec == V4L2_PIX_FMT_AV1) {
> +				config_params = pdata->dec_input_config_params_av1;
> +				config_params_size = pdata->dec_input_config_params_av1_size;
>   			} else {
>   				return -EINVAL;
>   			}
>   		} else {
> -			config_params = pdata->dec_output_config_params;
> -			config_params_size = pdata->dec_output_config_params_size;
> +			if (inst->codec == V4L2_PIX_FMT_AV1) {
> +				config_params = pdata->dec_output_config_params_av1;
> +				config_params_size = pdata->dec_output_config_params_av1_size;
> +			} else {
> +				config_params = pdata->dec_output_config_params;
> +				config_params_size = pdata->dec_output_config_params_size;
> +			}
>   		}
>   	} else {
>   		if (V4L2_TYPE_IS_OUTPUT(plane)) {
> @@ -598,6 +668,9 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
>   		break;
>   	case V4L2_PIX_FMT_VP9:
>   		codec = HFI_CODEC_DECODE_VP9;
> +		break;
> +	case V4L2_PIX_FMT_AV1:
> +		codec = HFI_CODEC_DECODE_AV1;
>   	}
> 
>   	iris_hfi_gen2_packet_session_property(inst,
> @@ -763,6 +836,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>   		change_param_size =
>   			core->iris_platform_data->dec_input_config_params_vp9_size;
>   		break;
> +	case V4L2_PIX_FMT_AV1:
> +		change_param = core->iris_platform_data->dec_input_config_params_av1;
> +		change_param_size =
> +			core->iris_platform_data->dec_input_config_params_av1_size;
> +		break;
>   	}
> 
>   	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
> @@ -845,6 +923,16 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>   				payload_size = sizeof(u32);
>   				payload_type = HFI_PAYLOAD_U32;
>   				break;
> +			case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
> +				payload[0] = subsc_params.film_grain;
> +				payload_size = sizeof(u32);

This is a historical mistake in this code.

payload_size should be sizeof(subsc_params.film_grain); with a similar 
pattern throughout.

It shouldn't be necessary at this point in the code to define the size 
based on a type you also have to know, just sizeof(the thing itself);

anyway - that should be fixed at some stage.
> +				payload_type = HFI_PAYLOAD_U32;
> +				break;
> +			case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
> +				payload[0] = subsc_params.super_block;
> +				payload_size = sizeof(u32);
> +				payload_type = HFI_PAYLOAD_U32;
> +				break;
>   			default:
>   				prop_type = 0;
>   				ret = -EINVAL;
> @@ -900,6 +988,11 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
>   			subscribe_prop_size =
>   				core->iris_platform_data->dec_output_prop_vp9_size;
>   			break;
> +		case V4L2_PIX_FMT_AV1:
> +			subcribe_prop = core->iris_platform_data->dec_output_prop_av1;
> +			subscribe_prop_size =
> +				core->iris_platform_data->dec_output_prop_av1_size;
> +			break;
>   		}
>   	}
> 
> @@ -1075,6 +1168,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
>   		return HFI_BUFFER_ARP;
>   	case BUF_VPSS:
>   		return HFI_BUFFER_VPSS;
> +	case BUF_PARTIAL:
> +		return HFI_BUFFER_PARTIAL_DATA;
>   	default:
>   		return 0;
>   	}
> @@ -1087,7 +1182,13 @@ static int iris_set_num_comv(struct iris_inst *inst)
>   	u32 num_comv;
> 
>   	caps = core->iris_platform_data->inst_caps;
> -	num_comv = caps->num_comv;
> +
> +	/*
> +	 * If Host allocates less comv count for AV1 then
> +	 * FW can raise SESSION_ERROR
> +	 */
> +	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
> +				NUM_COMV_AV1 : caps->num_comv;

I don't think the comment adds to the understanding of the code. Please 
try rewriting it.

> 
>   	return core->hfi_ops->session_set_property(inst,
>   						   HFI_PROP_COMV_BUFFER_COUNT,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index bbfe7a0851ea94fb7041a868b4df8b2ec63bf427..9cc0989c67d74a9e051725e9ee571a2ab9160519 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -89,9 +89,18 @@ enum hfi_seq_header_mode {
>   #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
>   #define HFI_PROP_NO_OUTPUT			0x0300016a
>   #define HFI_PROP_BUFFER_MARK			0x0300016c
> +#define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
> +#define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
>   #define HFI_PROP_RAW_RESOLUTION		0x03000178
> +#define HFI_PROP_AV1_FILM_GRAIN_PRESENT		0x03000180
> +#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED	0x03000181
> +#define HFI_PROP_AV1_OP_POINT				0x03000182
> +#define HFI_PROP_OPB_ENABLE                 0x03000184
> +#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
> +#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
>   #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
>   #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
> +#define HFI_PROP_AV1_UNIFORM_TILE_SPACING	0x03000197

These bit-fields ? are probably pretty interesting if you know what the 
magic numbers are.

Another thing to look at in the future.

>   #define HFI_PROP_END				0x03FFFFFF
> 
>   #define HFI_SESSION_ERROR_BEGIN			0x04000000
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 2f1f118eae4f6462ab1aa1d16844b34e6e699f1e..eb3373f0ad4a1b26fb847db02449ec8d8cb3bdbb 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>   			return BUF_SCRATCH_2;
>   	case HFI_BUFFER_PERSIST:
>   		return BUF_PERSIST;
> +	case HFI_BUFFER_PARTIAL_DATA:
> +		return BUF_PARTIAL;
>   	default:
>   		return 0;
>   	}
> @@ -72,6 +74,7 @@ static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
>   	case HFI_BUFFER_DPB:
>   	case HFI_BUFFER_PERSIST:
>   	case HFI_BUFFER_VPSS:
> +	case HFI_BUFFER_PARTIAL_DATA:
>   		return true;
>   	default:
>   		return false;
> @@ -596,6 +599,10 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>   		inst->fw_caps[PROFILE_H264].value = subsc_params.profile;
>   		inst->fw_caps[LEVEL_H264].value = subsc_params.level;
>   		break;
> +	case V4L2_PIX_FMT_AV1:
> +		inst->fw_caps[PROFILE_AV1].value = subsc_params.profile;
> +		inst->fw_caps[LEVEL_AV1].value = subsc_params.level;
> +		break;
>   	}
> 
>   	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
> @@ -608,6 +615,11 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>   		iris_inst_change_state(inst, IRIS_INST_ERROR);
>   	}
> 
> +	if (inst->codec == V4L2_PIX_FMT_AV1) {
> +		inst->fw_caps[FILM_GRAIN].value = subsc_params.film_grain;
> +		inst->fw_caps[SUPER_BLOCK].value = subsc_params.super_block;
> +	}
> +
>   	inst->fw_min_count = subsc_params.fw_min_count;
>   	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>   	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
> @@ -711,6 +723,12 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
>   	case HFI_PROP_NO_OUTPUT:
>   		inst_hfi_gen2->hfi_frame_info.no_output = 1;
>   		break;
> +	case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
> +		inst_hfi_gen2->src_subcr_params.film_grain = pkt->payload[0];
> +		break;
> +	case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
> +		inst_hfi_gen2->src_subcr_params.super_block = pkt->payload[0];
> +		break;
>   	case HFI_PROP_QUALITY_MODE:
>   	case HFI_PROP_STAGE:
>   	case HFI_PROP_PIPE:
> @@ -841,6 +859,10 @@ static void iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
>   		subsc_params->profile = inst->fw_caps[PROFILE_H264].value;
>   		subsc_params->level = inst->fw_caps[LEVEL_H264].value;
>   		break;
> +	case V4L2_PIX_FMT_AV1:
> +		subsc_params->profile = inst->fw_caps[PROFILE_AV1].value;
> +		subsc_params->level = inst->fw_caps[LEVEL_AV1].value;
> +		break;
>   	}
> 
>   	subsc_params->pic_order_cnt = inst->fw_caps[POC].value;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 9aca70b4c0690f0d8d799e2a9976bd20d6bb8c94..19f0660f0388499ab71a1413b2c05f891bd5d511 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -100,6 +100,13 @@ enum platform_inst_fw_cap_type {
>   	LEVEL_H264,
>   	LEVEL_HEVC,
>   	LEVEL_VP9,
> +	PROFILE_AV1,
> +	LEVEL_AV1,
> +	TIER_AV1,
> +	DRAP,
> +	FILM_GRAIN,
> +	SUPER_BLOCK,
> +	ENH_LAYER_COUNT,
>   	INPUT_BUF_HOST_MAX_COUNT,
>   	OUTPUT_BUF_HOST_MAX_COUNT,
>   	STAGE,
> @@ -237,8 +244,12 @@ struct iris_platform_data {
>   	unsigned int dec_input_config_params_hevc_size;
>   	const u32 *dec_input_config_params_vp9;
>   	unsigned int dec_input_config_params_vp9_size;
> +	const u32 *dec_input_config_params_av1;
> +	unsigned int dec_input_config_params_av1_size;
>   	const u32 *dec_output_config_params;
>   	unsigned int dec_output_config_params_size;
> +	const u32 *dec_output_config_params_av1;
> +	unsigned int dec_output_config_params_av1_size;
>   	const u32 *enc_input_config_params;
>   	unsigned int enc_input_config_params_size;
>   	const u32 *enc_output_config_params;
> @@ -251,6 +262,8 @@ struct iris_platform_data {
>   	unsigned int dec_output_prop_hevc_size;
>   	const u32 *dec_output_prop_vp9;
>   	unsigned int dec_output_prop_vp9_size;
> +	const u32 *dec_output_prop_av1;
> +	unsigned int dec_output_prop_av1_size;
>   	const u32 *dec_ip_int_buf_tbl;
>   	unsigned int dec_ip_int_buf_tbl_size;
>   	const u32 *dec_op_int_buf_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 12dfbb79da4838069fd0c2b00c539f4a17e300ba..7ca7b1350723f29002890984836d87660f630a4c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -64,6 +64,16 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>   		.set = iris_set_u32_enum,
>   	},
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
>   	{
>   		.cap_id = PROFILE_VP9,
>   		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> @@ -147,6 +157,33 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>   		.set = iris_set_u32_enum,
>   	},
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
>   	{
>   		.cap_id = TIER,
>   		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
> @@ -158,6 +195,53 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>   		.set = iris_set_u32_enum,
>   	},
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
>   	{
>   		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
>   		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> @@ -701,6 +785,19 @@ static const u32 sm8550_vdec_input_config_param_vp9[] = {
>   	HFI_PROP_LEVEL,
>   };
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
>   static const u32 sm8550_venc_input_config_params[] = {
>   	HFI_PROP_COLOR_FORMAT,
>   	HFI_PROP_RAW_RESOLUTION,
> @@ -714,6 +811,12 @@ static const u32 sm8550_vdec_output_config_params[] = {
>   	HFI_PROP_LINEAR_STRIDE_SCANLINE,
>   };
> 
> +static const u32 sm8550_vdec_output_config_param_av1[] = {
> +	HFI_PROP_OPB_ENABLE,
> +	HFI_PROP_COLOR_FORMAT,
> +	HFI_PROP_LINEAR_STRIDE_SCANLINE,
> +};
> +
>   static const u32 sm8550_venc_output_config_params[] = {
>   	HFI_PROP_BITSTREAM_RESOLUTION,
>   	HFI_PROP_CROP_OFFSETS,
> @@ -737,11 +840,18 @@ static const u32 sm8550_vdec_subscribe_output_properties_vp9[] = {
>   	HFI_PROP_PICTURE_TYPE,
>   };
> 
> +static const u32 sm8550_vdec_subscribe_output_properties_av1[] = {
> +	HFI_PROP_PICTURE_TYPE,
> +	HFI_PROP_WORST_COMPRESSION_RATIO,
> +	HFI_PROP_WORST_COMPLEXITY_FACTOR,
> +};
> +
>   static const u32 sm8550_dec_ip_int_buf_tbl[] = {
>   	BUF_BIN,
>   	BUF_COMV,
>   	BUF_NON_COMV,
>   	BUF_LINE,
> +	BUF_PARTIAL,
>   };
> 
>   static const u32 sm8550_dec_op_int_buf_tbl[] = {
> @@ -806,11 +916,18 @@ struct iris_platform_data sm8550_data = {
>   		sm8550_vdec_input_config_param_vp9,
>   	.dec_input_config_params_vp9_size =
>   		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_input_config_params_av1 =
> +		sm8550_vdec_input_config_param_av1,
> +	.dec_input_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>   	.dec_output_config_params =
>   		sm8550_vdec_output_config_params,
>   	.dec_output_config_params_size =
>   		ARRAY_SIZE(sm8550_vdec_output_config_params),
> -
> +	.dec_output_config_params_av1 =
> +		sm8550_vdec_output_config_param_av1,
> +	.dec_output_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_param_av1),
>   	.enc_input_config_params =
>   		sm8550_venc_input_config_params,
>   	.enc_input_config_params_size =
> @@ -831,6 +948,9 @@ struct iris_platform_data sm8550_data = {
>   	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>   	.dec_output_prop_vp9_size =
>   		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
> 
>   	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>   	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> @@ -900,10 +1020,18 @@ struct iris_platform_data sm8650_data = {
>   		sm8550_vdec_input_config_param_vp9,
>   	.dec_input_config_params_vp9_size =
>   		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_input_config_params_av1 =
> +		sm8550_vdec_input_config_param_av1,
> +	.dec_input_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>   	.dec_output_config_params =
>   		sm8550_vdec_output_config_params,
>   	.dec_output_config_params_size =
>   		ARRAY_SIZE(sm8550_vdec_output_config_params),
> +	.dec_output_config_params_av1 =
> +		sm8550_vdec_output_config_param_av1,
> +	.dec_output_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_param_av1),
> 
>   	.enc_input_config_params =
>   		sm8550_venc_input_config_params,
> @@ -925,6 +1053,9 @@ struct iris_platform_data sm8650_data = {
>   	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>   	.dec_output_prop_vp9_size =
>   		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
> 
>   	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>   	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index d38d0f6961cd5cb9929e2aecbec7353dcc2d4a7d..05eec18f937a51d3c081d0f98a8ffa6bbd30d166 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -178,6 +178,7 @@ int iris_open(struct file *filp)
>   	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_1].list);
>   	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
>   	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
> +	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
>   	init_completion(&inst->completion);
>   	init_completion(&inst->flush_completion);
> 
> 
> --
> 2.34.1
> 
> 

These are all nit-picks comments though.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

