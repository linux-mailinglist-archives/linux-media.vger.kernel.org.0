Return-Path: <linux-media+bounces-44613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0838CBDF92B
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 18:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 65A89500C34
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 16:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4C83376A2;
	Wed, 15 Oct 2025 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8BYHj8x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB92337698;
	Wed, 15 Oct 2025 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760544538; cv=none; b=gsowbLVdBUSPMwxDLmaVJX55hsFF/ICsqjkjJmW3LVKl0v0RtrIopAWOgZCJNmG5bEnBKPI45XyMKpTION9QFpVjlz061pBGKWVysA4sILbp+pLJ0wvWuNk1JmlqpxGS9kWFDi+yqlqyto0rchxvJJAwMNcwYBZWJBUu4qMFuc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760544538; c=relaxed/simple;
	bh=wxhM2lHKazzqBRJ2pAb29Vk//VglhpXBXYEpw04u9ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jM2e+TcYjjleLaxRg/TB4kdeJEjb+8DU5RYYwFONObooTkGCwzncGWqr18m4LBpUIcP/G/gXMxdK6B6vmakq+xBE3G5UFjvObfk5ifyI6PYf5kpiyVtI4+7TB5q0XLAT5MitHuqyk4iAnC2bcr4/tecxDEDxm2byDq1XDViJgnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8BYHj8x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8C3C4CEFB;
	Wed, 15 Oct 2025 16:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760544538;
	bh=wxhM2lHKazzqBRJ2pAb29Vk//VglhpXBXYEpw04u9ps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u8BYHj8x0sUFZndZ2bLbNqtcuC9BCRsbvg7pFJvyen15BwCk21dbKl6kkCoXHoULE
	 /ypVNjol+5CpMlAHvSthHZEHDYxgugQqBSMo09ixCfl3iRZENJ0LOn5xAc5ZmPR84t
	 gECbYpyqGvXntuzFxoHsdOVlEZpBViPA/f3qyiYbSk3b1xYRAamwDzgi7JpG63BjSL
	 Jhex2a4tHuGycnqqwDlwg8Ko3I6pYFpQ6Rt9tFMhqxPhWeBuNtUSYRVJ+YdO79ZXTc
	 lVpuztuTWmur1jyKwRlcKSM16LisetvOxG15qYs9E4HXxSNgd5QlZGvzguJ22lqGHX
	 PQhPEsZcvb8ng==
Message-ID: <437c380e-885e-4458-9913-788ece5a4ecc@kernel.org>
Date: Wed, 15 Oct 2025 17:08:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] media: qcom: iris: Add rotation support for
 encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 abhinav.kumar@linux.dev, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
 quic_renjiang@quicinc.com
References: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
 <VvDBI2gT4oH7ZFT0ooUS3sR8qVBmREmQCBoO6TyzK-3QbZzvQP6xByAlET8sWzpVPkJEeoa8pOCgjIHmayqBug==@protonmail.internalid>
 <20251015092708.3703-3-wangao.wang@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251015092708.3703-3-wangao.wang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2025 10:27, Wangao Wang wrote:
> Add rotation control for encoder, enabling V4L2_CID_ROTATE and handling
>   90/180/270 degree rotation.
> 
> Add VPSS buffer to platform data, which the rotate function requires.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 34 ++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h |  1 +
>   .../qcom/iris/iris_hfi_gen2_command.c         | 12 ++++-
>   .../qcom/iris/iris_hfi_gen2_defines.h         |  9 ++++
>   .../qcom/iris/iris_hfi_gen2_response.c        |  2 +
>   .../platform/qcom/iris/iris_platform_common.h |  1 +
>   .../platform/qcom/iris/iris_platform_gen2.c   | 20 +++++++
>   drivers/media/platform/qcom/iris/iris_utils.c |  6 +++
>   drivers/media/platform/qcom/iris/iris_utils.h |  1 +
>   .../platform/qcom/iris/iris_vpu_buffer.c      | 52 +++++++++++--------
>   10 files changed, 114 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 754a5ad718bc..00949c207ddb 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -98,6 +98,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>   		return B_FRAME_QP_H264;
>   	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
>   		return B_FRAME_QP_HEVC;
> +	case V4L2_CID_ROTATE:
> +		return ROTATION;
>   	default:
>   		return INST_FW_CAP_MAX;
>   	}
> @@ -185,6 +187,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>   		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
>   	case B_FRAME_QP_HEVC:
>   		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
> +	case ROTATION:
> +		return V4L2_CID_ROTATE;
>   	default:
>   		return 0;
>   	}
> @@ -883,6 +887,36 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>   				     &range, sizeof(range));
>   }
> 
> +int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 hfi_val;
> +
> +	switch (inst->fw_caps[cap_id].value) {
> +	case 0:
> +		hfi_val = HFI_ROTATION_NONE;
> +		return 0;
> +	case 90:
> +		hfi_val = HFI_ROTATION_90;
> +		break;
> +	case 180:
> +		hfi_val = HFI_ROTATION_180;
> +		break;
> +	case 270:
> +		hfi_val = HFI_ROTATION_270;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
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
> index 30af333cc494..3ea0a00c7587 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -32,6 +32,7 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>   int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_properties(struct iris_inst *inst, u32 plane);
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index c2258dfb2a8a..15db4f9e85ff 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -198,8 +198,12 @@ static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
>   		payload_type = HFI_PAYLOAD_U32;
>   	} else {
>   		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> -		resolution = ALIGN(inst->enc_bitstream_width, codec_align) << 16 |
> -			ALIGN(inst->enc_bitstream_height, codec_align);
> +		if (is_rotation_90_or_270(inst))
> +			resolution = ALIGN(inst->enc_bitstream_height, codec_align) << 16 |
> +				ALIGN(inst->enc_bitstream_width, codec_align);
> +		else
> +			resolution = ALIGN(inst->enc_bitstream_width, codec_align) << 16 |
> +				ALIGN(inst->enc_bitstream_height, codec_align);

That complex assignement can be expressed as a macro, static inline or 
just a regular method instead of copy/paste the same code with one 
variable changed.

>   		inst_hfi_gen2->dst_subcr_params.bitstream_resolution = resolution;
>   		payload_type = HFI_PAYLOAD_32_PACKED;
>   	}
> @@ -241,6 +245,10 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>   		right_offset = (ALIGN(inst->enc_raw_width, codec_align) - inst->enc_raw_width);
>   		left_offset = inst->crop.left;
>   		top_offset = inst->crop.top;
> +		if (inst->fw_caps[ROTATION].value) {
> +			bottom_offset = 0;
> +			right_offset = 0;
> +		}
>   	}
> 
>   	payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index aa1f795f5626..4edcce7faf5e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -83,6 +83,15 @@ enum hfi_seq_header_mode {
>   };
> 
>   #define HFI_PROP_SEQ_HEADER_MODE		0x03000149
> +
> +enum hfi_rotation {
> +	HFI_ROTATION_NONE = 0x00000000,
> +	HFI_ROTATION_90   = 0x00000001,
> +	HFI_ROTATION_180  = 0x00000002,
> +	HFI_ROTATION_270  = 0x00000003,
> +};
> +
> +#define HFI_PROP_ROTATION			0x0300014b
>   #define HFI_PROP_SIGNAL_COLOR_INFO		0x03000155
>   #define HFI_PROP_PICTURE_TYPE			0x03000162
>   #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 2f1f118eae4f..dc3e606b6ab4 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>   			return BUF_SCRATCH_2;
>   	case HFI_BUFFER_PERSIST:
>   		return BUF_PERSIST;
> +	case HFI_BUFFER_VPSS:
> +		return BUF_VPSS;
>   	default:
>   		return 0;
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 58d05e0a112e..9a4232b1c64e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -140,6 +140,7 @@ enum platform_inst_fw_cap_type {
>   	P_FRAME_QP_HEVC,
>   	B_FRAME_QP_H264,
>   	B_FRAME_QP_HEVC,
> +	ROTATION,
>   	INST_FW_CAP_MAX,
>   };
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 36d69cc73986..c2cba30be83d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -588,6 +588,16 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>   		.flags = CAP_FLAG_OUTPUT_PORT,
>   		.set = iris_set_u32,
>   	},
> +	{
> +		.cap_id = ROTATION,
> +		.min = 0,
> +		.max = 270,
> +		.step_or_mask = 90,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_ROTATION,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_rotation,
> +	},
>   };
> 
>   static struct platform_inst_caps platform_inst_cap_sm8550 = {
> @@ -729,6 +739,10 @@ static const u32 sm8550_dec_op_int_buf_tbl[] = {
>   	BUF_DPB,
>   };
> 
> +static const u32 sm8550_enc_ip_int_buf_tbl[] = {
> +	BUF_VPSS,
> +};
> +
>   static const u32 sm8550_enc_op_int_buf_tbl[] = {
>   	BUF_BIN,
>   	BUF_COMV,
> @@ -816,6 +830,8 @@ struct iris_platform_data sm8550_data = {
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> 
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>   	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> @@ -908,6 +924,8 @@ struct iris_platform_data sm8650_data = {
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> 
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>   	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> @@ -989,6 +1007,8 @@ struct iris_platform_data sm8750_data = {
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> 
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>   	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index 85c70a62b1fd..97465dfbdec1 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -124,3 +124,9 @@ int iris_check_core_mbps(struct iris_inst *inst)
> 
>   	return 0;
>   }
> +
> +bool is_rotation_90_or_270(struct iris_inst *inst)
> +{
> +	return inst->fw_caps[ROTATION].value == 90 ||
> +		inst->fw_caps[ROTATION].value == 270;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
> index 75740181122f..b5705d156431 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.h
> +++ b/drivers/media/platform/qcom/iris/iris_utils.h
> @@ -51,5 +51,6 @@ void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>   int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush);
>   int iris_check_core_mbpf(struct iris_inst *inst);
>   int iris_check_core_mbps(struct iris_inst *inst);
> +bool is_rotation_90_or_270(struct iris_inst *inst);
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 4463be05ce16..749cc3139de2 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -556,6 +556,22 @@ static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
>   		iris_vpu_dec_line_size(inst);
>   }
> 
> +static inline u32 iris_vpu_enc_get_bitstream_width(struct iris_inst *inst)
> +{
> +	if (is_rotation_90_or_270(inst))
> +		return inst->fmt_dst->fmt.pix_mp.height;
> +	else
> +		return inst->fmt_dst->fmt.pix_mp.width;
> +}
> +
> +static inline u32 iris_vpu_enc_get_bitstream_height(struct iris_inst *inst)
> +{
> +	if (is_rotation_90_or_270(inst))
> +		return inst->fmt_dst->fmt.pix_mp.width;
> +	else
> +		return inst->fmt_dst->fmt.pix_mp.height;
> +}
> +
>   static inline u32 size_bin_bitstream_enc(u32 width, u32 height,
>   					 u32 rc_type)
>   {
> @@ -638,10 +654,9 @@ static inline u32 hfi_buffer_bin_enc(u32 width, u32 height,
>   static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
>   {
>   	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> +	u32 height = iris_vpu_enc_get_bitstream_height(inst);
> +	u32 width = iris_vpu_enc_get_bitstream_width(inst);
>   	u32 stage = inst->fw_caps[STAGE].value;
> -	struct v4l2_format *f = inst->fmt_dst;
> -	u32 height = f->fmt.pix_mp.height;
> -	u32 width = f->fmt.pix_mp.width;
>   	u32 lcu_size;
> 
>   	if (inst->codec == V4L2_PIX_FMT_HEVC)
> @@ -676,9 +691,8 @@ u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
> 
>   static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
>   {
> -	struct v4l2_format *f = inst->fmt_dst;
> -	u32 height = f->fmt.pix_mp.height;
> -	u32 width = f->fmt.pix_mp.width;
> +	u32 height = iris_vpu_enc_get_bitstream_height(inst);
> +	u32 width = iris_vpu_enc_get_bitstream_width(inst);
>   	u32 num_recon = 1;
>   	u32 lcu_size = 16;
> 
> @@ -958,9 +972,8 @@ u32 hfi_buffer_non_comv_enc(u32 frame_width, u32 frame_height,
>   static u32 iris_vpu_enc_non_comv_size(struct iris_inst *inst)
>   {
>   	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> -	struct v4l2_format *f = inst->fmt_dst;
> -	u32 height = f->fmt.pix_mp.height;
> -	u32 width = f->fmt.pix_mp.width;
> +	u32 height = iris_vpu_enc_get_bitstream_height(inst);
> +	u32 width = iris_vpu_enc_get_bitstream_width(inst);
>   	u32 lcu_size = 16;
> 
>   	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> @@ -1051,9 +1064,8 @@ u32 hfi_buffer_line_enc_vpu33(u32 frame_width, u32 frame_height, bool is_ten_bit
>   static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
>   {
>   	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> -	struct v4l2_format *f = inst->fmt_dst;
> -	u32 height = f->fmt.pix_mp.height;
> -	u32 width = f->fmt.pix_mp.width;
> +	u32 height = iris_vpu_enc_get_bitstream_height(inst);
> +	u32 width = iris_vpu_enc_get_bitstream_width(inst);
>   	u32 lcu_size = 16;
> 
>   	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> @@ -1131,10 +1143,8 @@ static u32 iris_vpu_enc_arp_size(struct iris_inst *inst)
> 
>   inline bool is_scaling_enabled(struct iris_inst *inst)
>   {
> -	return inst->crop.left != inst->compose.left ||
> -		inst->crop.top != inst->compose.top ||
> -		inst->crop.width != inst->compose.width ||
> -		inst->crop.height != inst->compose.height;
> +	return inst->fmt_dst->fmt.pix_mp.width != inst->fmt_src->fmt.pix_mp.width ||
> +		inst->fmt_dst->fmt.pix_mp.height != inst->fmt_src->fmt.pix_mp.height;

These long chains of indirection make the code not very readable

Please take pointers to &fmt_dts->fmt and &fmt_src->fmt and reduce this 
clause.

>   }
> 
>   static inline
> @@ -1291,9 +1301,8 @@ static inline u32 hfi_buffer_scratch1_enc(u32 frame_width, u32 frame_height,
>   static u32 iris_vpu_enc_scratch1_size(struct iris_inst *inst)
>   {
>   	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> -	struct v4l2_format *f = inst->fmt_dst;
> -	u32 frame_height = f->fmt.pix_mp.height;
> -	u32 frame_width = f->fmt.pix_mp.width;
> +	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
> +	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
>   	u32 num_ref = 1;
>   	u32 lcu_size;
>   	bool is_h265;
> @@ -1389,9 +1398,8 @@ static inline u32 hfi_buffer_scratch2_enc(u32 frame_width, u32 frame_height,
> 
>   static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
>   {
> -	struct v4l2_format *f = inst->fmt_dst;
> -	u32 frame_width = f->fmt.pix_mp.width;
> -	u32 frame_height = f->fmt.pix_mp.height;
> +	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
> +	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
>   	u32 num_ref = 1;
> 
>   	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref,
> --
> 2.43.0
> 

---
bod

