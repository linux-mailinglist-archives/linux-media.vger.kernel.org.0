Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C252BA630
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 10:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbgKTJa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 04:30:29 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:33437 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726321AbgKTJa2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 04:30:28 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id g2kHk0xfglmd2g2kLkPgxH; Fri, 20 Nov 2020 10:30:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1605864625; bh=euwjf/1flaoFtA2L1HmEHhsxXmII9NFUyQC+UNU/XRY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=g+CMLlQHQkaVollEHtz8aRp5dlyKKBLz6Di71unWFtn/qAjR9GVRhHiB93LoXnlB/
         CzaRd0ooQRgHztFQVCUvtdxZTJMF2lHtMqS/bZ9oUaVqpIhOFS/91u5USWFdCy2SpS
         3h7qiSidshU4XbQsnAtnvBlK0wjZsOaqMxdGxEU/h1SAMLVdik/CmuVme4OHg9HmEL
         qiwz2Wong0zx9Tw5sOeIcmGdx5sOP4mre5YKYIyW1qjP+awxOyvHndQBj6DC2W5nAY
         tB4UYsxwQwVFS3CH3gEZ4oQiIOJHhGcdM6MrEsbT4UHFI/jrov4Lf84L2plzDSKOK7
         ZHlpgTsJ/nSIA==
Subject: Re: [PATCH v3 07/13] media: controls: Validate H264 stateless
 controls
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20201118184700.331213-1-ezequiel@collabora.com>
 <20201118184700.331213-8-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ce737ae7-053d-1171-1c03-5ff1efb5ea8c@xs4all.nl>
Date:   Fri, 20 Nov 2020 10:30:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201118184700.331213-8-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLY4UGI7vVzgO+LnBO1AAjRWMBtnDJPQnLVzwhe1mvha+d9wMiiUyJkRzkaD30ZJRs5dpJUrXiUFrVL0BK6T9aZGoYn0pltpKIAak43QLO0AF1JSDSHZ
 443nsf+/IQGiEHWVq6XYX0jaLwnuSuWfnBKZSD6ehRoifjq4XHIJpSnVDMpSAvRvt76B/7jcMp+LCApLXdA20+aOlyDJxYd8rhuIovVfyT6dUNxiVLsFOpuR
 rci+sVf0vhmh1OsDHEtUa2b4zXgKNQGdh7SNHNATvvNjZE2k2mJ9sryaF4MzkQqxKfiqmEbx+6M8RgP9PGZ8LI7EFkHyR+eHER30YTe50CR008E3NhXpKKX6
 O8wqcNNuFl841tY9rJkQWBcbZ3EF6iNNjLhw7XCgqHGn5rENtrM1BFXE2dHmDt43CODjn6neZhd0rszWyhgotdYO0vnKf/H0/RlHtfhbFrMcAH788pkKbRjr
 kZgEMVec8+uiy6eNje9lrD5Y6ZUGs2ogxkgfJBaehaHDwT3Cqm0fiiz1/oE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/11/2020 19:46, Ezequiel Garcia wrote:
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

weigths -> weights

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

You can drop the 'else'.

> +			 p_h264_sps->chroma_format_idc > 2)
> +				return -EINVAL;
> +		else if (p_h264_sps->chroma_format_idc > 3)

Ditto.

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
> +		if (p_h264_sps->max_num_ref_frames > V4L2_H264_REF_LIST_LEN)
> +			return -EINVAL;
> +		break;
> +
>  	case V4L2_CTRL_TYPE_H264_PPS:
> +		p_h264_pps = p;
> +
> +		if (p_h264_pps->num_slice_groups_minus1 > 7)
> +			return -EINVAL;
> +		if (p_h264_pps->num_ref_idx_l0_default_active_minus1 >
> +		    (V4L2_H264_REF_LIST_LEN - 1))
> +			return -EINVAL;
> +		if (p_h264_pps->num_ref_idx_l1_default_active_minus1 >
> +		    (V4L2_H264_REF_LIST_LEN - 1))
> +			return -EINVAL;
> +		if (p_h264_pps->weighted_bipred_idc > 2)
> +			return -EINVAL;
> +		/*
> +		 * pic_init_qp_minus26 shall be in the range of
> +		 * -(26 + QpBdOffset_y) to +25, inclusive,
> +		 *  where QpBdOffset_y is 6 * bit_depth_luma_minus8
> +		 */
> +		if (p_h264_pps->pic_init_qp_minus26 < -62 ||
> +		    p_h264_pps->pic_init_qp_minus26 > 25)
> +			return -EINVAL;
> +		if (p_h264_pps->pic_init_qs_minus26 < -26 ||
> +		    p_h264_pps->pic_init_qs_minus26 > 25)
> +			return -EINVAL;
> +		if (p_h264_pps->chroma_qp_index_offset < -12 ||
> +		    p_h264_pps->chroma_qp_index_offset > 12)
> +			return -EINVAL;
> +		if (p_h264_pps->second_chroma_qp_index_offset < -12 ||
> +		    p_h264_pps->second_chroma_qp_index_offset > 12)
> +			return -EINVAL;
> +		break;
> +
>  	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
> +		break;
> +
>  	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
> +		p_h264_pred_weigths = p;
> +
> +		if (p_h264_pred_weigths->luma_log2_weight_denom > 7)
> +			return -EINVAL;
> +		if (p_h264_pred_weigths->chroma_log2_weight_denom > 7)
> +			return -EINVAL;
>  		break;
>  
>  	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
>  		p_h264_slice_params = p;
>  
> +		if (p_h264_slice_params->colour_plane_id > 2)
> +			return -EINVAL;
> +		if (p_h264_slice_params->cabac_init_idc > 2)
> +			return -EINVAL;
> +		if (p_h264_slice_params->disable_deblocking_filter_idc > 2)
> +			return -EINVAL;
> +		if (p_h264_slice_params->slice_alpha_c0_offset_div2 < -6 ||
> +		    p_h264_slice_params->slice_alpha_c0_offset_div2 > 6)
> +			return -EINVAL;
> +		if (p_h264_slice_params->slice_beta_offset_div2 < -6 ||
> +		    p_h264_slice_params->slice_beta_offset_div2 > 6)
> +			return -EINVAL;
>  		zero_reserved(*p_h264_slice_params);
>  		break;
>  
>  	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
>  		p_h264_dec_params = p;
>  
> +		if (p_h264_dec_params->nal_ref_idc > 3)
> +			return -EINVAL;
>  		for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
>  			struct v4l2_h264_dpb_entry *dpb_entry =
>  				&p_h264_dec_params->dpb[i];
> 

General question: I don't see anything in std_init_compound() for these
controls. Is initializing these compound controls to 0 enough to make them
pass std_validate_compound()? It probably is, otherwise you'd see errors
in the compliance test, I guess.

Regards,

	Hans
