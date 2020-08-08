Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4E223F8E3
	for <lists+linux-media@lfdr.de>; Sat,  8 Aug 2020 23:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgHHVBc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Aug 2020 17:01:32 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:6214 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgHHVBc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Aug 2020 17:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=7ckVhzc9/VfGq+rMsDYb3pgmy8y9xne4ILOjK9rcAQ8=;
        b=DVpS7vF4Kc7FNLDyB04imDa9Zx55BzS1S6jk0/JF71/Wu3Asv+0yz1MsF5i726APSXMh
        tbfHz+fICU72+90DymFjmBN9NtUeJR5oS2SxauFg/medB8BT6PR+lm8NC9bJF8PoNBZp3k
        74OM3cbCL+aVYZwCfm6kq2u2lbuI1XgQQ=
Received: by filterdrecv-p3mdw1-7ff865655c-82wvk with SMTP id filterdrecv-p3mdw1-7ff865655c-82wvk-19-5F2F12AA-8
        2020-08-08 21:01:30.152069925 +0000 UTC m=+873909.987941538
Received: from [192.168.1.14] (unknown)
        by ismtpd0005p1lon1.sendgrid.net (SG) with ESMTP
        id F6xr0lzWTyGW67QhDNBbLg
        Sat, 08 Aug 2020 21:01:29.887 +0000 (UTC)
Subject: Re: [PATCH v2 03/14] media: uapi: h264: Split prediction weight
 parameters
References: <20200806151310.98624-1-ezequiel@collabora.com>
 <20200806151310.98624-4-ezequiel@collabora.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <ae2ac4ba-9272-ec67-d075-3429bc8926c3@kwiboo.se>
Date:   Sat, 08 Aug 2020 21:01:30 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806151310.98624-4-ezequiel@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h4O5Tr8bai3K3JVH3?=
 =?us-ascii?Q?eNDC7XU+slOR+Usg5leeJmvM3cOjJLzXf=2FmKarl?=
 =?us-ascii?Q?8gGn07et2rWh8S+nE8JaQQ2AJ5NosyEWbhVL9+Q?=
 =?us-ascii?Q?6OhHWAnsKhYal=2FGQTDJaQOioRfbvJKd93GkBQ1g?=
 =?us-ascii?Q?ddufLTFljVvY=2FOsLYAXCC8hZC1lOYCaL0xpic51?=
 =?us-ascii?Q?K=2FpEf+1qIpAs2zMA5SFmg=3D=3D?=
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Content-Type: text/plain; charset=us-ascii
Content-Language: sv
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-08-06 17:12, Ezequiel Garcia wrote:
> The prediction weight parameters are only required under
> certain conditions, which depend on slice header parameters.
> 
> As specified in section 7.3.3 Slice header syntax, the prediction
> weight table is present if:
> 
> ((weighted_pred_flag && (slice_type == P || slice_type == SP)) || \
> (weighted_bipred_idc == 1 && slice_type == B))

Maybe a macro can be added to help check this contition?

Something like this maybe:

#define V4L2_H264_CTRL_PRED_WEIGHTS_REQUIRED(pps, slice) \
	((((pps)->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED) && \
	 ((slice)->slice_type == V4L2_H264_SLICE_TYPE_P || \
	   (slice)->slice_type == V4L2_H264_SLICE_TYPE_SP)) || \
	 ((pps)->weighted_bipred_idc == 1 && \
	  (slice)->slice_type == V4L2_H264_SLICE_TYPE_B))

> 
> Given its size, it makes sense to move this table to its control,
> so applications can avoid passing it if the slice doesn't specify it.
> 
> Before this change struct v4l2_ctrl_h264_slice_params was 960 bytes.
> With this change, it's 188 bytes and struct v4l2_ctrl_h264_pred_weight
> is 772 bytes.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> v2: Fix missing Cedrus changes and mssing control declaration,
>     as noted by Hans and Jernej.
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 19 ++++++++++++-------
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  8 ++++++++
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  7 +++++++
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 ++
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 ++----
>  include/media/h264-ctrls.h                    |  5 +++--
>  include/media/v4l2-ctrls.h                    |  2 ++
>  8 files changed, 37 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index d1438b1e259f..c36ce5a95fc5 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1879,18 +1879,23 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - 0x00000008
>        -
>  
> -``Prediction Weight Table``
> +``V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS (struct)``
> +    Prediction weight table defined according to :ref:`h264`,
> +    section 7.4.3.2 "Prediction Weight Table Semantics".
> +    The prediction weight table must be passed by applications
> +    under the conditions explained in section 7.3.3 "Slice header
> +    syntax".
>  
> -    The bitstream parameters are defined according to :ref:`h264`,
> -    section 7.4.3.2 "Prediction Weight Table Semantics". For further
> -    documentation, refer to the above specification, unless there is
> -    an explicit comment stating otherwise.
> +    .. note::
> +
> +       This compound control is not yet part of the public kernel API and
> +       it is expected to change.
>  
> -.. c:type:: v4l2_h264_pred_weight_table
> +.. c:type:: v4l2_ctrl_h264_pred_weights
>  
>  .. cssclass:: longtable
>  
> -.. flat-table:: struct v4l2_h264_pred_weight_table
> +.. flat-table:: struct v4l2_ctrl_h264_pred_weights
>      :header-rows:  0
>      :stub-columns: 0
>      :widths:       1 1 2
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 3f3fbcd60cc6..76c8dc8fb31c 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -897,6 +897,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
>  	case V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE:		return "H264 Decode Mode";
>  	case V4L2_CID_MPEG_VIDEO_H264_START_CODE:		return "H264 Start Code";
> +	case V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS:		return "H264 Prediction Weight Table";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
> @@ -1412,6 +1413,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:
>  		*type = V4L2_CTRL_TYPE_H264_DECODE_PARAMS;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS:
> +		*type = V4L2_CTRL_TYPE_H264_PRED_WEIGHTS;
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
>  		*type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
>  		break;
> @@ -1790,6 +1794,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	case V4L2_CTRL_TYPE_H264_SPS:
>  	case V4L2_CTRL_TYPE_H264_PPS:
>  	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
> +	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
>  	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
>  	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
>  		break;
> @@ -2553,6 +2558,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
>  		elem_size = sizeof(struct v4l2_ctrl_h264_decode_params);
>  		break;
> +	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
> +		elem_size = sizeof(struct v4l2_ctrl_h264_pred_weights);
> +		break;
>  	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
>  		elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
>  		break;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
> index bc27f9430eeb..027cdd1be5a0 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -78,6 +78,13 @@ static const struct cedrus_control cedrus_controls[] = {
>  		.codec		= CEDRUS_CODEC_H264,
>  		.required	= true,
>  	},
> +	{
> +		.cfg = {
> +			.id	= V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS,
> +		},
> +		.codec		= CEDRUS_CODEC_H264,
> +		.required	= true,

This should probably be false if this control is to be optional as implied
by the commit message.

Best regards,
Jonas

> +	},
>  	{
>  		.cfg = {
>  			.id	= V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
> index 96765555ab8a..93c843ae14bb 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -62,6 +62,7 @@ struct cedrus_h264_run {
>  	const struct v4l2_ctrl_h264_scaling_matrix	*scaling_matrix;
>  	const struct v4l2_ctrl_h264_slice_params	*slice_params;
>  	const struct v4l2_ctrl_h264_sps			*sps;
> +	const struct v4l2_ctrl_h264_pred_weights	*pred_weights;
>  };
>  
>  struct cedrus_mpeg2_run {
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> index 58c48e4fdfe9..6385026d1b6b 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> @@ -57,6 +57,8 @@ void cedrus_device_run(void *priv)
>  			V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS);
>  		run.h264.sps = cedrus_find_control_data(ctx,
>  			V4L2_CID_MPEG_VIDEO_H264_SPS);
> +		run.h264.pred_weights = cedrus_find_control_data(ctx,
> +			V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS);
>  		break;
>  
>  	case V4L2_PIX_FMT_HEVC_SLICE:
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index cce527bbdf86..a9ba78b15907 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -256,10 +256,8 @@ static void cedrus_write_scaling_lists(struct cedrus_ctx *ctx,
>  static void cedrus_write_pred_weight_table(struct cedrus_ctx *ctx,
>  					   struct cedrus_run *run)
>  {
> -	const struct v4l2_ctrl_h264_slice_params *slice =
> -		run->h264.slice_params;
> -	const struct v4l2_h264_pred_weight_table *pred_weight =
> -		&slice->pred_weight_table;
> +	const struct v4l2_ctrl_h264_pred_weights *pred_weight =
> +		run->h264.pred_weights;
>  	struct cedrus_dev *dev = ctx->dev;
>  	int i, j, k;
>  
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index 4c0bb7f5fb05..54cd9bec0b23 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -36,6 +36,7 @@
>  #define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_MPEG_BASE+1004)
>  #define V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE	(V4L2_CID_MPEG_BASE+1005)
>  #define V4L2_CID_MPEG_VIDEO_H264_START_CODE	(V4L2_CID_MPEG_BASE+1006)
> +#define V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS	(V4L2_CID_MPEG_BASE+1007)
>  
>  /* enum v4l2_ctrl_type type values */
>  #define V4L2_CTRL_TYPE_H264_SPS			0x0110
> @@ -43,6 +44,7 @@
>  #define V4L2_CTRL_TYPE_H264_SCALING_MATRIX	0x0112
>  #define V4L2_CTRL_TYPE_H264_SLICE_PARAMS	0x0113
>  #define V4L2_CTRL_TYPE_H264_DECODE_PARAMS	0x0114
> +#define V4L2_CTRL_TYPE_H264_PRED_WEIGHTS	0x0115
>  
>  enum v4l2_mpeg_video_h264_decode_mode {
>  	V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
> @@ -125,7 +127,7 @@ struct v4l2_h264_weight_factors {
>  	__s16 chroma_offset[32][2];
>  };
>  
> -struct v4l2_h264_pred_weight_table {
> +struct v4l2_ctrl_h264_pred_weights {
>  	__u16 luma_log2_weight_denom;
>  	__u16 chroma_log2_weight_denom;
>  	struct v4l2_h264_weight_factors weight_factors[2];
> @@ -177,7 +179,6 @@ struct v4l2_ctrl_h264_slice_params {
>  	__s32 delta_pic_order_cnt0;
>  	__s32 delta_pic_order_cnt1;
>  
> -	struct v4l2_h264_pred_weight_table pred_weight_table;
>  	/* Size in bits of dec_ref_pic_marking() syntax element. */
>  	__u32 dec_ref_pic_marking_bit_size;
>  	/* Size in bits of pic order count syntax. */
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index f40e2cbb21d3..cb25f345e9ad 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -51,6 +51,7 @@ struct video_device;
>   * @p_h264_scaling_matrix:	Pointer to a struct v4l2_ctrl_h264_scaling_matrix.
>   * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params.
>   * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
> + * @p_h264_pred_weights:	Pointer to a struct v4l2_ctrl_h264_pred_weights.
>   * @p_vp8_frame_header:		Pointer to a VP8 frame header structure.
>   * @p_hevc_sps:			Pointer to an HEVC sequence parameter set structure.
>   * @p_hevc_pps:			Pointer to an HEVC picture parameter set structure.
> @@ -74,6 +75,7 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
>  	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
>  	struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
> +	struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weights;
>  	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
> 
