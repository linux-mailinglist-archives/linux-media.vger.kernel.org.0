Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC9A2C3D07
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 10:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgKYJwk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 04:52:40 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:58501 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725837AbgKYJwk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 04:52:40 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id hrTUkId71N7XghrTXkVfKr; Wed, 25 Nov 2020 10:52:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606297956; bh=rkinYp2aPlLDRuZB8efPy+co5I1trOJ7w1SXgznaBNA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NNs8H3XKTdKdCJa3Bp1xjb6HEWrNep42snEMOl33GBz/rz2A+7axAcHmJmoilX3ua
         PHbbtSDkIWsq19ozcxdCCZnw7hDv1PrNGLuib56i4gPVhN22wxzToqAuOZV8op4TS+
         i3ecl/0oS9DBnfj20XHZYcq9WVPkX3bDajBntg0KUyrYWUAYgNh5scakCQND5IYgKt
         7nmsoP8Hd3mkc0C78dzAsZXPy9i3JabASCl6DMrxTsVFT17Wy6ulGSisi2jlgj5qpo
         TaTGTuQ0A1MprTVOID0mGqXUoKQWX9CoslonSrhooBG5gyqD+vUNcQ1I9yFJinoaX0
         96FHeb2wIEzWA==
Subject: Re: [PATCH v4 07/13] media: controls: Validate H264 stateless
 controls
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20201123144000.81310-1-ezequiel@collabora.com>
 <20201123144000.81310-8-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b072a392-d127-21fe-6357-5e7ed82a2aaa@xs4all.nl>
Date:   Wed, 25 Nov 2020 10:52:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201123144000.81310-8-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAIByOm52jy1evmJ1TjUW1Bqv/IMbqHoPK0K0OHVef0DviU8Y9EWfkfu2diBn55JzpyrHZ5O3+g2FSy0D0VuHhDKsAc92ZU9n3VRsMLAe1ql2tvgcim3
 CJUNV7RR0c3MlwHkSDvhRv876qXKbzD0g6koW0IKr0VFG27cUSThokWbafmikcPPK23a3vfyeWywDaovFAud9uB3w2RlBTzK6Wmjy3szqQfiU1AWgUikG5Hy
 7LVNtcHLglYJF+03kxc3ssT9HiKXqNACnheFYg7iW/EpcMll85cHUERqSihaj0ulbxKN7xncT9ICOYMz9uyOVzAZ2T650Tp1Yx4aq/yYeJtJv7EzaKlSv+Bc
 Fk4hCatMT+zRibHc/pY/puyzYHjPt2bDlRThMhmWPaZowh2tPiTLS+hPPa4LRIffl7FTkGGdmx3ANHzUS+ctdib4qQOUVvCCGc7+lhywa648HdhtLM4vYhCb
 /SrnF7RPe3GgCyUYFO5jIknaXSw+LMq//7LoH1jY9gXqI1XxPBuAfxNBU3M=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/11/2020 15:39, Ezequiel Garcia wrote:
> Check that all the fields that correspond or are related
> to a H264 specification syntax element have legal values.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 128 +++++++++++++++++++++++++++
>  include/media/h264-ctrls.h           |   9 ++
>  2 files changed, 137 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 88ad475bd716..7b4f5ca91b86 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1775,6 +1775,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  {
>  	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
>  	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
> +	struct v4l2_ctrl_h264_sps *p_h264_sps;
> +	struct v4l2_ctrl_h264_pps *p_h264_pps;
> +	struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weights;
>  	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
>  	struct v4l2_ctrl_h264_decode_params *p_h264_dec_params;
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
> @@ -1834,20 +1837,145 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		break;
>  
>  	case V4L2_CTRL_TYPE_H264_SPS:
> +		p_h264_sps = p;
> +
> +		/* Some syntax elements are only conditionally valid */
> +		if (p_h264_sps->pic_order_cnt_type != 0) {
> +			p_h264_sps->log2_max_pic_order_cnt_lsb_minus4 = 0;
> +		} else if (p_h264_sps->pic_order_cnt_type != 1) {
> +			p_h264_sps->num_ref_frames_in_pic_order_cnt_cycle = 0;
> +			p_h264_sps->offset_for_non_ref_pic = 0;
> +			p_h264_sps->offset_for_top_to_bottom_field = 0;
> +			memset(&p_h264_sps->offset_for_ref_frame, 0,
> +			       sizeof(p_h264_sps->offset_for_ref_frame));
> +		}
> +
> +		if (!V4L2_H264_SPS_HAS_CHROMA_FORMAT(p_h264_sps)) {
> +			p_h264_sps->chroma_format_idc = 1;
> +			p_h264_sps->bit_depth_luma_minus8 = 0;
> +			p_h264_sps->bit_depth_chroma_minus8 = 0;
> +
> +			p_h264_sps->flags &=
> +				~V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS;
> +
> +			if (p_h264_sps->chroma_format_idc < 3)
> +				p_h264_sps->flags &=
> +					~V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE;
> +		}
> +
> +		if (p_h264_sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY)
> +			p_h264_sps->flags &=
> +				~V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD;
> +
> +		/* Only monochrome and 4:2:0 allowed for these profiles */
> +		if (p_h264_sps->profile_idc < V4L2_H264_PROFILE_IDC_HIGH_422 &&
> +		    p_h264_sps->chroma_format_idc > 1)
> +			return -EINVAL;
> +		/* 4:2:2 allowed */
> +		if (p_h264_sps->profile_idc < V4L2_H264_PROFILE_IDC_HIGH_444 &&
> +		    p_h264_sps->chroma_format_idc > 2)
> +			return -EINVAL;
> +		if (p_h264_sps->chroma_format_idc > 3)
> +			return -EINVAL;
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
> +		p_h264_pred_weights = p;
> +
> +		if (p_h264_pred_weights->luma_log2_weight_denom > 7)
> +			return -EINVAL;
> +		if (p_h264_pred_weights->chroma_log2_weight_denom > 7)
> +			return -EINVAL;
>  		break;
>  
>  	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
>  		p_h264_slice_params = p;
>  
> +		if (p_h264_slice_params->slice_type != V4L2_H264_SLICE_TYPE_B)
> +			p_h264_slice_params->flags &=
> +				~V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED;
> +
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
> +
> +		if (p_h264_slice_params->slice_type == V4L2_H264_SLICE_TYPE_I ||
> +		    p_h264_slice_params->slice_type == V4L2_H264_SLICE_TYPE_SI)
> +			p_h264_slice_params->num_ref_idx_l0_active_minus1 = 0;
> +		if (p_h264_slice_params->slice_type != V4L2_H264_SLICE_TYPE_B)
> +			p_h264_slice_params->num_ref_idx_l1_active_minus1 = 0;
> +
> +		if (p_h264_slice_params->num_ref_idx_l0_active_minus1 >
> +		    (V4L2_H264_REF_LIST_LEN - 1))
> +			return -EINVAL;
> +		if (p_h264_slice_params->num_ref_idx_l1_active_minus1 >
> +		    (V4L2_H264_REF_LIST_LEN - 1))
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
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index e14307f1a77c..0bd253031ab5 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -105,6 +105,15 @@ enum v4l2_mpeg_video_h264_start_code {
>  #define V4L2_H264_PROFILE_IDC_HIGH_422                          122
>  #define V4L2_H264_PROFILE_IDC_HIGH_444                          244
>  
> +#define V4L2_H264_SPS_HAS_CHROMA_FORMAT(sps) \
> +	((sps)->profile_idc == 100 || (sps)->profile_idc == 110 || \
> +	 (sps)->profile_idc == 122 || (sps)->profile_idc == 244 || \
> +	 (sps)->profile_idc == 44  || (sps)->profile_idc == 83  || \
> +	 (sps)->profile_idc == 86  || (sps)->profile_idc == 118 || \
> +	 (sps)->profile_idc == 128 || (sps)->profile_idc == 138 || \
> +	 (sps)->profile_idc == 139 || (sps)->profile_idc == 134 || \
> +	 (sps)->profile_idc == 135)

In the previous patch you added V4L2_H264_PROFILE_IDC_ defines, but they
are not used in this define. It's a bit odd.

Regards,

	Hans

> +
>  /**
>   * struct v4l2_ctrl_h264_sps - H264 sequence parameter set
>   *
> 

