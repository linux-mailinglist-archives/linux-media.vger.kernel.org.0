Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F16F2B9221
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 13:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgKSMJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 07:09:50 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47848 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbgKSMJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 07:09:49 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id F183C1F4579E
Message-ID: <8cc657c5d41c8794fb62d854dfb6380f1553dc21.camel@collabora.com>
Subject: Re: [PATCH v3 07/13] media: controls: Validate H264 stateless
 controls
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Date:   Thu, 19 Nov 2020 09:09:38 -0300
In-Reply-To: <20201118184700.331213-8-ezequiel@collabora.com>
References: <20201118184700.331213-1-ezequiel@collabora.com>
         <20201118184700.331213-8-ezequiel@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, 2020-11-18 at 15:46 -0300, Ezequiel Garcia wrote:
> Check that all the fields that correspond or are related
> to a H264 specification syntax element have legal values.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 83 ++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 21c1928a9df8..adcf47bddbe3 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1775,6 +1775,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  {
>  	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
>  	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
> +	struct v4l2_ctrl_h264_sps *p_h264_sps;
> +	struct v4l2_ctrl_h264_pps *p_h264_pps;
> +	struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weigths;
>  	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
>  	struct v4l2_ctrl_h264_decode_params *p_h264_dec_params;
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
> @@ -1834,20 +1837,100 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		break;
>  
>  	case V4L2_CTRL_TYPE_H264_SPS:
> +		p_h264_sps = p;
> +
> +		/* Only monochrome and 4:2:0 allowed */
> +		if (p_h264_sps->profile_idc < V4L2_H264_PROFILE_IDC_HIGH_422 &&
> +		    p_h264_sps->chroma_format_idc > 1)
> +				return -EINVAL;
> +		/* 4:2:2 allowed */
> +		else if (p_h264_sps->profile_idc < V4L2_H264_PROFILE_IDC_HIGH_444 &&
> +			 p_h264_sps->chroma_format_idc > 2)
> +				return -EINVAL;
> +		else if (p_h264_sps->chroma_format_idc > 3)
> +				return -EINVAL;
> +
> +		if (p_h264_sps->bit_depth_luma_minus8 > 6)
> +			return -EINVAL;
> +		if (p_h264_sps->bit_depth_chroma_minus8 > 6)
> +			return -EINVAL;
> +		if (p_h264_sps->log2_max_frame_num_minus4 > 12)
> +			return -EINVAL;
> +		if (p_h264_sps->pic_order_cnt_type > 2)
> +			return -EINVAL;
> +		if (p_h264_sps->log2_max_pic_order_cnt_lsb_minus4 > 12)
> +			return -EINVAL;

After a round of testing and some discussions with Jernej
on IRC, this patch needs some more discussion.

For instance, syntax element log2_max_pic_order_cnt_lsb_minus4
is only present if pic_order_cnt_type==0. It's easy to set it
to 0 in that case (although the spec doesn't specify any value).

Similarly, chroma_format_idc, bit_depth_luma_minus8,
bit_depth_chroma_minus8 elements are not present for some profiles.
The spec defines what are the values to be inferred in this case.

> +		if (p_h264_sps->max_num_ref_frames > V4L2_H264_REF_LIST_LEN)
> +			return -EINVAL;
> +		break;
> +
>  	case V4L2_CTRL_TYPE_H264_PPS:
> +		p_h264_pps = p;
> +
[snip]

>  
>  	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
>  		p_h264_slice_params = p;
>  
> +		if (p_h264_slice_params->colour_plane_id > 2)
> +			return -EINVAL;
> +		if (p_h264_slice_params->cabac_init_idc > 2)
> +			return -EINVAL;

There are other cases which are more complex to solve. For instance,
cabac_init_idc which is specified if PPS element
entropy_coding_mode_flag is passed.

I believe applications (most of them will have to be adapted
anyway for the new API), will have to ensure cabac_init_idc is sane
before passing it to the kernel.

> +		if (p_h264_slice_params->disable_deblocking_filter_idc > 2)
> +			return -EINVAL;
> +		if (p_h264_slice_params->slice_alpha_c0_offset_div2 < -6 ||
> +		    p_h264_slice_params->slice_alpha_c0_offset_div2 > 6)
> +			return -EINVAL;
> +		if (p_h264_slice_params->slice_beta_offset_div2 < -6 ||
> +		    p_h264_slice_params->slice_beta_offset_div2 > 6)

Same here, these depends on PPS element deblocking_filter_control_present_flag.

I guess we can handle the simple ones, but those that depend
on elements from other NALUs might have to remain as-is.

Thanks,
Ezequiel

