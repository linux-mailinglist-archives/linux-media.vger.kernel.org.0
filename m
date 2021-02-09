Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B02A314DE1
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 12:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbhBILIM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 06:08:12 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:43913 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232314AbhBILGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 06:06:20 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 9Qpkl3B6m9z9J9QpnloTo8; Tue, 09 Feb 2021 12:05:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612868731; bh=rTk96AFcfGUn5lwbTCQQMfPdWb4QJsgHf6oGPRXSZ1k=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wTuUnk1boLzRLaADfJGbYQ0VVgs7991lt3vYhscgjmbuteIhgUa0uYWAtTQ8qrMQN
         HSnQ5acDZ5Muhrm86vMZnM1RAARvyRw2RCz04TwRxRb0XLgA5fQNfdmvFLO0WrKaKU
         G08ddDZoHIussFOtEXZKjVuucTwofvXe8mkJjdIzLLVoiOsYefRjZ0gqURbf7/WjKG
         j6F9DlLN98ZY/AhyKjn7zkQGK0vb3DXEvcPmw9BMnz+2tGWrGDzSvcbMlsBvhQeQJ9
         nmyvR9+YTfFB8hxonXOjKKONjyoJMeFOAAItZi4QX7CJtm3miG/0AgrqOmG59JPJFm
         lpXxAeh76feFQ==
Subject: Re: [PATCH 1/2] v4l2-ctrl: Add decoder conceal color control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210209094527.2173690-1-stanimir.varbanov@linaro.org>
 <20210209094527.2173690-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <cccae00e-e30e-6691-d954-27379a104115@xs4all.nl>
Date:   Tue, 9 Feb 2021 12:05:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209094527.2173690-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNa8tKldIu4/n90P4g+inBwvTDmVuJlACLrORYsl24Es8lL+1+2zq0f9rxfATa62+W+wcMZSFEiFKHE5JuOEhH2QvdKYAdJPfPDXn7s4iUHY3BUczyHw
 TWLiBSA+A5W6144BqpX6yB4QKAUFHlxjU/eAz8fvnEpRia6hhj6zI+jwLJYg2uX3hXDrosp0Dr8Aj5m6EK8Y/jl1N5E7YCHRwK/+xXosfKniGSRVD9g2k2Iz
 2quz3tsLunorToUydY/p9gAnmKO82rLZRdqMqHAFOBJ21CuT+f/1b9AyQgkYTnlaIEA3jSIWJylFEIY2byiz+bRmTzzsM92vsq9RYcbeshM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/02/2021 10:45, Stanimir Varbanov wrote:
> Add decoder v4l2 control to set conceal color.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 20 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++++++
>  include/uapi/linux/v4l2-controls.h            |  1 +
>  3 files changed, 30 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 00944e97d638..994650052333 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -674,6 +674,26 @@ enum v4l2_mpeg_video_frame_skip_mode -
>      is currently displayed (decoded). This value is reset to 0 whenever
>      the decoder is started.
>  
> +``V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR (integer64)``
> +    This control sets conceal color in YUV color space. It describes the
> +    client preference of error conceal color in case of error where
> +    reference frame is missing. The decoder would paint the reference
> +    buffer with preferred color and use it for future decoding.
> +    Applicable to decoders.

You should mention explicitly that this is using 16-bit color components
and expects Limited Range.

> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - Bit 0:15
> +      - Y luminance
> +    * - Bit 16:31
> +      - Cb chrominance
> +    * - Bit 32:47
> +      - Cr chrominance
> +    * - Bit 48:63
> +      - Must be zero
> +
>  ``V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE (boolean)``
>      If enabled the decoder expects to receive a single slice per buffer,
>      otherwise the decoder expects a single frame in per buffer.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 016cf6204cbb..a3b9d28a00b7 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -945,6 +945,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:			return "VBV Buffer Size";
>  	case V4L2_CID_MPEG_VIDEO_DEC_PTS:			return "Video Decoder PTS";
>  	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:			return "Video Decoder Frame Count";
> +	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:		return "Video Decoder Conceal Color";
>  	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:			return "Initial Delay for VBV Control";
>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:		return "Horizontal MV Search Range";
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
> @@ -1430,6 +1431,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		*max = 0x7fffffffffffffffLL;
>  		*step = 1;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
> +		*type = V4L2_CTRL_TYPE_INTEGER64;
> +		*min = 0;
> +		/* default for 8bit black, luma is 16, chroma is 128 */

Since this is 16 bit the actual default luma value for black is 4096 and for chroma use
32768 (i.e. both values are times 256).

> +		*def = 0x8000800010LL;
> +		*max = 0xffffffffffffLL;
> +		*step = 1;
> +		break;
>  	case V4L2_CID_PIXEL_RATE:
>  		*type = V4L2_CTRL_TYPE_INTEGER64;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 039c0d7add1b..5e5a3068be2d 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -428,6 +428,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
>  #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
>  #define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID	(V4L2_CID_CODEC_BASE+230)
> +#define V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+231)
>  
>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
> 

Regards,

	Hans
