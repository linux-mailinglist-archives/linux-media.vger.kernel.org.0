Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF9A7396FA3
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 10:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233354AbhFAI5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 04:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbhFAI5f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Jun 2021 04:57:35 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1666C061574
        for <linux-media@vger.kernel.org>; Tue,  1 Jun 2021 01:55:53 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id j10so16314275edw.8
        for <linux-media@vger.kernel.org>; Tue, 01 Jun 2021 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ki1m+phqqeEKMm1Y4FBuUTps1qqhBduvhtHEsbv1LNk=;
        b=gVHP+iVkVE0dsRQgwkY8e1vEleVxDXKMH2ooJn0cjVk37p2rPcdS75EF/5UQNotqw2
         wBlAF9I6LXaYe6wvYob55OyeKzSa9JrGQ3PEfLh9El6YU8lqX1J9TZhVezrIc0r5wo4M
         VPWf/XRvi94ZTVyLWE6rtJbEMDao1rIqQa62Ld0ikX/LX8OttXYStEYPbXrT+OTuOZF6
         lHB8BLwWTGBE6s2Vp7TI7HJzvt5PKO98hQf6zn96OYaZaoTbtyFRUxgiJTEjVEOACzoP
         9zAmn9nnHL5SXM6yQ7TeJz8iyTgj4+oCKgDziQUzFyV2FStcD5UTDXl910NK07+XX1Gi
         GEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ki1m+phqqeEKMm1Y4FBuUTps1qqhBduvhtHEsbv1LNk=;
        b=hXhkh0cAJ++Pxsd2vWXhDSJkia6kPcz5NGrYdgnFVp2LNCSlKgMlVA6ZjL63bfFQS5
         XPkv1AWi4NScf6jsv8Jce7oLZDaIw/bpZQtc0V70PQv8mNzLE8hLE5reVAEXUGpdp7Ww
         jdVPUlUuzrOKmnm1muALQ6rbbdwnLaaItvQTtgwNsJzTvKOSYPWZBnv6bjeDkhhfzupt
         XD5OiUS05WFQzOyVSdET++YkiiQBX2z85qjaQs5eImUQ5eIuiW/8GTYMjn3UCY8NboYh
         7LlJHHVH9HD8zaMAKVa4Pq2KwprRySulMEWIiTBEjEHo79IoxuPheE6AaLpg5bD/RbYf
         6DAg==
X-Gm-Message-State: AOAM533PlI6F/xzHXzgViYn8NaQzb41FoWLNV5QfX+1c8aEeocaDyKQC
        aGYeYSi+AaUimckq++WRVCIOdQ==
X-Google-Smtp-Source: ABdhPJy0RXo/zlgAv9qpM1Lr6nZNz/RzUBY/p2OdPdpz8RLu++tUZdIuaNMmVap7sWf7w9OzZ+If9g==
X-Received: by 2002:aa7:c545:: with SMTP id s5mr17668220edr.113.1622537752505;
        Tue, 01 Jun 2021 01:55:52 -0700 (PDT)
Received: from [192.168.1.12] (hst-221-74.medicom.bg. [84.238.221.74])
        by smtp.googlemail.com with ESMTPSA id f3sm3735863eds.59.2021.06.01.01.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 01:55:52 -0700 (PDT)
Subject: Re: [PATCH] venus: venc: add support for
 V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org
References: <1622438514-16657-1-git-send-email-mansur@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <f49ab90e-2e5a-8a61-ba6f-30bdb71818cf@linaro.org>
Date:   Tue, 1 Jun 2021 11:55:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622438514-16657-1-git-send-email-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/31/21 8:21 AM, Mansur Alisha Shaik wrote:
> Add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control for
> H264 high profile and constrained high profile.
> 
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.h       |  1 +
>  drivers/media/platform/qcom/venus/hfi_cmds.c   | 10 ++++++++++
>  drivers/media/platform/qcom/venus/hfi_helper.h |  5 +++++
>  drivers/media/platform/qcom/venus/venc.c       | 11 +++++++++++
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 12 +++++++++++-
>  5 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 745f226..103fbd8 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -235,6 +235,7 @@ struct venc_controls {
>  	u32 h264_loop_filter_mode;
>  	s32 h264_loop_filter_alpha;
>  	s32 h264_loop_filter_beta;
> +	u32 h264_8x8_transform;
>  
>  	u32 hevc_i_qp;
>  	u32 hevc_p_qp;
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
> index 11a8347..61d04a5 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
> @@ -1178,6 +1178,7 @@ pkt_session_set_property_4xx(struct hfi_session_set_property_pkt *pkt,
>  {
>  	void *prop_data;
>  
> +

Uneeded new blank line.

>  	if (!pkt || !cookie || !pdata)
>  		return -EINVAL;
>  
> @@ -1227,6 +1228,15 @@ pkt_session_set_property_4xx(struct hfi_session_set_property_pkt *pkt,
>  		break;
>  	}
>  
> +	case HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8: {
> +		struct hfi_h264_8x8x_transform *in = pdata, *tm = prop_data;

s/hfi_h264_8x8x_transform/hfi_h264_8x8_transform

> +
> +		tm->enable_type = in->enable_type;
> +		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*tm);
> +		break;
> +
> +	}
> +
>  	case HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE:
>  	case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER:
>  	case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE:
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index 63cd347..81d0536 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -510,6 +510,7 @@
>  #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
>  #define HFI_PROPERTY_PARAM_VENC_H264_VUI_BITSTREAM_RESTRC	0x2005021
>  #define HFI_PROPERTY_PARAM_VENC_PRESERVE_TEXT_QUALITY		0x2005023
> +#define HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8			0x2005025
>  #define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER	0x2005026
>  #define HFI_PROPERTY_PARAM_VENC_DISABLE_RC_TIMESTAMP		0x2005027
>  #define HFI_PROPERTY_PARAM_VENC_INITIAL_QP			0x2005028
> @@ -565,6 +566,10 @@ struct hfi_bitrate {
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
> index 8dd49d4..4ecf331 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -567,6 +567,7 @@ static int venc_set_properties(struct venus_inst *inst)
>  		struct hfi_h264_vui_timing_info info;
>  		struct hfi_h264_entropy_control entropy;
>  		struct hfi_h264_db_control deblock;
> +		struct hfi_h264_8x8x_transform h264_transform;

ditto

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
> +			ctr->profile.h264 == HFI_H264_PROFILE_CONSTRAINED_HIGH)

checkpatch.pl --strict should complain about this ctr->profile.h264
alignment.

> +			h264_transform.enable_type = ctr->h264_8x8_transform;
> +
> +		ret = hfi_session_set_property(inst, ptype, &h264_transform);
> +		if (ret)
> +			return ret;
> +
>  	}
>  
>  	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index 637c92f..e3ef611 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -319,6 +319,13 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>  		ctr->mastering = *ctrl->p_new.p_hdr10_mastering;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
> +		if (ctr->profile.h264 != HFI_H264_PROFILE_HIGH ||
> +			ctr->profile.h264 != HFI_H264_PROFILE_CONSTRAINED_HIGH)

ditto

> +			return -EINVAL;
> +
> +		ctr->h264_8x8_transform = ctrl->val;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -334,7 +341,7 @@ int venc_ctrl_init(struct venus_inst *inst)
>  {
>  	int ret;
>  
> -	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 57);
> +	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 58);
>  	if (ret)
>  		return ret;
>  
> @@ -438,6 +445,9 @@ int venc_ctrl_init(struct venus_inst *inst)
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
