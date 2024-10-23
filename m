Return-Path: <linux-media+bounces-20104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD999AC872
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 13:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C5B0B2307A
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 11:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930E71A76C8;
	Wed, 23 Oct 2024 11:03:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234A719F437;
	Wed, 23 Oct 2024 11:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729681381; cv=none; b=KYeKMFJ9hctJNWfgwbcitYFvrZ069b+NEhslt6BjdnrXBxSIFqvwBkPT6x358wB6aNbj6wzBQZsYB5AWXUMJbhfSuQTm1Ji2Z5Oke8WFvbpEgKM0w3DeMKxar0vlAGVw6Gle2UdvzLfjfjS9+a3jWbCpe0xGa1RYHgg1sFSCjAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729681381; c=relaxed/simple;
	bh=HKfe+V+81Crx0o1o1zK5ps857vO3lNXfMhhJKnKecxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DutT8FbBpwcFiwB13MMdA6bNDHomzbq70/1KzY+232YRukbI47PMBxsRWB+UPBaU6YYznLqT1SgwIQ7GiWEDpOvk8lRpPjaqJs6J+5F7qNoyw1P1XOdDQIecey1GfnXeYyNz5qxh5Ses97tNlFZoKNl1mYuqAze84AXSK4ilfiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EEBC4CEC6;
	Wed, 23 Oct 2024 11:02:56 +0000 (UTC)
Message-ID: <52163cca-ee17-4c58-b247-8092ab9006f2@xs4all.nl>
Date: Wed, 23 Oct 2024 13:02:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/28] media: iris: implement iris v4l2_ctrl_ops
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vedang Nagar <quic_vnagar@quicinc.com>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-14-c5eaa4e9ab9e@quicinc.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241014-qcom-video-iris-v4-v4-14-c5eaa4e9ab9e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2024 11:07, Dikshita Agarwal wrote:
> Initialize ctrl handler by reading platform specific firmware
> capabilities. Capabilities are features supported by a
> specific platform (SOC). Each capability is defined with
> min, max, range, default value and corresponding HFI.
> Implement s_ctrl and g_volatile_ctrl ctrl ops.
> 
> Co-developed-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>  drivers/media/platform/qcom/iris/iris_core.h       |   2 +
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 186 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  17 ++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   2 +
>  drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
>  .../platform/qcom/iris/iris_platform_common.h      |  29 ++++
>  .../platform/qcom/iris/iris_platform_sm8550.c      |  47 ++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +
>  drivers/media/platform/qcom/iris/iris_vdec.c       |   9 +-
>  drivers/media/platform/qcom/iris/iris_vdec.h       |   2 +-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |   9 +-
>  12 files changed, 308 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 48ab264b7906..f685d76c2f79 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -1,5 +1,6 @@
>  iris-objs += iris_buffer.o \
>               iris_core.o \
> +             iris_ctrls.o \
>               iris_firmware.o \
>               iris_hfi_common.o \
>               iris_hfi_gen1_command.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 578166d196f6..70e0dbc7c457 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -63,6 +63,7 @@ struct icc_info {
>   * @intr_status: interrupt status
>   * @sys_error_handler: a delayed work for handling system fatal error
>   * @instances: a list_head of all instances
> + * @inst_fw_caps: an array of supported instance capabilities
>   */
>  
>  struct iris_core {
> @@ -101,6 +102,7 @@ struct iris_core {
>  	u32					intr_status;
>  	struct delayed_work			sys_error_handler;
>  	struct list_head			instances;
> +	struct platform_inst_fw_cap		inst_fw_caps[INST_FW_CAP_MAX];
>  };
>  
>  int iris_core_init(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> new file mode 100644
> index 000000000000..4b991145dbad
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <media/v4l2-mem2mem.h>
> +#include "iris_ctrls.h"
> +#include "iris_instance.h"
> +
> +static inline bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
> +{
> +	return cap_id >= 1 && cap_id < INST_FW_CAP_MAX;
> +}
> +
> +static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
> +{
> +	switch (id) {
> +	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
> +		return PROFILE;
> +	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
> +		return LEVEL;
> +	default:
> +		return INST_FW_CAP_MAX;
> +	}
> +}
> +
> +static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
> +{
> +	if (!iris_valid_cap_id(cap_id))
> +		return 0;
> +
> +	switch (cap_id) {
> +	case PROFILE:
> +		return V4L2_CID_MPEG_VIDEO_H264_PROFILE;
> +	case LEVEL:
> +		return V4L2_CID_MPEG_VIDEO_H264_LEVEL;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int iris_vdec_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
> +	enum platform_inst_fw_cap_type cap_id;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
> +		ctrl->val = inst->buffers[BUF_OUTPUT].min_count;
> +		break;
> +	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
> +		ctrl->val = inst->buffers[BUF_INPUT].min_count;
> +		break;

This is NOT volatile. It is just a regular read-only control. If the min_count
changes, then just call v4l2_ctrl_s_ctrl for it in the driver to update the
value of this control.

> +	default:
> +		cap_id = iris_get_cap_id(ctrl->id);
> +		if (iris_valid_cap_id(cap_id))
> +			ctrl->val = inst->fw_caps[cap_id].value;

Looking at this code, this is almost certainly not volatile either.
I.e. whenever the driver updates inst->fw_caps[cap_id].value, it can
update this control at the same time.

A volatile control typically reads from the hardware register that is
automatically modified by the hardware. An example is the gain value if
the hardware is in autogain mode and changes the gain value autonomously.

> +		else
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int iris_vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
> +	enum platform_inst_fw_cap_type cap_id;
> +	struct platform_inst_fw_cap *cap;
> +	struct vb2_queue *q;
> +
> +	cap = &inst->fw_caps[0];
> +	cap_id = iris_get_cap_id(ctrl->id);
> +	if (!iris_valid_cap_id(cap_id))
> +		return -EINVAL;
> +
> +	q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	if (vb2_is_streaming(q) &&
> +	    (!(inst->fw_caps[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)))
> +		return -EINVAL;
> +
> +	cap[cap_id].flags |= CAP_FLAG_CLIENT_SET;
> +
> +	inst->fw_caps[cap_id].value = ctrl->val;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops iris_ctrl_ops = {
> +	.s_ctrl = iris_vdec_op_s_ctrl,
> +	.g_volatile_ctrl = iris_vdec_op_g_volatile_ctrl,

So g_volatile_ctrl isn't needed.

> +};
> +
> +int iris_ctrls_init(struct iris_inst *inst)
> +{
> +	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];
> +	u32 num_ctrls = 0, ctrl_idx = 0, idx = 0;
> +	u32 v4l2_id;
> +	int ret;
> +
> +	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
> +		if (iris_get_v4l2_id(cap[idx].cap_id))
> +			num_ctrls++;
> +	}
> +	if (!num_ctrls)
> +		return -EINVAL;
> +
> +	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, num_ctrls);
> +	if (ret)
> +		return ret;
> +
> +	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
> +		struct v4l2_ctrl *ctrl;
> +
> +		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
> +		if (!v4l2_id)
> +			continue;
> +
> +		if (ctrl_idx >= num_ctrls) {
> +			ret = -EINVAL;
> +			goto error;
> +		}
> +
> +		if (cap[idx].flags & CAP_FLAG_MENU) {
> +			ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler,
> +						      &iris_ctrl_ops,
> +						      v4l2_id,
> +						      cap[idx].max,
> +						      ~(cap[idx].step_or_mask),
> +						      cap[idx].value);
> +		} else {
> +			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
> +						 &iris_ctrl_ops,
> +						 v4l2_id,
> +						 cap[idx].min,
> +						 cap[idx].max,
> +						 cap[idx].step_or_mask,
> +						 cap[idx].value);
> +		}
> +		if (!ctrl) {
> +			ret = -EINVAL;
> +			goto error;
> +		}
> +
> +		ret = inst->ctrl_handler.error;
> +		if (ret)
> +			goto error;

Move this out of the loop, you can check the result at the end.

> +
> +		if ((cap[idx].flags & CAP_FLAG_VOLATILE) ||
> +		    (ctrl->id == V4L2_CID_MIN_BUFFERS_FOR_CAPTURE ||
> +		     ctrl->id == V4L2_CID_MIN_BUFFERS_FOR_OUTPUT))
> +			ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
> +
> +		ctrl->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;

Do you really need this? It certainly does not make sense for
V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT.

If a control needs this, then set it in cap[idx].flags and don't add
it for all. It is rarely needed.

> +		ctrl_idx++;
> +	}
> +
> +	return 0;
> +error:
> +	v4l2_ctrl_handler_free(&inst->ctrl_handler);
> +
> +	return ret;
> +}
> +
> +void iris_session_init_caps(struct iris_core *core)
> +{
> +	struct platform_inst_fw_cap *caps;
> +	u32 i, num_cap, cap_id;
> +
> +	caps = core->iris_platform_data->inst_fw_caps;
> +	num_cap = core->iris_platform_data->inst_fw_caps_size;
> +
> +	for (i = 0; i < num_cap; i++) {
> +		cap_id = caps[i].cap_id;
> +		if (!iris_valid_cap_id(cap_id))
> +			continue;
> +
> +		core->inst_fw_caps[cap_id].cap_id = caps[i].cap_id;
> +		core->inst_fw_caps[cap_id].min = caps[i].min;
> +		core->inst_fw_caps[cap_id].max = caps[i].max;
> +		core->inst_fw_caps[cap_id].step_or_mask = caps[i].step_or_mask;
> +		core->inst_fw_caps[cap_id].value = caps[i].value;
> +		core->inst_fw_caps[cap_id].flags = caps[i].flags;
> +		core->inst_fw_caps[cap_id].hfi_id = caps[i].hfi_id;
> +	}
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> new file mode 100644
> index 000000000000..3e4dd46e7a26
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _IRIS_CTRLS_H_
> +#define _IRIS_CTRLS_H_
> +
> +#include "iris_platform_common.h"
> +
> +struct iris_core;
> +struct iris_inst;
> +
> +int iris_ctrls_init(struct iris_inst *inst);
> +void iris_session_init_caps(struct iris_core *core);
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 18cc9365ab75..457ab1887793 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -28,6 +28,8 @@
>  #define HFI_PROP_UBWC_BANK_SWZL_LEVEL3		0x03000008
>  #define HFI_PROP_UBWC_BANK_SPREADING		0x03000009
>  #define HFI_PROP_CODEC				0x03000100
> +#define HFI_PROP_PROFILE			0x03000107
> +#define HFI_PROP_LEVEL				0x03000108
>  #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
>  #define HFI_PROP_END				0x03FFFFFF
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index d28b8fd7ec2f..43ced6ece289 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -23,8 +23,10 @@
>   * @fh: reference of v4l2 file handler
>   * @fmt_src: structure of v4l2_format for source
>   * @fmt_dst: structure of v4l2_format for destination
> + * @ctrl_handler: reference of v4l2 ctrl handler
>   * @crop: structure of crop info
>   * @completions: structure of signal completions
> + * @fw_caps: array of supported instance firmware capabilities
>   * @buffers: array of different iris buffers
>   * @fw_min_count: minimnum count of buffers needed by fw
>   * @once_per_session_set: boolean to set once per session property
> @@ -42,8 +44,10 @@ struct iris_inst {
>  	struct v4l2_fh			fh;
>  	struct v4l2_format		*fmt_src;
>  	struct v4l2_format		*fmt_dst;
> +	struct v4l2_ctrl_handler	ctrl_handler;
>  	struct iris_hfi_rect_desc	crop;
>  	struct completion		completion;
> +	struct platform_inst_fw_cap	fw_caps[INST_FW_CAP_MAX];
>  	struct iris_buffers		buffers[BUF_TYPE_MAX];
>  	u32				fw_min_count;
>  	bool				once_per_session_set;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 54a2d723797b..c45928a6c4fe 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -49,6 +49,33 @@ struct platform_inst_caps {
>  	u32 max_frame_height;
>  	u32 max_mbpf;
>  };
> +
> +enum platform_inst_fw_cap_type {
> +	PROFILE = 1,
> +	LEVEL,
> +	INST_FW_CAP_MAX,
> +};
> +
> +enum platform_inst_fw_cap_flags {
> +	CAP_FLAG_DYNAMIC_ALLOWED	= BIT(0),
> +	CAP_FLAG_MENU			= BIT(1),
> +	CAP_FLAG_INPUT_PORT		= BIT(2),
> +	CAP_FLAG_OUTPUT_PORT		= BIT(3),
> +	CAP_FLAG_CLIENT_SET		= BIT(4),
> +	CAP_FLAG_BITMASK		= BIT(5),
> +	CAP_FLAG_VOLATILE		= BIT(6),
> +};
> +
> +struct platform_inst_fw_cap {
> +	enum platform_inst_fw_cap_type cap_id;
> +	s64 min;
> +	s64 max;
> +	s64 step_or_mask;
> +	s64 value;
> +	u32 hfi_id;
> +	enum platform_inst_fw_cap_flags flags;
> +};
> +
>  struct iris_core_power {
>  	u64 clk_freq;
>  	u64 icc_bw;
> @@ -79,6 +106,8 @@ struct iris_platform_data {
>  	const char *fwname;
>  	u32 pas_id;
>  	struct platform_inst_caps *inst_caps;
> +	struct platform_inst_fw_cap *inst_fw_caps;
> +	u32 inst_fw_caps_size;
>  	struct tz_cp_config *tz_cp_config_data;
>  	u32 core_arch;
>  	u32 hw_response_timeout;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> index 37c0130d7059..7e3703adb5b3 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -5,11 +5,56 @@
>  
>  #include "iris_core.h"
>  #include "iris_hfi_gen2.h"
> +#include "iris_hfi_gen2_defines.h"
>  #include "iris_platform_common.h"
>  #include "iris_vpu_common.h"
>  
>  #define VIDEO_ARCH_LX 1
>  
> +static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
> +	{
> +		.cap_id = PROFILE,
> +		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
> +		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = LEVEL,
> +		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
> +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +	},
> +};
> +
>  static struct platform_inst_caps platform_inst_cap_sm8550 = {
>  	.min_frame_width = 96,
>  	.max_frame_width = 8192,
> @@ -77,6 +122,8 @@ struct iris_platform_data sm8550_data = {
>  	.fwname = "qcom/vpu/vpu30_p4.mbn",
>  	.pas_id = IRIS_PAS_ID,
>  	.inst_caps = &platform_inst_cap_sm8550,
> +	.inst_fw_caps = inst_fw_cap_sm8550,
> +	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
>  	.tz_cp_config_data = &tz_cp_config_sm8550,
>  	.core_arch = VIDEO_ARCH_LX,
>  	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 15463a07ae59..86ef2e5c488e 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -12,6 +12,7 @@
>  #include <linux/reset.h>
>  
>  #include "iris_core.h"
> +#include "iris_ctrls.h"
>  #include "iris_vidc.h"
>  
>  static int iris_init_icc(struct iris_core *core)
> @@ -237,6 +238,8 @@ static int iris_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	iris_session_init_caps(core);
> +
>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index c4eeba5ed6da..66a54771b9e8 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -7,6 +7,7 @@
>  #include <media/v4l2-mem2mem.h>
>  
>  #include "iris_buffer.h"
> +#include "iris_ctrls.h"
>  #include "iris_instance.h"
>  #include "iris_vdec.h"
>  #include "iris_vpu_buffer.h"
> @@ -16,8 +17,9 @@
>  #define DEFAULT_CODEC_ALIGNMENT 16
>  #define MAX_EVENTS 30
>  
> -void iris_vdec_inst_init(struct iris_inst *inst)
> +int iris_vdec_inst_init(struct iris_inst *inst)
>  {
> +	struct iris_core *core = inst->core;
>  	struct v4l2_format *f;
>  
>  	inst->fmt_src  = kzalloc(sizeof(*inst->fmt_src), GFP_KERNEL);
> @@ -54,6 +56,11 @@ void iris_vdec_inst_init(struct iris_inst *inst)
>  	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>  	inst->buffers[BUF_OUTPUT].actual_count = inst->buffers[BUF_OUTPUT].min_count;
>  	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
> +
> +	memcpy(&inst->fw_caps[0], &core->inst_fw_caps[0],
> +	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
> +
> +	return iris_ctrls_init(inst);
>  }
>  
>  void iris_vdec_inst_deinit(struct iris_inst *inst)
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
> index 707fff34bf4d..d7b8a0ad6fa8 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
> @@ -8,7 +8,7 @@
>  
>  struct iris_inst;
>  
> -void iris_vdec_inst_init(struct iris_inst *inst);
> +int iris_vdec_inst_init(struct iris_inst *inst);
>  void iris_vdec_inst_deinit(struct iris_inst *inst);
>  int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
>  int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 8068c06c1f11..93d2be118a81 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -22,12 +22,14 @@
>  static void iris_v4l2_fh_init(struct iris_inst *inst)
>  {
>  	v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
> +	inst->fh.ctrl_handler = &inst->ctrl_handler;
>  	v4l2_fh_add(&inst->fh);
>  }
>  
>  static void iris_v4l2_fh_deinit(struct iris_inst *inst)
>  {
>  	v4l2_fh_del(&inst->fh);
> +	inst->fh.ctrl_handler = NULL;
>  	v4l2_fh_exit(&inst->fh);
>  }
>  
> @@ -159,7 +161,9 @@ int iris_open(struct file *filp)
>  		goto fail_m2m_release;
>  	}
>  
> -	iris_vdec_inst_init(inst);
> +	ret = iris_vdec_inst_init(inst);
> +	if (ret)
> +		goto fail_m2m_ctx_release;
>  
>  	iris_add_session(inst);
>  
> @@ -168,6 +172,8 @@ int iris_open(struct file *filp)
>  
>  	return 0;
>  
> +fail_m2m_ctx_release:
> +	v4l2_m2m_ctx_release(inst->m2m_ctx);
>  fail_m2m_release:
>  	v4l2_m2m_release(inst->m2m_dev);
>  fail_v4l2_fh_deinit:
> @@ -199,6 +205,7 @@ int iris_close(struct file *filp)
>  {
>  	struct iris_inst *inst = iris_get_inst(filp, NULL);
>  
> +	v4l2_ctrl_handler_free(&inst->ctrl_handler);
>  	v4l2_m2m_ctx_release(inst->m2m_ctx);
>  	v4l2_m2m_release(inst->m2m_dev);
>  	mutex_lock(&inst->lock);
> 


