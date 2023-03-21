Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7AD46C3315
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 14:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbjCUNkJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 09:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjCUNkI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 09:40:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94DD4C24
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 06:40:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8C97BB81665
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 13:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9916FC433EF;
        Tue, 21 Mar 2023 13:40:01 +0000 (UTC)
Message-ID: <e0410a7a-250c-851b-147f-a93652e0a131@xs4all.nl>
Date:   Tue, 21 Mar 2023 14:39:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC 1/2] media: uapi: Add VP8 stateless encoder controls
Content-Language: en-US
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com
References: <20230309125651.23911-1-andrzej.p@collabora.com>
 <20230309125651.23911-2-andrzej.p@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230309125651.23911-2-andrzej.p@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrzej,

On 09/03/2023 13:56, Andrzej Pietrasiewicz wrote:
> Add uAPI for stateless VP8 encoders.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 16 ++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c |  5 ++
>  include/media/v4l2-ctrls.h                |  1 +
>  include/uapi/linux/v4l2-controls.h        | 91 +++++++++++++++++++++++
>  include/uapi/linux/videodev2.h            |  3 +
>  5 files changed, 116 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 29169170880a..5055e75d37bb 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -335,6 +335,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>  	case V4L2_CTRL_TYPE_VP9_FRAME:
>  		pr_cont("VP9_FRAME");
>  		break;
> +	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
> +		pr_cont("VP8_ENCODE_PARAMS");
> +		break;
>  	case V4L2_CTRL_TYPE_HEVC_SPS:
>  		pr_cont("HEVC_SPS");
>  		break;
> @@ -568,6 +571,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>  	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> +	struct v4l2_ctrl_vp8_encode_params *p_vp8_encode_params;
>  	struct v4l2_area *area;
>  	void *p = ptr.p + idx * ctrl->elem_size;
>  	unsigned int i;
> @@ -918,6 +922,15 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  			return -EINVAL;
>  		break;
>  
> +	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
> +		p_vp8_encode_params = p;
> +		if (p_vp8_encode_params->loop_filter_level > 63)
> +			return -EINVAL;
> +
> +		if (p_vp8_encode_params->sharpness_level > 7)
> +			return -EINVAL;
> +		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1602,6 +1615,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_VP9_FRAME:
>  		elem_size = sizeof(struct v4l2_ctrl_vp9_frame);
>  		break;
> +	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
> +		elem_size = sizeof(struct v4l2_ctrl_vp8_encode_params);
> +		break;
>  	case V4L2_CTRL_TYPE_AREA:
>  		elem_size = sizeof(struct v4l2_area);
>  		break;
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 564fedee2c88..935bd9a07bad 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1182,6 +1182,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:		return "MPEG-2 Quantisation Matrices";
>  	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:	return "VP9 Probabilities Updates";
>  	case V4L2_CID_STATELESS_VP9_FRAME:			return "VP9 Frame Decode Parameters";
> +	case V4L2_CID_STATELESS_VP8_ENCODE_PARAMS:		return "VP8 Encode Parameters";
> +	case V4L2_CID_STATELESS_VP8_ENCODE_QP:			return "VP8 Encode QP";
>  	case V4L2_CID_STATELESS_HEVC_SPS:			return "HEVC Sequence Parameter Set";
>  	case V4L2_CID_STATELESS_HEVC_PPS:			return "HEVC Picture Parameter Set";
>  	case V4L2_CID_STATELESS_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
> @@ -1531,6 +1533,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_STATELESS_VP9_FRAME:
>  		*type = V4L2_CTRL_TYPE_VP9_FRAME;
>  		break;
> +	case V4L2_CID_STATELESS_VP8_ENCODE_PARAMS:
> +		*type = V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS;
> +		break;

Why isn't V4L2_CID_STATELESS_VP8_ENCODE_QP added here as well? I assume it is of
type INTEGER?

I also wonder if VP9 would have the same control, so that this could be called
V4L2_CID_STATELESS_VPX_ENCODE_QP. On the other hand, that might be overkill.

Regards,

	Hans

>  	case V4L2_CID_UNIT_CELL_SIZE:
>  		*type = V4L2_CTRL_TYPE_AREA;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index e59d9a234631..2c4d5d293872 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -81,6 +81,7 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
>  	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_area *p_area;
> +	struct v4l2_ctrl_vp8_encode_params *p_vp8_encode_params;
>  	void *p;
>  	const void *p_const;
>  };
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index b73a8ba7df6c..8b4795a601a5 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -2750,6 +2750,97 @@ struct v4l2_ctrl_vp9_compressed_hdr {
>  	struct v4l2_vp9_mv_probs mv;
>  };
>  
> +#define V4L2_CID_STATELESS_VP8_ENCODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 501)
> +
> +#define V4L2_VP8_FRAME_FLAG_SHOWFRAME			0x1
> +#define V4L2_VP8_FRAME_FLAG_GOLDEN_REFRESH		0x2
> +#define V4L2_VP8_FRAME_FLAG_ALTREF_REFRESH		0x4
> +#define V4L2_VP8_FRAME_FLAG_SEGMENT_ENABLED		0x8
> +#define V4L2_VP8_FRAME_FLAG_LOOP_FILTER_ADJ_ENABLED	0x10
> +#define V4L2_VP8_FRAME_FLAG_REFRESH_ENTROPY_PROBS	0x20
> +
> +#define V4L2_VP8_FRAME_TYPE_KEYFRAME	0
> +#define V4L2_VP8_FRAME_TYPE_INTER	1
> +
> +#define V4L2_VP8_FRAME_COLOR_SPACE_YUV		0
> +#define V4L2_VP8_FRAME_COLOR_SPACE_RESERVED	1
> +
> +#define V4L2_VP8_FRAME_CLAMPING_REQUIRED	0
> +#define V4L2_VP8_FRAME_CLAMPING_NO		1
> +
> +#define V4L2_VP8_FRAME_FILTER_TYPE_NORMAL	0
> +#define V4L2_VP8_FRAME_FILTER_TYPE_SIMPLE	1
> +
> +#define V4L2_VP8_FRAME_NBR_DCT_PARTITIONS_1	0
> +#define V4L2_VP8_FRAME_NBR_DCT_PARTITIONS_2	1
> +#define V4L2_VP8_FRAME_NBR_DCT_PARTITIONS_4	2
> +#define V4L2_VP8_FRAME_NBR_DCT_PARTITIONS_8	3
> +
> +#define V4L2_VP8_FRAME_GOLDEN_KEEP		0
> +#define V4L2_VP8_FRAME_GOLDEN_LASTFRAME		1
> +#define V4L2_VP8_FRAME_GOLDEN_ALTREF		2
> +
> +#define V4L2_VP8_FRAME_ALTREF_KEEP		0
> +#define V4L2_VP8_FRAME_ALTREF_LASTFRAME		1
> +#define V4L2_VP8_FRAME_ALTREF_GOLDEN		2
> +
> +#define V4L2_VP8_FRAME_REF_LAST		0
> +#define V4L2_VP8_FRAME_REF_GOLDEN	1
> +#define V4L2_VP8_FRAME_REF_ALT		2
> +
> +/**
> + * struct v4l2_ctrl_vp8_encode_params - VP8 encode parameters
> + * @flags: combination of V4L2_VP8_FRAME_FLAG_{} flags.
> + * @frame_type: specifies the frame type (key or inter).
> + *		Set to one of V4L2_VP8_FRAME_TYPE_{}.
> + * @color_space: defines the YUV color space of the sequence.
> + *		 V4L2_VP8_FRAME_TYPE_INTER frames shall set this field to zero.
> + *		 Set to one of V4L2_VP8_FRAME_COLOR_SPACE_{}.
> + * @clamping_type: defines pixel value clamping type.
> + *		   V4L2_VP8_FRAME_TYPE_INTER frames shall set this field to zero.
> + *		   Set to one of V4L2_VP8_FRAME_CLAMPING_{}.
> + * @loop_filter_type: selects the type of loop filter applied.
> + *		      Set to one of V4L2_VP8_FRAME_FILTER_TYPE_{}.
> + * @loop_filter_level: sets the strength of the applied loop filter.
> + *		       Set to a value from the rage 0..63.
> + * @sharpness_level: sets the sharpness of the applied loop filter.
> + *		     Set to a value from the range 0..7.
> + * @log2_nbr_of_dct_partitions: determines the number of separate partitions
> + *				containing the DCT coefficients of macroblocks.
> + *				Set to one of V4L2_VP8_FRAME_NBR_DCT_PARTITIONS_{}.
> + * @prob_intra: indicates the probability of an intra macroblock.
> + *		Set to a value from the range 0..255.
> + * @prob_last: indicates the probability that the last reference frame is used for inter-prediction.
> + *	       Set to a value from the range 0..255.
> + * @prob_gf: indicates the probability that the golden reference frame is used for inter-prediction.
> + *	     Set to a value from the range 0..255.
> + * @copy_buffer_to_golden: specifies the golden frame refresh strategy.
> + *			   Set to one of V4L2_VP8_FRAME_FLAG_GOLDEN_{}.
> + * @copy_buffer_to_alternate: specifies the atlref frame refresh strategy.
> + *			      Set to one of V4L2_VP8_FRAME_FLAG_ALTREF_{}.
> + * @reference_type: specifies what kind of reference to use for current inter frame.
> + *		    V4L2_VP8_FRAME_TYPE_KEYFRAME shall set this field to zero.
> + *		    Set to one of V4L2_VP8_FRAME_REF_{}.
> + */
> +struct v4l2_ctrl_vp8_encode_params {
> +	__u32 flags;
> +	__u8 frame_type;
> +	__u8 color_space;
> +	__u8 clamping_type;
> +	__u8 loop_filter_type;
> +	__u8 loop_filter_level;
> +	__u8 sharpness_level;
> +	__u8 log2_nbr_of_dct_partitions;
> +	__u8 prob_intra;
> +	__u8 prob_last;
> +	__u8 prob_gf;
> +	__u8 copy_buffer_to_golden;
> +	__u8 copy_buffer_to_alternate;
> +	__u8 reference_type;
> +};
> +
> +#define V4L2_CID_STATELESS_VP8_ENCODE_QP	(V4L2_CID_CODEC_STATELESS_BASE + 502)
> +
>  /* MPEG-compression definitions kept for backwards compatibility */
>  #ifndef __KERNEL__
>  #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 1befd181a4cc..71932ceba248 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1804,6 +1804,7 @@ struct v4l2_ext_control {
>  		struct v4l2_ctrl_hevc_slice_params __user *p_hevc_slice_params;
>  		struct v4l2_ctrl_hevc_scaling_matrix __user *p_hevc_scaling_matrix;
>  		struct v4l2_ctrl_hevc_decode_params __user *p_hevc_decode_params;
> +		struct v4l2_ctrl_vp8_encode_params __user *p_vp8_encode_params;
>  		void __user *ptr;
>  	};
>  } __attribute__ ((packed));
> @@ -1877,6 +1878,8 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS	= 0x0272,
>  	V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX	= 0x0273,
>  	V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS	= 0x0274,
> +
> +	V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS	= 0x0280,
>  };
>  
>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */

