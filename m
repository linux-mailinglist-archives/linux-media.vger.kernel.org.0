Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7C729F656
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 21:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgJ2UlA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 16:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbgJ2Uk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 16:40:59 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13879C0613CF
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 13:31:06 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id 32so3580876otm.3
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 13:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=UR5Q0rKVUZjqjZjwnrNInjG9jrCLixcHQwLzgr/1Eis=;
        b=HV9Vy5DGmPZuj3g+adYzUcMkmIcsObWADfy9IOyMUqA81J85Uo3Ty2Bo9eg3i26o2e
         VIkP/KwY6N2x9aILFnAobvRCThLVfa0To9qUJrvnjHxvjm+YnAU41QjD/2n1Y43t2iAo
         H617tuMddEvvZcQDir3Fo516PZG87OshVe0Oxbrc9O517qSdg6bA5T1sKDI7KB+CU+mw
         jOv9kNKGWk4XSzKEF2VQRtHVUifvDdIrNjw3S9Mut/ZhksfEAgL5aAsj5Z2VuQqs7trn
         8oHkC7SfSvCcui0a/rLmkUYbfJ2/2Cl5J/7gHGZT7kihnSwJeTLrBdtuqClKdjJ/Bhjn
         nQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=UR5Q0rKVUZjqjZjwnrNInjG9jrCLixcHQwLzgr/1Eis=;
        b=JhEd1T5Z7ZBcph1l7uCJqogO3uKZvog5CFh3eXhXXRRD/8s+J15FCrQWTUMeJiGJ/A
         oYnq9BaVVZt9iXlxJtl712wJEbh4zxf2apFMOVhSSBIaNXieZeKNfQygb7MgPQoiPoYJ
         1q0OUKWrNA41m4tIHYjjMNvOGVsJctBavFiAEWtAaKYfUMNRCTpfmJUC4gXJXDojtjgT
         bFcHRsxAkfvzBmmrv1wY0NQloQdAPMn56jBEubzp3mOo/vxFkUMf1jaKMmCNitcnviEr
         F8jD0IfMqtE8NdBoyMWakgzSZruwcI0k4RZlyoARQCFQ/j/X/MPL/LWc6/0FsgY8rfGa
         7YLQ==
X-Gm-Message-State: AOAM533E99SetpzpVgTATjL6Ql3jakeeKncvv7cdwIulre60KEMoGHYh
        mDWG6kAb64dBGdmQ2MrxDgfdJw==
X-Google-Smtp-Source: ABdhPJxVXE0ig9F8lWwLK4LTAPtkSuv1cfubfW6QDWGisnqAKdobrt19osBEbRph4BPo1fWlhr0gMg==
X-Received: by 2002:a05:6830:1241:: with SMTP id s1mr4415710otp.366.1604003465489;
        Thu, 29 Oct 2020 13:31:05 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id z126sm927764oiz.41.2020.10.29.13.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 13:31:04 -0700 (PDT)
Subject: Re: [PATCH v2] venus: venc: Fix setting of profile and level
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201027091936.14478-1-stanimir.varbanov@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <b66a9736-e7ec-82d2-8065-d587c379d298@kali.org>
Date:   Thu, 29 Oct 2020 15:31:02 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201027091936.14478-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 10/27/20 4:19 AM, Stanimir Varbanov wrote:
> The profile and level in op_set_ctrl was recently changed but during
> v4l2_ctrl_handler_setup profile and level control values are mangled.
>
> Fixes: 435c53c3698f ("media: venus: venc: Use helper to set profile and level")
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>
> v2: Fixed kernel test robot WARNING
>
>  drivers/media/platform/qcom/venus/core.h      | 15 +++++++--
>  drivers/media/platform/qcom/venus/venc.c      | 31 ++++++++++++++++++-
>  .../media/platform/qcom/venus/venc_ctrls.c    | 14 +++++++--
>  3 files changed, 55 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 7b79a33dc9d6..05c9fbd51f0c 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -243,8 +243,19 @@ struct venc_controls {
>  
>  	u32 header_mode;
>  
> -	u32 profile;
> -	u32 level;
> +	struct {
> +		u32 h264;
> +		u32 mpeg4;
> +		u32 hevc;
> +		u32 vp8;
> +		u32 vp9;
> +	} profile;
> +	struct {
> +		u32 h264;
> +		u32 mpeg4;
> +		u32 hevc;
> +		u32 vp9;
> +	} level;
>  };
>  
>  struct venus_buffer {
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index f8b1484e7dcd..47246528ac7e 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -537,6 +537,7 @@ static int venc_set_properties(struct venus_inst *inst)
>  	struct hfi_quantization quant;
>  	struct hfi_quantization_range quant_range;
>  	u32 ptype, rate_control, bitrate;
> +	u32 profile, level;
>  	int ret;
>  
>  	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
> @@ -684,7 +685,35 @@ static int venc_set_properties(struct venus_inst *inst)
>  	if (ret)
>  		return ret;
>  
> -	ret = venus_helper_set_profile_level(inst, ctr->profile, ctr->level);
> +	switch (inst->hfi_codec) {
> +	case HFI_VIDEO_CODEC_H264:
> +		profile = ctr->profile.h264;
> +		level = ctr->level.h264;
> +		break;
> +	case HFI_VIDEO_CODEC_MPEG4:
> +		profile = ctr->profile.mpeg4;
> +		level = ctr->level.mpeg4;
> +		break;
> +	case HFI_VIDEO_CODEC_VP8:
> +		profile = ctr->profile.vp8;
> +		level = 0;
> +		break;
> +	case HFI_VIDEO_CODEC_VP9:
> +		profile = ctr->profile.vp9;
> +		level = ctr->level.vp9;
> +		break;
> +	case HFI_VIDEO_CODEC_HEVC:
> +		profile = ctr->profile.hevc;
> +		level = ctr->level.hevc;
> +		break;
> +	case HFI_VIDEO_CODEC_MPEG2:
> +	default:
> +		profile = 0;
> +		level = 0;
> +		break;
> +	}
> +
> +	ret = venus_helper_set_profile_level(inst, profile, level);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index 0708b3b89d0c..cf860e6446c0 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -103,15 +103,25 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ctr->h264_entropy_mode = ctrl->val;
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
> +		ctr->profile.mpeg4 = ctrl->val;
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
> +		ctr->profile.h264 = ctrl->val;
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
> +		ctr->profile.hevc = ctrl->val;
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
> -		ctr->profile = ctrl->val;
> +		ctr->profile.vp8 = ctrl->val;
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
> +		ctr->level.mpeg4 = ctrl->val;
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
> +		ctr->level.h264 = ctrl->val;
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
> -		ctr->level = ctrl->val;
> +		ctr->level.hevc = ctrl->val;
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
>  		ctr->h264_i_qp = ctrl->val;

Hi Stanimir,

When I apply this patch on top of my 5.10rc1 tree - (
https://github.com/steev/linux/commits/c630-5.10-rc1... my c630 no
longer boots.  Unfortunately... nothing shows up in the logs, and I have
no idea how to get debug output from the c630. 

-- Steev

