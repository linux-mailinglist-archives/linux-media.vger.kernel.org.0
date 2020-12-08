Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 905382D2FDE
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 17:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730203AbgLHQi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 11:38:26 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:52615 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730013AbgLHQi0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 11:38:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607445485; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GKqaNR8RoeApXAKL255ad/JnOHss3+Y2agk82fIqQWU=;
 b=T1LsITLFEm+ulzm1NDey3btl9X31LpvUZD/UpLoBJH1sXFapf5/EJS67fdajsMMqeAuhYrW/
 nzgjmDkVTAduFK2mtjKgoJY7cUSaNivQiv+zArHz8CjIFH+9KIKdSwzBKgorS84LTXPFh04e
 6diBDKuznfbszEw8KXb6mkCtxt4=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fcfabd0233278a213c9b40d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Dec 2020 16:37:36
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5007BC43461; Tue,  8 Dec 2020 16:37:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D934C433C6;
        Tue,  8 Dec 2020 16:37:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 08 Dec 2020 22:07:35 +0530
From:   dikshita@codeaurora.org
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        stanimir.varbanov@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH v3 3/3] venus: venc: Add support for frame-specific
 min/max qp controls
In-Reply-To: <a5f99684-54ff-6d09-eeb7-4748ed3c3271@xs4all.nl>
References: <1605682497-29273-1-git-send-email-dikshita@codeaurora.org>
 <1605682497-29273-4-git-send-email-dikshita@codeaurora.org>
 <a5f99684-54ff-6d09-eeb7-4748ed3c3271@xs4all.nl>
Message-ID: <445dd26796e2242666e5256e7e36bcbe@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-12-02 19:06, Hans Verkuil wrote:
> On 18/11/2020 07:54, Dikshita Agarwal wrote:
>> Add support for frame type specific min and max qp controls
>> for encoder.
>> 
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/core.h       | 18 +++++++++
>>  drivers/media/platform/qcom/venus/venc.c       | 21 ++++++++---
>>  drivers/media/platform/qcom/venus/venc_ctrls.c | 51 
>> ++++++++++++++++++++++++++
>>  3 files changed, 85 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/core.h 
>> b/drivers/media/platform/qcom/venus/core.h
>> index 3bc129a..6a764c9 100644
>> --- a/drivers/media/platform/qcom/venus/core.h
>> +++ b/drivers/media/platform/qcom/venus/core.h
>> @@ -230,10 +230,28 @@ struct venc_controls {
>>  	u32 h264_b_qp;
>>  	u32 h264_min_qp;
>>  	u32 h264_max_qp;
>> +	u32 h264_i_min_qp;
>> +	u32 h264_i_max_qp;
>> +	u32 h264_p_min_qp;
>> +	u32 h264_p_max_qp;
>> +	u32 h264_b_min_qp;
>> +	u32 h264_b_max_qp;
>>  	u32 h264_loop_filter_mode;
>>  	s32 h264_loop_filter_alpha;
>>  	s32 h264_loop_filter_beta;
>> 
>> +	u32 hevc_i_qp;
>> +	u32 hevc_p_qp;
>> +	u32 hevc_b_qp;
>> +	u32 hevc_min_qp;
>> +	u32 hevc_max_qp;
>> +	u32 hevc_i_min_qp;
>> +	u32 hevc_i_max_qp;
>> +	u32 hevc_p_min_qp;
>> +	u32 hevc_p_max_qp;
>> +	u32 hevc_b_min_qp;
>> +	u32 hevc_b_max_qp;
>> +
>>  	u32 vp8_min_qp;
>>  	u32 vp8_max_qp;
>> 
>> diff --git a/drivers/media/platform/qcom/venus/venc.c 
>> b/drivers/media/platform/qcom/venus/venc.c
>> index 0bf92cc..f2f5a85 100644
>> --- a/drivers/media/platform/qcom/venus/venc.c
>> +++ b/drivers/media/platform/qcom/venus/venc.c
>> @@ -668,17 +668,28 @@ static int venc_set_properties(struct venus_inst 
>> *inst)
>>  		return ret;
>> 
>>  	ptype = HFI_PROPERTY_PARAM_VENC_SESSION_QP;
>> -	quant.qp_i = ctr->h264_i_qp;
>> -	quant.qp_p = ctr->h264_p_qp;
>> -	quant.qp_b = ctr->h264_b_qp;
>> +	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
>> +		quant.qp_i = ctr->hevc_i_qp;
>> +		quant.qp_p = ctr->hevc_p_qp;
>> +		quant.qp_b = ctr->hevc_b_qp;
>> +	} else {
>> +		quant.qp_i = ctr->h264_i_qp;
>> +		quant.qp_p = ctr->h264_p_qp;
>> +		quant.qp_b = ctr->h264_b_qp;
>> +	}
>>  	quant.layer_id = 0;
>>  	ret = hfi_session_set_property(inst, ptype, &quant);
>>  	if (ret)
>>  		return ret;
>> 
>>  	ptype = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE;
>> -	quant_range.min_qp = ctr->h264_min_qp;
>> -	quant_range.max_qp = ctr->h264_max_qp;
>> +	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
>> +		quant_range.min_qp = ctr->hevc_min_qp;
>> +		quant_range.max_qp = ctr->hevc_max_qp;
>> +	} else {
>> +		quant_range.min_qp = ctr->h264_min_qp;
>> +		quant_range.max_qp = ctr->h264_max_qp;
>> +	}
>>  	quant_range.layer_id = 0;
>>  	ret = hfi_session_set_property(inst, ptype, &quant_range);
>>  	if (ret)
>> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c 
>> b/drivers/media/platform/qcom/venus/venc_ctrls.c
>> index 0708b3b..cd131e3 100644
>> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
>> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
>> @@ -125,9 +125,60 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>>  	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
>>  		ctr->h264_min_qp = ctrl->val;
>>  		break;
>> +	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP:
>> +		ctr->h264_i_min_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP:
>> +		ctr->h264_p_min_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:
>> +		ctr->h264_b_min_qp = ctrl->val;
>> +		break;
>>  	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
>>  		ctr->h264_max_qp = ctrl->val;
>>  		break;
>> +	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP:
>> +		ctr->h264_i_max_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:
>> +		ctr->h264_p_max_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:
>> +		ctr->h264_b_max_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:
>> +		ctr->hevc_i_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP:
>> +		ctr->hevc_p_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
>> +		ctr->hevc_b_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
>> +		ctr->hevc_min_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP:
>> +		ctr->hevc_i_min_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP:
>> +		ctr->hevc_p_min_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP:
>> +		ctr->hevc_b_min_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:
>> +		ctr->hevc_max_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP:
>> +		ctr->hevc_i_max_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP:
>> +		ctr->hevc_p_max_qp = ctrl->val;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP:
>> +		ctr->hevc_b_max_qp = ctrl->val;
>> +		break;
>>  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
>>  		ctr->multi_slice_mode = ctrl->val;
>>  		break;
>> 
> 
> This looks incomplete: the new controls aren't actually added to the
> driver with v4l2_ctrl_new_std(). Did you test this?
Oh, Sorry. Looks like I forgot to add some changes.
will send a new patch.

Thanks,
Dikshita
> 
> Regards,
> 
> 	Hans
