Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01ED3BBA72
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 11:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhGEJqF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 05:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbhGEJqE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 05:46:04 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848A0C061574
        for <linux-media@vger.kernel.org>; Mon,  5 Jul 2021 02:43:26 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id i8so21366081wrc.0
        for <linux-media@vger.kernel.org>; Mon, 05 Jul 2021 02:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eS0sMkTK8rjemH9/gEUO8BHQe0Kh8hbGJ2b31RLH6BI=;
        b=kasmQ0lDT3GCPw80x0UbxxX5qf9vNfEeYoOBwVkPpmbVVgazc8anwLhAX4n+GMvMl+
         weBE/0sKZwU3CSlUY3eTP+DNFGWhIr5QW/cjIYocuLgrvfmQxUaqtDcXS/y4eOJZgOIh
         CUX6AY6iht8DW48K9paxGH+2FJg0Y4qNjiM6YtcwuLFhhK59LvRtCj5zuN/q52ByiYgJ
         K6s99j6WLqLOOhN8m2Hx1DdJRxbVCgN1fXLhsljkn34GuzdEUlOY1XBDlFdlZNYLA9B+
         sJuOC+me9eOCTtVwYe9/z1/DkxJ556n5jek8CXrgKaEbELvwc+Z9q+MlewDdlpc4i43c
         ZcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eS0sMkTK8rjemH9/gEUO8BHQe0Kh8hbGJ2b31RLH6BI=;
        b=DrYnr4lPyWrCGfWxPURbgxL3YNiGWxRVMrJXic7tRWgmOvxvO4e7Y3xk2HVPClrheo
         Ge25CYL/eBUvcXAuWf2FLNPzKWSh/fH/V3p/yIDm+oB6Ontrs/nXmtvD2S8dJoecVoUW
         izBVMZkyBWWgSiA19qMtq79iKcguHap0AqHj3PONHKIpvHCK7rkYZv48GV8R6hp+lsOg
         GTbj6zqVIw2lH532pVW3EoKKmE4bg6HSZi08BZ5f6/b/5Qi4DRUAuO9DxslfgIPSYMXU
         u0V9PMhG2rNwygOcfN4dvqOoKRQqrzU7Sx7G2lgbBFJh4uJYzU605Wruu8pmVcDydUEl
         QxFQ==
X-Gm-Message-State: AOAM532bb3Sjawbcx1/HYYCEXR8tAzEDqukW8+wOhtzdUDSg0BSDXQU3
        n5MrhkB7/zBCV9LLQtK4YlBJ2w==
X-Google-Smtp-Source: ABdhPJwp1xUvayNOkLbjJDDeWqOWcmH3oIzXYTU2Vw6s+X2TzTl45+TwQuVejGNEi4ndxahtpAMb1w==
X-Received: by 2002:a05:6000:120e:: with SMTP id e14mr14424301wrx.139.1625478205168;
        Mon, 05 Jul 2021 02:43:25 -0700 (PDT)
Received: from [192.168.1.9] (hst-221-44.medicom.bg. [84.238.221.44])
        by smtp.googlemail.com with ESMTPSA id q7sm10042513wmq.33.2021.07.05.02.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 02:43:24 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] media: venus: Set buffer to FW based on FW min
 count requirement.
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1625126736-16266-1-git-send-email-dikshita@codeaurora.org>
 <1625126736-16266-8-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <58231cab-5160-d80a-7335-b5db796508e6@linaro.org>
Date:   Mon, 5 Jul 2021 12:43:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625126736-16266-8-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/1/21 11:05 AM, Dikshita Agarwal wrote:
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
>  drivers/media/platform/qcom/venus/hfi_plat_bufs.h    |  2 +-
>  drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c | 14 +++++++++-----
>  drivers/media/platform/qcom/venus/hfi_platform.h     |  3 ++-
>  drivers/media/platform/qcom/venus/vdec.c             | 20 +++++++++++++-------
>  8 files changed, 52 insertions(+), 15 deletions(-)
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
> index ccf188a..a7c49ab 100644
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
> +	ret = hfi_plat->bufreq(&params, inst->session_type, buftype, req, inst->num_output_bufs);

I'm confused, inst->num_output_bufs is filled by calling
venus_helper_get_bufreq() which itself is calling hfi_plat->bufreq().
Could you explain the idea?

> +	if (buftype == HFI_BUFFER_OUTPUT || buftype == HFI_BUFFER_OUTPUT2)
> +		if (inst->fw_min_cnt != req->count_min)
> +			inst->fw_min_cnt = req->count_min;
> +	return ret;
>  }
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
> diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs.h b/drivers/media/platform/qcom/venus/hfi_plat_bufs.h
> index 52a51a3..f40daa3 100644
> --- a/drivers/media/platform/qcom/venus/hfi_plat_bufs.h
> +++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs.h
> @@ -33,6 +33,6 @@ struct hfi_plat_buffers_params {
>  };
>  
>  int hfi_plat_bufreq_v6(struct hfi_plat_buffers_params *params, u32 session_type,
> -		       u32 buftype, struct hfi_buffer_requirements *bufreq);
> +		       u32 buftype, struct hfi_buffer_requirements *bufreq, u32 num_output_bufs);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> index 479178b..2d50949 100644
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
> @@ -1180,7 +1180,7 @@ static int output_buffer_count(u32 session_type, u32 codec)
>  }
>  
>  static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
> -		      struct hfi_buffer_requirements *bufreq)
> +		      struct hfi_buffer_requirements *bufreq, u32 num_output_bufs)
>  {
>  	enum hfi_version version = params->version;
>  	u32 codec = params->codec;
> @@ -1213,6 +1213,10 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
>  	}
>  
>  	out_min_count = output_buffer_count(VIDC_SESSION_TYPE_DEC, codec);
> +	/* Max of driver and FW count */
> +	out_min_count = max(out_min_count, bufreq->count_min);
> +	/* Max of FW and client count */
> +	out_min_count = max(out_min_count, num_output_bufs);
>  
>  	bufreq->type = buftype;
>  	bufreq->region_size = 0;
> @@ -1237,7 +1241,7 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
>  	} else if (buftype == HFI_BUFFER_INTERNAL_SCRATCH(version)) {
>  		bufreq->size = dec_ops->scratch(width, height, is_interlaced);
>  	} else if (buftype == HFI_BUFFER_INTERNAL_SCRATCH_1(version)) {
> -		bufreq->size = dec_ops->scratch1(width, height, out_min_count,
> +		bufreq->size = dec_ops->scratch1(width, height, VB2_MAX_FRAME,
>  						 is_secondary_output,
>  						 num_vpp_pipes);
>  	} else if (buftype == HFI_BUFFER_INTERNAL_PERSIST_1) {
> @@ -1318,10 +1322,10 @@ static int bufreq_enc(struct hfi_plat_buffers_params *params, u32 buftype,
>  }
>  
>  int hfi_plat_bufreq_v6(struct hfi_plat_buffers_params *params, u32 session_type,
> -		       u32 buftype, struct hfi_buffer_requirements *bufreq)
> +		       u32 buftype, struct hfi_buffer_requirements *bufreq, u32 num_output_bufs)
>  {
>  	if (session_type == VIDC_SESSION_TYPE_DEC)
> -		return bufreq_dec(params, buftype, bufreq);
> +		return bufreq_dec(params, buftype, bufreq, num_output_bufs);
>  	else
>  		return bufreq_enc(params, buftype, bufreq);
>  }
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
> index ef768bf..89fa3bd 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform.h
> +++ b/drivers/media/platform/qcom/venus/hfi_platform.h
> @@ -51,7 +51,8 @@ struct hfi_platform {
>  	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count);
>  	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries);
>  	int (*bufreq)(struct hfi_plat_buffers_params *params, u32 session_type,
> -		      u32 buftype, struct hfi_buffer_requirements *bufreq);
> +		      u32 buftype, struct hfi_buffer_requirements *bufreq,
> +		      u32 num_output_bufs);
>  };
>  
>  extern const struct hfi_platform hfi_plat_v4;
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
> +	if(inst->hfi_codec == HFI_VIDEO_CODEC_VP9)
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
