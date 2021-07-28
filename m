Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0039C3D8B7A
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 12:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235906AbhG1KMu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 06:12:50 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53427 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232114AbhG1KMu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 06:12:50 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 8gYQmHG4gXTlc8gYRmT2WA; Wed, 28 Jul 2021 12:12:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627467168; bh=RHZJByB5leL9DQabKAKLwVitrU78TIsOgRxa6Y6vloI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IAaaBb/WNIyEoE/mE6TsMQMKcrniLCVMeZT55NqarfZREXbz7K6B4OZ3DGhfAdaae
         /SkEof1EdxoMMleiknZl7yg92tTUlFI95mPTGVbgCjLXHpvzAcf5F1M7G4WYMANwnI
         XtaoR2cmYGK5gepvzPaHjIhjn9kybOc2gJPho/k+lgrPxDlgcOr5QOs5vq7ckEoZRl
         o7JXL6ifHoyDuHsR0Zr3MRBzroPNDvz1lLRceTAD4VcLHruAzF0dhRwfXoy7eIELI2
         s9H4eVS4incibIFZdw6VXV6/q/3DjIAmMMqAUuNpup41R7Ru9bXZK08XGaF/0WTAZ0
         FynCb7f29cOCA==
Subject: Re: [PATCH v5 2/3] media: v4l2-ctrls: Add intra-refresh period
 control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com
References: <20210622113958.809173-1-stanimir.varbanov@linaro.org>
 <20210622113958.809173-3-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0429d350-0000-6f47-9d04-47ee3bbb26d7@xs4all.nl>
Date:   Wed, 28 Jul 2021 12:12:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622113958.809173-3-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNgoEdcOHTk8ieMLWZ3w1SMpoJikaRitewNHm5eDR0BycQIF8A8TOIru2mxQM+4HAbQ2e9YGSHXdQtVQcPW6X+i/VHghs0B5Blm4p1J7U2jPxQmCbu56
 Tgg523qLxkKisuDFWvZWkWfuCjq/f1pLQ4AMRenMi8Gdo+e15UbPlzdiPThwPH4bplF9ENY00O0YWDg9DpAUMWFXwZVHTCwj3Rz3NvA6OdB1uJeTlwMBven3
 K5+04rAjYPhgsZh1vr7PkJABA3UP443HdWYSw3MlyiZuVlX3U04douoUvNOTteEaZ0zQBj/mSgkzcvn05E/tqbktGUcckzLfmpp2/cjqClnt4xsNAAXOU9iZ
 UIfcRPuXZ/hjrV5R79t8DE+3gu/kRouMohr+VjryB4MwFZDpvSTo6Q/Tv0DnhbhuxAP7u9eM3WgLLvHLidBu1L1oxy9YMSS1wVpJEpG5aLg9nAr/wtecUjXp
 9vYMAu4YQl+yDttJyeKmP6Q6axhbxw6YAVEqcw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/06/2021 13:39, Stanimir Varbanov wrote:
> Add a control to set intra-refresh period.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst | 17 ++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c       |  2 ++
>  include/uapi/linux/v4l2-controls.h              |  1 +
>  3 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index addf44b99dfa..64c76a3a1205 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1175,9 +1175,24 @@ enum v4l2_mpeg_video_h264_entropy_mode -
>      macroblocks refreshed every frame. Each frame a successive set of
>      macroblocks is refreshed until the cycle completes and starts from
>      the top of the frame. Setting this control to zero means that
> -    macroblocks will not be refreshed.
> +    macroblocks will not be refreshed.  Note that this control will not
> +    take effect when ``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD`` control
> +    is set to non zero value.
>      Applicable to H264, H263 and MPEG4 encoder.
>  
> +``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD (integer)``
> +    Intra macroblock refresh period. This sets the period to refresh
> +    the whole frame. In other words, this defines the number of frames
> +    for which the whole frame will be intra-refreshed.  An example:
> +    setting period to 1 means that the whole frame will be refreshed,
> +    setting period to 2 means that the half of macroblocks will be
> +    intra-refreshed on frameX and the other half of macroblocks
> +    will be refreshed in frameX + 1 and so on. Setting the period to
> +    zero means no period is specified.
> +    Note that if the client sets this control to non zero value the
> +    ``V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB`` control shall be
> +    ignored. Applicable to H264 and HEVC encoders.
> +
>  ``V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE (boolean)``
>      Frame level rate control enable. If this control is disabled then
>      the quantization parameter for each frame type is constant and set
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index b6344bbf1e00..421300e13a41 100644
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
> @@ -1258,6 +1259,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
>  	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
> +	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index fdf97a6d7d18..5532b5f68493 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -435,6 +435,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
>  #define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX		(V4L2_CID_CODEC_BASE+233)
>  #define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES		(V4L2_CID_CODEC_BASE+234)
>  #define V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+235)
> +#define V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD	(V4L2_CID_CODEC_BASE+236)
>  
>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
> 

