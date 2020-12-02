Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFBCD2CBCD5
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 13:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729815AbgLBMVm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 07:21:42 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:53309 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727427AbgLBMVl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 07:21:41 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kR7vkDoRaN7XgkR7ykswEh; Wed, 02 Dec 2020 13:20:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606911659; bh=RyqW6fmVK3El+l1OFkTlJuUamgfR+SHMbA/e1v7uP8Q=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=D6kNSgsPHYcfSWqO592YfUIbnnVqvMWwUCQcLG/NE2fbAsYO9gMaLY3MEO8Cw8M3V
         mKVeehuGq+mZKgB2SmR7DsoBXQTHtwHDOGxD/0S69RDtCRS/7SvViHean33uqKEns3
         tzMmGWNJ0iMy0+OsJK2xgXg7+LpMcZCdRt/beMDFlYIydhOEUdglLt7OT5uE96Ob40
         7lSZixiUvB6aEgkrbKoNlMjmhKmhcmf/6CBqq45938UL4V4SwqH/qdHUXD5+WA4O8C
         zEQvq2pKyqgemuyWlOJ1UpOBHpB80byDLv/OUb+A8VnNUsEOd1I++WeBNKW44sxPj1
         SoQvzU3SAT4ag==
Subject: Re: [PATCH 3/4] media: v4l2-ctrls: Add control for AUD generation
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>
References: <20201130090859.25272-1-stanimir.varbanov@linaro.org>
 <20201130090859.25272-4-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0801e721-0201-09c9-1e81-afa410b1ec1d@xs4all.nl>
Date:   Wed, 2 Dec 2020 13:20:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201130090859.25272-4-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPBR0cNZ1m24uLgMQZKNmJpvEP543o+LmOunenUEG9mq2ccCT42YkOgBu4PP9u4nYyTJ8To7j8ChZjW326yy7/yhpTJyI4mOQprDVTOrJ2/l9e8WpwOm
 JzusHFlvp0i28rf9YOg6PsMGvfO9XqVUO9JbLokLC7DroB+t+nes7dV0zOpgA26zH4XLfPgS4Y9klivPLhVcVXSbrvnPPILkNukcMlEYNYhzOMnaxtFJjM1R
 TpiDObxGcQ+vrF33vroAGYuN7qW3Rwb5ZJlWqXMDZ0trJjWcOJriUbTWhdLnwx2b1GsfyixXpFzq3Kfi2qwADAoiiWn3L2RJD2Vc/pVbGTh9UDEeSI0/rodP
 N2Q5ldE3HI9H+ERrVAhW4UA1cpXmbwvEn0oYGdjjPAV8OcnyaQgmvy4vaM4pzi5drN0cW47Omdj6zg9uZdtqMsZQ7OkHYg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/11/2020 10:08, Stanimir Varbanov wrote:
> Add a control to enable inserting of AUD NALU into encoded
> bitstream.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 5 +++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                      | 2 ++
>  include/uapi/linux/v4l2-controls.h                        | 1 +
>  3 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 59c5d3da4d95..d0a161add543 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -679,6 +679,11 @@ enum v4l2_mpeg_video_frame_skip_mode -
>      otherwise the decoder expects a single frame in per buffer.
>      Applicable to the decoder, all codecs.
>  
> +``V4L2_CID_MPEG_VIDEO_AU_DELIMITER (boolean)``
> +    If enabled, AUD (Access Unit Delimiter) NALU will be generated. That

If enabled, -> If enabled, then
NALU -> NALUs

> +    could be useful to find the start of a frame without having to fully
> +    parse each NALU. Applicable to the H264 and HEVC encoders.
> +
>  ``V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE (boolean)``
>      Enable writing sample aspect ratio in the Video Usability
>      Information. Applicable to the H264 encoder.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 5354547ed777..887fb13974de 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -875,6 +875,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
>  	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
>  	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
> +	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:			return "Acess Unit Delimiter";

Acess -> Access

Wouldn't this be a more descriptive name: "Generate Access Unit Delimiters"?
Unless I miscounted this should just fit.

>  	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
> @@ -1228,6 +1229,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:
> +	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
>  	case V4L2_CID_WIDE_DYNAMIC_RANGE:
>  	case V4L2_CID_IMAGE_STABILIZATION:
>  	case V4L2_CID_RDS_RECEPTION:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index cc7676ffff67..18c4f46423bc 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -422,6 +422,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
>  #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+228)
>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_MPEG_BASE+229)
>  #define V4L2_CID_MPEG_VIDEO_RANDOM_INTRA_REFRESH_MB	(V4L2_CID_MPEG_BASE+230)
> +#define V4L2_CID_MPEG_VIDEO_AU_DELIMITER		(V4L2_CID_MPEG_BASE+231)
>  
>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
> 

Regards,

	Hans
