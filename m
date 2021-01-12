Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7FD2F2ABF
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 10:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389332AbhALJFV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 04:05:21 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:60527 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388856AbhALJFS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 04:05:18 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id zFbIkDFNAVfyLzFbLkopWg; Tue, 12 Jan 2021 10:04:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610442271; bh=w+eQNhQZnKJAllfIzv3g8UL7ixvpbCSLuEatvY5u/XI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KBbY/P7mJw0U7W6AdLzOqfUcXsIvbj3VuzH2QfSeFCuPeFlsDUbPo321JOY711RVQ
         jkVL714w1GHgf3zdqlU+8jjm3z/wPele3KaPgZrrFDvGJszmpnG/y4OdOCdl3Q2BBL
         6KubodHq54gb5Wc+vBOb8RPTdVq1cHDrliCD58s/V7mcf+UwSQOPR7fAD8R3pZdWAG
         BZE9VkyCXq70RoctikkJA+MnS0PxLBklpoH3t6CL0gH3iHqVBaSMjrwCzXc9XAOwLr
         rnSh57fRdo4Z/3D0kS+LNrC1X4FA2NUP3aWSsL5GJyxDYPxsUr3fq2E/n0qvLKGc6N
         +Bi48mk0NsNpA==
Subject: Re: [PATCH v5 2/2] venus: venc: Add support for Long Term Reference
 (LTR) controls
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1609736971-14454-1-git-send-email-dikshita@codeaurora.org>
 <1609736971-14454-3-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e11a4e78-8e41-c7f4-4947-76d27f0fa2ed@xs4all.nl>
Date:   Tue, 12 Jan 2021 10:04:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1609736971-14454-3-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNfNVDt7xI9xuvE28pakTe/RciRNCg7GGlZTvFiXs8nhuSsM/ARLZqkNolvXYjUWI8q6xAPEXTm2qTPk6C+KMppHZhHyxC90OftYJ9yerdRsdF9oqWS3
 cnhrppwA5Tyqp9piHy0BO39n0rDMTTwJpHnjX+8VLuWA8W6+XxcTPbGZTzySN0FD29Y8BqVsCPDMBtn1U+Zc9pdr/iKbZAscijqEPHsBI8gFzOJJqZGC+1QD
 YOv8U9x+XdRYDX/aE7WMhaFPd7xrtrkI2lrdbasAIL1hLn5U6aEdTqzFEyirJAWY29nnGnCZpjvHJ4BjdFB2nJRcWPwzaeC47fb2nxTvqmPpmjDp77JGbzJS
 E1AcqhLtfOJjLWXky8GiDXcF8QutnMX7n4fbCntvmVGw2YQleis=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/01/2021 06:09, Dikshita Agarwal wrote:
> Add support for below LTR controls in encoder:
> - V4L2_CID_MPEG_VIDEO_LTR_COUNT
> - V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
> - V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES

This patch does not add any Request API support to the venus driver,
so it makes no sense to merge this series. It's incomplete.

The other two series (priority ID and QP and layer bitrate) look good
to be merged.

Regards,

	Hans

> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 49 +++++++++++++++++++++++++-
>  1 file changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index 496ad4d..7d010d8 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -20,6 +20,7 @@
>  #define INTRA_REFRESH_MBS_MAX	300
>  #define AT_SLICE_BOUNDARY	\
>  	V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY
> +#define MAX_LTR_FRAME_COUNT 4
>  
>  static int venc_calc_bpframes(u32 gop_size, u32 conseq_b, u32 *bf, u32 *pf)
>  {
> @@ -72,6 +73,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>  	struct venc_controls *ctr = &inst->controls.enc;
>  	struct hfi_enable en = { .enable = 1 };
>  	struct hfi_bitrate brate;
> +	struct hfi_ltr_use ltr_use;
> +	struct hfi_ltr_mark ltr_mark;
> +	struct hfi_ltr_mode ltr_mode;
>  	u32 bframes;
>  	u32 ptype;
>  	int ret;
> @@ -259,6 +263,37 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
>  		ctr->frame_skip_mode = ctrl->val;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
> +		ptype = HFI_PROPERTY_PARAM_VENC_LTRMODE;
> +		ltr_mode.ltr_count = ctrl->val;
> +		ltr_mode.ltr_mode = HFI_LTR_MODE_MANUAL;
> +		ltr_mode.trust_mode = 1;
> +		ret = hfi_session_set_property(inst, ptype, &ltr_mode);
> +		if (ret) {
> +			mutex_unlock(&inst->lock);
> +			return ret;
> +		}
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
> +		ptype = HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME;
> +		ltr_mark.mark_frame = ctrl->val;
> +		ret = hfi_session_set_property(inst, ptype, &ltr_mark);
> +		if (ret) {
> +			mutex_unlock(&inst->lock);
> +			return ret;
> +		}
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
> +		ptype = HFI_PROPERTY_CONFIG_VENC_USELTRFRAME;
> +		ltr_use.ref_ltr = ctrl->val;
> +		ltr_use.use_constrnt = true;
> +		ltr_use.frames = 0;
> +		ret = hfi_session_set_property(inst, ptype, &ltr_use);
> +		if (ret) {
> +			mutex_unlock(&inst->lock);
> +			return ret;
> +		}
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -274,7 +309,7 @@ int venc_ctrl_init(struct venus_inst *inst)
>  {
>  	int ret;
>  
> -	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 50);
> +	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 53);
>  	if (ret)
>  		return ret;
>  
> @@ -476,6 +511,18 @@ int venc_ctrl_init(struct venus_inst *inst)
>  			       (1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT)),
>  			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED);
>  
> +	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +			  V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES, 0,
> +			  (MAX_LTR_FRAME_COUNT - 1), 1, 0);
> +
> +	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +			  V4L2_CID_MPEG_VIDEO_LTR_COUNT, 0,
> +			  MAX_LTR_FRAME_COUNT, 1, 0);
> +
> +	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +			  V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX, 0,
> +			  (MAX_LTR_FRAME_COUNT - 1), 1, 0);
> +
>  	ret = inst->ctrl_handler.error;
>  	if (ret)
>  		goto err;
> 

