Return-Path: <linux-media+bounces-47826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 437B2C8DD61
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 11:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E70533AF405
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 10:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC727329E4F;
	Thu, 27 Nov 2025 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5FliBhU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38565299924;
	Thu, 27 Nov 2025 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764240609; cv=none; b=ht+v2KYOF6AO5coEuSSwYQAaNCVB6/6KfNmHFeGjVPfHRrjc6LZuDAJpTwK13u27FC7b2uIOhlB1hxSqx7KKzglYGFOOEGMTZqaLz12zKbuDf/sjFFRD+gua/2Z2oQHNTZoBnybgurnNvvsJZvMvJdgLZsWR8oBy1i8HU9ZGNo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764240609; c=relaxed/simple;
	bh=H0FETUPmgKipNj2wiCGKNSw0ozJMw8NXDeBsuhkmv9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrcbRxtYVQyj7NEis6RXzrIvcL2k3hAXcOg45IdVJmdVQ5bhG6XqGfuup7/I/cr/Z34F3UBQ37aJqF0GU4ZD8jmeUVvSNtG8kuEdt7hblxfsbqukNSsB1Skrvg4a+CTMjwxJAiCja/TjzXLSIWcKfVAmrAtEIFTwkPD7f62nxTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5FliBhU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBD1C4CEF8;
	Thu, 27 Nov 2025 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764240609;
	bh=H0FETUPmgKipNj2wiCGKNSw0ozJMw8NXDeBsuhkmv9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D5FliBhUTSWD80bvkqhutJ3odJLO5BDN1e2MoJ2OK+LTE5yEQJaiQWr+UVikH3kN8
	 bGdLir+iQJ0h+xqNJLYhStf3z/F2T8MNOi3SeqKxSZHBkzaUTyaZ1Wn4F9MQCFdf8J
	 lcW9LuICKRCi/ym6RdBWz/P+Y31EgIzfANZ6BYaJNGhelP1DxyJRlFsML+unnW9Ewf
	 h4A7HLW+A68mf55M7gMjE16qT0zIjNqQDqMe6bGR3LLVsfGI8Mwspr3BHB7Z8UM/vJ
	 JXoRcb4O9kxDbmUiEpX7IXkQQrfN3la80C54Kvv4H2wJDLY9H+OScVbOQtFtmKD5X4
	 EBi2kd8u8P4Kg==
Message-ID: <319062a7-f72b-4d9c-a8fc-14ad954bf2da@kernel.org>
Date: Thu, 27 Nov 2025 10:50:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: qcom: iris: Add hierarchical coding support
 for encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
 <QDBXgyF8pqFmyCDIkZAePruxy5dmwaF51gez3ucRXrNsciPUy0iySAeYmJSIfDvW8gElL8pVNXnkBbTDZ2ULag==@protonmail.internalid>
 <20251127-batch2_iris_encoder_enhancements-v1-4-5ea78e2de2ae@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251127-batch2_iris_encoder_enhancements-v1-4-5ea78e2de2ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/2025 07:44, Wangao Wang wrote:
> Add hierarchical coding support for both gen1 and gen2 encoders by enabling
>   the following V4L2 controls:
> H264:
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING,
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE,
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER
> HEVC(gen2 only):
> V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE,
> V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER
> 
> Key changes:
> Added capability IDs for hierarchical coding enable, type, and layer count.
> Implemented handlers for layer type and layer count (gen1/gen2).
> Defined new HFI properties and enums for hierarchical coding.
> Updated platform capability tables and buffer logic to handle hierarchical
>   coding.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 150 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |   3 +
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  14 ++
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   2 +
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 ++
>   drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
>   .../platform/qcom/iris/iris_platform_common.h      |  11 ++
>   .../media/platform/qcom/iris/iris_platform_gen1.c  |  26 ++++
>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  48 +++++++
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  21 +++
>   10 files changed, 288 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 9aec8a2006e9f8e545d05e40cb68ef0ae8502f79..99b6cfdd726258f753b3d1920144044e5aa76f29 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -116,6 +116,16 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>   		return MARK_LTR;
>   	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
>   		return B_FRAME;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
> +		return LAYER_ENABLE;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
> +		return LAYER_TYPE_H264;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE:
> +		return LAYER_TYPE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:
> +		return LAYER_COUNT_H264;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER:
> +		return LAYER_COUNT_HEVC;
>   	default:
>   		return INST_FW_CAP_MAX;
>   	}
> @@ -221,6 +231,16 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>   		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
>   	case B_FRAME:
>   		return V4L2_CID_MPEG_VIDEO_B_FRAMES;
> +	case LAYER_ENABLE:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING;
> +	case LAYER_TYPE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE;
> +	case LAYER_TYPE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE;
> +	case LAYER_COUNT_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER;
> +	case LAYER_COUNT_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER;
>   	default:
>   		return 0;
>   	}
> @@ -1173,6 +1193,136 @@ int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type
>   					     &intra_period, sizeof(intra_period));
>   }
> 
> +int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 layer_enable = inst->fw_caps[LAYER_ENABLE].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 layer_type;
> +
> +	if (inst->hfi_rc_type == HFI_RATE_CONTROL_CQ ||
> +	    inst->hfi_rc_type == HFI_RATE_CONTROL_OFF)
> +		return -EINVAL;
> +
> +	if (inst->codec == V4L2_PIX_FMT_H264) {
> +		if (!layer_enable || !inst->fw_caps[LAYER_COUNT_H264].value)
> +			return -EINVAL;
> +
> +		if (inst->fw_caps[LAYER_TYPE_H264].value ==
> +			V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P) {
> +			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
> +				layer_type = HFI_HIER_P_HYBRID_LTR;
> +			else
> +				layer_type = HFI_HIER_P_SLIDING_WINDOW;
> +		} else if (inst->fw_caps[LAYER_TYPE_HEVC].value ==
> +			V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) {
> +			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
> +				layer_type = HFI_HIER_B;
> +			else
> +				return -EINVAL;
> +		} else {
> +			return -EINVAL;
> +		}
> +	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +		if (!inst->fw_caps[LAYER_COUNT_HEVC].value)
> +			return -EINVAL;
> +
> +		if (inst->fw_caps[LAYER_TYPE_HEVC].value ==
> +			V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P) {
> +			layer_type = HFI_HIER_P_SLIDING_WINDOW;
> +		} else if (inst->fw_caps[LAYER_TYPE_HEVC].value ==
> +			V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) {
> +			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
> +				layer_type = HFI_HIER_B;
> +			else
> +				return -EINVAL;
> +		} else {
> +			return -EINVAL;
> +		}
> +	}
> +
> +	inst->hfi_layer_type = layer_type;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32_ENUM,
> +					     &layer_type, sizeof(u32));
> +}
> +
> +int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 layer_enable = inst->fw_caps[LAYER_ENABLE].value;
> +	u32 layer_count = inst->fw_caps[cap_id].value;
> +	u32 hfi_id;
> +
> +	if (!layer_enable || !layer_count)
> +		return -EINVAL;
> +
> +	inst->hfi_layer_count = layer_count;
> +
> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq)) {
> +		hfi_id = HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER;
> +		hfi_ops->session_set_property(inst, hfi_id,
> +					      HFI_HOST_FLAGS_NONE,
> +					      iris_get_port_info(inst, cap_id),
> +					      HFI_PAYLOAD_U32,
> +					      &layer_count, sizeof(u32));

Shouldn't you catch the result code and bug out if this fails ?

> +	}
> +
> +	hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &layer_count, sizeof(u32));
> +}
> +
> +int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 layer_type = inst->hfi_layer_type;
> +	u32 layer_count, layer_count_max;
> +
> +	layer_count = (inst->codec == V4L2_PIX_FMT_H264) ?
> +		inst->fw_caps[LAYER_COUNT_H264].value :
> +		inst->fw_caps[LAYER_COUNT_HEVC].value;
> +
> +	if (!layer_type || !layer_count)
> +		return -EINVAL;
> +
> +	if (layer_type == HFI_HIER_B) {
> +		layer_count_max = MAX_LAYER_HB;
> +	} else if (layer_type == HFI_HIER_P_HYBRID_LTR) {
> +		layer_count_max = MAX_AVC_LAYER_HP_HYBRID_LTR;
> +	} else if (layer_type == HFI_HIER_P_SLIDING_WINDOW) {
> +		if (inst->codec == V4L2_PIX_FMT_H264) {
> +			layer_count_max = MAX_AVC_LAYER_HP_SLIDING_WINDOW;
> +		} else {
> +			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
> +				layer_count_max = MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW;
> +			else
> +				layer_count_max = MAX_HEVC_LAYER_HP_SLIDING_WINDOW;
> +		}
> +	}
> +
> +	if (layer_count > layer_count_max)
> +		layer_count = layer_count_max;
> +
> +	layer_count += 1; /* base layer */
> +	inst->hfi_layer_count = layer_count;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &layer_count, sizeof(u32));
> +}
> +
>   int iris_set_properties(struct iris_inst *inst, u32 plane)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 609258c81517b71523b682ca994786cdd020b07f..d7db8749273c73348e7dc1c344d720a97d571e24 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -42,6 +42,9 @@ int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>   int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_properties(struct iris_inst *inst, u32 plane);
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index fe51eccb903be146e83a4fb2faf4b4092875dea4..1e001e2639a1d913c81ed643f8071cd561767651 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -726,6 +726,20 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
>   		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_period);
>   		break;
>   	}
> +	case HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER: {
> +		u32 *in = pdata;
> +
> +		packet->data[1] = *in;
> +		packet->shdr.hdr.size += sizeof(u32) * 2;
> +		break;
> +	}
> +	case HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER: {
> +		u32 *in = pdata;
> +
> +		packet->data[1] = *in;
> +		packet->shdr.hdr.size += sizeof(u32) * 2;

This feels inconsistent.

You have a u32 header part and then a u32 data part right ?

> +		break;
> +	}
>   	default:
>   		return -EINVAL;
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 476177add1ec860d46d85960dd09617ad347f60a..7ecfd23a925c83d82912c1ab4ca148e5cc35e142 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -154,11 +154,13 @@
> 
>   #define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
>   #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
> +#define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER	0x2005026
>   #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
>   #define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
>   #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
>   #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
>   #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
> +#define HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER		0x200600b
> 
>   struct hfi_pkt_hdr {
>   	u32 size;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 2b8c87c25a066ead30bb1b134bdc3fe1e84e8f05..3a689d3f53b4e8750a33e8bc78a8df7a023d7a56 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -74,6 +74,15 @@ enum hfi_rate_control {
>   #define HFI_PROP_LTR_COUNT			0x03000134
>   #define HFI_PROP_LTR_MARK			0x03000135
>   #define HFI_PROP_LTR_USE			0x03000136
> +
> +enum hfi_layer_encoding_type {
> +	HFI_HIER_P_SLIDING_WINDOW	= 0x1,
> +	HFI_HIER_P_HYBRID_LTR		= 0x2,
> +	HFI_HIER_B			= 0x3,
> +};
> +
> +#define HFI_PROP_LAYER_ENCODING_TYPE		0x03000138
> +#define HFI_PROP_LAYER_COUNT			0x03000139
>   #define HFI_PROP_TOTAL_BITRATE			0x0300013b
>   #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
>   #define HFI_PROP_MAX_B_FRAMES			0x03000147
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 0a0d4ace0bb6bee6ab11bd47fddb27432cd524f7..f4aa904f94ebb3c87bcdeeb6c3732b616d030b96 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -73,6 +73,8 @@ struct iris_fmt {
>    * @enc_raw_height: source image height for encoder instance
>    * @enc_scale_width: scale width for encoder instance
>    * @enc_scale_height: scale height for encoder instance
> + * @hfi_layer_type: hierarchical coding layer type
> + * @hfi_layer_count: hierarchical coding layer count
>    */
> 
>   struct iris_inst {
> @@ -115,6 +117,8 @@ struct iris_inst {
>   	u32				enc_raw_height;
>   	u32				enc_scale_width;
>   	u32				enc_scale_height;
> +	u32				hfi_layer_type;
> +	u32				hfi_layer_count;
>   };
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 34deb32eb5be0899fee779ff99b3f4b8bd91529f..db80617dbdc865c5a10708968f34987972d935f7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -32,6 +32,12 @@ struct iris_inst;
>   #define INVALID_DEFAULT_MARK_OR_USE_LTR		-1
>   #define MAX_LTR_FRAME_COUNT_GEN1		4
>   #define MAX_LTR_FRAME_COUNT_GEN2		2
> +#define MAX_LAYER_HB				3
> +#define MAX_AVC_LAYER_HP_HYBRID_LTR		5
> +#define MAX_AVC_LAYER_HP_SLIDING_WINDOW		3
> +#define MAX_HEVC_LAYER_HP_SLIDING_WINDOW	3
> +#define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
> +#define MAX_HIER_CODING_LAYER_GEN1		6
> 
>   enum stage_type {
>   	STAGE_1 = 1,
> @@ -156,6 +162,11 @@ enum platform_inst_fw_cap_type {
>   	MARK_LTR,
>   	B_FRAME,
>   	INTRA_PERIOD,
> +	LAYER_ENABLE,
> +	LAYER_TYPE_H264,
> +	LAYER_TYPE_HEVC,
> +	LAYER_COUNT_H264,
> +	LAYER_COUNT_HEVC,
>   	INST_FW_CAP_MAX,
>   };
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index b76f0ecaa721f3469bc63b7ff4ce5fc6ea19a8e1..ba5d0ddb87f4b3dc21f81027e7011a6acda3854d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -296,6 +296,32 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>   		.flags = CAP_FLAG_OUTPUT_PORT,
>   		.set = iris_set_intra_period,
>   	},
> +	{
> +		.cap_id = LAYER_ENABLE,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = LAYER_TYPE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.max = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P),
> +		.value = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = LAYER_COUNT_H264,
> +		.min = 0,
> +		.max = MAX_HIER_CODING_LAYER_GEN1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_layer_count_gen1,
> +	},
>   };
> 
>   static struct platform_inst_caps platform_inst_cap_sm8250 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 7c9a71755685d195a7adc8064523e1c33a572089..e9c4a62a891c34bc0969c0fd4ea33a9d9b11c93d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -677,6 +677,54 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>   		.flags = CAP_FLAG_OUTPUT_PORT,
>   		.set = iris_set_u32,
>   	},
> +	{
> +		.cap_id = LAYER_ENABLE,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = LAYER_TYPE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B,
> +		.max = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B) |
> +				BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P),
> +		.value = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		.hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = LAYER_TYPE_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B,
> +		.max = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) |
> +				BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P),
> +		.value = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
> +		.hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_layer_type,
> +	},
> +	{
> +		.cap_id = LAYER_COUNT_H264,
> +		.min = 0,
> +		.max = 5,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_LAYER_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +	},
> +	{
> +		.cap_id = LAYER_COUNT_HEVC,
> +		.min = 0,
> +		.max = 5,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_LAYER_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_layer_count_gen2,
> +	}
>   };
> 
>   static struct platform_inst_caps platform_inst_cap_sm8550 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 4a854a4dab322eabb16a52b1cf816c18d78acc81..dfdffcf08b6837936b7be1f1a1f109d2bb8203c6 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -670,6 +670,8 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
> 
>   static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
>   {
> +	u32 layer_count = inst->hfi_layer_count;
> +	u32 layer_type = inst->hfi_layer_type;
>   	u32 bframe_count, ltr_count;
>   	u32 num_ref = 1;
> 
> @@ -679,9 +681,28 @@ static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
>   	if (bframe_count)
>   		num_ref = 2;
> 
> +	if (layer_type == HFI_HIER_P_HYBRID_LTR)
> +		num_ref = (layer_count + 1) >> 1;
> +
> +	if (layer_type == HFI_HIER_P_SLIDING_WINDOW) {
> +		if (inst->codec == V4L2_PIX_FMT_HEVC)
> +			num_ref = (layer_count + 1) >> 1;
> +		else if (inst->codec == V4L2_PIX_FMT_H264 && layer_count < 4)
> +			num_ref = (layer_count - 1);
> +		else
> +			num_ref = layer_count;
> +	}

Why are some of these num_refs shifted but others are not ?

> +
>   	if (ltr_count)
>   		num_ref = num_ref + ltr_count;
> 
> +	if (layer_type == HFI_HIER_B) {
> +		if (inst->codec == V4L2_PIX_FMT_HEVC)
> +			num_ref	= layer_count;
> +		else
> +			num_ref = (1 << (layer_count - 2)) + 1;
> +	}
> +
>   	return num_ref + 1;
>   }
> 
> 
> --
> 2.43.0
> 


