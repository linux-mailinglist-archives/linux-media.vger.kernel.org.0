Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B2E2CBEBD
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 14:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730119AbgLBNwj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 08:52:39 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:51093 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728034AbgLBNwi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 08:52:38 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kSXvkERTgN7XgkSXyktK7M; Wed, 02 Dec 2020 14:51:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606917115; bh=QC1qQiiUguqL+R4UhMsNy/Vd2a1SGfIVmZtbgkGTe8c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=svxGooqKmxA6a48lHB3ZXQjvG66XoqZ8w2SBbY9+ZZi7z5ghbL1EtE+SSgNlehoTy
         8b3W0IAH0KoFp0HqFb/X/TNiAyKauZeu4DRZz+zhOaSUKDhiKOuvqHI3Hc+v1NJYBK
         xLgMlWMUvdVdzrtLeEXQnfa8/5SOdOxf5JzBPaPNgowxA0R3gqRq8kX3NQZj83PFY/
         4f3G/KX6IysWK58FLe1+O2IeKj2y1867fI2WdvyQ0TRxnG4bCmkY9fDAnD3dpfoX1I
         csk9uR3wqKClf8mnagGLCMUZnPBPAvWEEuQvXkGFzRHaQR0Sbtvzqic2VJSZABMFip
         o0N3eeACGzEQg==
Subject: Re: [PATCH v3 1/3] media: v4l2-ctrl: Add frame-specific min/max qp
 controls for hevc
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1605682497-29273-1-git-send-email-dikshita@codeaurora.org>
 <1605682497-29273-2-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <42116828-e21f-64a2-1de5-23a5a1108642@xs4all.nl>
Date:   Wed, 2 Dec 2020 14:51:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1605682497-29273-2-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJjdmkj9lQmvRPbuu6tQ/8rfTx0HWOXXCt3bLye5uVcVYKOC4yKKg3iqMKIGQPAB/lm3JqnExne0dTVPNhAyVq2d0p0QrlasToI9oG/IsuJVB2QKIksj
 vk4Z5VyGqfLFEzl/bAe1CofQzlJLoTpKekvq4iZzIU7oOKZfAAGq5vq0EqgoRjIs4f/oSz98JhCCslotw409cqdq0deala6pH2jRwJHegCEK5VHso17JpMdM
 VXKudHN1fFqU+XqbFk+k4/zPIbcEscAVItNarfu8n/p1ipZzzvX6604izAS7T3jlXJ7rqrbQhlyUeMJ27S+b0OCeYCHAoRdvYTWwTG1G/6dI/+8XgbO/W1Ib
 Mg9I1NwbGrZyzcS7JB86ykvCgsaTR7EhFEiDlD6ZVRP5oFKpkqS3pVKv4masD61zlOI0nJ3UK57v8uxAZmyESDkw7HmxdQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dikshita,

Just a few nitpicks, I'd have changed it myself, but since a new version is
needed anyway you might as well change it for next time :-)

On 18/11/2020 07:54, Dikshita Agarwal wrote:
> - Adds min/max qp controls for B frame for h264.
> - Adds min/max qp controls for I/P/B frames for hevc similar to h264.
> - Update valid range of  mim/max qp for hevc to accommodate 10 bit.

double space after 'of'. Typo: mim -> min

> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 52 +++++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls.c               |  8 ++++
>  include/uapi/linux/v4l2-controls.h                 |  9 ++++
>  3 files changed, 67 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index aac1ea3..a9c7011 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1182,6 +1182,18 @@ enum v4l2_mpeg_video_h264_entropy_mode -
>      V4L2_CID_MPEG_VIDEO_H264_MAX_QP is also set, the quantization parameter
>      should be chosen to meet both requirements.
>  
> +``V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP (integer)``
> +    Minimum quantization parameter for the H264 B frame to limit B frame
> +    quality to a range. Valid range: from 0 to 51. If
> +    V4L2_CID_MPEG_VIDEO_H264_MIN_QP is also set, the quantization parameter
> +    should be chosen to meet both requirements.
> +
> +``V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP (integer)``
> +    Maximum quantization parameter for the H264 B frame to limit B frame
> +    quality to a range. Valid range: from 0 to 51. If
> +    V4L2_CID_MPEG_VIDEO_H264_MAX_QP is also set, the quantization parameter
> +    should be chosen to meet both requirements.
> +
>  ``V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP (integer)``
>      Quantization parameter for an I frame for MPEG4. Valid range: from 1
>      to 31.
> @@ -3441,11 +3453,11 @@ HEVC/H.265 Control IDs
>  
>  ``V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP (integer)``
>      Minimum quantization parameter for HEVC.
> -    Valid range: from 0 to 51.
> +    Valid range: from 0 - 51 for 8 bit and  0 - 63 for 10 bit.

Write in full:

Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.

Ditto elsewhere.

>  
>  ``V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP (integer)``
>      Maximum quantization parameter for HEVC.
> -    Valid range: from 0 to 51.
> +    Valid range: from 0 - 51 for 8 bit and 0 - 63 for 10 bit.
>  
>  ``V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP (integer)``
>      Quantization parameter for an I frame for HEVC.
> @@ -3462,6 +3474,42 @@ HEVC/H.265 Control IDs
>      Valid range: [V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
>      V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP].
>  
> +``V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP (integer)``
> +    Minimum quantization parameter for the HEVC I frame to limit I frame
> +    quality to a range. Valid range: from 0 to 51 for 8 bit, 0 - 63 for 10 bit.
> +    If V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
> +    should be chosen to meet both requirements.
> +
> +``V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP (integer)``
> +    Maximum quantization parameter for the HEVC I frame to limit I frame
> +    quality to a range. Valid range: from 0 to 51 for 8 bit, 0 - 63 for 10 bit.
> +    If V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
> +    should be chosen to meet both requirements.
> +
> +``V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP (integer)``
> +    Minimum quantization parameter for the HEVC P frame to limit P frame
> +    quality to a range. Valid range: from 0 to 51 for 8 bit, 0 - 63 for 10 bit.
> +    If V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
> +    should be chosen to meet both requirements.
> +
> +``V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP (integer)``
> +    Maximum quantization parameter for the HEVC P frame to limit P frame
> +    quality to a range. Valid range: from 0 to 51 for 8 bit, 0 - 63 for 10 bit.
> +    If V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
> +    should be chosen to meet both requirements.
> +
> +``V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP (integer)``
> +    Minimum quantization parameter for the HEVC B frame to limit B frame
> +    quality to a range. Valid range: from 0 to 51 for 8 bit, 0 - 63 for 10 bit.
> +    If V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
> +    should be chosen to meet both requirements.
> +
> +``V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP (integer)``
> +    Maximum quantization parameter for the HEVC B frame to limit B frame
> +    quality to a range. Valid range: from 0 to 51 for 8 bit, 0 - 63 for 10 bit.
> +    If V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
> +    should be chosen to meet both requirements.
> +
>  ``V4L2_CID_MPEG_VIDEO_HEVC_HIER_QP (boolean)``
>      HIERARCHICAL_QP allows the host to specify the quantization parameter
>      values for each temporal layer through HIERARCHICAL_QP_LAYER. This is
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index e8ee29e..6e74500 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -920,6 +920,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP:		return "H264 I-Frame Maximum QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP:		return "H264 P-Frame Minimum QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:		return "H264 P-Frame Maximum QP Value";
> +	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:		return "H264 B-Frame Minimum QP Value";
> +	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:		return "H264 B-Frame Maximum QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H264_SPS:			return "H264 Sequence Parameter Set";
>  	case V4L2_CID_MPEG_VIDEO_H264_PPS:			return "H264 Picture Parameter Set";
>  	case V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
> @@ -982,6 +984,12 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:		return "HEVC B-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:			return "HEVC Minimum QP Value";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:			return "HEVC Maximum QP Value";
> +	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP:		return "HEVC I-Frame Minimum QP Value";
> +	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP:		return "HEVC I-Frame Maximum QP Value";
> +	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP:		return "HEVC P-Frame Minimum QP Value";
> +	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP:		return "HEVC P-Frame Maximum QP Value";
> +	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP:		return "HEVC B-Frame Minimum QP Value";
> +	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP:		return "HEVC B-Frame Maximum QP Value";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:			return "HEVC Profile";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:			return "HEVC Level";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:			return "HEVC Tier";
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 14ce833..fea0f18 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -588,6 +588,8 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type {
>  #define V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+386)
>  #define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+387)
>  #define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+388)
> +#define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+389)
> +#define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+390)
>  #define V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP	(V4L2_CID_MPEG_BASE+400)
>  #define V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP	(V4L2_CID_MPEG_BASE+401)
>  #define V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP	(V4L2_CID_MPEG_BASE+402)
> @@ -772,6 +774,13 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
>  #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
>  #define V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY		(V4L2_CID_MPEG_BASE + 645)
>  #define V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE		(V4L2_CID_MPEG_BASE + 646)
> +#define V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+647)
> +#define V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+648)
> +#define V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+649)
> +#define V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+650)
> +#define V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+651)
> +#define V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+652)
> +
>  enum v4l2_mpeg_video_frame_skip_mode {
>  	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED	= 0,
>  	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT	= 1,
> 

Regards,

	Hans
