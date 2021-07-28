Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A123D90F9
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 16:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236993AbhG1OxJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 10:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236914AbhG1OxG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 10:53:06 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE34C061765
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 07:53:04 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id h14so2890408wrx.10
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 07:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FLa9JkYsnVFYuAh0m/VrdgEnPoab+4HrUUbPIcU3ZTA=;
        b=CC0Ae83R+scTToRCxibUQ8g+cU1jUC3z6GWqbkDyXyKA15xFyl9QHfcCX2vLRbs7E6
         Mh1i/5pzLZXLHxcn6ZZRyeMy7tDsKNFwygmEpFcut8aXUN0ltJ+ECAfZ/15Clfrcuajm
         jyehU/F59MDDt4gLhb8UcbNhmm9hmKCTsRV4qS187cfpGWgwq6L9LpybOowMYpszwoLj
         6oJpuYdiBPyYB5tJz9lUXosf2Xkk6y3HehQ0bd0t4d3Rd1dJKMLWg4pyGC/hdGWfmc3j
         AlN4psPs4uaRUi0PHUomQpZ6+Rq2eoHpWXtqPmxB2DbM+9DzmMkGud49TxjSUGA3rxPB
         /ELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FLa9JkYsnVFYuAh0m/VrdgEnPoab+4HrUUbPIcU3ZTA=;
        b=cXJZy7WnUkZoDVHeEObQbH0RujoeoH2LeonOBVHn3jRBU2JL/WyDTjpD4jC09k081P
         NHfwZKZZAE9JudcmdT7ITox8nYgejx4gSBxuycEmYC6Gi0zLh78EkxNTwZQLmg/UKlvg
         H5uY0SWBOiWPHJgpXLFFbFVy0u0jkoWDxED4y2ENOn24sCaAnzMLxpiPMay1Bn3dNp7e
         +JT6FEwyF+NM3UNJJLuAtzjIvfKN6uM9/P1s9HWRSpjTKF33JhfiS/bADindmnXFPq9K
         DC63wKtVS6yMDcCJmrsX4zugInepXs7ms1m3n5wcT6SUncsPILdYbgABbt/Etvxt7C51
         Z80A==
X-Gm-Message-State: AOAM531l6ffHn62jJoXsvHCAmcEEF3ZTcA3e+iupTFfBwdNIHYiCwY35
        EW+2xeed14G3dHsNhLAAykjVCg==
X-Google-Smtp-Source: ABdhPJwRlLF7HdOtB6/tmNwW4HJhWd7IOR3djacIZTmwFK5zwHJw32e9Gp52b6W5ox0Z7OSO/SeFrw==
X-Received: by 2002:adf:dd05:: with SMTP id a5mr7815662wrm.214.1627483982539;
        Wed, 28 Jul 2021 07:53:02 -0700 (PDT)
Received: from [10.10.6.131] ([109.120.209.55])
        by smtp.googlemail.com with ESMTPSA id s1sm6211270wmj.8.2021.07.28.07.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 07:53:02 -0700 (PDT)
Subject: Re: [PATCH v3 7/7] media: venus: Set buffer to FW based on FW min
 count requirement.
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1626246068-21023-1-git-send-email-dikshita@codeaurora.org>
 <1626246068-21023-8-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <e85515cc-6213-cdc3-dab8-46ea5eb58011@linaro.org>
Date:   Wed, 28 Jul 2021 17:53:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626246068-21023-8-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/14/21 10:01 AM, Dikshita Agarwal wrote:
> - Get the min buffer count required by FW from source event change
>   and use the same value to decide actual buffer count and for
>   buffer size calculation.
> - Setup DPB and OPB buffers after session continue incase of
>   reconfig.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.h             |  1 +
>  drivers/media/platform/qcom/venus/helpers.c          | 11 ++++++++++-
>  drivers/media/platform/qcom/venus/hfi_helper.h       |  9 +++++++++
>  drivers/media/platform/qcom/venus/hfi_msgs.c         |  7 +++++++
>  drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c |  6 ++++--
>  drivers/media/platform/qcom/venus/vdec.c             | 20 +++++++++++++-------
>  6 files changed, 44 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 1ff20d9..b2b023e 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -403,6 +403,7 @@ struct venus_inst {
>  	u32 width;
>  	u32 height;
>  	struct v4l2_rect crop;
> +	u32 fw_min_cnt;
>  	u32 out_width;
>  	u32 out_height;
>  	u32 colorspace;
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index ccf188a..ea82cdc 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -576,6 +576,7 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
>  	struct hfi_plat_buffers_params params;
>  	bool is_dec = inst->session_type == VIDC_SESSION_TYPE_DEC;
>  	struct venc_controls *enc_ctr = &inst->controls.enc;
> +	int ret = 0;

No need to initialize ret to zero.

>  
>  	hfi_plat = hfi_platform_get(version);
>  
> @@ -610,7 +611,15 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
>  		params.enc.is_tenbit = inst->bit_depth == VIDC_BITDEPTH_10;
>  	}
>  
> -	return hfi_plat->bufreq(&params, inst->session_type, buftype, req);
> +	if (buftype == HFI_BUFFER_OUTPUT || buftype == HFI_BUFFER_OUTPUT2 ||
> +	    buftype == HFI_BUFFER_INTERNAL_SCRATCH_1(version))

Could you add a comment why HFI_BUFFER_INTERNAL_SCRATCH_1 is included in
condition and not included in below 'if' condition?

> +		req->count_min = inst->fw_min_cnt;
> +
> +	ret = hfi_plat->bufreq(&params, inst->session_type, buftype, req);
> +	if (buftype == HFI_BUFFER_OUTPUT || buftype == HFI_BUFFER_OUTPUT2)

^^^^

> +		if (inst->fw_min_cnt != req->count_min)
> +			inst->fw_min_cnt = req->count_min;
> +	return ret;
>  }

Also in regards to inst->fw_min_cnt, can we pass fw_min_cnt as input to
get_bufreq via 'req' structure, i.e.

req.count_min = inst->fw_min_cnt;

ret = venus_helper_get_bufreq(inst, type, &req);

inst->fw_min_cnt = req.count_min

?

>  
>  int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index 185c302..f2e8fad 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -167,6 +167,7 @@
>  #define HFI_PROPERTY_PARAM_VDEC_RECOVERY_POINT_SEI_EXTRADATA	0x120300c
>  #define HFI_PROPERTY_PARAM_VDEC_THUMBNAIL_MODE			0x120300d
>  #define HFI_PROPERTY_PARAM_VDEC_FRAME_ASSEMBLY			0x120300e
> +#define HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS				0x120300e
>  #define HFI_PROPERTY_PARAM_VDEC_VC1_FRAMEDISP_EXTRADATA		0x1203011
>  #define HFI_PROPERTY_PARAM_VDEC_VC1_SEQDISP_EXTRADATA		0x1203012
>  #define HFI_PROPERTY_PARAM_VDEC_TIMESTAMP_EXTRADATA		0x1203013
> @@ -906,6 +907,14 @@ struct hfi_extradata_input_crop {
>  	u32 height;
>  };
>  
> +struct hfi_dpb_counts {
> +	u32 max_dpb_count;
> +	u32 max_ref_frames;
> +	u32 max_dec_buffering;
> +	u32 max_reorder_frames;
> +	u32 fw_min_cnt;
> +};
> +
>  #define HFI_COLOR_FORMAT_MONOCHROME		0x01
>  #define HFI_COLOR_FORMAT_NV12			0x02
>  #define HFI_COLOR_FORMAT_NV21			0x03
> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
> index a2d436d..ed005d6 100644
> --- a/drivers/media/platform/qcom/venus/hfi_msgs.c
> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
> @@ -32,6 +32,7 @@ static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
>  	struct hfi_colour_space *colour_info;
>  	struct hfi_buffer_requirements *bufreq;
>  	struct hfi_extradata_input_crop *crop;
> +	struct hfi_dpb_counts *dpb_count;
>  	u8 *data_ptr;
>  	u32 ptype;
>  
> @@ -110,6 +111,12 @@ static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
>  			event.input_crop.height = crop->height;
>  			data_ptr += sizeof(*crop);
>  			break;
> +		case HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS:
> +			data_ptr += sizeof(u32);
> +			dpb_count = (struct hfi_dpb_counts *)data_ptr;
> +			event.buf_count = dpb_count->fw_min_cnt;
> +			data_ptr += sizeof(*dpb_count);
> +			break;
>  		default:
>  			break;
>  		}
> diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> index 479178b..ea25c45 100644
> --- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> +++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> @@ -1164,7 +1164,7 @@ static int output_buffer_count(u32 session_type, u32 codec)
>  			output_min_count = 6;
>  			break;
>  		case V4L2_PIX_FMT_VP9:
> -			output_min_count = 9;
> +			output_min_count = 11;
>  			break;
>  		case V4L2_PIX_FMT_H264:
>  		case V4L2_PIX_FMT_HEVC:
> @@ -1213,6 +1213,8 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
>  	}
>  
>  	out_min_count = output_buffer_count(VIDC_SESSION_TYPE_DEC, codec);
> +	/* Max of driver and FW count */
> +	out_min_count = max(out_min_count, bufreq->count_min);
>  
>  	bufreq->type = buftype;
>  	bufreq->region_size = 0;
> @@ -1237,7 +1239,7 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
>  	} else if (buftype == HFI_BUFFER_INTERNAL_SCRATCH(version)) {
>  		bufreq->size = dec_ops->scratch(width, height, is_interlaced);
>  	} else if (buftype == HFI_BUFFER_INTERNAL_SCRATCH_1(version)) {
> -		bufreq->size = dec_ops->scratch1(width, height, out_min_count,
> +		bufreq->size = dec_ops->scratch1(width, height, VB2_MAX_FRAME,
>  						 is_secondary_output,
>  						 num_vpp_pipes);
>  	} else if (buftype == HFI_BUFFER_INTERNAL_PERSIST_1) {
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 892be8d..3e91d8c 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -988,23 +988,23 @@ static int vdec_start_capture(struct venus_inst *inst)
>  	if (ret)
>  		goto err;
>  
> +	venus_pm_load_scale(inst);
> +
> +	inst->next_buf_last = false;
> +
>  	ret = venus_helper_alloc_dpb_bufs(inst);
>  	if (ret)
>  		goto err;
>  
> -	ret = venus_helper_queue_dpb_bufs(inst);
> +	ret = hfi_session_continue(inst);
>  	if (ret)
>  		goto free_dpb_bufs;
>  
> -	ret = venus_helper_process_initial_cap_bufs(inst);
> +	ret = venus_helper_queue_dpb_bufs(inst);
>  	if (ret)
>  		goto free_dpb_bufs;
>  
> -	venus_pm_load_scale(inst);
> -
> -	inst->next_buf_last = false;
> -
> -	ret = hfi_session_continue(inst);
> +	ret = venus_helper_process_initial_cap_bufs(inst);
>  	if (ret)
>  		goto free_dpb_bufs;
>  
> @@ -1411,6 +1411,11 @@ static void vdec_event_change(struct venus_inst *inst,
>  		inst->crop.height = ev_data->height;
>  	}
>  
> +	inst->fw_min_cnt = ev_data->buf_count;
> +	//overwriting this to 11 for vp9 due to fw bug

Please use C style for comments

> +	if(inst->hfi_codec == HFI_VIDEO_CODEC_VP9)

Space after if:

if (condition)

> +		inst->fw_min_cnt = 11;
> +
>  	inst->out_width = ev_data->width;
>  	inst->out_height = ev_data->height;
>  
> @@ -1514,6 +1519,7 @@ static void vdec_inst_init(struct venus_inst *inst)
>  	inst->crop.top = 0;
>  	inst->crop.width = inst->width;
>  	inst->crop.height = inst->height;
> +	inst->fw_min_cnt = 8;
>  	inst->out_width = frame_width_min(inst);
>  	inst->out_height = frame_height_min(inst);
>  	inst->fps = 30;
> 

-- 
regards,
Stan
