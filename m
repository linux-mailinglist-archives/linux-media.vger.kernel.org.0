Return-Path: <linux-media+bounces-47824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05677C8DD1C
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 11:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7E3A6345B46
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 10:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82579329E4F;
	Thu, 27 Nov 2025 10:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdQYM9+V"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D371779DA;
	Thu, 27 Nov 2025 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764240114; cv=none; b=dv+CgN82uJgf4H5KIQSWOebOtQ+FkNu7pnhz1coKkFDgje+WG/EW/5aAnemBrNSHQbeOgGMHkgOVwRuRWghdtUVhXzBE1vKVesBSHEvCLXpOd5kAOWN+zaTNJ408GxmCdi40wK/wi7ucUMdWNKBQ7LeuYVNEUVLpKwGe6uae12s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764240114; c=relaxed/simple;
	bh=pvMSXbyKfRjsCOuDy7+gCTtYt3nSa0EzL+bz3+E4fxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wd78qPb6C8HXSdCSBXJidVtHzgVjR29D4SpxWD2Q2NIlMzTxjCszO3xy0+uu0N+KiVIy2fOlggwjLmuxl7SV6wn1lzLXdEMVD4BRGdpJZfZq/+nsi+wOhvJXDVdqmpveg9yikCad9kx6+p0fNj2LV1/4XBVVSPfTqXQBjz0Dv1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdQYM9+V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24CDC4CEF8;
	Thu, 27 Nov 2025 10:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764240114;
	bh=pvMSXbyKfRjsCOuDy7+gCTtYt3nSa0EzL+bz3+E4fxA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VdQYM9+VC15204grGwe/xeQLuotNdpu6kMgDVe0D7SoFtCz3LtzNefOMF3cAPDMor
	 EkIu9F+Trc+c8lEl9RHzy67XhWLUDcZFZZy20B2Y+3qIOtoXDIwsRUl/2sXqEQjbGp
	 6PBmsEgLet0xrdWYFcc+YRWdpyXDVvBjNF7Uik3ZJiu3nYvWZ+s/UQ2B5cEw04yxkD
	 ZYzwCExxS0ep5Mltftm0mWwce/Ym8eDS4/20cvA8X7ujX//wGKtyl62ykSjkodNeNN
	 oSDogTZLT4AsPmH/AqoT1z4mLc2RJFMqt015PCf2Oyq5tY36T3o+Iyq+gKmPfL3NI7
	 xs3rGo2XLUR7Q==
Message-ID: <26c1e2ac-6568-4d04-93f8-a8f1e49d156a@kernel.org>
Date: Thu, 27 Nov 2025 10:41:49 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: qcom: iris: Add Long-Term Reference support
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
 <Lm-sduib7iCBaaUii-g8s2lQybZpjV4n2nWi9p68zk9gRImpIof2Z2zkV1pYMifyLlQmN4CqnFpbHpz8K-bffw==@protonmail.internalid>
 <20251127-batch2_iris_encoder_enhancements-v1-2-5ea78e2de2ae@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251127-batch2_iris_encoder_enhancements-v1-2-5ea78e2de2ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/2025 07:44, Wangao Wang wrote:
> Add Long-Term Reference(LTR) frame support for both gen1 and gen2
> encoders by enabling the following V4L2 controls:
> V4L2_CID_MPEG_VIDEO_LTR_COUNT
> V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
> V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
> 
> Key changes:
> Added LTR capability IDs and V4L2 controls.
> Implemented handlers for LTR count, use, and mark (gen1/gen2).
> Defined new HFI properties and structures for LTR.
> Updated platform capability tables and buffer size calculations.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 126 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |   5 +
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  25 ++++
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  24 ++++
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
>   .../platform/qcom/iris/iris_platform_common.h      |   6 +
>   .../media/platform/qcom/iris/iris_platform_gen1.c  |  30 +++++
>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  30 +++++
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  33 ++++--
>   9 files changed, 270 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index cdf38c285b9133f20bdb9bc3dd0f5e916d3ed7f8..33e104142a5bb51c952550fa45e81b3bdc723ac2 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -108,6 +108,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>   		return IR_TYPE;
>   	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
>   		return IR_PERIOD;
> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
> +		return LTR_COUNT;
> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
> +		return USE_LTR;
> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
> +		return MARK_LTR;
>   	default:
>   		return INST_FW_CAP_MAX;
>   	}
> @@ -205,6 +211,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>   		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
>   	case IR_PERIOD:
>   		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
> +	case LTR_COUNT:
> +		return V4L2_CID_MPEG_VIDEO_LTR_COUNT;
> +	case USE_LTR:
> +		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
> +	case MARK_LTR:
> +		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
>   	default:
>   		return 0;
>   	}
> @@ -1022,6 +1034,120 @@ int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
>   					     &ir_period, sizeof(u32));
>   }
> 
> +int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 ltr_count = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_ltr_mode ltr_mode;
> +
> +	if (!ltr_count)
> +		return -EINVAL;
> +
> +	ltr_mode.count = ltr_count;
> +	ltr_mode.mode = HFI_LTR_MODE_MANUAL;
> +	ltr_mode.trust_mode = 1;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &ltr_mode, sizeof(ltr_mode));
> +}
> +
> +int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_ltr_use ltr_use;
> +
> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
> +		return -EINVAL;
> +
> +	if (!ltr_count)
> +		return -EINVAL;
> +
> +	ltr_use.ref_ltr = inst->fw_caps[cap_id].value;
> +	ltr_use.use_constrnt = true;
> +	ltr_use.frames = 0;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &ltr_use, sizeof(ltr_use));
> +}
> +
> +int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_ltr_mark ltr_mark;
> +
> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
> +		return -EINVAL;
> +
> +	if (!ltr_count)
> +		return -EINVAL;
> +
> +	ltr_mark.mark_frame = inst->fw_caps[cap_id].value;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &ltr_mark, sizeof(ltr_mark));
> +}
> +
> +int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 ltr_count = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +
> +	if (!ltr_count)
> +		return -EINVAL;
> +
> +	if (inst->hfi_rc_type == HFI_RATE_CONTROL_VBR_VFR ||
> +	    inst->hfi_rc_type == HFI_RATE_CONTROL_VBR_CFR ||
> +	    inst->hfi_rc_type == HFI_RATE_CONTROL_CQ)
> +		return -EINVAL;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &ltr_count, sizeof(u32));
> +}
> +
> +int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
> +	u32 hfi_val = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +
> +	if (!ltr_count || hfi_val == INVALID_DEFAULT_MARK_OR_USE_LTR)
> +		return -EINVAL;
> +
> +	if (inst->hfi_rc_type == HFI_RATE_CONTROL_VBR_VFR ||
> +	    inst->hfi_rc_type == HFI_RATE_CONTROL_VBR_CFR ||
> +	    inst->hfi_rc_type == HFI_RATE_CONTROL_CQ)
> +		return -EINVAL;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &hfi_val, sizeof(u32));
> +}
> +
>   int iris_set_properties(struct iris_inst *inst, u32 plane)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index a0d5338bdc910bd30407132e8b700c333ad74e4c..996c83fdc6f492dc252771129fc1d62e8b7a7e07 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -36,6 +36,11 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>   int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_properties(struct iris_inst *inst, u32 plane);
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 4d9632ba86bc8f629cee6d726eb44efcdeba2475..139e7a9321d30d3e348671f99b0fa81afed4827e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -693,6 +693,31 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
>   		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
>   		break;
>   	}
> +	case HFI_PROPERTY_PARAM_VENC_LTRMODE: {
> +		struct hfi_ltr_mode *in = pdata, *ltr_mode = prop_data;
> +
> +		ltr_mode->mode = in->mode;
> +		ltr_mode->count = in->count;
> +		ltr_mode->trust_mode = in->trust_mode;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mode);

This looks like an unconditional pattern in this code

packet->shdr.hdr.size += sizeof(u32) for each one of the switch cases.

Could you at least add a patch to the end of this series to tidy this up 
- either always incrmenting by sizeof(u32) before the swich - or making 
a macro or static inline that packs the header appropriately.

Also what is the sizeof(u32) representative of ? "Some field in the 
header" - get that but right now its just a literal unnamed dword.

> +		break;
> +	}
> +	case HFI_PROPERTY_CONFIG_VENC_USELTRFRAME: {
> +		struct hfi_ltr_use *in = pdata, *ltr_use = prop_data;
> +
> +		ltr_use->frames = in->frames;
> +		ltr_use->ref_ltr = in->ref_ltr;
> +		ltr_use->use_constrnt = in->use_constrnt;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_use);
> +		break;
> +	}
> +	case HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME: {
> +		struct hfi_ltr_mark *in = pdata, *ltr_mark = prop_data;
> +
> +		ltr_mark->mark_frame = in->mark_frame;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
> +		break;
> +	}
>   	default:
>   		return -EINVAL;
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 04c79ee0463d7f32a2042044fe4564718cc01561..34249fc0d047918c2463517b8303e30df3666b97 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -147,8 +147,16 @@
>   #define HFI_INTRA_REFRESH_RANDOM		0x5
> 
>   #define HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH			0x200500d
> +
> +#define HFI_LTR_MODE_DISABLE			0x0
> +#define HFI_LTR_MODE_MANUAL			0x1
> +#define HFI_LTR_MODE_PERIODIC			0x2
> +
> +#define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
>   #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
>   #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
> +#define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
> +#define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
>   #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
> 
>   struct hfi_pkt_hdr {
> @@ -460,6 +468,22 @@ struct hfi_intra_refresh {
>   	u32 mbs;
>   };
> 
> +struct hfi_ltr_mode {
> +	u32 mode;
> +	u32 count;
> +	u32 trust_mode;
> +};
> +
> +struct hfi_ltr_use {
> +	u32 ref_ltr;
> +	u32 use_constrnt;
> +	u32 frames;
> +};
> +
> +struct hfi_ltr_mark {
> +	u32 mark_frame;
> +};
> +
>   struct hfi_event_data {
>   	u32 error;
>   	u32 height;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index f6a214a6815420f299be70f80732943d02168f0c..2b8c87c25a066ead30bb1b134bdc3fe1e84e8f05 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -71,6 +71,9 @@ enum hfi_rate_control {
>   #define HFI_PROP_MIN_QP_PACKED			0x0300012f
>   #define HFI_PROP_MAX_QP_PACKED			0x03000130
>   #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
> +#define HFI_PROP_LTR_COUNT			0x03000134
> +#define HFI_PROP_LTR_MARK			0x03000135
> +#define HFI_PROP_LTR_USE			0x03000136
>   #define HFI_PROP_TOTAL_BITRATE			0x0300013b
>   #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
>   #define HFI_PROP_MAX_B_FRAMES			0x03000147
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index dd0a4210a2647ff4dadf8d67b71c6f4a22deb548..c48dfb6d47734fadd4f2e4123c93560f55355b86 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -29,6 +29,9 @@ struct iris_inst;
>   #define MAX_QP_HEVC				63
>   #define DEFAULT_QP				20
>   #define BITRATE_DEFAULT			20000000
> +#define INVALID_DEFAULT_MARK_OR_USE_LTR		-1
> +#define MAX_LTR_FRAME_COUNT_GEN1		4
> +#define MAX_LTR_FRAME_COUNT_GEN2		2
> 
>   enum stage_type {
>   	STAGE_1 = 1,
> @@ -148,6 +151,9 @@ enum platform_inst_fw_cap_type {
>   	VFLIP,
>   	IR_TYPE,
>   	IR_PERIOD,
> +	LTR_COUNT,
> +	USE_LTR,
> +	MARK_LTR,
>   	INST_FW_CAP_MAX,
>   };
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index e7645bd60eb46785e0110a34f3257f7c37bbfca5..13cee5f72a443b85136d30b41b589aeb0db8eb9a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -249,6 +249,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>   		.flags = CAP_FLAG_OUTPUT_PORT,
>   		.set = iris_set_ir_period_gen1,
>   	},
> +	{
> +		.cap_id = LTR_COUNT,
> +		.min = 0,
> +		.max = MAX_LTR_FRAME_COUNT_GEN1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_LTRMODE,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_ltr_count_gen1,
> +	},
> +	{
> +		.cap_id = USE_LTR,
> +		.min = 0,
> +		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN1) - 1),
> +		.step_or_mask = 0,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_USELTRFRAME,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_use_ltr,
> +	},
> +	{
> +		.cap_id = MARK_LTR,
> +		.min = 0,
> +		.max = (MAX_LTR_FRAME_COUNT_GEN1 - 1),
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_mark_ltr,
> +	},
>   };
> 
>   static struct platform_inst_caps platform_inst_cap_sm8250 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index b3425dcea22ceadbd56021e5859a24134100d5df..6ae34312f50d4a3709ca20b3aadcfee12338a2f7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -637,6 +637,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>   			CAP_FLAG_DYNAMIC_ALLOWED,
>   		.set = iris_set_ir_period_gen2,
>   	},
> +	{
> +		.cap_id = LTR_COUNT,
> +		.min = 0,
> +		.max = MAX_LTR_FRAME_COUNT_GEN2,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_LTR_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_ltr_count_gen2,
> +	},
> +	{
> +		.cap_id = USE_LTR,
> +		.min = 0,
> +		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN2) - 1),
> +		.step_or_mask = 0,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_LTR_USE,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_use_and_mark_ltr,
> +	},
> +	{
> +		.cap_id = MARK_LTR,
> +		.min = INVALID_DEFAULT_MARK_OR_USE_LTR,
> +		.max = (MAX_LTR_FRAME_COUNT_GEN2 - 1),
> +		.step_or_mask = 1,
> +		.value = INVALID_DEFAULT_MARK_OR_USE_LTR,
> +		.hfi_id = HFI_PROP_LTR_MARK,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_use_and_mark_ltr,
> +	},
>   };
> 
>   static struct platform_inst_caps platform_inst_cap_sm8550 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 1e54ace966c74956208d88f06837b97b1fd48e17..8139fefe40fe179ff7862bbca879ce94c71c1f89 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -668,6 +668,19 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
>   				  num_vpp_pipes, inst->hfi_rc_type);
>   }
> 
> +static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
> +{
> +	u32 num_ref = 1;
> +	u32 ltr_count;
> +
> +	ltr_count = inst->fw_caps[LTR_COUNT].value;
> +
> +	if (ltr_count)
> +		num_ref = num_ref + ltr_count;
> +
> +	return num_ref + 1;
> +}
> +
>   static inline
>   u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
>   			u32 num_recon, u32 standard)
> @@ -693,17 +706,14 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
>   {
>   	u32 height = iris_vpu_enc_get_bitstream_height(inst);
>   	u32 width = iris_vpu_enc_get_bitstream_width(inst);
> -	u32 num_recon = 1;
> -	u32 lcu_size = 16;
> +	u32 num_recon = hfi_buffer_get_recon_count(inst);
> +	u32 standard, lcu_size;
> 
> -	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> -		lcu_size = 32;
> -		return hfi_buffer_comv_enc(width, height, lcu_size,
> -					   num_recon + 1, HFI_CODEC_ENCODE_HEVC);
> -	}
> +	standard = (inst->codec == V4L2_PIX_FMT_HEVC) ?
> +		   HFI_CODEC_ENCODE_HEVC : HFI_CODEC_ENCODE_AVC;
> +	lcu_size = (inst->codec == V4L2_PIX_FMT_HEVC) ? 32 : 16;
> 
> -	return hfi_buffer_comv_enc(width, height, lcu_size,
> -				   num_recon + 1, HFI_CODEC_ENCODE_AVC);
> +	return hfi_buffer_comv_enc(width, height, lcu_size, num_recon, standard);
>   }
> 
>   static inline
> @@ -1402,10 +1412,9 @@ static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
>   {
>   	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
>   	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
> -	u32 num_ref = 1;
> +	u32 num_ref = hfi_buffer_get_recon_count(inst);
> 
> -	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref,
> -				       false);
> +	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref, false);
>   }
> 
>   static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)
> 
> --
> 2.43.0
> 


