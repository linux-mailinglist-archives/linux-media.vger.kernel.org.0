Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB7036616
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 22:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfFEU4A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 16:56:00 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:33923 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfFEUz7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 16:55:59 -0400
Received: from collins (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 59C6D240002;
        Wed,  5 Jun 2019 20:55:51 +0000 (UTC)
Message-ID: <92a38f6e9f7e71cd4758379e9dbcd4c1634473e1.camel@bootlin.com>
Subject: Re: [PATCH RFC 2/6] media: uapi: h264: Add the concept of decoding
 mode
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Wed, 05 Jun 2019 22:55:51 +0200
In-Reply-To: <20190603110946.4952-3-boris.brezillon@collabora.com>
References: <20190603110946.4952-1-boris.brezillon@collabora.com>
         <20190603110946.4952-3-boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le lundi 03 juin 2019 à 13:09 +0200, Boris Brezillon a écrit :
> Some stateless decoders don't support per-slice decoding (or at least
> not in a way that would make them efficient or easy to use).
> Let's expose a menu to control and expose the supported decoding modes.
> Drivers are allowed to support only one decoding but they can support
> both too.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  .../media/uapi/v4l/ext-ctrls-codec.rst        | 42 ++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++
>  include/media/h264-ctrls.h                    | 13 ++++++
>  3 files changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> index 82547d5de250..188f625acb7c 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -1748,6 +1748,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - __u32
>        - ``size``
>        -
> +    * - __u32
> +      - ``start_byte_offset``
> +      - Where the slice payload starts in the output buffer. Useful when
> +        operating in per frame decoding mode and decoding multi-slice content.
> +        In this case, the output buffer will contain more than one slice and
> +        some codecs need to know where each slice starts. Note that this
> +        offsets points to the beginning of the slice which is supposed to
> +        contain an ANNEX B start code

Looks good, maybe add a terminating dot.

>      * - __u32
>        - ``header_bit_size``
>        -
> @@ -1931,7 +1939,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        -
>      * - __u16
>        - ``num_slices``
> -      - Number of slices needed to decode the current frame
> +      - Number of slices needed to decode the current frame/field. When
> +        operating in per-slice decoding mode (see
> +        :c:type:`v4l2_mpeg_video_h264_decoding_mode`), this field
> +        should always be set to one

So maybe we should allow an arbitrary number of slices unless only per-
frame decoding is selected and we need all the slices at once.

>      * - __u16
>        - ``nal_ref_idc``
>        - NAL reference ID value coming from the NAL Unit header
> @@ -2022,6 +2033,35 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - 0x00000004
>        - The DPB entry is a long term reference frame
>  
> +``V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE (enum)``
> +    Specifies the decoding mode to use. Currently exposes per slice and per
> +    frame decoding but new modes might be added later on.

I think it definitey makes sense to have this per-codec.

> +
> +    .. note::
> +
> +       This menu control is not yet part of the public kernel API and
> +       it is expected to change.
> +
> +.. c:type:: v4l2_mpeg_video_h264_decoding_mode
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_MPEG_VIDEO_H264_DECODING_PER_SLICE``
> +      - 0
> +      - The decoding is done per slice. v4l2_ctrl_h264_decode_params->num_slices
> +        must be set to 1 and the output buffer should contain only one slice.

See above about having arbitrary numbers of slices (within frame
boundary).

> +    * - ``V4L2_MPEG_VIDEO_H264_DECODING_PER_FRAME``
> +      - 1
> +      - The decoding is done per frame. v4l2_ctrl_h264_decode_params->num_slices
> +        can be > 1. When that happens, the output buffer should contain all
> +        slices needed to decode a frame/field, each slice being prefixed by an
> +        Annex B NAL header/start-code.

Looks good!

> +
>  .. _v4l2-mpeg-mpeg2:
>  
>  ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS (struct)``
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 1217d38ea394..72bb3c8882f5 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -406,6 +406,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		"Explicit",
>  		NULL,
>  	};
> +	static const char * const h264_decoding_mode[] = {
> +		"Per Slice",
> +		"Per Frame",
> +		NULL,
> +	};
>  	static const char * const mpeg_mpeg2_level[] = {
>  		"Low",
>  		"Main",
> @@ -637,6 +642,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		return h264_fp_arrangement_type;
>  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
>  		return h264_fmo_map_type;
> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:
> +		return h264_decoding_mode;
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
>  		return mpeg_mpeg2_level;
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
> @@ -856,6 +863,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
>  	case V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
>  	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:		return "H264 Decoding Mode";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
> @@ -1224,6 +1232,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
>  	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
>  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index e1404d78d6ff..26de2243f6f5 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -26,6 +26,7 @@
>  #define V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX	(V4L2_CID_MPEG_BASE+1002)
>  #define V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS	(V4L2_CID_MPEG_BASE+1003)
>  #define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_MPEG_BASE+1004)
> +#define V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE	(V4L2_CID_MPEG_BASE+1005)
>  
>  /* enum v4l2_ctrl_type type values */
>  #define V4L2_CTRL_TYPE_H264_SPS			0x0110
> @@ -33,6 +34,12 @@
>  #define V4L2_CTRL_TYPE_H264_SCALING_MATRIX	0x0112
>  #define V4L2_CTRL_TYPE_H264_SLICE_PARAMS	0x0113
>  #define V4L2_CTRL_TYPE_H264_DECODE_PARAMS	0x0114
> +#define V4L2_CTRL_TYPE_H264_DECODING_MODE	0x0115
> +
> +enum v4l2_mpeg_video_h264_decoding_mode {
> +	V4L2_MPEG_VIDEO_H264_DECODING_PER_SLICE,
> +	V4L2_MPEG_VIDEO_H264_DECODING_PER_FRAME,
> +};
>  
>  #define V4L2_H264_SPS_CONSTRAINT_SET0_FLAG			0x01
>  #define V4L2_H264_SPS_CONSTRAINT_SET1_FLAG			0x02
> @@ -111,6 +118,8 @@ struct v4l2_h264_pred_weight_table {
>  	struct v4l2_h264_weight_factors weight_factors[2];
>  };
>  
> +#define V4L2_H264_MAX_SLICES_PER_FRAME			16
> +
>  #define V4L2_H264_SLICE_TYPE_P				0
>  #define V4L2_H264_SLICE_TYPE_B				1
>  #define V4L2_H264_SLICE_TYPE_I				2
> @@ -125,6 +134,10 @@ struct v4l2_h264_pred_weight_table {
>  struct v4l2_ctrl_h264_slice_params {
>  	/* Size in bytes, including header */
>  	__u32 size;
> +
> +	/* Where the slice starts in the output buffer (expressed in bytes). */

Maybe call it "beginning of the slice" or adapt the following comment
to use the same terminology.

Looks good otherwise, thanks!

Cheers,

Paul

> +	__u32 start_byte_offset;
> +
>  	/* Offset in bits to slice_data() from the beginning of this slice. */
>  	__u32 header_bit_size;
>  

