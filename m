Return-Path: <linux-media+bounces-44026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92345BC6F15
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 01:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F29B3C42C1
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 23:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA792D0622;
	Wed,  8 Oct 2025 23:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EKdXmlgU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DDD28D83F
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 23:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759967289; cv=none; b=eiSfm8UWfLzz5jUCUSTt+nsJ9x7c0+CNNzTUzmsVzL2xSEZMDYEJPL05S8VxfywUepXjXRILRXhXrZg2dqo/SvYyuthsYy0rVqMAF3eh+lG4Hc2X6xqf2ditaHNquHzlE2pLSTdOw2kPewSJXkY04gF1DSa+9xRJt8fnAHEcx8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759967289; c=relaxed/simple;
	bh=8ZTU7ZI4dOQz+oWLWUmekV68DhahEks06RCGsIgh8c0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EcVXROwm5EBbm0O2gqPBTJoR8BV/uOo9Bv8fitU6iaZBhuBezsbrf3laDZgZlhFCSTJWzsi9lPuExS5ddhVga3PuPqY81jiSYrI/xGT6JuJ9DAte2a0CcWAlXARSE7V0vqPd1ibPy0CASKVWtZi+dpk87pk+E35rsiKGzYq5+FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EKdXmlgU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so403172f8f.0
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 16:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759967284; x=1760572084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfHx0KfaapEjiwM0tW/YvvhxPGY3AJttLQVN9hlDJ6Y=;
        b=EKdXmlgUSGAwcnI9H3URtsGBW6A/eS668ZAQ+bPEtgG03sExA5mx9f8R/dwlIQP2GQ
         R+Sqa0UR37CbtHZAxakCjyEFPCRPF42snlhMDAXBr6XR4Q34lhL+nT5AYeeNkwi5otMS
         fOoBKsmDnvtpIYKrfwIMob++4PngWB/xuaiE8Cci45fvf02jMaPKTmFy4iCYv5uYliVd
         YlIKf3zqO5/P6fF5mNQKu5DV69IF0dZBKzjGXiijHojGbj7x+FXcUKIPM/BMRDSPpR0n
         OHizspKHWtQl5ohymuoKAvT70c98DDimZfI1HzJp/trVvMEEGFa8egEjMnUuBONGFakv
         Ct5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759967284; x=1760572084;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tfHx0KfaapEjiwM0tW/YvvhxPGY3AJttLQVN9hlDJ6Y=;
        b=kkvV0t025xKxZATmpCEf26815Fakf+TAN/qgfuMiK7MLWIOvqhaBhbirjeHQ8KFrpT
         c1ZlIfemHdy9rTiZ7NDfUO+yAvBc1PKyoaG+muFu7wdzXfH1sWsKw29xjb7olRYsb3T0
         rDEsQS4Bgt1f4VvP+zzUZRbCKDYpdfnQK4M64na+yemHSMJofLwvwH+qwyGYLf8ZavHt
         3bJUQox+stUYoRlWgAB87tj6C8fj+SbSjoSuuQj72Y0a07XCh2KclrPY6r5P8CGP2FD4
         A4GN/DRDwZkRMkeZ2fabUyqH+BX7+oilNEMdFieKpoOIzOMMxGdqpGQncw8pZ+szyXWc
         +4iQ==
X-Gm-Message-State: AOJu0YxLG+e1d1SYrd+f+cICghuU3Y7seAsGhsJPOtpIkcAT/3CIfrDH
	EU6OXoHkWYyJS5/7farDq/vElJiaJEJaM65ZQj/dIoX+wpd2FsFfhJ/+fATK4HW4opE=
X-Gm-Gg: ASbGncuV5+emt0cJTYOZp8mdp6wWglXd1FXnKOIqfSmPDroq7sCkSEpKTeMY5cg+e0x
	wBa0rIpgamaeXs/0QzRQ9Tv0+4Xon2pJC14iJwvxojkZKFGCD1Kz3Ae3lWJeb1Mk+qHdsYfldmx
	yWgRuoCgYwPGeUc1+OoBtZPirJi7OziUSVwFwGFmDy+wONnHXBBZ8i8XWiiP8du9wA1O3IDDrE9
	/iTLl0pG6ZFnn51JSiWd35MHvLdaF3F0NDd/mv+NMqRSN36Uhi3GNYlW7vXYaAtlLoCsvWlzFC8
	XLPviWIgl0NS5KvaKOQ36CPC6GzGWEOW368tn3dCFd5QHQr9+z6+SjCMPgnFwYIl4Al5WSf7HEP
	JBqUsLnHy5ExDU23hMum+8T16Zp3AmWH94Pv3E23JNu1AYCa9QQQnZzbcKo8EBTN4OLyPvwUytM
	CqWZUE3Bo2AxOO2c55
X-Google-Smtp-Source: AGHT+IELSJRQI78RURkVWMFub+1nmQpBtlrGEe11X4pGowAAY1G6tWSvEw45NXJ4Bm06qoUBaF4PuQ==
X-Received: by 2002:a05:6000:1a87:b0:3ee:b126:6b6 with SMTP id ffacd0b85a97d-4266e7dfee2mr2929865f8f.34.1759967284039;
        Wed, 08 Oct 2025 16:48:04 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f011bsm32442627f8f.46.2025.10.08.16.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 16:48:02 -0700 (PDT)
Message-ID: <b58f9dd3-6ace-474f-98ad-a5b9c5f0cf17@linaro.org>
Date: Thu, 9 Oct 2025 00:48:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: iris: stop copying r/o data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <MNE6-NWyEnaQyvn4In-jfg6F21lf0p0GgcEsRO6lM610hKJwSHgpSoefqJ7PROY_eWIuyd08U3G5bDI8ufq0aQ==@protonmail.internalid>
 <20251008-iris-sc7280-v1-3-def050ba5e1f@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251008-iris-sc7280-v1-3-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2025 05:33, Dmitry Baryshkov wrote:
> Most of the platform_inst_caps data is read-only. In order to lower the
> amount of memory consumed by the driver, store the value and the
> corresponding indice in the read-write data and use the rest via the
> pointer to r/o capability data.

corresponding index

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.h       |   4 +-
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 238 ++++++++++-----------
>   drivers/media/platform/qcom/iris/iris_instance.h   |   3 +-
>   .../platform/qcom/iris/iris_platform_common.h      |   8 +-
>   drivers/media/platform/qcom/iris/iris_vdec.c       |   5 +-
>   drivers/media/platform/qcom/iris/iris_venc.c       |   5 +-
>   6 files changed, 135 insertions(+), 128 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index fb194c967ad4f9b5e00cd74f0d41e0b827ef14db..b5037ae8c71921753c165a86a277a4a4b5083b30 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -115,8 +115,8 @@ struct iris_core {
>   	struct delayed_work			sys_error_handler;
>   	struct list_head			instances;
>   	/* encoder and decoder have overlapping caps, so two different arrays are required */
> -	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
> -	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
> +	struct platform_inst_fw_cap_value	inst_fw_caps_dec[INST_FW_CAP_MAX];
> +	struct platform_inst_fw_cap_value	inst_fw_caps_enc[INST_FW_CAP_MAX];
>   };
> 
>   int iris_core_init(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce..0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -194,26 +194,28 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
>   	enum platform_inst_fw_cap_type cap_id;
> -	struct platform_inst_fw_cap *cap;
> +	unsigned int cap_idx;
>   	struct vb2_queue *q;
> 
> -	cap = &inst->fw_caps[0];
>   	cap_id = iris_get_cap_id(ctrl->id);
>   	if (!iris_valid_cap_id(cap_id))
>   		return -EINVAL;
> 
> +	cap_idx = inst->fw_caps[cap_id].idx;
> +
>   	q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
>   	if (vb2_is_streaming(q) &&
> -	    (!(inst->fw_caps[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)))
> +	    (!(inst->inst_fw_caps[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)))
>   		return -EINVAL;
> 
> -	cap[cap_id].flags |= CAP_FLAG_CLIENT_SET;
> +	inst->fw_caps[cap_id].client_set = true;

Why drop just this one bit - CAP_FLAG_CLIENT_SET.

Code seems neater with that bit retained in fw_caps to me, you have 
fewer LOC changed that way too.

> 
>   	inst->fw_caps[cap_id].value = ctrl->val;
> 
>   	if (vb2_is_streaming(q)) {
> -		if (cap[cap_id].set)
> -			cap[cap_id].set(inst, cap_id);
> +
> +		if (inst->inst_fw_caps[cap_idx].set)
> +			inst->inst_fw_caps[cap_idx].set(inst, cap_id);
>   	}
> 
>   	return 0;
> @@ -225,13 +227,14 @@ static const struct v4l2_ctrl_ops iris_ctrl_ops = {
> 
>   int iris_ctrls_init(struct iris_inst *inst)
>   {
> -	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];
>   	u32 num_ctrls = 0, ctrl_idx = 0, idx = 0;
>   	u32 v4l2_id;
>   	int ret;
> 
>   	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
> -		if (iris_get_v4l2_id(cap[idx].cap_id))
> +		unsigned int cap_idx = inst->fw_caps[idx].idx;
> +
> +		if (iris_get_v4l2_id(inst->inst_fw_caps[cap_idx].cap_id))
>   			num_ctrls++;
>   	}
> 
> @@ -245,9 +248,11 @@ int iris_ctrls_init(struct iris_inst *inst)
>   		return ret;
> 
>   	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
> +		unsigned int cap_idx = inst->fw_caps[idx].idx;
> +		const struct platform_inst_fw_cap *cap = &inst->inst_fw_caps[cap_idx];
>   		struct v4l2_ctrl *ctrl;
> 
> -		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
> +		v4l2_id = iris_get_v4l2_id(cap->cap_id);
>   		if (!v4l2_id)
>   			continue;
> 
> @@ -256,21 +261,21 @@ int iris_ctrls_init(struct iris_inst *inst)
>   			goto error;
>   		}
> 
> -		if (cap[idx].flags & CAP_FLAG_MENU) {
> +		if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_MENU) {
>   			ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler,
>   						      &iris_ctrl_ops,
>   						      v4l2_id,
> -						      cap[idx].max,
> -						      ~(cap[idx].step_or_mask),
> -						      cap[idx].value);
> +						      cap[cap_idx].max,
> +						      ~(cap[cap_idx].step_or_mask),
> +						      inst->fw_caps[idx].value);
>   		} else {
>   			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
>   						 &iris_ctrl_ops,
>   						 v4l2_id,
> -						 cap[idx].min,
> -						 cap[idx].max,
> -						 cap[idx].step_or_mask,
> -						 cap[idx].value);
> +						 cap[cap_idx].min,
> +						 cap[cap_idx].max,
> +						 cap[cap_idx].step_or_mask,
> +						 inst->fw_caps[idx].value);
>   		}
>   		if (!ctrl) {
>   			ret = -EINVAL;
> @@ -312,14 +317,8 @@ void iris_session_init_caps(struct iris_core *core)
>   		if (!iris_valid_cap_id(cap_id))
>   			continue;
> 
> -		core->inst_fw_caps_dec[cap_id].cap_id = caps[i].cap_id;
> -		core->inst_fw_caps_dec[cap_id].min = caps[i].min;
> -		core->inst_fw_caps_dec[cap_id].max = caps[i].max;
> -		core->inst_fw_caps_dec[cap_id].step_or_mask = caps[i].step_or_mask;
> +		core->inst_fw_caps_dec[cap_id].idx = i;
>   		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> -		core->inst_fw_caps_dec[cap_id].flags = caps[i].flags;
> -		core->inst_fw_caps_dec[cap_id].hfi_id = caps[i].hfi_id;
> -		core->inst_fw_caps_dec[cap_id].set = caps[i].set;
>   	}
> 
>   	caps = core->iris_platform_data->inst_fw_caps_enc;
> @@ -330,29 +329,23 @@ void iris_session_init_caps(struct iris_core *core)
>   		if (!iris_valid_cap_id(cap_id))
>   			continue;
> 
> -		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
> -		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
> -		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
> -		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
> +		core->inst_fw_caps_enc[cap_id].idx = i;
>   		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
> -		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
> -		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
> -		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
>   	}
>   }
> 
>   static u32 iris_get_port_info(struct iris_inst *inst,
> -			      enum platform_inst_fw_cap_type cap_id)
> +			      unsigned int cap_idx)
>   {
>   	if (inst->domain == DECODER) {
> -		if (inst->fw_caps[cap_id].flags & CAP_FLAG_INPUT_PORT)
> +		if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_INPUT_PORT)
>   			return HFI_PORT_BITSTREAM;
> -		else if (inst->fw_caps[cap_id].flags & CAP_FLAG_OUTPUT_PORT)
> +		else if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_OUTPUT_PORT)
>   			return HFI_PORT_RAW;
>   	} else {
> -		if (inst->fw_caps[cap_id].flags & CAP_FLAG_INPUT_PORT)
> +		if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_INPUT_PORT)
>   			return HFI_PORT_RAW;
> -		else if (inst->fw_caps[cap_id].flags & CAP_FLAG_OUTPUT_PORT)
> +		else if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_OUTPUT_PORT)
>   			return HFI_PORT_BITSTREAM;
>   	}
> 
> @@ -362,12 +355,13 @@ static u32 iris_get_port_info(struct iris_inst *inst,
>   int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
>   	u32 hfi_value = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>   					     HFI_PAYLOAD_U32_ENUM,
>   					     &hfi_value, sizeof(u32));
>   }
> @@ -375,12 +369,13 @@ int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>   int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
>   	u32 hfi_value = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>   					     HFI_PAYLOAD_U32,
>   					     &hfi_value, sizeof(u32));
>   }
> @@ -389,7 +384,8 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	struct v4l2_format *inp_f = inst->fmt_src;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 height = inp_f->fmt.pix_mp.height;
>   	u32 width = inp_f->fmt.pix_mp.width;
>   	u32 work_mode = STAGE_2;
> @@ -401,7 +397,7 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>   					     HFI_PAYLOAD_U32,
>   					     &work_mode, sizeof(u32));
>   }
> @@ -409,12 +405,13 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>   int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 work_route = inst->fw_caps[PIPE].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>   					     HFI_PAYLOAD_U32,
>   					     &work_route, sizeof(u32));
>   }
> @@ -422,19 +419,13 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	u32 hfi_id, hfi_value;
> -
> -	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		hfi_id = inst->fw_caps[PROFILE_H264].hfi_id;
> -		hfi_value = inst->fw_caps[PROFILE_H264].value;
> -	} else {
> -		hfi_id = inst->fw_caps[PROFILE_HEVC].hfi_id;
> -		hfi_value = inst->fw_caps[PROFILE_HEVC].value;
> -	}
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
> +	u32 hfi_value = inst->fw_caps[cap_id].value;
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>   					     HFI_PAYLOAD_U32_ENUM,
>   					     &hfi_value, sizeof(u32));
>   }
> @@ -442,19 +433,13 @@ int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>   int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	u32 hfi_id, hfi_value;
> -
> -	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		hfi_id = inst->fw_caps[LEVEL_H264].hfi_id;
> -		hfi_value = inst->fw_caps[LEVEL_H264].value;
> -	} else {
> -		hfi_id = inst->fw_caps[LEVEL_HEVC].hfi_id;
> -		hfi_value = inst->fw_caps[LEVEL_HEVC].value;
> -	}
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
> +	u32 hfi_value = inst->fw_caps[cap_id].value;
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>   					     HFI_PAYLOAD_U32_ENUM,
>   					     &hfi_value, sizeof(u32));
>   }
> @@ -462,20 +447,19 @@ int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>   int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	struct hfi_profile_level pl;
> 
> -	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		pl.profile = inst->fw_caps[PROFILE_H264].value;
> +	pl.profile = inst->fw_caps[cap_id].value;
> +	if (inst->codec == V4L2_PIX_FMT_H264)
>   		pl.level = inst->fw_caps[LEVEL_H264].value;
> -	} else {
> -		pl.profile = inst->fw_caps[PROFILE_HEVC].value;
> +	else
>   		pl.level = inst->fw_caps[LEVEL_HEVC].value;
> -	}
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>   					     HFI_PAYLOAD_U32_ENUM,
>   					     &pl, sizeof(u32));
>   }
> @@ -484,7 +468,8 @@ int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	u32 header_mode = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 hfi_val;
> 
>   	if (header_mode == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
> @@ -494,7 +479,7 @@ int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32,
>   				     &hfi_val, sizeof(u32));
>   }
> @@ -504,7 +489,8 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	u32 prepend_sps_pps = inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value;
>   	u32 header_mode = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 hfi_val;
> 
>   	if (prepend_sps_pps)
> @@ -516,7 +502,7 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32_ENUM,
>   				     &hfi_val, sizeof(u32));
>   }
> @@ -526,7 +512,8 @@ int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
>   	u32 bitrate = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 max_bitrate;
> 
>   	if (inst->codec == V4L2_PIX_FMT_HEVC)
> @@ -541,7 +528,7 @@ int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32,
>   				     &bitrate, sizeof(u32));
>   }
> @@ -552,12 +539,13 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
>   	u32 rc_mode = inst->fw_caps[BITRATE_MODE].value;
>   	u32 peak_bitrate = inst->fw_caps[cap_id].value;
>   	u32 bitrate = inst->fw_caps[BITRATE].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
> 
>   	if (rc_mode != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
>   		return 0;
> 
> -	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET) {
> +	if (inst->fw_caps[cap_id].client_set) {
>   		if (peak_bitrate < bitrate)
>   			peak_bitrate = bitrate;
>   	} else {
> @@ -568,7 +556,7 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32,
>   				     &peak_bitrate, sizeof(u32));
>   }
> @@ -579,7 +567,8 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>   	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
>   	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
>   	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 rc_mode = 0;
> 
>   	if (!frame_rc)
> @@ -595,7 +584,7 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32_ENUM,
>   				     &rc_mode, sizeof(u32));
>   }
> @@ -606,7 +595,8 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
>   	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
>   	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
>   	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 rc_mode = 0;
> 
>   	if (!frame_rc)
> @@ -622,7 +612,7 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32_ENUM,
>   				     &rc_mode, sizeof(u32));
>   }
> @@ -631,7 +621,8 @@ int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	u32 entropy_mode = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 hfi_val;
> 
>   	if (inst->codec != V4L2_PIX_FMT_H264)
> @@ -642,7 +633,7 @@ int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32,
>   				     &hfi_val, sizeof(u32));
>   }
> @@ -651,7 +642,8 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	u32 entropy_mode = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 profile;
> 
>   	if (inst->codec != V4L2_PIX_FMT_H264)
> @@ -667,7 +659,7 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32,
>   				     &entropy_mode, sizeof(u32));
>   }
> @@ -678,32 +670,33 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>   	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
>   	u32 i_frame_qp = 0, p_frame_qp = 0, b_frame_qp = 0;
>   	u32 min_qp_enable = 0, client_qp_enable = 0;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 hfi_val;
> 
>   	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		if (inst->fw_caps[MIN_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +		if (inst->fw_caps[MIN_FRAME_QP_H264].client_set)
>   			min_qp_enable = 1;
>   		if (min_qp_enable ||
> -		    (inst->fw_caps[I_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[I_FRAME_MIN_QP_H264].client_set))
>   			i_qp_enable = 1;
>   		if (min_qp_enable ||
> -		    (inst->fw_caps[P_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[P_FRAME_MIN_QP_H264].client_set))
>   			p_qp_enable = 1;
>   		if (min_qp_enable ||
> -		    (inst->fw_caps[B_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[B_FRAME_MIN_QP_H264].client_set))
>   			b_qp_enable = 1;
>   	} else {
> -		if (inst->fw_caps[MIN_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +		if (inst->fw_caps[MIN_FRAME_QP_HEVC].client_set)
>   			min_qp_enable = 1;
>   		if (min_qp_enable ||
> -		    (inst->fw_caps[I_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[I_FRAME_MIN_QP_HEVC].client_set))
>   			i_qp_enable = 1;
>   		if (min_qp_enable ||
> -		    (inst->fw_caps[P_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[P_FRAME_MIN_QP_HEVC].client_set))
>   			p_qp_enable = 1;
>   		if (min_qp_enable ||
> -		    (inst->fw_caps[B_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[B_FRAME_MIN_QP_HEVC].client_set))
>   			b_qp_enable = 1;
>   	}
> 
> @@ -731,7 +724,7 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_32_PACKED,
>   				     &hfi_val, sizeof(u32));
>   }
> @@ -742,32 +735,33 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>   	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
>   	u32 max_qp_enable = 0, client_qp_enable;
>   	u32 i_frame_qp, p_frame_qp, b_frame_qp;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 hfi_val;
> 
>   	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		if (inst->fw_caps[MAX_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +		if (inst->fw_caps[MAX_FRAME_QP_H264].client_set)
>   			max_qp_enable = 1;
>   		if (max_qp_enable ||
> -		    (inst->fw_caps[I_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[I_FRAME_MAX_QP_H264].client_set))
>   			i_qp_enable = 1;
>   		if (max_qp_enable ||
> -		    (inst->fw_caps[P_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[P_FRAME_MAX_QP_H264].client_set))
>   			p_qp_enable = 1;
>   		if (max_qp_enable ||
> -		    (inst->fw_caps[B_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[B_FRAME_MAX_QP_H264].client_set))
>   			b_qp_enable = 1;
>   	} else {
> -		if (inst->fw_caps[MAX_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +		if (inst->fw_caps[MAX_FRAME_QP_HEVC].client_set)
>   			max_qp_enable = 1;
>   		if (max_qp_enable ||
> -		    (inst->fw_caps[I_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[I_FRAME_MAX_QP_HEVC].client_set))
>   			i_qp_enable = 1;
>   		if (max_qp_enable ||
> -		    (inst->fw_caps[P_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[P_FRAME_MAX_QP_HEVC].client_set))
>   			p_qp_enable = 1;
>   		if (max_qp_enable ||
> -		    (inst->fw_caps[B_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[B_FRAME_MAX_QP_HEVC].client_set))
>   			b_qp_enable = 1;
>   	}
> 
> @@ -796,7 +790,7 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_32_PACKED,
>   				     &hfi_val, sizeof(u32));
>   }
> @@ -806,7 +800,8 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0, client_qp_enable;
>   	u32 i_frame_qp, p_frame_qp, b_frame_qp;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	struct vb2_queue *q;
>   	u32 hfi_val;
> 
> @@ -822,18 +817,18 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>   		b_qp_enable = 1;
>   	} else {
>   		if (inst->codec == V4L2_PIX_FMT_H264) {
> -			if (inst->fw_caps[I_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[I_FRAME_QP_H264].client_set)
>   				i_qp_enable = 1;
> -			if (inst->fw_caps[P_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[P_FRAME_QP_H264].client_set)
>   				p_qp_enable = 1;
> -			if (inst->fw_caps[B_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[B_FRAME_QP_H264].client_set)
>   				b_qp_enable = 1;
>   		} else {
> -			if (inst->fw_caps[I_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[I_FRAME_QP_HEVC].client_set)
>   				i_qp_enable = 1;
> -			if (inst->fw_caps[P_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[P_FRAME_QP_HEVC].client_set)
>   				p_qp_enable = 1;
> -			if (inst->fw_caps[B_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[B_FRAME_QP_HEVC].client_set)
>   				b_qp_enable = 1;
>   		}
>   	}
> @@ -857,7 +852,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_32_PACKED,
>   				     &hfi_val, sizeof(u32));
>   }
> @@ -866,7 +861,8 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	struct hfi_quantization_range_v2 range;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
> 
>   	if (inst->codec == V4L2_PIX_FMT_HEVC) {
>   		range.min_qp.qp_packed = inst->fw_caps[MIN_FRAME_QP_HEVC].value;
> @@ -878,7 +874,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_32_PACKED,
>   				     &range, sizeof(range));
>   }
> @@ -886,7 +882,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>   int iris_set_properties(struct iris_inst *inst, u32 plane)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	struct platform_inst_fw_cap *cap;
> +	const struct platform_inst_fw_cap *cap;
>   	int ret;
>   	u32 i;
> 
> @@ -895,7 +891,9 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
>   		return ret;
> 
>   	for (i = 1; i < INST_FW_CAP_MAX; i++) {
> -		cap = &inst->fw_caps[i];
> +		unsigned int cap_idx = inst->fw_caps[i].idx;
> +
> +		cap = &inst->inst_fw_caps[cap_idx];
>   		if (!iris_valid_cap_id(cap->cap_id))
>   			continue;
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 5982d7adefeab80905478b32cddba7bd4651a691..39d74bef4d188abb919c372b7529d1d0773bd96a 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -82,7 +82,8 @@ struct iris_inst {
>   	struct completion		completion;
>   	struct completion		flush_completion;
>   	u32				flush_responses_pending;
> -	struct platform_inst_fw_cap	fw_caps[INST_FW_CAP_MAX];
> +	struct platform_inst_fw_cap_value fw_caps[INST_FW_CAP_MAX];
> +	const struct platform_inst_fw_cap *inst_fw_caps;
>   	struct iris_buffers		buffers[BUF_TYPE_MAX];
>   	u32				fw_min_count;
>   	enum iris_inst_state		state;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5ffc1874e8c6362b1c650e912c230e9c4e3bd160..104ff38219e30e6d52476d44b54338c55ef2ca7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -148,7 +148,7 @@ enum platform_inst_fw_cap_flags {
>   	CAP_FLAG_MENU			= BIT(1),
>   	CAP_FLAG_INPUT_PORT		= BIT(2),
>   	CAP_FLAG_OUTPUT_PORT		= BIT(3),
> -	CAP_FLAG_CLIENT_SET		= BIT(4),
> +	// BIT(4)

/* BIT(4) */

>   	CAP_FLAG_BITMASK		= BIT(5),
>   	CAP_FLAG_VOLATILE		= BIT(6),
>   };
> @@ -165,6 +165,12 @@ struct platform_inst_fw_cap {
>   		   enum platform_inst_fw_cap_type cap_id);
>   };
> 
> +struct platform_inst_fw_cap_value {
> +	unsigned int idx;
> +	s64 value;
> +	bool client_set;
> +};
> +
>   struct bw_info {
>   	u32 mbs_per_sec;
>   	u32 bw_ddr;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb..72559497e81c30373711e9b113582039f1fb5153 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -55,8 +55,9 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>   	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>   	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
> 
> -	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_dec[0],
> -	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
> +	memcpy(inst->fw_caps, core->inst_fw_caps_dec,
> +	       sizeof(inst->fw_caps));
> +	inst->inst_fw_caps = core->iris_platform_data->inst_fw_caps_dec;
> 
>   	return iris_ctrls_init(inst);
>   }
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 099bd5ed4ae0294725860305254c4cad1ec88d7e..3d1d481f8048305ef9a9bf0cb435ebca68563105 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -68,8 +68,9 @@ int iris_venc_inst_init(struct iris_inst *inst)
>   	inst->operating_rate = DEFAULT_FPS;
>   	inst->frame_rate = DEFAULT_FPS;
> 
> -	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
> -	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
> +	memcpy(inst->fw_caps, core->inst_fw_caps_enc,
> +	       sizeof(inst->fw_caps));
> +	inst->inst_fw_caps = core->iris_platform_data->inst_fw_caps_enc;
> 
>   	return iris_ctrls_init(inst);
>   }
> 
> --
> 2.47.3
> 


