Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC8539860B
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 12:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbhFBKPO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 06:15:14 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:37963 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230073AbhFBKPN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 06:15:13 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id oNsLlUJ0HIpGyoNsOlPEI0; Wed, 02 Jun 2021 12:13:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622628809; bh=bUYMd0RzTLxd4QK2km6G8mx81+/nGJbGFGBtTxiFJYs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ne71Ell9zTaPHyMNkkSakNwb90Vtu2YaJlM3SlwSbhbMqJF3CJvUqNdY8E3GSdk1Y
         w5zoib4JBKIippCfQ/jzxmYMQOnCEBonFkf2fMBfxr8Go1cjz5hPDbn4HxoFL4+8Zp
         g/Z150yvAwQd9uutAafXCX28Pc1l7EzE0Jk/D5vKn1Wx30sG+U2c6t6PNwIscsX4wK
         fUIcj409NLjtCho23iqXq03p3n7rLMpnXAtLHTaNBOaji6C4X0/4ymbODUUmqm8VUk
         6l+Sq0WInYsuYPkHE94VaSO7e0KWuyDwv16hyjEkmnQSK1Au/sIRGBmz6oMgjM8ySv
         JwpS0V24wQ5jQ==
Subject: Re: [PATCH v4 1/2] media: v4l2-ctrls: Add intra-refresh period
 control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com
References: <20210602094714.607828-1-stanimir.varbanov@linaro.org>
 <20210602094714.607828-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d7807e7a-a72f-75be-ecd3-36faf4d2f3ca@xs4all.nl>
Date:   Wed, 2 Jun 2021 12:13:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602094714.607828-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfG93JJgiup/emqwC2KkBjzDXunk3+yBrrChwPmPNzYRk+eeOAni2jgMt+2n0ChteYKzK4CvX+MXDMGjtd2jPOwUyc5QDt96LuUqA+z+3HrpNR97d6Ha5
 FZiGnnRlaA4E/81GoJcuqTvB+/wYT5Ot2De6lqGaF5F8lJqQb5NP9bwc+EdH7dhG7gTuiuaWhRv+S+fuzE9MPKcnJYcZ2ASfOlw8Nitq1CvTTM9iBfJDIEJN
 FBT7BfPgxMbjC5jenRfzfYFP+9lvn3PzVgXljkab+JVYvhXpgFkuyq6193ziSixvO6d1MIeSzxGgRElukM7/y4gKj0345QqebYl5VUi03Mux+gfSACDMRbpP
 0uKJyVeUz8O3BFCobsVQAoUTz/SvZ1u0Bg1pPEeM1sK8z8Es2QBkV+0A6sQnBibwp4krNM3W
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/06/2021 11:47, Stanimir Varbanov wrote:
> Add a control to set intra-refresh period.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../media/v4l/ext-ctrls-codec.rst              | 18 +++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c      |  2 ++
>  include/uapi/linux/v4l2-controls.h             |  1 +
>  3 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 0b8061666c57..803fb655af1c 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1174,7 +1174,23 @@ enum v4l2_mpeg_video_h264_entropy_mode -
>      Cyclic intra macroblock refresh. This is the number of continuous
>      macroblocks refreshed every frame. Each frame a successive set of
>      macroblocks is refreshed until the cycle completes and starts from
> -    the top of the frame. Applicable to H264, H263 and MPEG4 encoder.
> +    the top of the frame.  Note that intra-refresh period is

intra-refresh period -> this control

> +    mutually exclusive with V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD

with -> with the

> +    control, aka the client must set this one or the other but not both.

'aka' is not really the right abbreviation to use. How about 'i.e.'?

> +    Applicable to H264, H263 and MPEG4 encoder.
> +
> +``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD (integer)``
> +    Intra macroblock refresh period. This sets the period to refresh
> +    the whole frame. In other words, this defines the number of frames
> +    for which the whole frame will be intra-refreshed.  An example:
> +    setting period to 1 means that the whole frame will be refreshed,
> +    setting period to 2 means that the half of macroblocks will be
> +    intra-refreshed on frameX and the other half of macroblocks
> +    will be refreshed in frameX + 1 and so on. Setting period to zero

period -> the period

> +    means no period is specified.  Note that intra-refresh period is

intra-refresh period -> this control

> +    mutually exclusive with V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB

with -> with the

> +    control, aka the client must set this one or the other but not both.

aka -> i.e.

> +    Applicable to H264 and HEVC encoders.

This text is still problematic. Saying that 'the client must set this one or
the other but not both' makes no sense, since controls are *always* set to
some value. Now, V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD can be set to 0
to indicate that no period is specified. Can the same be done with
V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB? The description makes no mention
of that, perhaps it should be updated?

If V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB can be 0, then you can write
something like: 'both controls cannot both have non-0 values' (but better
phrased, but you get my drift). Or setting one should set the other to
0? Or if both are non-0, then control X takes priority. I'm not entirely sure
what works best. I think having one control have a higher prio might make the
most sense. I.e. "if V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD is not 0, then
V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB shall be ignored."

It's surprisingly hard to unambiguously define things like this!

Regards,

	Hans

>  
>  ``V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE (boolean)``
>      Frame level rate control enable. If this control is disabled then
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 7963c7b43450..3d73c28bafa7 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -833,6 +833,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:	return "Decoder Slice Interface";
>  	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:	return "MPEG4 Loop Filter Enable";
>  	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:	return "Number of Intra Refresh MBs";
> +	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:		return "Intra Refresh Period";
>  	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:		return "Frame Level Rate Control Enable";
>  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
> @@ -1257,6 +1258,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
>  	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
> +	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index f96bea19c991..a34a18ec7f69 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -434,6 +434,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
>  #define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX		(V4L2_CID_CODEC_BASE+233)
>  #define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES		(V4L2_CID_CODEC_BASE+234)
>  #define V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+235)
> +#define V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD	(V4L2_CID_CODEC_BASE+236)
>  
>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
> 

