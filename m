Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08E1089B39
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 12:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbfHLKTn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 06:19:43 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:57255 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727409AbfHLKTn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 06:19:43 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x7QOhPs4Rur8Tx7QRhhsK9; Mon, 12 Aug 2019 12:19:40 +0200
Subject: Re: [PATCH v4 03/11] media: uapi: h264: Add the concept of decoding
 mode
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
References: <20190808103432.12062-1-ezequiel@collabora.com>
 <20190808103432.12062-4-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e8895d5f-af65-5ee8-665b-b9d4abd681bc@xs4all.nl>
Date:   Mon, 12 Aug 2019 12:19:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190808103432.12062-4-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJmAHzbMgg/7+RLqkI3O+xpYZSwzmsq8ZwkX+JeU+AMFaD4MsGY5tuB9Ku+bH4yJItNwyfjuIvgP6j08XEhzt1YAr6FjamU6D53IgfjdxksHM4Q6oYnc
 3zemor8qhAUaPCrG69dXKBpeHz9UWqIiE6JRziRK0kTiXDhczLs8+Pq4znwaKQDJsx0zDbUcNqlWIWJC//SCRLlWG18PwNr2UncX9zRflbOQtotWOaDjD4iY
 JdosNhOxy+jEoylptWwSnJosThT35Msn0xQ3EnH+48jk+nMQTJFdezWkzaRcflZgmRgt85ZwD+arbAhqUYT9o0SyrvxCGs/7S4XDOJXgDUhezxy0spt7M6mB
 /HWfUdIJJzrAPsiYRyJAApJXDkqGMoAp3IQnwEPAG+tpbdlrldkwhQmZTqmJoDsG1siD0HLbKlXx8QIE52GPbQzad9kLxyiJqyS8KVfd3e7bwi/lWXj9+spZ
 Uw+hWmsJLaqMv22kp9rSxWXyTDZbBNfIkzAvF03hqfR3iH6+S56tlm8TRclR7I5LyhOHhd4A3HKKvQwAoPIt1qAszJohEsVaH4U6fauGIeKmwnckO9r/pPJE
 tZa2ddhUa7Vjin4Ypmj2s7Tx7TS6yA7BD73pMkHlT9+GSuxqo4JjQ9VbKaKrrWwmwoE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/8/19 12:34 PM, Ezequiel Garcia wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Some stateless decoders don't support per-slice decoding granularity
> (or at least not in a way that would make them efficient or easy to use).
> 
> Expose a menu to control the supported decoding modes. Drivers are
> allowed to support only one decoding but they can support both too.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
> Changes in v4:
> * Typos/rewording fixes
> 
> Changes in v3:
> * s/per-{slice,frame} decoding/{slice,frame}-based decoding/
> * Add Paul's R-b
> 
> Changes in v2:
> * Allow decoding multiple slices in per-slice decoding mode
> * Minor doc improvement/fixes
> ---
>  .../media/uapi/v4l/ext-ctrls-codec.rst        | 43 ++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++
>  include/media/h264-ctrls.h                    | 11 +++++
>  3 files changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> index c5f39dd50043..ea0455957149 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -1747,6 +1747,11 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - __u32
>        - ``size``
>        -
> +    * - __u32
> +      - ``start_byte_offset``
> +      - Where the slice payload starts in the output buffer. Useful when the
> +        OUTPUT buffer contains more than one slice (some codecs need to know
> +        where each slice starts in this buffer).
>      * - __u32
>        - ``header_bit_size``
>        -
> @@ -1930,7 +1935,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        -
>      * - __u16
>        - ``num_slices``
> -      - Number of slices needed to decode the current frame
> +      - Number of slices needed to decode the current frame/field. When
> +        operating in slice-based decoding mode (see
> +        :c:type:`v4l2_mpeg_video_h264_decoding_mode`), this field
> +        should always be set to one.
>      * - __u16
>        - ``nal_ref_idc``
>        - NAL reference ID value coming from the NAL Unit header
> @@ -2021,6 +2029,39 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - 0x00000004
>        - The DPB entry is a long term reference frame
>  
> +``V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE (enum)``
> +    Specifies the decoding mode to use. Currently exposes slice-based and
> +    frame-based decoding but new modes might be added later on.
> +    Drivers may expose a single or multiple decoding modes,
> +    depending on what they can support.

This should mention that this is valid for V4L2_PIX_FMT_H264_SLICE pixelformat
only. And it is a required control (i.e. it must always be present for that
pixelformat). Ditto for the start code control.

Also, the V4L2_PIX_FMT_H264_SLICE should refer to this control and the start
code control as well since these controls effectively are modifiers for the
pixelformat.

Regards,

	Hans

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
> +    * - ``V4L2_MPEG_VIDEO_H264_SLICE_BASED_DECODING``
> +      - 0
> +      - The decoding is done at the slice granularity.
> +        v4l2_ctrl_h264_decode_params->num_slices should be set to 1.
> +        The OUTPUT buffer must contain a single slice.
> +    * - ``V4L2_MPEG_VIDEO_H264_FRAME_BASED_DECODING``
> +      - 1
> +      - The decoding is done at the frame granularity.
> +        v4l2_ctrl_h264_decode_params->num_slices should be set to the number of
> +        slices forming a frame.

Actually, I wonder if there shouldn't be a third option: FIELD_BASED_DECODING
to indicate that the hardware expects the slices of a single field in a buffer
instead of both fields.

Or just stick to FRAME_BASED_DECODING for now but explicitly mention that
in the case of interlaced decoding both fields must be present in the buffer.

A FIELD_BASED_DECODING option can always be added later if necessary.

> +        The OUTPUT buffer should contain all slices needed to decode the
> +        frame/field.
> +
>  .. _v4l2-mpeg-mpeg2:
>  
>  ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS (struct)``
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index cd1ae016706f..c3194299bfac 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -402,6 +402,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		"Explicit",
>  		NULL,
>  	};
> +	static const char * const h264_decoding_mode[] = {
> +		"Slice-Based",
> +		"Frame-Based",
> +		NULL,
> +	};
>  	static const char * const mpeg_mpeg2_level[] = {
>  		"Low",
>  		"Main",
> @@ -633,6 +638,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		return h264_fp_arrangement_type;
>  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
>  		return h264_fmo_map_type;
> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:
> +		return h264_decoding_mode;
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
>  		return mpeg_mpeg2_level;
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
> @@ -852,6 +859,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
>  	case V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
>  	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:		return "H264 Decoding Mode";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
> @@ -1220,6 +1228,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
>  	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
>  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
> +	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index 6160a69c0143..e6c510877f67 100644
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
> +	V4L2_MPEG_VIDEO_H264_SLICE_BASED_DECODING,
> +	V4L2_MPEG_VIDEO_H264_FRAME_BASED_DECODING,
> +};
>  
>  #define V4L2_H264_SPS_CONSTRAINT_SET0_FLAG			0x01
>  #define V4L2_H264_SPS_CONSTRAINT_SET1_FLAG			0x02
> @@ -125,6 +132,10 @@ struct v4l2_h264_pred_weight_table {
>  struct v4l2_ctrl_h264_slice_params {
>  	/* Size in bytes, including header */
>  	__u32 size;
> +
> +	/* Offset in bytes to the start of slice in the OUTPUT buffer. */
> +	__u32 start_byte_offset;
> +
>  	/* Offset in bits to slice_data() from the beginning of this slice. */
>  	__u32 header_bit_size;
>  
> 

Regards,

	Hans
