Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B618C3DD189
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 09:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232594AbhHBHuy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 03:50:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46693 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232571AbhHBHux (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Aug 2021 03:50:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627890644; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=tWe1+n8/KCKc6hmAR5ZRgy1dDHfI2CiePPX+J9Lc/w0=;
 b=FkMMsfeUXK2LmV4u26me73MM/rCtp+o7hmmu5k5H/J1zObVdfEdFODLZ4XMTSEeLxJTVBYmI
 KDoPan500MHGzctXQWjrEQ8YNR8+tisrCX/mjOAIIFeVG2SGomwrz6MYzTf7kPJFba7wN4L9
 dsldxJF6dNqtKTEDPqYVA+5k+Kg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6107a3ba17c2b4047dcf77c3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Aug 2021 07:50:18
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7DED8C43460; Mon,  2 Aug 2021 07:50:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DACD9C433F1;
        Mon,  2 Aug 2021 07:50:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 Aug 2021 13:20:15 +0530
From:   dikshita@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH v3 7/7] media: venus: Set buffer to FW based on FW min
 count requirement.
In-Reply-To: <e85515cc-6213-cdc3-dab8-46ea5eb58011@linaro.org>
References: <1626246068-21023-1-git-send-email-dikshita@codeaurora.org>
 <1626246068-21023-8-git-send-email-dikshita@codeaurora.org>
 <e85515cc-6213-cdc3-dab8-46ea5eb58011@linaro.org>
Message-ID: <6c8f0d013be8ba6d276afe04d6e0c840@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2021-07-28 20:23, Stanimir Varbanov wrote:
> On 7/14/21 10:01 AM, Dikshita Agarwal wrote:
>> - Get the min buffer count required by FW from source event change
>>   and use the same value to decide actual buffer count and for
>>   buffer size calculation.
>> - Setup DPB and OPB buffers after session continue incase of
>>   reconfig.
>> 
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/core.h             |  1 +
>>  drivers/media/platform/qcom/venus/helpers.c          | 11 ++++++++++-
>>  drivers/media/platform/qcom/venus/hfi_helper.h       |  9 +++++++++
>>  drivers/media/platform/qcom/venus/hfi_msgs.c         |  7 +++++++
>>  drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c |  6 ++++--
>>  drivers/media/platform/qcom/venus/vdec.c             | 20 
>> +++++++++++++-------
>>  6 files changed, 44 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/core.h 
>> b/drivers/media/platform/qcom/venus/core.h
>> index 1ff20d9..b2b023e 100644
>> --- a/drivers/media/platform/qcom/venus/core.h
>> +++ b/drivers/media/platform/qcom/venus/core.h
>> @@ -403,6 +403,7 @@ struct venus_inst {
>>  	u32 width;
>>  	u32 height;
>>  	struct v4l2_rect crop;
>> +	u32 fw_min_cnt;
>>  	u32 out_width;
>>  	u32 out_height;
>>  	u32 colorspace;
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index ccf188a..ea82cdc 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -576,6 +576,7 @@ static int platform_get_bufreq(struct venus_inst 
>> *inst, u32 buftype,
>>  	struct hfi_plat_buffers_params params;
>>  	bool is_dec = inst->session_type == VIDC_SESSION_TYPE_DEC;
>>  	struct venc_controls *enc_ctr = &inst->controls.enc;
>> +	int ret = 0;
> 
> No need to initialize ret to zero.
Right, Will update in next patch.
> 
>> 
>>  	hfi_plat = hfi_platform_get(version);
>> 
>> @@ -610,7 +611,15 @@ static int platform_get_bufreq(struct venus_inst 
>> *inst, u32 buftype,
>>  		params.enc.is_tenbit = inst->bit_depth == VIDC_BITDEPTH_10;
>>  	}
>> 
>> -	return hfi_plat->bufreq(&params, inst->session_type, buftype, req);
>> +	if (buftype == HFI_BUFFER_OUTPUT || buftype == HFI_BUFFER_OUTPUT2 ||
>> +	    buftype == HFI_BUFFER_INTERNAL_SCRATCH_1(version))
> 
> Could you add a comment why HFI_BUFFER_INTERNAL_SCRATCH_1 is included 
> in
> condition and not included in below 'if' condition?
> 
we can actually remove HFI_BUFFER_INTERNAL_SCRATCH_1 from this condition 
now
since count_min is no longer being used for SCRATCH_1 buffer 
calculation.
>> +		req->count_min = inst->fw_min_cnt;
>> +
>> +	ret = hfi_plat->bufreq(&params, inst->session_type, buftype, req);
>> +	if (buftype == HFI_BUFFER_OUTPUT || buftype == HFI_BUFFER_OUTPUT2)
> 
> ^^^^
> 
>> +		if (inst->fw_min_cnt != req->count_min)
>> +			inst->fw_min_cnt = req->count_min;
>> +	return ret;
>>  }
> 
> Also in regards to inst->fw_min_cnt, can we pass fw_min_cnt as input to
> get_bufreq via 'req' structure, i.e.
> 
> req.count_min = inst->fw_min_cnt;
> 
> ret = venus_helper_get_bufreq(inst, type, &req);
> 
> inst->fw_min_cnt = req.count_min
> 
> ?
> 
Sorry, I didn't get it, How is this different from the current 
implementation?
>> 
>>  int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
>> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h 
>> b/drivers/media/platform/qcom/venus/hfi_helper.h
>> index 185c302..f2e8fad 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
>> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
>> @@ -167,6 +167,7 @@
>>  #define 
>> HFI_PROPERTY_PARAM_VDEC_RECOVERY_POINT_SEI_EXTRADATA	0x120300c
>>  #define HFI_PROPERTY_PARAM_VDEC_THUMBNAIL_MODE			0x120300d
>>  #define HFI_PROPERTY_PARAM_VDEC_FRAME_ASSEMBLY			0x120300e
>> +#define HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS				0x120300e
>>  #define HFI_PROPERTY_PARAM_VDEC_VC1_FRAMEDISP_EXTRADATA		0x1203011
>>  #define HFI_PROPERTY_PARAM_VDEC_VC1_SEQDISP_EXTRADATA		0x1203012
>>  #define HFI_PROPERTY_PARAM_VDEC_TIMESTAMP_EXTRADATA		0x1203013
>> @@ -906,6 +907,14 @@ struct hfi_extradata_input_crop {
>>  	u32 height;
>>  };
>> 
>> +struct hfi_dpb_counts {
>> +	u32 max_dpb_count;
>> +	u32 max_ref_frames;
>> +	u32 max_dec_buffering;
>> +	u32 max_reorder_frames;
>> +	u32 fw_min_cnt;
>> +};
>> +
>>  #define HFI_COLOR_FORMAT_MONOCHROME		0x01
>>  #define HFI_COLOR_FORMAT_NV12			0x02
>>  #define HFI_COLOR_FORMAT_NV21			0x03
>> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c 
>> b/drivers/media/platform/qcom/venus/hfi_msgs.c
>> index a2d436d..ed005d6 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_msgs.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
>> @@ -32,6 +32,7 @@ static void event_seq_changed(struct venus_core 
>> *core, struct venus_inst *inst,
>>  	struct hfi_colour_space *colour_info;
>>  	struct hfi_buffer_requirements *bufreq;
>>  	struct hfi_extradata_input_crop *crop;
>> +	struct hfi_dpb_counts *dpb_count;
>>  	u8 *data_ptr;
>>  	u32 ptype;
>> 
>> @@ -110,6 +111,12 @@ static void event_seq_changed(struct venus_core 
>> *core, struct venus_inst *inst,
>>  			event.input_crop.height = crop->height;
>>  			data_ptr += sizeof(*crop);
>>  			break;
>> +		case HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS:
>> +			data_ptr += sizeof(u32);
>> +			dpb_count = (struct hfi_dpb_counts *)data_ptr;
>> +			event.buf_count = dpb_count->fw_min_cnt;
>> +			data_ptr += sizeof(*dpb_count);
>> +			break;
>>  		default:
>>  			break;
>>  		}
>> diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c 
>> b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
>> index 479178b..ea25c45 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
>> @@ -1164,7 +1164,7 @@ static int output_buffer_count(u32 session_type, 
>> u32 codec)
>>  			output_min_count = 6;
>>  			break;
>>  		case V4L2_PIX_FMT_VP9:
>> -			output_min_count = 9;
>> +			output_min_count = 11;
>>  			break;
>>  		case V4L2_PIX_FMT_H264:
>>  		case V4L2_PIX_FMT_HEVC:
>> @@ -1213,6 +1213,8 @@ static int bufreq_dec(struct 
>> hfi_plat_buffers_params *params, u32 buftype,
>>  	}
>> 
>>  	out_min_count = output_buffer_count(VIDC_SESSION_TYPE_DEC, codec);
>> +	/* Max of driver and FW count */
>> +	out_min_count = max(out_min_count, bufreq->count_min);
>> 
>>  	bufreq->type = buftype;
>>  	bufreq->region_size = 0;
>> @@ -1237,7 +1239,7 @@ static int bufreq_dec(struct 
>> hfi_plat_buffers_params *params, u32 buftype,
>>  	} else if (buftype == HFI_BUFFER_INTERNAL_SCRATCH(version)) {
>>  		bufreq->size = dec_ops->scratch(width, height, is_interlaced);
>>  	} else if (buftype == HFI_BUFFER_INTERNAL_SCRATCH_1(version)) {
>> -		bufreq->size = dec_ops->scratch1(width, height, out_min_count,
>> +		bufreq->size = dec_ops->scratch1(width, height, VB2_MAX_FRAME,
>>  						 is_secondary_output,
>>  						 num_vpp_pipes);
>>  	} else if (buftype == HFI_BUFFER_INTERNAL_PERSIST_1) {
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c 
>> b/drivers/media/platform/qcom/venus/vdec.c
>> index 892be8d..3e91d8c 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -988,23 +988,23 @@ static int vdec_start_capture(struct venus_inst 
>> *inst)
>>  	if (ret)
>>  		goto err;
>> 
>> +	venus_pm_load_scale(inst);
>> +
>> +	inst->next_buf_last = false;
>> +
>>  	ret = venus_helper_alloc_dpb_bufs(inst);
>>  	if (ret)
>>  		goto err;
>> 
>> -	ret = venus_helper_queue_dpb_bufs(inst);
>> +	ret = hfi_session_continue(inst);
>>  	if (ret)
>>  		goto free_dpb_bufs;
>> 
>> -	ret = venus_helper_process_initial_cap_bufs(inst);
>> +	ret = venus_helper_queue_dpb_bufs(inst);
>>  	if (ret)
>>  		goto free_dpb_bufs;
>> 
>> -	venus_pm_load_scale(inst);
>> -
>> -	inst->next_buf_last = false;
>> -
>> -	ret = hfi_session_continue(inst);
>> +	ret = venus_helper_process_initial_cap_bufs(inst);
>>  	if (ret)
>>  		goto free_dpb_bufs;
>> 
>> @@ -1411,6 +1411,11 @@ static void vdec_event_change(struct venus_inst 
>> *inst,
>>  		inst->crop.height = ev_data->height;
>>  	}
>> 
>> +	inst->fw_min_cnt = ev_data->buf_count;
>> +	//overwriting this to 11 for vp9 due to fw bug
> 
> Please use C style for comments
> 
Sure.
>> +	if(inst->hfi_codec == HFI_VIDEO_CODEC_VP9)
> 
> Space after if:
> 
> if (condition)
> 
Sure, Will fix in next patch.

>> +		inst->fw_min_cnt = 11;
>> +
>>  	inst->out_width = ev_data->width;
>>  	inst->out_height = ev_data->height;
>> 
>> @@ -1514,6 +1519,7 @@ static void vdec_inst_init(struct venus_inst 
>> *inst)
>>  	inst->crop.top = 0;
>>  	inst->crop.width = inst->width;
>>  	inst->crop.height = inst->height;
>> +	inst->fw_min_cnt = 8;
>>  	inst->out_width = frame_width_min(inst);
>>  	inst->out_height = frame_height_min(inst);
>>  	inst->fps = 30;
>> 
