Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2A93959B8
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 13:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbhEaL3s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 07:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbhEaL3q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 07:29:46 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09962C061574
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:28:06 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id dj8so839119edb.6
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=08fXbeDStzHaGH5Vv8VS9Oq7rvVQTuttwAyor2Lln0g=;
        b=gbuoAiRJbkCKFW2KsN3P2Fmsne4dRY3Ck4pKSqoUsRVRTiC3caDviB9DOXz28zGEnn
         kgx4a20dVhKP6PyZZ6uTteu2tWevegydHAwe9edp7O8ZuV2Lujls5ipCQ4zBr21eZ6k6
         S/2s0v4uU18m49FSb0xdloOId6BWpI9BseIhaWggzZdFqj8dUiEjsBD6e82YgJa5m7kr
         cvC6tmrXw7xJbqN/fUUBMBCRIyYPa3jtXjL8eftxxM6QxbdeXtQv2x0LNn6jseA6vLdl
         J6NesMpED3YNKGb7s9SsbQYkY0odjyqDk0RsZHu2bdBAMeuo9FZph6neWfoY+djEwAf0
         /7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=08fXbeDStzHaGH5Vv8VS9Oq7rvVQTuttwAyor2Lln0g=;
        b=lsB/etsj5vHkg1PdWb3Zed2mzANfUC2qmwTE5EKEvHtbS3pbAungOWzNroqDK+nRxi
         ErgOKRg569lO7i8BInfhHUmwYgA7lT7R8k6XksEmcu/tzWUpZZMzNqRJcwXNud29oII3
         kcQRpujZqndLfxFfyy6lWRoBwWZDfhIeXsil5IG3ZLlyqyLIH9V97s5UVWTjls5ya5Tv
         3tk4WsB7NtPvMpxzZhCUcDsEWhB+zVTORbtF4BtktbHNuo3mz14TwZ7YGdxAzBOb9h2i
         NHkwEVfymcKARNFJyS89DXgBSohI20o3UriCwCDmRenNnqbBDati9GHiXThf96R7VQFz
         Gpqg==
X-Gm-Message-State: AOAM533wOUPBapgGpKWrjFn3Kb5/tjvQbVVq1P8Xg4pWyZWIC1UYXiu3
        eqxY5OjNFK3yO1GB41gJRzQMXw==
X-Google-Smtp-Source: ABdhPJzQYmmocAX1SbMXFJgbWcA5WhuM5DYhopG80nroRCFOU8+Kqhb85lejb49OMj/oCL5Evs8GMA==
X-Received: by 2002:a50:fd11:: with SMTP id i17mr24503080eds.23.1622460484644;
        Mon, 31 May 2021 04:28:04 -0700 (PDT)
Received: from [192.168.1.28] (hst-208-210.medicom.bg. [84.238.208.210])
        by smtp.googlemail.com with ESMTPSA id x4sm3070907edq.23.2021.05.31.04.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 04:28:04 -0700 (PDT)
Subject: Re: [PATCH 7/7] media: venus: Set buffer to FW based on FW min count
 requirement.
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1621417008-6117-1-git-send-email-dikshita@codeaurora.org>
 <1621417008-6117-8-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <f73ae5c1-6c4d-672c-6fb7-9ba65ac945ae@linaro.org>
Date:   Mon, 31 May 2021 14:28:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621417008-6117-8-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/19/21 12:36 PM, Dikshita Agarwal wrote:
> - Get the min buffer count required by FW from source event change
>   and use the same value to decide actual buffer count and for
>   buffer size calculation.
> - Setup DPB and OPB buffers after session continue incase of
>   reconfig.
> 
> Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> Co-developed-by: Vikash Garodia <vgarodia@codeaurora.org>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.h           |  1 +
>  drivers/media/platform/qcom/venus/helpers.c        | 11 ++++++++++-
>  drivers/media/platform/qcom/venus/hfi.h            |  1 +
>  drivers/media/platform/qcom/venus/hfi_helper.h     |  9 +++++++++
>  drivers/media/platform/qcom/venus/hfi_msgs.c       |  7 +++++++
>  .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   |  3 ++-
>  drivers/media/platform/qcom/venus/vdec.c           | 22 ++++++++++++----------
>  7 files changed, 42 insertions(+), 12 deletions(-)
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
> index cbe653f..83c3009 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -576,6 +576,7 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
>  	struct hfi_plat_buffers_params params;
>  	bool is_dec = inst->session_type == VIDC_SESSION_TYPE_DEC;
>  	struct venc_controls *enc_ctr = &inst->controls.enc;
> +	int ret = 0;
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
> +		req->count_min = inst->fw_min_cnt;
> +
> +	ret = hfi_plat->bufreq(&params, inst->session_type, buftype, req);
> +	if (buftype == HFI_BUFFER_OUTPUT || buftype == HFI_BUFFER_OUTPUT2)
> +		if (inst->fw_min_cnt != req->count_min)
> +			inst->fw_min_cnt = req->count_min;
> +	return ret;
>  }
>  
>  int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
> diff --git a/drivers/media/platform/qcom/venus/hfi.h b/drivers/media/platform/qcom/venus/hfi.h
> index f25d412..287d544 100644
> --- a/drivers/media/platform/qcom/venus/hfi.h
> +++ b/drivers/media/platform/qcom/venus/hfi.h
> @@ -75,6 +75,7 @@ struct hfi_event_data {
>  		u32 left, top;
>  		u32 width, height;
>  	} input_crop;
> +	u32 fw_min_cnt;
>  };
>  
>  /* define core states */
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index 185c302..5162f09 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -167,6 +167,7 @@
>  #define HFI_PROPERTY_PARAM_VDEC_RECOVERY_POINT_SEI_EXTRADATA	0x120300c
>  #define HFI_PROPERTY_PARAM_VDEC_THUMBNAIL_MODE			0x120300d
>  #define HFI_PROPERTY_PARAM_VDEC_FRAME_ASSEMBLY			0x120300e
> +#define HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS			0x120300e
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
> index a2d436d..2d207254 100644
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
> +			event.fw_min_cnt = dpb_count->fw_min_cnt;
> +			data_ptr += sizeof(*dpb_count);
> +			break;
>  		default:
>  			break;
>  		}
> diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> index 479178b..c7aea06 100644
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
> @@ -1213,6 +1213,7 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
>  	}
>  
>  	out_min_count = output_buffer_count(VIDC_SESSION_TYPE_DEC, codec);
> +	out_min_count = max(out_min_count, bufreq->count_min);
>  
>  	bufreq->type = buftype;
>  	bufreq->region_size = 0;
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index a674281..d8f0529 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -977,7 +977,7 @@ static int vdec_start_capture(struct venus_inst *inst)
>  		return ret;
>  
>  	ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
> -					VB2_MAX_FRAME, VB2_MAX_FRAME);
> +					inst->num_output_bufs, inst->num_output_bufs);

Please keep VB2_MAX_FRAME for output and output2 num buffers. We need
this to implement vidioc_create_bufs ...

>  	if (ret)
>  		return ret;
>  
> @@ -985,6 +985,14 @@ static int vdec_start_capture(struct venus_inst *inst)
>  	if (ret)
>  		goto err;
>  
> +	venus_pm_load_scale(inst);
> +
> +	inst->next_buf_last = false;
> +
> +	ret = hfi_session_continue(inst);
> +	if (ret)
> +		goto err;
> +
>  	ret = venus_helper_alloc_dpb_bufs(inst);
>  	if (ret)
>  		goto err;
> @@ -997,14 +1005,6 @@ static int vdec_start_capture(struct venus_inst *inst)
>  	if (ret)
>  		goto free_dpb_bufs;
>  
> -	venus_pm_load_scale(inst);
> -
> -	inst->next_buf_last = false;
> -
> -	ret = hfi_session_continue(inst);
> -	if (ret)
> -		goto free_dpb_bufs;
> -
>  	inst->codec_state = VENUS_DEC_STATE_DECODING;
>  
>  	if (inst->drain_active)
> @@ -1069,7 +1069,7 @@ static int vdec_start_output(struct venus_inst *inst)
>  		return ret;
>  
>  	ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
> -					VB2_MAX_FRAME, VB2_MAX_FRAME);
> +					inst->num_output_bufs, inst->num_output_bufs);

... ditto

>  	if (ret)
>  		return ret;
>  
> @@ -1410,6 +1410,7 @@ static void vdec_event_change(struct venus_inst *inst,
>  		inst->crop.height = ev_data->height;
>  	}
>  
> +	inst->fw_min_cnt = ev_data->fw_min_cnt;
>  	inst->out_width = ev_data->width;
>  	inst->out_height = ev_data->height;
>  
> @@ -1513,6 +1514,7 @@ static void vdec_inst_init(struct venus_inst *inst)
>  	inst->crop.top = 0;
>  	inst->crop.width = inst->width;
>  	inst->crop.height = inst->height;
> +	inst->fw_min_cnt = 8;

Why 8? Is this the default value for h264 and resolution 96x96?

>  	inst->out_width = frame_width_min(inst);
>  	inst->out_height = frame_height_min(inst);
>  	inst->fps = 30;
> 

-- 
regards,
Stan
