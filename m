Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02CF2F431B
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 05:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbhAME3W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 23:29:22 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:56541 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbhAME3V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 23:29:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610512141; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=66p2zu4LuO1Krs2pvfhwJZAiz8SDa/CWM02xUQZyH+k=;
 b=hvKdsA7/oDQjMI6Vk3PMK51BlgKxqmBkClCLgFbsV2C3dtztqYc296NYLV+8gmJbSxB9okVC
 sZLkWJlfKUn6TpIaVFbM5NLCqyr0C4IFsOfLn0y5/3yiqfo/cUBQINQ3myfmtQIDtSzHjfEV
 dM46bYPph8n5I5mUDpZkRQebQcA=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ffe76e38fb3cda82f113fa3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 04:28:19
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 219B4C433CA; Wed, 13 Jan 2021 04:28:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 407FEC433C6;
        Wed, 13 Jan 2021 04:28:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 13 Jan 2021 09:58:18 +0530
From:   dikshita@codeaurora.org
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
Subject: Re: [PATCH v5 2/2] venus: venc: Add support for Long Term Reference
 (LTR) controls
In-Reply-To: <e11a4e78-8e41-c7f4-4947-76d27f0fa2ed@xs4all.nl>
References: <1609736971-14454-1-git-send-email-dikshita@codeaurora.org>
 <1609736971-14454-3-git-send-email-dikshita@codeaurora.org>
 <e11a4e78-8e41-c7f4-4947-76d27f0fa2ed@xs4all.nl>
Message-ID: <cf29047907ef104a233316a47c313d21@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 2021-01-12 14:34, Hans Verkuil wrote:
> On 04/01/2021 06:09, Dikshita Agarwal wrote:
>> Add support for below LTR controls in encoder:
>> - V4L2_CID_MPEG_VIDEO_LTR_COUNT
>> - V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
>> - V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
> 
> This patch does not add any Request API support to the venus driver,
> so it makes no sense to merge this series. It's incomplete.
> 

It Is not mandatory to use request API for LTR controls.
LTR controls can be exercised either in frame synchronized manner or
in the non-frame synchronized way as well.

Thanks,
Dikshita
> The other two series (priority ID and QP and layer bitrate) look good
> to be merged.
> 
> Regards,
> 
> 	Hans
> 
>> 
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/venc_ctrls.c | 49 
>> +++++++++++++++++++++++++-
>>  1 file changed, 48 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c 
>> b/drivers/media/platform/qcom/venus/venc_ctrls.c
>> index 496ad4d..7d010d8 100644
>> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
>> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
>> @@ -20,6 +20,7 @@
>>  #define INTRA_REFRESH_MBS_MAX	300
>>  #define AT_SLICE_BOUNDARY	\
>>  	V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY
>> +#define MAX_LTR_FRAME_COUNT 4
>> 
>>  static int venc_calc_bpframes(u32 gop_size, u32 conseq_b, u32 *bf, 
>> u32 *pf)
>>  {
>> @@ -72,6 +73,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>>  	struct venc_controls *ctr = &inst->controls.enc;
>>  	struct hfi_enable en = { .enable = 1 };
>>  	struct hfi_bitrate brate;
>> +	struct hfi_ltr_use ltr_use;
>> +	struct hfi_ltr_mark ltr_mark;
>> +	struct hfi_ltr_mode ltr_mode;
>>  	u32 bframes;
>>  	u32 ptype;
>>  	int ret;
>> @@ -259,6 +263,37 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>>  	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
>>  		ctr->frame_skip_mode = ctrl->val;
>>  		break;
>> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
>> +		ptype = HFI_PROPERTY_PARAM_VENC_LTRMODE;
>> +		ltr_mode.ltr_count = ctrl->val;
>> +		ltr_mode.ltr_mode = HFI_LTR_MODE_MANUAL;
>> +		ltr_mode.trust_mode = 1;
>> +		ret = hfi_session_set_property(inst, ptype, &ltr_mode);
>> +		if (ret) {
>> +			mutex_unlock(&inst->lock);
>> +			return ret;
>> +		}
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
>> +		ptype = HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME;
>> +		ltr_mark.mark_frame = ctrl->val;
>> +		ret = hfi_session_set_property(inst, ptype, &ltr_mark);
>> +		if (ret) {
>> +			mutex_unlock(&inst->lock);
>> +			return ret;
>> +		}
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
>> +		ptype = HFI_PROPERTY_CONFIG_VENC_USELTRFRAME;
>> +		ltr_use.ref_ltr = ctrl->val;
>> +		ltr_use.use_constrnt = true;
>> +		ltr_use.frames = 0;
>> +		ret = hfi_session_set_property(inst, ptype, &ltr_use);
>> +		if (ret) {
>> +			mutex_unlock(&inst->lock);
>> +			return ret;
>> +		}
>> +		break;
>>  	default:
>>  		return -EINVAL;
>>  	}
>> @@ -274,7 +309,7 @@ int venc_ctrl_init(struct venus_inst *inst)
>>  {
>>  	int ret;
>> 
>> -	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 50);
>> +	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 53);
>>  	if (ret)
>>  		return ret;
>> 
>> @@ -476,6 +511,18 @@ int venc_ctrl_init(struct venus_inst *inst)
>>  			       (1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT)),
>>  			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED);
>> 
>> +	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
>> +			  V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES, 0,
>> +			  (MAX_LTR_FRAME_COUNT - 1), 1, 0);
>> +
>> +	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
>> +			  V4L2_CID_MPEG_VIDEO_LTR_COUNT, 0,
>> +			  MAX_LTR_FRAME_COUNT, 1, 0);
>> +
>> +	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
>> +			  V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX, 0,
>> +			  (MAX_LTR_FRAME_COUNT - 1), 1, 0);
>> +
>>  	ret = inst->ctrl_handler.error;
>>  	if (ret)
>>  		goto err;
>> 
