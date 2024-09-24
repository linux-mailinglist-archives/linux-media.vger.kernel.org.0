Return-Path: <linux-media+bounces-18517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EEC984848
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 17:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05F56283383
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 15:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5544B1AB6CF;
	Tue, 24 Sep 2024 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uO7JWzlM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E5E1AB6D6
	for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727190574; cv=none; b=FElba7SmdX3ibL/P8EAutAuMg5fUanUid82cUKwJnM9n8ji7Aay42tJBvWgx741UwWahB2feMl5i+Zx2I9SiC1K+gw3/vT7PHCSp4gBnwkoovVJSuV6SOoF5zy8jEpuva5ioNK5yqUCkHt/+xkIb25TrbaitiMe06IxoTVYwSsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727190574; c=relaxed/simple;
	bh=wI5b1A7zGiOWOLje6U7Yn0QQOrgj6UTqlJxCLlzafnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WE56l8xjEFP2XQ0pOMVj1IwvxdobDYgfB5peC8ImsclcFLRpixnSvzHZFemV6HTfDInUMFb5pPgBSJBe3Ihe2f2gugedOdjSO5GGVFkkzayprTARzYQ+cQsZv/WKkxD0ovImBSNMoflzPQZI/XF7v7llcF1uim9ggcuOJiySWXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uO7JWzlM; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c718bb04a3so790364a12.3
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727190570; x=1727795370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IAjWodISkISV3HUmSg9RUK1MZwSh8gJqRq0YkkxRkcA=;
        b=uO7JWzlMBJ5pmUiIL0DW6ijP5iMycf1QlagNzHDsyVx/7qg9FSscs6FLFCGfJ/+aiR
         cA96NvbokNC1jLuXQ6oTR5T2FLOXOIh7yEqHqV680d019KVvIkKwNI23tMH2qjv9mYLW
         A/hrww+Gp7csGB41UL9YF8PtMvjSGVUCQ41DEmvHyZNYiaDlfwvi7ujnVYgR7QPrhldJ
         jsFn3Ze6Lfw6BdxPr0fueueeIfn6Ibd96OoPRslKq06jFEoGllBJCAzZWlMFo5GowTC5
         UO9c4c+vt8/HaVo+oDcXc4/yp2mcpQ3Hzd2TvcE/bUi2hX+p4sxIpuYi9y0iJiFOx6SS
         OPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727190570; x=1727795370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IAjWodISkISV3HUmSg9RUK1MZwSh8gJqRq0YkkxRkcA=;
        b=v2uUpbAfIiViRR1ZIATY76u4mDU+REs9SxKvwOTOp413zMJ6c6pFCLtCxSFk5OBvq0
         nawD7wHjhaTkLQQKWgoQVEPj11MkiHGk+FApf9HJ0RR2ziR7KWLGwIukSBq0Iyu3syiG
         5GIRoba9JHmvqeq4F/EiMXa6WEAJjjhknqbXbP/RUETsAcEwpkgrJ/0j029RUrBOko1P
         lwwbt/wTI6RqXsBIvaqGEwRJZkCUjQmZsHoXzDuJEGsHwNKbW5PYueYlTRROQEylC7+u
         PLagFv5WwIis3UM0qi7mWdeyqYTGxexrtNrT3Wv43zLtxlc8X+FVk1SBJ5W/nV7vmHJ9
         rCQg==
X-Gm-Message-State: AOJu0Yxbw1tMVJoP29KiLBXVfn3zDoBJmzmPezjKQ/KPVikxKQfbi+by
	KhXPjjEoIPfMFl6uctwh4TZEHBtlwX0bupwH5YtPKkkH5diZJTi17x9cWy/MzJA=
X-Google-Smtp-Source: AGHT+IGLkkedAiaA2bYJB/C0hM9mydFvYMrPqVTcbebDrcIyuEajn/eliXvfbniaCmwOtKGfIhXI1w==
X-Received: by 2002:a05:6402:2693:b0:5c5:bad0:df40 with SMTP id 4fb4d7f45d1cf-5c5bad0dfd4mr9429127a12.9.1727190570339;
        Tue, 24 Sep 2024 08:09:30 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf4c50e5sm839987a12.78.2024.09.24.08.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 08:09:29 -0700 (PDT)
Message-ID: <38416875-0664-47cf-848c-6a5dbb0110dd@linaro.org>
Date: Tue, 24 Sep 2024 16:09:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/29] media: iris: implement set properties to
 firmware during streamon
To: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vedang Nagar <quic_vnagar@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-19-c5fdbbe65e70@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240827-iris_v3-v3-19-c5fdbbe65e70@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> During stream on, set some mandatory properties
> to firmware to start a session. Set all v4l2 properties set
> by client, to firmware prepared with the dependency graph.
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c     | 113 ++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.c      |  99 +++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |   7 +
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |  76 ++++
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     | 418 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  79 ++++
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   2 +
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 327 ++++++++++++++++
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  20 +
>   .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 112 ++++++
>   .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   7 +
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  50 +++
>   .../platform/qcom/iris/iris_platform_common.h      |  11 +
>   .../platform/qcom/iris/iris_platform_sm8250.c      |  19 +
>   .../platform/qcom/iris/iris_platform_sm8550.c      |  31 ++
>   drivers/media/platform/qcom/iris/iris_utils.c      |  22 ++
>   drivers/media/platform/qcom/iris/iris_utils.h      |   3 +
>   drivers/media/platform/qcom/iris/iris_vdec.c       |  11 +
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  22 ++
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   1 +
>   20 files changed, 1430 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 652117a19b45..b90b912d73b6 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -64,6 +64,117 @@ static u32 iris_output_buffer_size_nv12(struct iris_inst *inst)
>   	return ALIGN(y_plane + uv_plane, PIXELS_4K);
>   }
>   
> +/*
> + * QC08C:
> + * Compressed Macro-tile format for NV12.
> + * Contains 4 planes in the following order -
> + * (A) Y_Meta_Plane
> + * (B) Y_UBWC_Plane
> + * (C) UV_Meta_Plane
> + * (D) UV_UBWC_Plane
> + *
> + * Y_Meta_Plane consists of meta information to decode compressed
> + * tile data in Y_UBWC_Plane.
> + * Y_UBWC_Plane consists of Y data in compressed macro-tile format.
> + * UBWC decoder block will use the Y_Meta_Plane data together with
> + * Y_UBWC_Plane data to produce loss-less uncompressed 8 bit Y samples.
> + *
> + * UV_Meta_Plane consists of meta information to decode compressed
> + * tile data in UV_UBWC_Plane.
> + * UV_UBWC_Plane consists of UV data in compressed macro-tile format.
> + * UBWC decoder block will use UV_Meta_Plane data together with
> + * UV_UBWC_Plane data to produce loss-less uncompressed 8 bit 2x2
> + * subsampled color difference samples.
> + *
> + * Each tile in Y_UBWC_Plane/UV_UBWC_Plane is independently decodable
> + * and randomly accessible. There is no dependency between tiles.
> + *
> + * <----- y_meta_stride ---->
> + * <-------- Width ------>
> + * M M M M M M M M M M M M . .      ^           ^
> + * M M M M M M M M M M M M . .      |           |
> + * M M M M M M M M M M M M . .      Height      |
> + * M M M M M M M M M M M M . .      |         y_meta_scanlines
> + * M M M M M M M M M M M M . .      |           |
> + * M M M M M M M M M M M M . .      |           |
> + * M M M M M M M M M M M M . .      |           |
> + * M M M M M M M M M M M M . .      V           |
> + * . . . . . . . . . . . . . .                  |
> + * . . . . . . . . . . . . . .                  |
> + * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> + * . . . . . . . . . . . . . .                  V
> + * <--Compressed tile y_stride--->
> + * <------- Width ------->
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  Height      |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile y_scanlines
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
> + * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
> + * . . . . . . . . . . . . . . . .              |
> + * . . . . . . . . . . . . . . . .              |
> + * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> + * . . . . . . . . . . . . . . . .              V
> + * <----- uv_meta_stride ---->
> + * M M M M M M M M M M M M . .      ^
> + * M M M M M M M M M M M M . .      |
> + * M M M M M M M M M M M M . .      |
> + * M M M M M M M M M M M M . .      uv_meta_scanlines
> + * . . . . . . . . . . . . . .      |
> + * . . . . . . . . . . . . . .      V
> + * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
> + * <--Compressed tile uv_stride--->
> + * U* V* U* V* U* V* U* V* . . . .  ^
> + * U* V* U* V* U* V* U* V* . . . .  |
> + * U* V* U* V* U* V* U* V* . . . .  |
> + * U* V* U* V* U* V* U* V* . . . .  uv_scanlines
> + * . . . . . . . . . . . . . . . .  |
> + * . . . . . . . . . . . . . . . .  V
> + * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
> + *

As a reviewer, really appreicate the time taken to map this out.

Thanks.

> + * y_stride = align(Width, 128)
> + * uv_stride = align(Width, 128)
> + * y_scanlines = align(Height, 32)
> + * uv_scanlines = align(Height/2, 16)
> + * y_plane = align(y_stride * y_scanlines, 4096)
> + * uv_plane = align(uv_stride * uv_scanlines, 4096)
> + * y_meta_stride = align(roundup(Width, Y_TileWidth), 64)
> + * y_meta_scanlines = align(roundup(Height, Y_TileHeight), 16)
> + * y_meta_plane = align(y_meta_stride * y_meta_scanlines, 4096)
> + * uv_meta_stride = align(roundup(Width, UV_TileWidth), 64)
> + * uv_meta_scanlines = align(roundup(Height, UV_TileHeight), 16)
> + * uv_meta_plane = align(uv_meta_stride * uv_meta_scanlines, 4096)
> + *
> + * Total size = align( y_plane + uv_plane +
> + *           y_meta_plane + uv_meta_plane, 4096)
> + */
> +static u32 iris_output_buffer_size_qc08c(struct iris_inst *inst)
> +{
> +	u32 y_plane, uv_plane, y_stride, uv_stride;
> +	u32 uv_meta_stride, uv_meta_plane;
> +	u32 y_meta_stride, y_meta_plane;
> +	struct v4l2_format *f;
> +
> +	f = inst->fmt_dst;
> +	y_meta_stride = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.width, 32), 64);
> +	y_meta_plane = y_meta_stride * ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.height, 8), 16);
> +	y_meta_plane = ALIGN(y_meta_plane, PIXELS_4K);

This is a smattering of roundings, alignments and magic numbers.

Please add some comments to explain what all of those transformations 
with hard-coded numbers do.

> +
> +	y_stride = ALIGN(f->fmt.pix_mp.width, 128);
> +	y_plane = ALIGN(y_stride * ALIGN(f->fmt.pix_mp.height, 32), PIXELS_4K);
> +
> +	uv_meta_stride = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.width / 2, 16), 64);
> +	uv_meta_plane = uv_meta_stride * ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.height / 2, 8), 16);
> +	uv_meta_plane = ALIGN(uv_meta_plane, PIXELS_4K);
> +
> +	uv_stride = ALIGN(f->fmt.pix_mp.width, 128);
> +	uv_plane = ALIGN(uv_stride * ALIGN(f->fmt.pix_mp.height / 2, 32), PIXELS_4K);
> +
> +	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
> +}
> +
>   static u32 iris_input_buffer_size(struct iris_inst *inst)
>   {
>   	u32 base_res_mbs = NUM_MBS_4K;
> @@ -97,6 +208,8 @@ int iris_get_buffer_size(struct iris_inst *inst,
>   		return iris_input_buffer_size(inst);
>   	case BUF_OUTPUT:
>   		return iris_output_buffer_size_nv12(inst);
> +	case BUF_DPB:
> +		return iris_output_buffer_size_qc08c(inst);
>   	default:
>   		return 0;
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 868306d68a87..64b2f19c2b03 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -3,6 +3,8 @@
>    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
> +#include <linux/types.h>
> +
>   #include "iris_ctrls.h"
>   #include "iris_instance.h"
>   
> @@ -192,3 +194,100 @@ int iris_session_init_caps(struct iris_core *core)
>   
>   	return 0;
>   }
> +
> +static u32 iris_get_port_info(struct iris_inst *inst,
> +			      enum platform_inst_fw_cap_type cap_id)
> +{
> +	if (inst->fw_cap[cap_id].flags & CAP_FLAG_INPUT_PORT)
> +		return HFI_PORT_BITSTREAM;
> +	else if (inst->fw_cap[cap_id].flags & CAP_FLAG_OUTPUT_PORT)
> +		return HFI_PORT_RAW;
> +
> +	return HFI_PORT_NONE;
> +}
> +
> +int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 hfi_value = inst->fw_cap[cap_id].value;
> +	u32 hfi_id = inst->fw_cap[cap_id].hfi_id;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32_ENUM,
> +					     &hfi_value, sizeof(u32));
> +}
> +
> +int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 hfi_value = inst->fw_cap[cap_id].value;
> +	u32 hfi_id = inst->fw_cap[cap_id].hfi_id;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &hfi_value, sizeof(u32));
> +}
> +
> +int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct v4l2_format *inp_f;
> +	u32 work_mode = STAGE_2;
> +	u32 width, height;
> +	u32 hfi_id;
> +
> +	hfi_id = inst->fw_cap[cap_id].hfi_id;
> +
> +	inp_f = inst->fmt_src;
> +	height = inp_f->fmt.pix_mp.height;
> +	width = inp_f->fmt.pix_mp.width;
> +	if (iris_res_is_less_than(width, height, 1280, 720))
> +		work_mode = STAGE_1;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &work_mode, sizeof(u32));
> +}
> +
> +int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 work_route, hfi_id;
> +
> +	work_route = inst->fw_cap[PIPE].value;
> +	hfi_id = inst->fw_cap[cap_id].hfi_id;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &work_route, sizeof(u32));
> +}
> +
> +int iris_set_properties(struct iris_inst *inst, u32 plane)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct platform_inst_fw_cap *cap;
> +	int ret, i;
> +
> +	ret = hfi_ops->session_set_config_params(inst, plane);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 1; i < INST_FW_CAP_MAX; i++) {
> +		cap = &inst->fw_cap[i];
> +		if (!iris_valid_cap_id(cap->cap_id))
> +			continue;
> +
> +		if (cap->cap_id && cap->set)
> +			cap->set(inst, i);
> +	}
> +
> +	return ret;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 46e1da847aa8..ece28623070b 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -6,10 +6,17 @@
>   #ifndef _IRIS_CTRLS_H_
>   #define _IRIS_CTRLS_H_
>   
> +#include "iris_platform_common.h"
> +
>   struct iris_core;
>   struct iris_inst;
>   
>   int iris_ctrls_init(struct iris_inst *inst);
>   int iris_session_init_caps(struct iris_core *core);
> +int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_properties(struct iris_inst *inst, u32 plane);
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index 4ac97692d072..fa409a9b3f04 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -43,11 +43,75 @@ enum hfi_packet_host_flags {
>   	HFI_HOST_FLAGS_GET_PROPERTY		= 0x00000008,
>   };
>   
> +enum hfi_color_primaries {
> +	HFI_PRIMARIES_RESERVED		= 0,
> +	HFI_PRIMARIES_BT709		= 1,
> +	HFI_PRIMARIES_UNSPECIFIED	= 2,
> +	HFI_PRIMARIES_BT470_SYSTEM_M	= 4,
> +	HFI_PRIMARIES_BT470_SYSTEM_BG	= 5,
> +	HFI_PRIMARIES_BT601_525		= 6,
> +	HFI_PRIMARIES_SMPTE_ST240M	= 7,
> +	HFI_PRIMARIES_GENERIC_FILM	= 8,
> +	HFI_PRIMARIES_BT2020		= 9,
> +	HFI_PRIMARIES_SMPTE_ST428_1	= 10,
> +	HFI_PRIMARIES_SMPTE_RP431_2	= 11,
> +	HFI_PRIMARIES_SMPTE_EG431_1	= 12,
> +	HFI_PRIMARIES_SMPTE_EBU_TECH	= 22,
> +};
> +
> +enum hfi_transfer_characteristics {
> +	HFI_TRANSFER_RESERVED		= 0,
> +	HFI_TRANSFER_BT709		= 1,
> +	HFI_TRANSFER_UNSPECIFIED	= 2,
> +	HFI_TRANSFER_BT470_SYSTEM_M	= 4,
> +	HFI_TRANSFER_BT470_SYSTEM_BG	= 5,
> +	HFI_TRANSFER_BT601_525_OR_625	= 6,
> +	HFI_TRANSFER_SMPTE_ST240M	= 7,
> +	HFI_TRANSFER_LINEAR		= 8,
> +	HFI_TRANSFER_LOG_100_1		= 9,
> +	HFI_TRANSFER_LOG_SQRT		= 10,
> +	HFI_TRANSFER_XVYCC		= 11,
> +	HFI_TRANSFER_BT1361_0		= 12,
> +	HFI_TRANSFER_SRGB_SYCC		= 13,
> +	HFI_TRANSFER_BT2020_14		= 14,
> +	HFI_TRANSFER_BT2020_15		= 15,
> +	HFI_TRANSFER_SMPTE_ST2084_PQ	= 16,
> +	HFI_TRANSFER_SMPTE_ST428_1	= 17,
> +	HFI_TRANSFER_BT2100_2_HLG	= 18,
> +};
> +
> +enum hfi_matrix_coefficients {
> +	HFI_MATRIX_COEFF_SRGB_SMPTE_ST428_1		= 0,
> +	HFI_MATRIX_COEFF_BT709				= 1,
> +	HFI_MATRIX_COEFF_UNSPECIFIED			= 2,
> +	HFI_MATRIX_COEFF_RESERVED			= 3,
> +	HFI_MATRIX_COEFF_FCC_TITLE_47			= 4,
> +	HFI_MATRIX_COEFF_BT470_SYS_BG_OR_BT601_625	= 5,
> +	HFI_MATRIX_COEFF_BT601_525_BT1358_525_OR_625	= 6,
> +	HFI_MATRIX_COEFF_SMPTE_ST240			= 7,
> +	HFI_MATRIX_COEFF_YCGCO				= 8,
> +	HFI_MATRIX_COEFF_BT2020_NON_CONSTANT		= 9,
> +	HFI_MATRIX_COEFF_BT2020_CONSTANT		= 10,
> +	HFI_MATRIX_COEFF_SMPTE_ST2085			= 11,
> +	HFI_MATRIX_COEFF_SMPTE_CHROM_DERV_NON_CONSTANT	= 12,
> +	HFI_MATRIX_COEFF_SMPTE_CHROM_DERV_CONSTANT	= 13,
> +	HFI_MATRIX_COEFF_BT2100				= 14,
> +};
> +
> +struct iris_hfi_prop_type_handle {
> +	u32 type;
> +	int (*handle)(struct iris_inst *inst);
> +};
> +
>   struct iris_hfi_command_ops {
>   	int (*sys_init)(struct iris_core *core);
>   	int (*sys_image_version)(struct iris_core *core);
>   	int (*sys_interframe_powercollapse)(struct iris_core *core);
>   	int (*sys_pc_prep)(struct iris_core *core);
> +	int (*session_set_config_params)(struct iris_inst *inst, u32 plane);
> +	int (*session_set_property)(struct iris_inst *inst,
> +				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
> +				    void *payload, u32 payload_size);
>   	int (*session_open)(struct iris_inst *inst);
>   	int (*session_start)(struct iris_inst *inst, u32 plane);
>   	int (*session_stop)(struct iris_inst *inst, u32 plane);
> @@ -58,6 +122,18 @@ struct iris_hfi_response_ops {
>   	void (*hfi_response_handler)(struct iris_core *core);
>   };
>   
> +struct hfi_subscription_params {
> +	u32	bitstream_resolution;
> +	u32	crop_offsets[2];
> +	u32	bit_depth;
> +	u32	coded_frames;
> +	u32	fw_min_count;
> +	u32	pic_order_cnt;
> +	u32	color_info;
> +	u32	profile;
> +	u32	level;
> +};
> +
>   int iris_hfi_core_init(struct iris_core *core);
>   int iris_hfi_pm_suspend(struct iris_core *core);
>   int iris_hfi_pm_resume(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index a2e29f03bfee..65f561ec76ab 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -6,6 +6,7 @@
>   #include "iris_hfi_gen1.h"
>   #include "iris_hfi_gen1_defines.h"
>   #include "iris_instance.h"
> +#include "iris_vpu_buffer.h"
>   
>   static int iris_hfi_gen1_sys_init(struct iris_core *core)
>   {
> @@ -182,12 +183,429 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
>   	return ret;
>   }
>   
> +static int
> +iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *packet,
> +					  struct iris_inst *inst, u32 ptype, void *pdata)
> +{
> +	void *prop_data;
> +
> +	prop_data = &packet->data[1];
> +
> +	packet->shdr.hdr.size = sizeof(*packet);
> +	packet->shdr.hdr.pkt_type = HFI_CMD_SESSION_SET_PROPERTY;
> +	packet->shdr.session_id = inst->session_id;
> +	packet->num_properties = 1;
> +	packet->data[0] = ptype;
> +
> +	switch (ptype) {
> +	case HFI_PROPERTY_PARAM_FRAME_SIZE: {
> +		struct hfi_framesize *in = pdata, *fsize = prop_data;
> +
> +		fsize->buffer_type = in->buffer_type;
> +		fsize->height = in->height;
> +		fsize->width = in->width;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*fsize);

You do this thing with sizeof(u32) all through this function. What's it 
for - some kind of packet overhead I suppose.

Please define this type of repeated offsetting to a #define or similar 
which is commented.

Again for comprehensibility sake.

> +		break;
> +	}
> +	case HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE: {
> +		struct hfi_videocores_usage_type *in = pdata, *cu = prop_data;
> +
> +		cu->video_core_enable_mask = in->video_core_enable_mask;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*cu);
> +		break;
> +	}
> +	case HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT: {
> +		struct hfi_uncompressed_format_select *in = pdata;
> +		struct hfi_uncompressed_format_select *hfi = prop_data;
> +
> +		hfi->buffer_type = in->buffer_type;
> +		hfi->format = in->format;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*hfi);
> +		break;
> +	}
> +	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO: {
> +		struct hfi_uncompressed_plane_actual_constraints_info *info = prop_data;
> +
> +		info->buffer_type = HFI_BUFFER_OUTPUT2;
> +		info->num_planes = 2;
> +		info->plane_format[0].stride_multiples = 128;
> +		info->plane_format[0].max_stride = 8192;
> +		info->plane_format[0].min_plane_buffer_height_multiple = 32;
> +		info->plane_format[0].buffer_alignment = 256;
> +		if (info->num_planes > 1) {
> +			info->plane_format[1].stride_multiples = 128;
> +			info->plane_format[1].max_stride = 8192;
> +			info->plane_format[1].min_plane_buffer_height_multiple = 16;
> +			info->plane_format[1].buffer_alignment = 256;
> +		}
> +
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*info);

Alot of magic numbers and fixed stride sizes. As a reviewer its pretty 
difficult to discern if these are correct.

I feel they probably are but it makes me hesitating adding a Review-by 
without more information.

A comment or a macro with a name that describes that stride/alignement 
multiple / whatever.

---
bod

