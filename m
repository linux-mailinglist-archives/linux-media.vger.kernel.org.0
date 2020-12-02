Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD5F2CBE79
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 14:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727274AbgLBNhi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 08:37:38 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:38709 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726063AbgLBNhh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 08:37:37 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kSJOkELI0N7XgkSJSktGTp; Wed, 02 Dec 2020 14:36:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606916214; bh=0p93BDswAy4jNORVIR/sbAsAJ8XI35uwObYCucjeNFU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OA4EMhrIWm5j/M8DVVuSRWPsUcifXI8imAbRTYoOBqgSH968xkZ8Z/itEHOKsiTm3
         4VUMtsqY1CSlzsVruJ0HogYmaLGysIyw86hn/289BRohUAcn5EXGkfcwu1OgO3zOWb
         49DPOK+6BqQuIHDoVcqOj9exrGMnm6gF/8JU9PYVWLJPhtMRBnEE5QswuXY6vkGSdE
         181v6NHStKYTpXF0h5KY/SplTp1klfICJN1Q4paGIbliF/XNckgo64t65PNN+ArqtC
         SIEc0TOuHqWrHC19/n/2HS/+g75VGfdfeAPHxBPyOhXwB0PJhgmIKwOSn2oZ0TU4DK
         bvCG/X4g5Dtqw==
Subject: Re: [PATCH v3 3/3] venus: venc: Add support for frame-specific
 min/max qp controls
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1605682497-29273-1-git-send-email-dikshita@codeaurora.org>
 <1605682497-29273-4-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a5f99684-54ff-6d09-eeb7-4748ed3c3271@xs4all.nl>
Date:   Wed, 2 Dec 2020 14:36:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1605682497-29273-4-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJCyZqR7dyovBx+dTvzQQXmQvFZKmbkyGAhGrBWWLn40ycWdbDIGr539lSV9UScf4eSh7ov4OqV1WhJoMmUIpFN6qgezYv6BoAYCdHkfM9gnBcR4AoID
 MnHng437DzuLyFMKjT16M3I768eimb2lN1qAlqvuEaEEls2ZDSDvnrLx1j8/Q/BljSsw5+kZxc4RItAk2GVU5RSezNzN9oi3yLQ+8O4vAuMAvPp4HbXNiFb/
 VCyzzDu9JUOuCrKuMz4DYoGEawuv5XyiOVf3Enmddg/iTrS+7+0ZRPmsCt01r1vkwPOrKLUln1lxg1GkXdLXxIJQB5DRKaxBP3r4/7mr0J0eB1rNdEY/MZoI
 ygaQstbq2KhiWK7SfZTnikPuCouzzkGulPlwKTXR1vcvlJRSRj4nNzW3JljY3JikYc1JeVRGWlW3vi7i2NNH5szVMVzO4w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/11/2020 07:54, Dikshita Agarwal wrote:
> Add support for frame type specific min and max qp controls
> for encoder.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.h       | 18 +++++++++
>  drivers/media/platform/qcom/venus/venc.c       | 21 ++++++++---
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 51 ++++++++++++++++++++++++++
>  3 files changed, 85 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 3bc129a..6a764c9 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -230,10 +230,28 @@ struct venc_controls {
>  	u32 h264_b_qp;
>  	u32 h264_min_qp;
>  	u32 h264_max_qp;
> +	u32 h264_i_min_qp;
> +	u32 h264_i_max_qp;
> +	u32 h264_p_min_qp;
> +	u32 h264_p_max_qp;
> +	u32 h264_b_min_qp;
> +	u32 h264_b_max_qp;
>  	u32 h264_loop_filter_mode;
>  	s32 h264_loop_filter_alpha;
>  	s32 h264_loop_filter_beta;
>  
> +	u32 hevc_i_qp;
> +	u32 hevc_p_qp;
> +	u32 hevc_b_qp;
> +	u32 hevc_min_qp;
> +	u32 hevc_max_qp;
> +	u32 hevc_i_min_qp;
> +	u32 hevc_i_max_qp;
> +	u32 hevc_p_min_qp;
> +	u32 hevc_p_max_qp;
> +	u32 hevc_b_min_qp;
> +	u32 hevc_b_max_qp;
> +
>  	u32 vp8_min_qp;
>  	u32 vp8_max_qp;
>  
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 0bf92cc..f2f5a85 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -668,17 +668,28 @@ static int venc_set_properties(struct venus_inst *inst)
>  		return ret;
>  
>  	ptype = HFI_PROPERTY_PARAM_VENC_SESSION_QP;
> -	quant.qp_i = ctr->h264_i_qp;
> -	quant.qp_p = ctr->h264_p_qp;
> -	quant.qp_b = ctr->h264_b_qp;
> +	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
> +		quant.qp_i = ctr->hevc_i_qp;
> +		quant.qp_p = ctr->hevc_p_qp;
> +		quant.qp_b = ctr->hevc_b_qp;
> +	} else {
> +		quant.qp_i = ctr->h264_i_qp;
> +		quant.qp_p = ctr->h264_p_qp;
> +		quant.qp_b = ctr->h264_b_qp;
> +	}
>  	quant.layer_id = 0;
>  	ret = hfi_session_set_property(inst, ptype, &quant);
>  	if (ret)
>  		return ret;
>  
>  	ptype = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE;
> -	quant_range.min_qp = ctr->h264_min_qp;
> -	quant_range.max_qp = ctr->h264_max_qp;
> +	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
> +		quant_range.min_qp = ctr->hevc_min_qp;
> +		quant_range.max_qp = ctr->hevc_max_qp;
> +	} else {
> +		quant_range.min_qp = ctr->h264_min_qp;
> +		quant_range.max_qp = ctr->h264_max_qp;
> +	}
>  	quant_range.layer_id = 0;
>  	ret = hfi_session_set_property(inst, ptype, &quant_range);
>  	if (ret)
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index 0708b3b..cd131e3 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -125,9 +125,60 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
>  		ctr->h264_min_qp = ctrl->val;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP:
> +		ctr->h264_i_min_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP:
> +		ctr->h264_p_min_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:
> +		ctr->h264_b_min_qp = ctrl->val;
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
>  		ctr->h264_max_qp = ctrl->val;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP:
> +		ctr->h264_i_max_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:
> +		ctr->h264_p_max_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:
> +		ctr->h264_b_max_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:
> +		ctr->hevc_i_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP:
> +		ctr->hevc_p_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
> +		ctr->hevc_b_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
> +		ctr->hevc_min_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP:
> +		ctr->hevc_i_min_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP:
> +		ctr->hevc_p_min_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP:
> +		ctr->hevc_b_min_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:
> +		ctr->hevc_max_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP:
> +		ctr->hevc_i_max_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP:
> +		ctr->hevc_p_max_qp = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP:
> +		ctr->hevc_b_max_qp = ctrl->val;
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
>  		ctr->multi_slice_mode = ctrl->val;
>  		break;
> 

This looks incomplete: the new controls aren't actually added to the
driver with v4l2_ctrl_new_std(). Did you test this?

Regards,

	Hans
