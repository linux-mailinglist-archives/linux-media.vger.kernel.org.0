Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C15F989AF8
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 12:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbfHLKL7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 06:11:59 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:53979 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727323AbfHLKL6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 06:11:58 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x7InhPofuur8Tx7IrhhqfU; Mon, 12 Aug 2019 12:11:56 +0200
Subject: Re: [PATCH v4 04/11] media: uapi: h264: Add the concept of start code
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
 <20190808103432.12062-5-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a729d241-6550-c23a-4f75-f106ab1c7ff9@xs4all.nl>
Date:   Mon, 12 Aug 2019 12:11:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190808103432.12062-5-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDoPf/404e2Omyd+CfJk4yviftoCzNBRkVme7c74kGwyvxDOIMzAHj8E8MMNIoV/aHmm2NOUJtG9nBtN0tMz8RfB2zJFVY5BYAvggT5lxe/Zwdz4NOqH
 OAvw1xr74y/BfYTZoq3M237ie4Mc91QHqpLGLj/DorGdNy3APQvEoGckSAe7XuR0YZvHlNjBJogyP3AtSAGjNtEv18CBAs6+2+C8fvTZmYCnpPwIS2MVDzfX
 2ZZrn+O0XsEsZAjZCyaihE3nBbw/wik6t8NLVpc/td2YXjMs9+PYEEETYIHLgaVbv2Im/kd/qLMCXecGRr+ZvQcxPayyBtBNctLM0ScfkacxXAYjvlfvStE/
 Jil6SbSz9lscSxIqzGdBxYaivmsChUUXWLm+IhDgZrwQ3ucfIJc5ub9MRdWR9gqLxKhonpcHlpu7A0lijXerK78gpgXw1kYuhDz0yGE2zuopUiCDoS2fhKeR
 phhxAO4SJEFzfe8X5o82zyWFzxKGoH8+zVJw+Vi/0lddIlCS8OSrtgRTephn71CZbKvOofFrZUwiE+jRhjYuEQ7aPs1iOUReTbc+R0QUEBMVM/a8ciEUCvVx
 FGCXegGjVEM32DuckZtEzdMjkZwaWez9eStQJe7pL25pWN4DUwpAZ4Cz9rYF8pD7uZs=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/8/19 12:34 PM, Ezequiel Garcia wrote:
> Stateless decoders have different expectations about the
> start code that is prepended on H264 slices. Add a
> menu control to express the supported start code types
> (including no start code).
> 
> Drivers are allowed to support only one start code type,
> but they can support both too.
> 
> Note that this is independent of the H264 decoding mode,
> which specifies the granularity of the decoding operations.
> Either in frame-based or slice-based mode, this new control
> will allow to define the start code expected on H264 slices.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> Changes in v4:
> * New patch.
> ---
>  .../media/uapi/v4l/ext-ctrls-codec.rst        | 31 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++++
>  include/media/h264-ctrls.h                    |  6 ++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> index ea0455957149..94fd3a9b8b9e 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -2062,6 +2062,37 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>          The OUTPUT buffer should contain all slices needed to decode the
>          frame/field.
>  
> +``V4L2_CID_MPEG_VIDEO_H264_STARTCODE (enum)``
> +    Specifies the H264 slice start code expected for each slice.
> +    This control shall e used to complement V4L2_PIX_FMT_H264_SLICE

e -> be

> +    pixel format. Drivers may expose a single or multiple
> +    start codes, depending on what they can support.
> +
> +    .. note::
> +
> +       This menu control is not yet part of the public kernel API and
> +       it is expected to change.
> +
> +.. c:type:: v4l2_mpeg_video_h264_startcode
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_MPEG_VIDEO_H264_NO_STARTCODE``
> +      - 0
> +      - Selecting this value specifies that H264 slices are passed
> +        to the driver without any start code.
> +        Bla.

Bla?

> +    * - ``V4L2_MPEG_VIDEO_H264_ANNEX_B_STARTCODE``
> +      - 1
> +      - Selecting this value specifies that H264 slices are expected
> +        to be prefixed by Annex B start codes. According to :ref:`h264`
> +        valid start codes can be 3-bytes 0x000001, or 4-bytes 0x00000001.
> +

I had the impression that it is more common to require startcodes. If that's
indeed the case, shouldn't this have value 0 instead of 1?

>  .. _v4l2-mpeg-mpeg2:
>  
>  ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS (struct)``
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index c3194299bfac..01fddb4ec640 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -407,6 +407,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		"Frame-Based",
>  		NULL,
>  	};
> +	static const char * const h264_start_code[] = {
> +		"No Start Code",
> +		"Annex B Start Code",
> +		NULL,
> +	};
>  	static const char * const mpeg_mpeg2_level[] = {
>  		"Low",
>  		"Main",
> @@ -640,6 +645,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		return h264_fmo_map_type;
>  	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:
>  		return h264_decoding_mode;
> +	case V4L2_CID_MPEG_VIDEO_H264_STARTCODE:
> +		return h264_start_code;
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
>  		return mpeg_mpeg2_level;
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
> @@ -860,6 +867,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
>  	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
>  	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:		return "H264 Decoding Mode";
> +	case V4L2_CID_MPEG_VIDEO_H264_STARTCODE:		return "H264 Start Code";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
> @@ -1229,6 +1237,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
>  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
>  	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:
> +	case V4L2_CID_MPEG_VIDEO_H264_STARTCODE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index e6c510877f67..31555c99f64a 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -27,6 +27,7 @@
>  #define V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS	(V4L2_CID_MPEG_BASE+1003)
>  #define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_MPEG_BASE+1004)
>  #define V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE	(V4L2_CID_MPEG_BASE+1005)
> +#define V4L2_CID_MPEG_VIDEO_H264_STARTCODE	(V4L2_CID_MPEG_BASE+1006)
>  
>  /* enum v4l2_ctrl_type type values */
>  #define V4L2_CTRL_TYPE_H264_SPS			0x0110
> @@ -41,6 +42,11 @@ enum v4l2_mpeg_video_h264_decoding_mode {
>  	V4L2_MPEG_VIDEO_H264_FRAME_BASED_DECODING,
>  };
>  
> +enum v4l2_mpeg_video_h264_start_code {
> +	V4L2_MPEG_VIDEO_H264_NO_STARTCODE,
> +	V4L2_MPEG_VIDEO_H264_ANNEX_B_STARTCODE,
> +};
> +
>  #define V4L2_H264_SPS_CONSTRAINT_SET0_FLAG			0x01
>  #define V4L2_H264_SPS_CONSTRAINT_SET1_FLAG			0x02
>  #define V4L2_H264_SPS_CONSTRAINT_SET2_FLAG			0x04
> 

Regards,

	Hans
