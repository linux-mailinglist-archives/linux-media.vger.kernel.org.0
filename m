Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144F530A65F
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 12:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233475AbhBALVI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 06:21:08 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:32809 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233219AbhBALVH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 06:21:07 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6XFklvDwlefbk6XFnlgLOh; Mon, 01 Feb 2021 12:20:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612178423; bh=hszt98APAs4vtpYcEWGqcYnvbnBQJqUfs1RIQxxIaL0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mhVpvMAQfmvHHyu+Dr6UiAtN3UwAkGlvwEwepiaM3yx7VY2YF8J6dG+DT8u+1WItC
         ApYO/0V1XD4ni9vrzxbKNFYvBl9Kukxwf7b95knTKBoruqG4lC4eVSp8NEw6b+1FwI
         oSjiOIX1RqdrS0+q7z/Mt3sWu64/PbjoeoMAqwZ2J2mN6xJKO3vNwrcCxu3JiP2ZCI
         3PSBKkSAK5NGE2qy4DtNa1pj4J2jLzH4PyhqxbT8BBj5u5mV3h/2PcUiYfIINTqedp
         pmfSxaMXmYWeLqHGAKRaZ/0dgsPBmjkCaqz53pYCbHHvW9IWnGE63iZCBForC6F/qX
         WpBDMElc9zS4Q==
Subject: Re: [PATCH v6 1/2] media: v4l2-ctrl: add controls for long term
 reference.
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1611553919-17919-1-git-send-email-dikshita@codeaurora.org>
 <1611553919-17919-2-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d20ba57f-54a7-5a61-a64b-2d9433b79281@xs4all.nl>
Date:   Mon, 1 Feb 2021 12:20:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1611553919-17919-2-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDVn+00m4tzB2wKDHfLZEKb52G2SPVDITu9AZKkJZ+V/WJ46uu4QXa7ijEdPAGLUxYjtFLWAjvsP2AZUX29AKgBWP9z9L7ny+hmviy/2OBE2BiluzEuP
 B8GjzK3z/pE8LqK3G/uDyITt+2xOIC5uNJBUuLUosB1N61fm5WDSlEwOLUUMV0ZpMLuUzuhkKxvmO1Rdm0vtthyahzxGOwA/6TYkcz+4gQDMq6bhI1cz//5P
 whLdwnkqdgIDPL81LbzzrGqbfgMtsHxNChXBGBN6tivwdkiDpfgkDoeiQMEuaOJvv2oz1vULReYzvx5Ot5BVLfsgbMwpBIF9PDJwK3wJJJjMUwqIIZf2Q6BY
 VP6xgEOyN0LH4rqpbUDsCpYrY06BnfZvaFlux0qmcRFXVyBv4TE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/01/2021 06:51, Dikshita Agarwal wrote:
> Long Term Reference (LTR) frames are the frames that are encoded
> sometime in the past and stored in the DPB buffer list to be used
> as reference to encode future frames.
> This change adds controls to enable this feature.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst        | 18 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                   | 14 ++++++++++++++
>  include/uapi/linux/v4l2-controls.h                     |  3 +++
>  3 files changed, 35 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 400774c..a37d460 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -3637,3 +3637,21 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>        - Selecting this value specifies that HEVC slices are expected
>          to be prefixed by Annex B start codes. According to :ref:`hevc`
>          valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
> +
> +``V4L2_CID_MPEG_VIDEO_LTR_COUNT (integer)``
> +       Specifies the number of Long Term Reference (LTR) frames encoder needs
> +       to generate or keep. This is applicable to the H264 and HEVC encoders.
> +
> +``V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX (integer)``
> +       The current frame is marked as a Long Term Reference (LTR) frame
> +       and given this LTR index which ranges from 0 to LTR_COUNT-1.
> +       This is applicable to the H264 and HEVC encoders and can be applied using
> +       Request API.

You mentioned in reply to my comment that the venus driver didn't support the
Request API that it is also possible to use it without that API.

But that requires more precise documentation. I assume that without the Request
API you would set this control, then queue the buffer containing the frame this
control should apply to, then wait until it is dequeued. Since that's the only
way you can be certain this control is applied to the correct frame.

Is this indeed what you do in your application?

Regards,

	Hans

> +       Source Rec. ITU-T H.264 (06/2019); Table 7.9
> +
> +``V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES (bitmask)``
> +       Specifies the Long Term Reference (LTR) frame(s) to be used for
> +       encoding the current frame.
> +       This provides a bitmask which consists of bits [0, LTR_COUNT-1].
> +       This is applicable to the H264 and HEVC encoders and can be applied using
> +       Request API.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 16ab54f..84c1eb8 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -950,6 +950,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
>  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
> @@ -1277,6 +1280,17 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
> +		*type = V4L2_CTRL_TYPE_BITMASK;
> +		*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>  	case V4L2_CID_PAN_RESET:
>  	case V4L2_CID_TILT_RESET:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index af8dda2..c0bb87b 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -422,6 +422,9 @@ enum v4l2_mpeg_video_multi_slice_mode {
>  #define V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+227)
>  #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
> +#define V4L2_CID_MPEG_VIDEO_LTR_COUNT			(V4L2_CID_CODEC_BASE+230)
> +#define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX		(V4L2_CID_CODEC_BASE+231)
> +#define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES		(V4L2_CID_CODEC_BASE+232)
>  
>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
> 

