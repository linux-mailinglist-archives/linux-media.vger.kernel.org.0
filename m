Return-Path: <linux-media+bounces-43063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 410FDB9A07A
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 15:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F2FF1899643
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 13:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820E5302748;
	Wed, 24 Sep 2025 13:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMnbHh58"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39E21ADFFB;
	Wed, 24 Sep 2025 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758720527; cv=none; b=VqeYd/Af7vHhX0dgiOgNs2cGsCMD43qMAKXdPTg0A7SCk9eaXfbuDF74xeMBvlsMB+2PbWEIVO9zfsntBebtGFBHC1GarPYe9NQu2PyaZPLBJhhyoLA26ON9sXSSQ/YA4R+lDy3JMyPKlN8zdeyPxFlSBGPjuNkdn+eZ4iqifNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758720527; c=relaxed/simple;
	bh=ECLDkssgzzs/zAyW85AovNWJBwLlkh7rXuyl0VEp6RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3Jw0i8Zkz211I0Dm19WKeh11JacG26aBDGhVW/8whEr6ldjqeWRHJ6x2zy4xsTeZBhbS4cH5PLVCWQ88DhLiPzlL5VGb3KUH3xuaEVxAACilzGPgx8JH1aa+MTAy5WasQAUwSbkPPSlXrYXJmNeJDRnZ/wnZlteLPbQYd4x6Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMnbHh58; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F20C4CEE7;
	Wed, 24 Sep 2025 13:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758720527;
	bh=ECLDkssgzzs/zAyW85AovNWJBwLlkh7rXuyl0VEp6RY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EMnbHh581wcIH2tBVJrSo2df6RRbppI/ljrTK3x8z/Q9xvs7usggd//vspg8uO8Sf
	 48+KOO21EXxLN/O6J5EG6iLiqU2f/ml3qaVCzWy4AvXTuuaHqf+FP8ryTA4Gsighl8
	 Z4vQX7e95mKulQN4joZpH/aLglYwMz1J/yRe1XcAjL8lnG5xrAMHiCEy4jUBZpJYKr
	 0ErAExzg8idqx+ygqQYw7wiZFXAf1nmp8GKETtdgLCC1F5kZ0UvQuOdGPuhBO/YPOH
	 /soKR+GjmZGuIGSL1izXt6CubhNUGl1YJTXDHW28i/k3Cs/Trwm0sRO6RnUQrhRCZj
	 miaUIhS84MAlQ==
Message-ID: <27e36fdb-3107-4e7b-b402-fd72ea5c4d61@kernel.org>
Date: Wed, 24 Sep 2025 14:28:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: iris: Add support for QC08C format for decoder
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
 <OyMR2y907eHs6rnnO6bzy52LY_t8KXKscM-nTPu48x3NCYFU4mza-uz0HqnQlYqPg2JtDB8AhCtGAa26Cbq4PA==@protonmail.internalid>
 <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/09/2025 16:47, Dikshita Agarwal wrote:
> Introduce handling for the QC08C format in the decoder.
> Update format checks and configuration to enable decoding of QC08C
> streams.

Since QC08C is a Qualcomm specific pixel format, you should detail in 
your commit log exactly what the packing/ordering of pixels is.

In other words tell the reader more about QC08C.

> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c     |  5 +-
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 +++--
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 18 ++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
>   drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
>   8 files changed, 89 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index c0900038e7defccf7de3cb60e17c71e36a0e8ead..83dcf49e57ec1473bc4edd26c48ab0b247d23818 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -261,7 +261,10 @@ int iris_get_buffer_size(struct iris_inst *inst,
>   		case BUF_INPUT:
>   			return iris_dec_bitstream_buffer_size(inst);
>   		case BUF_OUTPUT:
> -			return iris_yuv_buffer_size_nv12(inst);
> +			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)

It'd be nice to get a pointer to the final level of indireciton you need 
generally, instead of these very->long->lists->of.indirections.

Please consider getting a final pointer as much as possible especially 
in functions where you end up writing those long chains over and over again.

> +				return iris_yuv_buffer_size_qc08c(inst);
> +			else
> +				return iris_yuv_buffer_size_nv12(inst);
>   		case BUF_DPB:
>   			return iris_yuv_buffer_size_qc08c(inst);
>   		default:
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index e1788c266bb1080921f17248fd5ee60156b3143d..e458d3349ce09aadb75d056ae84e3aab95f03078 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -774,20 +774,21 @@ static int iris_hfi_gen1_set_raw_format(struct iris_inst *inst, u32 plane)
>   		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>   		if (iris_split_mode_enabled(inst)) {
>   			fmt.buffer_type = HFI_BUFFER_OUTPUT;
> -			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
> -				HFI_COLOR_FORMAT_NV12_UBWC : 0;
> +			fmt.format = HFI_COLOR_FORMAT_NV12_UBWC;
> 
>   			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>   			if (ret)
>   				return ret;
> 
>   			fmt.buffer_type = HFI_BUFFER_OUTPUT2;
> -			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
> +			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
> +				HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
> 
>   			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>   		} else {
>   			fmt.buffer_type = HFI_BUFFER_OUTPUT;
> -			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
> +			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
> +				HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
> 
>   			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>   		}
> @@ -806,6 +807,9 @@ static int iris_hfi_gen1_set_format_constraints(struct iris_inst *inst, u32 plan
>   	const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO;
>   	struct hfi_uncompressed_plane_actual_constraints_info pconstraint;
> 
> +	if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
> +		return 0;
> +
>   	pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
>   	pconstraint.num_planes = 2;
>   	pconstraint.plane_format[0].stride_multiples = 128;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 4ce71a14250832440099e4cf3835b4aedfb749e8..5ad202d3fcdc57a2b7b43de15763a686ce0f7bd7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -422,6 +422,20 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst, u32 plane)
>   						  sizeof(u32));
>   }
> 
> +static int iris_hfi_gen2_set_opb_enable(struct iris_inst *inst, u32 plane)
> +{
> +	u32 port = iris_hfi_gen2_get_port(inst, plane);
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
>   static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>   {
>   	u32 port = iris_hfi_gen2_get_port(inst, plane);
> @@ -429,7 +443,8 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
> 
>   	if (inst->domain == DECODER) {
>   		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
> -		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
> +		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
> +			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>   	} else {
>   		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>   		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
> @@ -527,6 +542,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>   		{HFI_PROP_SIGNAL_COLOR_INFO,          iris_hfi_gen2_set_colorspace             },
>   		{HFI_PROP_PROFILE,                    iris_hfi_gen2_set_profile                },
>   		{HFI_PROP_LEVEL,                      iris_hfi_gen2_set_level                  },
> +		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },


As I read this code I end up asking myself "what does OPB" mean ?

For preference the introduction of OPB would be its own patch with its 
own commit log that explains OPB as an individual thing.

You can enable your QC08C format as an additional step.


>   		{HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
>   		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
>   		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index aa1f795f5626c1f76a32dd650302633877ce67be..1b6a4dbac828ffea53c1be0d3624a033c283c972 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -91,6 +91,7 @@ enum hfi_seq_header_mode {
>   #define HFI_PROP_BUFFER_MARK			0x0300016c
>   #define HFI_PROP_RAW_RESOLUTION		0x03000178
>   #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
> +#define HFI_PROP_OPB_ENABLE			0x03000184
>   #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
>   #define HFI_PROP_END				0x03FFFFFF
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 5982d7adefeab80905478b32cddba7bd4651a691..11134f75c26dd1f6c92ba72fbf4e56e41a72de64 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -15,12 +15,17 @@
>   #define DEFAULT_WIDTH 320
>   #define DEFAULT_HEIGHT 240
> 
> -enum iris_fmt_type {
> +enum iris_fmt_type_out {
>   	IRIS_FMT_H264,
>   	IRIS_FMT_HEVC,
>   	IRIS_FMT_VP9,
>   };
> 
> +enum iris_fmt_type_cap {
> +	IRIS_FMT_NV12,
> +	IRIS_FMT_UBWC,
> +};
> +
>   struct iris_fmt {
>   	u32 pixfmt;
>   	u32 type;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 36d69cc73986b74534a2912524c8553970fd862e..69c952c68e939f305f25511e2e4763487ec8e0de 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -691,6 +691,7 @@ static const u32 sm8550_venc_input_config_params[] = {
>   };
> 
>   static const u32 sm8550_vdec_output_config_params[] = {
> +	HFI_PROP_OPB_ENABLE,
>   	HFI_PROP_COLOR_FORMAT,
>   	HFI_PROP_LINEAR_STRIDE_SCANLINE,
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index 85c70a62b1fd2c409fc18b28f64771cb0097a7fd..e2f1131de43128254d8211343771e657e425541e 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -34,7 +34,8 @@ int iris_get_mbpf(struct iris_inst *inst)
> 
>   bool iris_split_mode_enabled(struct iris_inst *inst)
>   {
> -	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12;
> +	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12 ||
> +		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
>   }
> 
>   void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb..7fa745c6bf8950d192c2d2fc1770c4b6fd7b8c4c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -67,7 +67,7 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>   	kfree(inst->fmt_src);
>   }
> 
> -static const struct iris_fmt iris_vdec_formats[] = {
> +static const struct iris_fmt iris_vdec_formats_out[] = {
>   	[IRIS_FMT_H264] = {
>   		.pixfmt = V4L2_PIX_FMT_H264,
>   		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> @@ -82,12 +82,35 @@ static const struct iris_fmt iris_vdec_formats[] = {
>   	},
>   };
> 
> +static const struct iris_fmt iris_vdec_formats_cap[] = {
> +	[IRIS_FMT_NV12] = {
> +		.pixfmt = V4L2_PIX_FMT_NV12,
> +		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +	},
> +	[IRIS_FMT_UBWC] = {
> +		.pixfmt = V4L2_PIX_FMT_QC08C,
> +		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +	},
> +};
> +
>   static const struct iris_fmt *
>   find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   {
> -	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
> -	const struct iris_fmt *fmt = iris_vdec_formats;
> +	const struct iris_fmt *fmt = NULL;
> +	unsigned int size = 0;
>   	unsigned int i;
> +	switch (type) {
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		fmt = iris_vdec_formats_out;
> +		size = ARRAY_SIZE(iris_vdec_formats_out);
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		fmt = iris_vdec_formats_cap;
> +		size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		break;
> +	default:
> +		return NULL;
> +	}
> 
>   	for (i = 0; i < size; i++) {
>   		if (fmt[i].pixfmt == pixfmt)
> @@ -103,8 +126,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   static const struct iris_fmt *
>   find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>   {
> -	const struct iris_fmt *fmt = iris_vdec_formats;
> -	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
> +	const struct iris_fmt *fmt = NULL;
> +	unsigned int size = 0;
> +
> +	switch (type) {
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		fmt = iris_vdec_formats_out;
> +		size = ARRAY_SIZE(iris_vdec_formats_out);
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		fmt = iris_vdec_formats_cap;
> +		size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		break;
> +	default:
> +		return NULL;
> +	}
> 
>   	if (index >= size || fmt[index].type != type)
>   		return NULL;
> @@ -126,9 +162,10 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
>   		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
>   		break;
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		if (f->index)
> +		fmt = find_format_by_index(inst, f->index, f->type);
> +		if (!fmt)
>   			return -EINVAL;
> -		f->pixelformat = V4L2_PIX_FMT_NV12;
> +		f->pixelformat = fmt->pixfmt;
>   		break;
>   	default:
>   		return -EINVAL;
> @@ -157,7 +194,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   		}
>   		break;
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
> +		if (!fmt) {
>   			f_inst = inst->fmt_dst;
>   			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
>   			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
> @@ -238,10 +275,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   		inst->crop.height = f->fmt.pix_mp.height;
>   		break;
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
> +			return -EINVAL;
> +
>   		fmt = inst->fmt_dst;
>   		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> -		if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
> -			return -EINVAL;
>   		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
>   		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>   		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
> @@ -268,7 +306,8 @@ int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat)
>   {
>   	const struct iris_fmt *fmt = NULL;
> 
> -	if (pixelformat != V4L2_PIX_FMT_NV12) {
> +	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	if (!fmt) {
>   		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>   		if (!fmt)
>   			return -EINVAL;
> 
> --
> 2.34.1
> 


