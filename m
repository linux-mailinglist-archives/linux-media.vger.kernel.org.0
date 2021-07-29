Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FAD3D9F23
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 10:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbhG2IGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 04:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235035AbhG2IEd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 04:04:33 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15035C061796
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 01:04:24 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id n28-20020a05600c3b9cb02902552e60df56so3367470wms.0
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 01:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iHhkz3MM2znVBopUn3V1Chth9bX7Bpogp99sb0VmtaE=;
        b=iTWBEDwuhrK8huDbJxyxklHK6C1NKK3p+MGUQ/Te26VOvvdWRmBlWhdl1w2yJIBNkW
         N1ofWIGdOiHkAENqKU2/Th5t9aAiJmsAtJ+Qd0HPxvYuoxU6QwQjDyNWrzpwe4mP0iNB
         7o5BNczcwn2ct/Il4TaxnCjcbKpmfpmRjcKxVhRGLzohoUvvXo/e9tWqaOqppN07v3cc
         zzE9j1oU16CDrq3VlTRWmFHynN9EsLGytLQOF04T2KhXle/WNovd4SgJIREARgG5BIoB
         6ckfNUE7kd2B9iPlGXlKiD6ybt2J5F5FmWvBTALCqHj4Vj4nRCcfxW8lXKKMYS9TlWLQ
         dfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iHhkz3MM2znVBopUn3V1Chth9bX7Bpogp99sb0VmtaE=;
        b=MWGReFrqgnMemrHbL1IGUVKPLwrlaHJTfmlw9/5gzYSg9UL0fqDyGoHhDOgkDFFvv7
         HsoRXoTQ3pPAV1s843R2aZJL9Bilk+IUBj3Pnep761rGr7blF97QdKt+0NFMK5dhoEme
         FU3/8J0Yw5l5x2Ck8Jsr56gS9epuGr2eSn2JQ7Me2jWzuHdQxCDMC8Ma9dvnnevjCEGo
         KAQTLj/xa/WD8n8W9vJVCgQ7T8Gr/iD8Gx/12II3qQFGmL/SPOD884TthaW0NU2V6pMW
         +O4i5baAmZxDGSz6u5m8p/zRuNYD0EOaN1ndpLWNjEulIjhlS4jyZ6mCDsHXVVwelIKg
         N8vQ==
X-Gm-Message-State: AOAM530rZ6PeEr4rfLM3LDMm1HyKEPbnLreFyCQBJrqy5PoqSk3NuvFT
        aXPJuE4zjz+ozx6xYvQBbhsbyg==
X-Google-Smtp-Source: ABdhPJxNDr9R2KOVIOpEDQDcUJUTRwCm2JyppVneFr3FKdXuS73yvy03OEuU/9afjVDLW0+D0WgDew==
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr13255078wmk.84.1627545862669;
        Thu, 29 Jul 2021 01:04:22 -0700 (PDT)
Received: from [10.10.6.131] ([109.120.209.55])
        by smtp.googlemail.com with ESMTPSA id j1sm7901395wmo.4.2021.07.29.01.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 01:04:21 -0700 (PDT)
Subject: Re: [V2] venus: venc: add support for
 V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org
References: <1626184787-25020-1-git-send-email-mansur@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <d43738a8-cc29-57c7-d9e4-bf8ee03bfe19@linaro.org>
Date:   Thu, 29 Jul 2021 11:04:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626184787-25020-1-git-send-email-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/13/21 4:59 PM, Mansur Alisha Shaik wrote:
> Add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control for
> H264 high profile and constrained high profile.
> 
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.h       |  1 +
>  drivers/media/platform/qcom/venus/hfi_cmds.c   |  8 ++++++++
>  drivers/media/platform/qcom/venus/hfi_helper.h |  5 +++++
>  drivers/media/platform/qcom/venus/venc.c       | 11 +++++++++++
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 15 ++++++++++++++-
>  5 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 8df2d49..39dfab4 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -234,6 +234,7 @@ struct venc_controls {
>  	u32 h264_loop_filter_mode;
>  	s32 h264_loop_filter_alpha;
>  	s32 h264_loop_filter_beta;
> +	u32 h264_8x8_transform;
>  
>  	u32 hevc_i_qp;
>  	u32 hevc_p_qp;
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
> index f510247..d121dcb 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
> @@ -1239,6 +1239,14 @@ pkt_session_set_property_4xx(struct hfi_session_set_property_pkt *pkt,
>  		break;
>  	}
>  
> +	case HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8: {
> +		struct hfi_h264_8x8x_transform *in = pdata, *tm = prop_data;
> +
> +		tm->enable_type = in->enable_type;
> +		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*tm);
> +		break;
> +	}
> +
>  	case HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE:
>  	case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER:
>  	case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE:
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index b0a9beb..fe3e523 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -507,6 +507,7 @@
>  #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
>  #define HFI_PROPERTY_PARAM_VENC_H264_VUI_BITSTREAM_RESTRC	0x2005021
>  #define HFI_PROPERTY_PARAM_VENC_PRESERVE_TEXT_QUALITY		0x2005023
> +#define HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8			0x2005025
>  #define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER	0x2005026
>  #define HFI_PROPERTY_PARAM_VENC_DISABLE_RC_TIMESTAMP		0x2005027
>  #define HFI_PROPERTY_PARAM_VENC_INITIAL_QP			0x2005028
> @@ -562,6 +563,10 @@ struct hfi_bitrate {
>  	u32 layer_id;
>  };
>  
> +struct hfi_h264_8x8x_transform {

s/hfi_h264_8x8x_transform/hfi_h264_8x8_transform

> +	u32 enable_type;
> +};
> +
>  #define HFI_CAPABILITY_FRAME_WIDTH			0x01
>  #define HFI_CAPABILITY_FRAME_HEIGHT			0x02
>  #define HFI_CAPABILITY_MBS_PER_FRAME			0x03
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 8dd49d4..948369c 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -567,6 +567,7 @@ static int venc_set_properties(struct venus_inst *inst)
>  		struct hfi_h264_vui_timing_info info;
>  		struct hfi_h264_entropy_control entropy;
>  		struct hfi_h264_db_control deblock;
> +		struct hfi_h264_8x8x_transform h264_transform;
>  
>  		ptype = HFI_PROPERTY_PARAM_VENC_H264_VUI_TIMING_INFO;
>  		info.enable = 1;
> @@ -597,6 +598,16 @@ static int venc_set_properties(struct venus_inst *inst)
>  		ret = hfi_session_set_property(inst, ptype, &deblock);
>  		if (ret)
>  			return ret;
> +
> +		ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
> +		if (ctr->profile.h264 == HFI_H264_PROFILE_HIGH ||
> +		    ctr->profile.h264 == HFI_H264_PROFILE_CONSTRAINED_HIGH)
> +			h264_transform.enable_type = ctr->h264_8x8_transform;
> +
> +		ret = hfi_session_set_property(inst, ptype, &h264_transform);

h264_transform.enable_type is undefined for other profiles different
from HIGH and CONSTRAINED_HIGH.

> +		if (ret)
> +			return ret;
> +
>  	}
>  
>  	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index 637c92f..62beba2 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -319,6 +319,16 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>  		ctr->mastering = *ctrl->p_new.p_hdr10_mastering;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
> +		if (ctr->profile.h264 != HFI_H264_PROFILE_HIGH &&
> +		    ctr->profile.h264 != HFI_H264_PROFILE_CONSTRAINED_HIGH)
> +			return -EINVAL;
> +
> +		if (ctrl->val == 0)
> +			return -EINVAL;

Can you add a comment why 8x8 transform cannot be disabled for HIGH and
CONSTRAINED_HIGH profiles.

> +
> +		ctr->h264_8x8_transform = ctrl->val;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -334,7 +344,7 @@ int venc_ctrl_init(struct venus_inst *inst)
>  {
>  	int ret;
>  
> -	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 57);
> +	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 58);
>  	if (ret)
>  		return ret;
>  
> @@ -438,6 +448,9 @@ int venc_ctrl_init(struct venus_inst *inst)
>  			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP, 1, 51, 1, 1);
>  
>  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +		V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM, 0, 1, 1, 0);
> +
> +	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
>  			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP, 1, 51, 1, 1);
>  
>  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> 

-- 
regards,
Stan
