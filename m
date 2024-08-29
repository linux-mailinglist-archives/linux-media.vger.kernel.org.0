Return-Path: <linux-media+bounces-17117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBFD964035
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 11:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF0001F25F23
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 09:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BC818D622;
	Thu, 29 Aug 2024 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qHmuYsPy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AC3189F36
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724924010; cv=none; b=GI9gq5RN2D1gSQ4FDppZTJF55Og5HVUKGoDZ+bqEsHgK0Ej4QTMMZP2SYBw1vjeQyxpD6LFEs4zWj1XzNGhbYSRTKNxvro4Z1d1QfxG5My5h7YrscWgyJ3vLaalVDBo1r7zM8xfmt0S2cA+jxJr53f/rzp/3G92tbjwLZ3TU/2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724924010; c=relaxed/simple;
	bh=VB1kDnu1MIKuQQyIPG+ao88lOi5fFWaWQ4pPR/dfLYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITviuT+mQxXHTV0TNLetlrhxuSebLV0ZNIKApaOp0b6EtLPP2lUVgAd/EKSWTAUdEWE1y4U60rRensqGRNEAMS9OilPXCmXs8WD35F7zvZmTUcx1UvUrQpm0pwFwj8+tZeEhsA7YopS7AZOOm3InKnHdiwWQ0pqB4dlBEfQGKkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qHmuYsPy; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5343617fdddso765985e87.0
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 02:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724924006; x=1725528806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jf1RPd5k7N/KVvI+pR1mRC3GqCsCws3Rx9+XmMS/Wws=;
        b=qHmuYsPyHOjMKuudmW3MAPOpIovYRUGYh7jBI8Ttbuhd/qlLuDKOSQKiwEAwGxgnxH
         lONv8ExEFaHOzBCcGhm0ULoFOleF7VdAVZthz3YKBaXGJ/czZ6ih8dv/mYsCaaMjyX1w
         /+zqciqjUE1SIT46ee//l/NkHWGY+ibY6AhCFNsBxFweYZsl9Oyk+LyH6LGN9++ir12v
         3cRO9WzthmABKqjLmFjRXeaeUfNmxWwTZwKy0mPcYHxVE3Yizx3yXRh+mNpgmZlPBnQh
         zxoEJpNNVhC1jfO5eWgADYn/6xzSBCGUePnZ+RYgJ0VIiiuXXhQKseKQCEAywOepVxIJ
         bHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724924006; x=1725528806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jf1RPd5k7N/KVvI+pR1mRC3GqCsCws3Rx9+XmMS/Wws=;
        b=aqplGNjkuZ/kHPZz4YVCMcZ7peEbOUzgLQobQU6QZa8NHoWP8tXiDAk2cxo/7YA8va
         O46M1my6clMb0Syx4VQQUr1VuMLxAU7s44igEYh4ckv+V/SQss8jbnFVpljG30MvNELf
         0oB9WVD3eYL17+DtF0Ucqwdh5xUgsArlDGbzyGMlMo1mCZhdUQdSc7qLQwcHnNEZ2Aqr
         UWzACABY9tndk4SpcZ/ZFV5ioCY1fb8w0PgIQ9O3a2KOKgciEIA6Tdm0CGBo2DgFMW/b
         GZ1H5M03XNZV1DqfuBG0c13yMlnjR9E742eAwUv5FfS78ZlnHvq+5R1ZGZORxGKV89ER
         ZYNw==
X-Forwarded-Encrypted: i=1; AJvYcCUajVxJguScVn0k1lDCJrVBPpTefqf/uFDWmY4jDoWFdui+eXknwcMM80QOVCtPL6EKXaEa/1h8VuRpXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5eCiOfMkdS/YkyXqc8zphl/n3JQw8ke3ZQhaJBfsjg2ELIfTq
	MukxJhfs8BG7AyahY4WTfVmq4IqHpctvVsj+szrjH0SgqKKZYvUntJfr3HHO3h0=
X-Google-Smtp-Source: AGHT+IF0uXzxqPg+vkmJaBu1kcINtw+G6a7PP/BHLmzK3LMZI1o0ADhmOi10PWnUFYBbncLDSaMPzA==
X-Received: by 2002:a05:6512:3094:b0:52e:9921:6dff with SMTP id 2adb3069b0e04-5353e5755a3mr2004560e87.26.1724924005677;
        Thu, 29 Aug 2024 02:33:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407ac51esm105418e87.80.2024.08.29.02.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:33:25 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:33:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_dikshita@quicinc.com
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
Subject: Re: [PATCH v3 16/29] media: iris: implement iris v4l2_ctrl_ops and
 prepare capabilities
Message-ID: <gehwgofhviqcnopaughxfcpsqmbbiaayid2scgat4xnd5ngwmo@ylawfiup2tqc>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-16-c5fdbbe65e70@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827-iris_v3-v3-16-c5fdbbe65e70@quicinc.com>

On Tue, Aug 27, 2024 at 03:35:41PM GMT, Dikshita Agarwal via B4 Relay wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> Implement s_ctrl and g_volatile_ctrl ctrl ops.
> Introduce platform specific driver and firmware capabilities.
> Capabilities are set of video specifications
> and features supported by a specific platform (SOC).
> Each capability is defined with min, max, range, default
> value and corresponding HFI.
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>  drivers/media/platform/qcom/iris/iris_buffer.c     |   3 +-
>  drivers/media/platform/qcom/iris/iris_core.h       |   2 +
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 194 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 ++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   4 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |   1 +
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 +
>  drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
>  .../platform/qcom/iris/iris_platform_common.h      |  71 ++++++++
>  .../platform/qcom/iris/iris_platform_sm8250.c      |  56 ++++++
>  .../platform/qcom/iris/iris_platform_sm8550.c      | 138 +++++++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |   7 +
>  drivers/media/platform/qcom/iris/iris_vdec.c       |  24 ++-
>  drivers/media/platform/qcom/iris/iris_vdec.h       |   2 +-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  16 +-
>  16 files changed, 536 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 9c50e29db41e..a746681e03cd 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -1,5 +1,6 @@
>  iris-objs += iris_buffer.o \
>               iris_core.o \
> +             iris_ctrls.o \
>               iris_firmware.o \
>               iris_hfi_common.o \
>               iris_hfi_gen1_command.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index a1017ceede7d..652117a19b45 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -12,7 +12,6 @@
>  #define MAX_WIDTH 4096
>  #define MAX_HEIGHT 2304
>  #define NUM_MBS_4K (DIV_ROUND_UP(MAX_WIDTH, 16) * DIV_ROUND_UP(MAX_HEIGHT, 16))
> -#define BASE_RES_MB_MAX 138240
>  
>  /*
>   * NV12:
> @@ -74,7 +73,7 @@ static u32 iris_input_buffer_size(struct iris_inst *inst)
>  	num_mbs = iris_get_mbpf(inst);
>  	if (num_mbs > NUM_MBS_4K) {
>  		div_factor = 4;
> -		base_res_mbs = BASE_RES_MB_MAX;
> +		base_res_mbs = inst->driver_cap[MBPF].value;
>  	} else {
>  		base_res_mbs = NUM_MBS_4K;
>  		div_factor = 2;
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 1f6eca31928d..657d26a0fa2e 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -58,6 +58,7 @@
>   * @intr_status: interrupt status
>   * @sys_error_handler: a delayed work for handling system fatal error
>   * @instances: a list_head of all instances
> + * @inst_fw_cap: an array of supported instance capabilities
>   */
>  
>  struct iris_core {
> @@ -97,6 +98,7 @@ struct iris_core {
>  	u32					intr_status;
>  	struct delayed_work			sys_error_handler;
>  	struct list_head			instances;
> +	struct platform_inst_fw_cap		inst_fw_cap[INST_FW_CAP_MAX];
>  };
>  
>  int iris_core_init(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> new file mode 100644
> index 000000000000..868306d68a87
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_ctrls.h"
> +#include "iris_instance.h"
> +
> +static bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
> +{
> +	return cap_id >= 1 && cap_id < INST_FW_CAP_MAX;
> +}
> +
> +static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
> +{
> +	switch (id) {
> +	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
> +		return DEBLOCK;
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
> +	case DEBLOCK:
> +		return V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER;
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
> +	enum platform_inst_fw_cap_type cap_id;
> +	struct iris_inst *inst = NULL;
> +
> +	inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
> +	switch (ctrl->id) {
> +	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
> +		ctrl->val = inst->buffers[BUF_OUTPUT].min_count;
> +		break;
> +	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
> +		ctrl->val = inst->buffers[BUF_INPUT].min_count;
> +		break;
> +	default:
> +		cap_id = iris_get_cap_id(ctrl->id);
> +		if (iris_valid_cap_id(cap_id))
> +			ctrl->val = inst->fw_cap[cap_id].value;
> +		else
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int iris_vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	enum platform_inst_fw_cap_type cap_id;
> +	struct platform_inst_fw_cap *cap;
> +	struct iris_inst *inst;
> +
> +	inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
> +	cap = &inst->fw_cap[0];
> +
> +	cap_id = iris_get_cap_id(ctrl->id);
> +	if (!iris_valid_cap_id(cap_id))
> +		return -EINVAL;
> +
> +	cap[cap_id].flags |= CAP_FLAG_CLIENT_SET;
> +
> +	inst->fw_cap[cap_id].value = ctrl->val;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops iris_ctrl_ops = {
> +	.s_ctrl = iris_vdec_op_s_ctrl,
> +	.g_volatile_ctrl = iris_vdec_op_g_volatile_ctrl,
> +};
> +
> +int iris_ctrls_init(struct iris_inst *inst)
> +{
> +	struct platform_inst_fw_cap *cap;
> +	int num_ctrls = 0, ctrl_idx = 0;
> +	int idx = 0, ret;
> +	u32 v4l2_id;
> +
> +	cap = &inst->fw_cap[0];
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
> +
> +		if ((cap[idx].flags & CAP_FLAG_VOLATILE) ||
> +		    (ctrl->id == V4L2_CID_MIN_BUFFERS_FOR_CAPTURE ||
> +		     ctrl->id == V4L2_CID_MIN_BUFFERS_FOR_OUTPUT))
> +			ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
> +
> +		ctrl->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
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
> +int iris_session_init_caps(struct iris_core *core)
> +{
> +	struct platform_inst_fw_cap *inst_plat_cap_data;
> +	int i, num_inst_cap;
> +	u32 cap_id;
> +
> +	inst_plat_cap_data = core->iris_platform_data->inst_fw_cap_data;
> +	if (!inst_plat_cap_data)
> +		return -EINVAL;
> +
> +	num_inst_cap = core->iris_platform_data->inst_fw_cap_data_size;
> +
> +	for (i = 0; i < num_inst_cap && i < INST_FW_CAP_MAX - 1; i++) {

Drop the second condition

> +		cap_id = inst_plat_cap_data[i].cap_id;
> +		if (!iris_valid_cap_id(cap_id))
> +			continue;
> +
> +		core->inst_fw_cap[cap_id].cap_id = inst_plat_cap_data[i].cap_id;
> +		core->inst_fw_cap[cap_id].min = inst_plat_cap_data[i].min;
> +		core->inst_fw_cap[cap_id].max = inst_plat_cap_data[i].max;
> +		core->inst_fw_cap[cap_id].step_or_mask = inst_plat_cap_data[i].step_or_mask;
> +		core->inst_fw_cap[cap_id].value = inst_plat_cap_data[i].value;
> +		core->inst_fw_cap[cap_id].flags = inst_plat_cap_data[i].flags;
> +		core->inst_fw_cap[cap_id].hfi_id = inst_plat_cap_data[i].hfi_id;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> new file mode 100644
> index 000000000000..46e1da847aa8
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _IRIS_CTRLS_H_
> +#define _IRIS_CTRLS_H_
> +
> +struct iris_core;
> +struct iris_inst;
> +
> +int iris_ctrls_init(struct iris_inst *inst);
> +int iris_session_init_caps(struct iris_core *core);
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index da52e497b74a..9dc050063924 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -31,9 +31,13 @@
>  #define HFI_EVENT_SYS_ERROR				0x1
>  #define HFI_EVENT_SESSION_ERROR				0x2
>  
> +#define HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER	0x1200001
> +
>  #define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL		0x5
>  #define HFI_PROPERTY_SYS_IMAGE_VERSION			0x6
>  
> +#define HFI_PROPERTY_PARAM_WORK_MODE			0x1015
> +#define HFI_PROPERTY_PARAM_WORK_ROUTE			0x1017
>  #define HFI_MSG_SYS_INIT				0x20001
>  #define HFI_MSG_SYS_SESSION_INIT			0x20006
>  #define HFI_MSG_SYS_SESSION_END				0x20007
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index a74114b0761a..6ad2ca7be0f0 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -108,6 +108,7 @@ static int iris_hfi_gen2_session_set_default_header(struct iris_inst *inst)
>  	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>  	u32 default_header = false;
>  
> +	default_header = inst->fw_cap[DEFAULT_HEADER].value;

This isn't related to the s_ctrl and g_volatile_ctrl. Please split this
commit into the chunk that is actually related to that API and the rest
of the changes.

>  	iris_hfi_gen2_packet_session_property(inst,
>  					      HFI_PROP_DEC_DEFAULT_HEADER,
>  					      HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 18cc9365ab75..401df7b4e976 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -28,7 +28,16 @@
>  #define HFI_PROP_UBWC_BANK_SWZL_LEVEL3		0x03000008
>  #define HFI_PROP_UBWC_BANK_SPREADING		0x03000009
>  #define HFI_PROP_CODEC				0x03000100
> +#define HFI_PROP_PROFILE			0x03000107
> +#define HFI_PROP_LEVEL				0x03000108
> +#define HFI_PROP_STAGE				0x0300010a
> +#define HFI_PROP_PIPE				0x0300010b
> +#define HFI_PROP_LUMA_CHROMA_BIT_DEPTH		0x0300010f
> +#define HFI_PROP_CODED_FRAMES			0x03000120
> +#define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
> +#define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
>  #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
> +#define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
>  #define HFI_PROP_END				0x03FFFFFF
>  
>  #define HFI_SESSION_ERROR_BEGIN			0x04000000
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index d28b8fd7ec2f..2429b9860789 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -23,8 +23,11 @@
>   * @fh: reference of v4l2 file handler
>   * @fmt_src: structure of v4l2_format for source
>   * @fmt_dst: structure of v4l2_format for destination
> + * @ctrl_handler: reference of v4l2 ctrl handler
>   * @crop: structure of crop info
>   * @completions: structure of signal completions
> + * @driver_cap: array of supported instance driver capabilities
> + * @fw_cap: array of supported instance firmware capabilities
>   * @buffers: array of different iris buffers
>   * @fw_min_count: minimnum count of buffers needed by fw
>   * @once_per_session_set: boolean to set once per session property
> @@ -42,8 +45,11 @@ struct iris_inst {
>  	struct v4l2_fh			fh;
>  	struct v4l2_format		*fmt_src;
>  	struct v4l2_format		*fmt_dst;
> +	struct v4l2_ctrl_handler	ctrl_handler;
>  	struct iris_hfi_rect_desc	crop;
>  	struct completion		completion;
> +	struct platform_inst_driver_cap	driver_cap[INST_DRIVER_CAP_MAX];
> +	struct platform_inst_fw_cap	fw_cap[INST_FW_CAP_MAX];
>  	struct iris_buffers		buffers[BUF_TYPE_MAX];
>  	u32				fw_min_count;
>  	bool				once_per_session_set;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 754cccc638a5..2935b769abb7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -10,6 +10,23 @@
>  #define HW_RESPONSE_TIMEOUT_VALUE               (1000) /* milliseconds */
>  #define AUTOSUSPEND_DELAY_VALUE			(HW_RESPONSE_TIMEOUT_VALUE + 500) /* milliseconds */
>  
> +#define REGISTER_BIT_DEPTH(luma, chroma)	((luma) << 16 | (chroma))
> +#define BIT_DEPTH_8				REGISTER_BIT_DEPTH(8, 8)
> +#define CODED_FRAMES_PROGRESSIVE		0x0
> +#define DEFAULT_MAX_HOST_BUF_COUNT		64
> +#define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
> +
> +enum stage_type {
> +	STAGE_1 = 1,
> +	STAGE_2 = 2,
> +};
> +
> +enum pipe_type {
> +	PIPE_1 = 1,
> +	PIPE_2 = 2,
> +	PIPE_4 = 4,
> +};
> +
>  extern struct iris_platform_data sm8550_data;
>  extern struct iris_platform_data sm8250_data;
>  
> @@ -41,6 +58,56 @@ struct ubwc_config_data {
>  	u32	bank_spreading;
>  };
>  
> +enum platform_inst_driver_cap_type {
> +	FRAME_WIDTH = 1,
> +	FRAME_HEIGHT,
> +	MBPF,
> +	INST_DRIVER_CAP_MAX,
> +};

Please use C structures for platform caps. You have introduced a
wrapping that 1:1 maps to C code, which is not iterated or otherwise
accessed via a generic ID aside from the driver code.

> +
> +enum platform_inst_fw_cap_type {
> +	PROFILE = 1,
> +	LEVEL,
> +	INPUT_BUF_HOST_MAX_COUNT,
> +	STAGE,
> +	PIPE,
> +	POC,
> +	CODED_FRAMES,
> +	BIT_DEPTH,
> +	DEFAULT_HEADER,
> +	RAP_FRAME,
> +	DEBLOCK,
> +	INST_FW_CAP_MAX,
> +};

I have mixed feelings towards fw caps. Let's see how the code evolves
after you split the commit into V4L2 CTRL code and the rest of the
changes.

> +
> +enum platform_inst_cap_flags {
> +	CAP_FLAG_NONE			= 0,

No need to define NONE, just skip the setting.

> +	CAP_FLAG_DYNAMIC_ALLOWED	= BIT(0),
> +	CAP_FLAG_MENU			= BIT(1),
> +	CAP_FLAG_INPUT_PORT		= BIT(2),
> +	CAP_FLAG_OUTPUT_PORT		= BIT(3),
> +	CAP_FLAG_CLIENT_SET		= BIT(4),
> +	CAP_FLAG_BITMASK		= BIT(5),
> +	CAP_FLAG_VOLATILE		= BIT(6),
> +};
> +
> +struct platform_inst_driver_cap {
> +	enum platform_inst_driver_cap_type cap_id;
> +	u32 min;
> +	u32 max;
> +	u32 value;
> +};
> +
> +struct platform_inst_fw_cap {
> +	enum platform_inst_fw_cap_type cap_id;
> +	s64 min;
> +	s64 max;
> +	s64 step_or_mask;
> +	s64 value;
> +	u32 hfi_id;
> +	enum platform_inst_cap_flags flags;
> +};
> +


-- 
With best wishes
Dmitry

