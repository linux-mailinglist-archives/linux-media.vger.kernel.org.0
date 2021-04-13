Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1546835E341
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 17:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbhDMP45 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 11:56:57 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:48163 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229710AbhDMP44 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 11:56:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WLOtlG2drMxedWLOxljKxP; Tue, 13 Apr 2021 17:56:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618329391; bh=fbKN+dcTFfLjSUoDGz4bJfylcdVtY5sH5AxxmCSxPW4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=N9Ll5Vz8YEiRt1zxwuU3THQaPE1ttcB+TRHqivGDoCcf0x6K+OBXWE/LM/ZgQv6u8
         YjxBlBruNEokvX+GVGuiwQYdWS6SsX1+qgGKErrIgVp/GChwJwhS2pHIaOlvQ4yhuo
         tQGaGzHYDmHVna7+bRyqMJT5Ynmd71jfc4UyGg98jgo+11veKi/jHz2jOZBrR7+OPz
         t78FKAPH1cdgID85OmXhcRCqaiNngal9evIZtkKDnB9mQyhWQmhP/4FJJkld+Ca0Q9
         cxPfB/g6c4b9fXBFoqwhb9oQ+yTno6nBSGhD4QRm3/TL1372Q4TygbsQHNibdYf/v/
         xamXlmVdZ3pyw==
Subject: Re: [PATCH v3 1/2] media: v4l2-ctrls: Add intra-refresh period
 control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com
References: <20210302095340.3584204-1-stanimir.varbanov@linaro.org>
 <20210302095340.3584204-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <704d2df0-16dc-c1d6-d989-0ac176502cac@xs4all.nl>
Date:   Tue, 13 Apr 2021 17:56:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210302095340.3584204-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDFrCyqAh+B0ZXe8+BUoHZ23IxLestuAWQNZtVLasEsOfqE6jDu+qLGUSQ3CoXmE4lrYtIU3MDTvZ8QdImtg2GLPPnoLV+P8T4Z9joIKcoBWsz955NvQ
 Snvcxr5DADePb5g4/K7RxDcYI7fpO0Mf4GR06pCn5vhjSLuhJSgFdL+uGpom0X7PqZrdQNpFikux51QQsiYIpchNnepeEAteRP1/2UocnLbAKVh1TzgC+pE+
 OI6L2u+cJYkW1/xP3ah0MayLFeGNpfjaA8dW80Y1yw8ThRqOv+aLZfujWqZ7YuYyc8XZx/qbHRWZC5MDsDrhs43ubUYz5XOPEjN7pK4DRR0CcEhc5AcsZp/C
 8dX0uxwOxwyMZs3BsmENq56X9pPgo7rYY8mFBh7Ka7rUrGW8kp6ouSKn5yJ4+do6jZSk418u
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2021 10:53, Stanimir Varbanov wrote:
> Add a control to set intra-refresh period.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst      | 12 ++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                 |  2 ++
>  include/uapi/linux/v4l2-controls.h                   |  1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 00944e97d638..49e6d364ded7 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1104,6 +1104,18 @@ enum v4l2_mpeg_video_h264_entropy_mode -
>      macroblocks is refreshed until the cycle completes and starts from
>      the top of the frame. Applicable to H264, H263 and MPEG4 encoder.
>  
> +``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD (integer)``
> +    Intra macroblock refresh period. This sets the period to refresh
> +    the whole frame. In other words, this defines the number of frames
> +    for which the whole frame will be intra-refreshed.  An example:
> +    setting period to 1 means that the whole frame will be refreshed,
> +    setting period to 2 means that the half of macroblocks will be
> +    intra-refreshed on frameX and the other half of macroblocks
> +    will be refreshed in frameX + 1 and so on. Setting period to zero
> +    means no period is specified. Note that intra-refresh  is mutually

Double space after 'intra-refresh'

> +    exclusive with V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB control.

1) The same must be mentioned in the V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB
   control documentation as well.
2) What does it mean: 'mutually exclusive'? Does that mean that a driver
   implements only one or the other? If not, and both can be implemented, then
   how does userspace know which control is applied?

Also, you mentioned that V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB is
enumerated in the venus driver, but doesn't do anything. Wouldn't it be
better to remove it?

Regards,

	Hans

> +    Applicable to H264 and HEVC encoders.
> +
>  ``V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE (boolean)``
>      Frame level rate control enable. If this control is disabled then
>      the quantization parameter for each frame type is constant and set
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 016cf6204cbb..2ee463e08f1e 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -869,6 +869,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:	return "Decoder Slice Interface";
>  	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:	return "MPEG4 Loop Filter Enable";
>  	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:	return "Number of Intra Refresh MBs";
> +	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:		return "Intra Refresh Period";
>  	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:		return "Frame Level Rate Control Enable";
>  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
> @@ -1276,6 +1277,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
> +	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 039c0d7add1b..1fddd9f0d4f1 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -428,6 +428,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
>  #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
>  #define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID	(V4L2_CID_CODEC_BASE+230)
> +#define V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD	(V4L2_CID_CODEC_BASE+231)
>  
>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
> 

