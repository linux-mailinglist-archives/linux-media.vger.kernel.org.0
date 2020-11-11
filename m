Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 444D22AF036
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 13:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgKKMAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 07:00:42 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:38793 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726495AbgKKMAl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 07:00:41 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id con7kmvMzRiwVconGkaFiV; Wed, 11 Nov 2020 13:00:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605096024; bh=l0Ozo/+OjgN/6xyN63j58z4RiGeYnpiEElVQhjW0MUY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KpRAGyD+h4yH320VEmBUI32TmLwos4dB9+DM6q65P1tyO0/kXRxiypnLPdlWbangC
         bDPBahys1rnntfj7xTculER+zYiFENWPLo+IRpUoRexYDvcFmphk/2pymArIWr65Eg
         JHWfQxnfllX5ZKHhWKRfUN/62uWWuEHyrNrM8ejYE9iohLmkcWm85I+VMtSCtYCCZ9
         02i6DLZyv/YqXGNqrSkox74T8kzfc7D4YUCqg9n/dQlbPf29na876oMg3yZpLoJcbI
         Dkugb+l8E3laxKKN4YMJlH01bBCEG7mzeB9NjJLZZzRJLe1lOoGkH4CiA+BKc9XAlf
         uxZ9gtAk8VTFg==
Subject: Re: [PATCH v2 1/2] media: v4l2-ctrl: Add frame-specific min/max qp
 controls for hevc
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     mchehab@kernel.org, ezequiel@collabora.com,
        stanimir.varbanov@linaro.org, vgarodia@codeaurora.org,
        majja@codeaurora.org
References: <1600693440-3015-1-git-send-email-dikshita@codeaurora.org>
 <1600693440-3015-2-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <32716f9e-8fb9-5c8f-7f3b-742200ce00c2@xs4all.nl>
Date:   Wed, 11 Nov 2020 12:59:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600693440-3015-2-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDwyuppk4vqyjet+IdgaWc5hDCrlM2OI91rLDhqpfPeCf6QMih/OwpgA2TcQMW2YUsIDwFKYRfpy5/0k4n0R4MNN26l5AZ72rqmb7gYrxYPCzElvfN8G
 OaBjTvdVMhhhNKlLTsCfF+JE1+hSVUfoxLmzH8+DbAD9ruehARw4z6O1yokfG3RntTdygDGYpzkJ33PmhCdRopdEnkpmzOV0o4NQ8FtQxWd8B1A/NEGfZFDk
 rsMgSPgfrDJlZQsDzkyDvOZ+qqBOxdvUaf/PJlfdlp1i3K8PMAUEcLQCNT8Jr3eVI2JYz3D0vegvbrMVZW1gy1YJXkdCjk63QX/PBd4sZ8bEsxKvuFb2s9or
 WntV766c1+71OmkmVoxvuLaOBDIdaXwiaHhsYeKWAp7N7bZoTcXQ/FXBkyGUPmIGYmgMhIrUqRDph/G+KyxyMPSCu+niEpziRUUanCX10dGJShOmLzFP9X4h
 hAvjZ07elBggWCdN8ww0kvrRG+MslBX3L6P7FA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/09/2020 15:03, Dikshita Agarwal wrote:
> - Adds min/max qp controls for B frame for h264.
> - Adds min/max qp controls for I/P/B frames for hevc similar to h264.
> - Update valid range of mim/max qp for hevc to accommodate 10 bit.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 54 +++++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls.c               |  8 ++++
>  include/uapi/linux/v4l2-controls.h                 |  9 ++++
>  3 files changed, 69 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index ce728c75..26f8220 100644
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
> @@ -3441,11 +3453,13 @@ HEVC/H.265 Control IDs
>  
>  ``V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP (integer)``
>      Minimum quantization parameter for HEVC.
> -    Valid range: from 0 to 51.
> +    Valid range: from 0 - 51 for 8 bit and
> +    0 - 63 for 10 bit.

This can be on one line.

>  
>  ``V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP (integer)``
>      Maximum quantization parameter for HEVC.
> -    Valid range: from 0 to 51.
> +    Valid range: from 0 - 51 for 8 bit and
> +    0 - 63 for 10 bit

Same here, but this is also missing a period at the end.

>  
>  ``V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP (integer)``
>      Quantization parameter for an I frame for HEVC.
> @@ -3462,6 +3476,42 @@ HEVC/H.265 Control IDs
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
> index bd7f330..abef73e 100644
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
> @@ -978,6 +980,12 @@ const char *v4l2_ctrl_get_name(u32 id)
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
> index a184c49..7ba05fe 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -578,6 +578,8 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type {
>  #define V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+386)
>  #define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+387)
>  #define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+388)
> +#define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+389)
> +#define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+390)
>  #define V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP	(V4L2_CID_MPEG_BASE+400)
>  #define V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP	(V4L2_CID_MPEG_BASE+401)
>  #define V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP	(V4L2_CID_MPEG_BASE+402)
> @@ -762,6 +764,13 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
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
