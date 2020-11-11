Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1722AF015
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 12:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgKKLze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 06:55:34 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:41197 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725995AbgKKLzd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 06:55:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id coiQkmu7HRiwVcoiYkaFAK; Wed, 11 Nov 2020 12:55:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605095730; bh=HDa7FQ+sDo6ODRLOp2q9uk1S/MYb4VsfJup3IA08iR4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JgGE6hffu5BzoWZs43uzImp9z946WleJZ6OwbT2VQdwBfVGdBNWHv6HQKAJb/b+bi
         du9nDvvdZbgJaHLBzdLyUFu8AbcQUFMsgYSJ4rAj/xpwsq6W7zAt7VgTkpVeUDr15l
         EEM7Eg2zeDE9wgxBOnef92vLDmijUl3cIbvSjvNJ+osPJ1juVncNX9LVViasDi/02I
         C8MxmDPd+LslOgfJHYNZ+6xnXayTSXHP6Ph3g/fIeOgC2fX261ErtIjc4ncUnAwl2+
         Ctxix7sQ/OG3XuzL6oGjjGSOb2wnpbjIwyxoSFJYDgBxdxdu5GSpyWOmfjb/GaFwKp
         fY2Z9yAdZ3Inw==
Subject: Re: [PATCH v2 2/2] media: v4l2-ctrl: Add layer wise bitrate controls
 for h264
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     mchehab@kernel.org, ezequiel@collabora.com,
        stanimir.varbanov@linaro.org, vgarodia@codeaurora.org,
        majja@codeaurora.org
References: <1600693440-3015-1-git-send-email-dikshita@codeaurora.org>
 <1600693440-3015-3-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f6c94a1a-9f5b-ecec-9077-95548ea9838f@xs4all.nl>
Date:   Wed, 11 Nov 2020 12:55:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600693440-3015-3-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPvegNORkRbCZqZp8V9rwKA2dm4lWEyRZhuxTHHxYpiQFjcEY4Ntqpdv2cq5F/F0gHtiiHQxgMnjO3nbwr64Y855jbO/e9s/vjkjgfD2eeOvaQRNcQwi
 oJUVmu1y64HkdN5ThASiGA4Cvt0cClszD53X5rQLkVwii34ANKStFujLr/+LXXEXWF6kwuzRNZ5hi0aHSvwLAp2jEQ2S1b/ECol99HQuefaJr4kWDX2j1l2Z
 0591yzpet6z0g9oEjTmIjLEci+EXEREh3mr0PvmaVuNTuiSo9qB5u7ht0qpPKZhvSORiNISJ8/DCktCOzfKbICWL5t5bv8m43S0S3gsoYu/3nr5OfHGgPJPJ
 ZDD6Fj1Llcci03UpdPp+OFufUuxF3Db59/jIzxPxorjM3nVdDg/IXog5rN95gKEJ+khBbcUCeRn2LH94Oqa1uQeblLLhMfHZ5Fdl7j4sB/hfzVH9VT+IcrUQ
 QyRK4mAypFrCow0XbOIKUCXNeEwymv3BsSLdIQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/09/2020 15:04, Dikshita Agarwal wrote:
> Adds bitrate control for all coding layers for h264
> same as hevc.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst      | 20 ++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                 |  7 +++++++
>  include/uapi/linux/v4l2-controls.h                   |  8 ++++++++
>  3 files changed, 35 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 26f8220..690b066 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1513,6 +1513,26 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - Bit 16:32
>        - Layer number
>  
> +``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR (integer)``
> +    Indicates bit rate for hierarchical coding layer 0 for H264 encoder.
> +
> +``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR (integer)``
> +    Indicates bit rate for hierarchical coding layer 1 for H264 encoder.
> +
> +``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR (integer)``
> +    Indicates bit rate for hierarchical coding layer 2 for H264 encoder.
> +
> +``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR (integer)``
> +    Indicates bit rate for hierarchical coding layer 3 for H264 encoder.
> +
> +``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR (integer)``
> +    Indicates bit rate for hierarchical coding layer 4 for H264 encoder.
> +
> +``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR (integer)``
> +    Indicates bit rate for hierarchical coding layer 5 for H264 encoder.
> +
> +``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR (integer)``
> +    Indicates bit rate for hierarchical coding layer 6 for H264 encoder.

The unit isn't specified here. I assume it is bits per second, but that should
be stated explicitly.

>  
>  .. _v4l2-mpeg-h264:
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index abef73e..9296294 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -922,6 +922,13 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:		return "H264 P-Frame Maximum QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:		return "H264 B-Frame Minimum QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:		return "H264 B-Frame Maximum QP Value";
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:	return "H264 Hierarchical Lay 0 BitRate";
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:	return "H264 Hierarchical Lay 1 BitRate";
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:	return "H264 Hierarchical Lay 2 BitRate";
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:	return "H264 Hierarchical Lay 3 BitRate";
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:	return "H264 Hierarchical Lay 4 BitRate";
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:	return "H264 Hierarchical Lay 5 BitRate";
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR:	return "H264 Hierarchical Lay 6 BitRate";

BitRate -> Bitrate

>  	case V4L2_CID_MPEG_VIDEO_H264_SPS:			return "H264 Sequence Parameter Set";
>  	case V4L2_CID_MPEG_VIDEO_H264_PPS:			return "H264 Picture Parameter Set";
>  	case V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 7ba05fe..b869b54 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -580,12 +580,20 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type {
>  #define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+388)
>  #define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+389)
>  #define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+390)
> +#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR	(V4L2_CID_MPEG_BASE + 391)
> +#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR	(V4L2_CID_MPEG_BASE + 392)
> +#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR	(V4L2_CID_MPEG_BASE + 393)
> +#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR	(V4L2_CID_MPEG_BASE + 394)
> +#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR	(V4L2_CID_MPEG_BASE + 395)
> +#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR	(V4L2_CID_MPEG_BASE + 396)
> +#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 397)
>  #define V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP	(V4L2_CID_MPEG_BASE+400)
>  #define V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP	(V4L2_CID_MPEG_BASE+401)
>  #define V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP	(V4L2_CID_MPEG_BASE+402)
>  #define V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP	(V4L2_CID_MPEG_BASE+403)
>  #define V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP	(V4L2_CID_MPEG_BASE+404)
>  #define V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL		(V4L2_CID_MPEG_BASE+405)
> +
>  enum v4l2_mpeg_video_mpeg4_level {
>  	V4L2_MPEG_VIDEO_MPEG4_LEVEL_0	= 0,
>  	V4L2_MPEG_VIDEO_MPEG4_LEVEL_0B	= 1,
> 

Regards,

	Hans
