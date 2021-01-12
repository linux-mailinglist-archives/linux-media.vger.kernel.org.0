Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D72B2F2C35
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 11:07:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391193AbhALKF4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 05:05:56 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:56427 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725877AbhALKF4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 05:05:56 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id zGY1kDacoVfyLzGY5kp3Fs; Tue, 12 Jan 2021 11:05:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610445913; bh=rWROg1JHwbdQ8ZfUE0XIhGOm+anaMeiAqHnUFTzVV8M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pWJ7+TAztdKzsf6cOU/3xilYiYruFpOny48JFxGLZ1IQimvtRcEtR8oeEUDOcuuZb
         +bxoI/LOvbxqK05YAMTDH+CnfFRFHz60QEJcuQGt3E8NTxx7n24wNwTL/v20yPi55b
         bnKGp8tGyGAmMhoFKywevP7VVzLS48fnFmVGUjtZ2NNOGQ8TJcYv/MP07dR1jlTrbu
         uoq3su8d4UJVjAacwPYeM31NziVONhnpJsGPZllSf2gpQk+pc4mwjyLm88AI8SE95d
         3nfKDwskM8joXV8KNmvfKrs/aeOtl7Nr2ZUmbZAgh0gNc7C6s4Yzc9cdfca+dMK4Qt
         JYCPdB1cK99FQ==
Subject: Re: [PATCH v2 1/4] media: v4l2-ctrls: Add intra-refresh period
 control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>
References: <20201206102717.19000-1-stanimir.varbanov@linaro.org>
 <20201206102717.19000-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6eb7ea37-e460-2884-9e07-6ff6f9a15414@xs4all.nl>
Date:   Tue, 12 Jan 2021 11:05:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201206102717.19000-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHT90d7mhin5WWalSTuhUnYSQEdOPpmkWhnTETeXwNN5wBrsM3gIxVIBrMg+5MtMk07eXeu9fj8EHgvwMkjghZcXlxMaE4103ZkxX3cAkKJMljoJ28jI
 ksAbbeReM2Ljc/wY+E38rYvoD/VRinP1SggYvxuY6o8VgEc2gUqngxu/mF33JOwhqPI4NUwnyvrOwXCNA0sXtfHKsb7oA1gpBCCyxySIlFStGn7qOC7QV4fS
 +LEAzIziuLr5FEeK1rPYL062Xwie3egc/arSVuRVshkzR2rG0igmq8mk+1PAniCEJJ4Z+W4itVhxvb7/cgc2ihbb3KlRIArvlRqNIpxlLna7HAWV7r0cL0Nc
 NW4uTcogtp39bQC6Rh/NCbcmz8omJnnsbe05RjNVjvzekSe4Tws2DL0lWBNp6DgCalNj31ofMKkXp4jEMTyOb7z1MWxq2w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/12/2020 11:27, Stanimir Varbanov wrote:
> Add a control to set intra-refresh period.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst       | 11 +++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                  |  2 ++
>  include/uapi/linux/v4l2-controls.h                    |  1 +
>  3 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 454ecd9a0f83..d65d7c1381b7 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1104,6 +1104,17 @@ enum v4l2_mpeg_video_h264_entropy_mode -
>      macroblocks is refreshed until the cycle completes and starts from
>      the top of the frame. Applicable to H264, H263 and MPEG4 encoder.
>  
> +``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD (integer)``
> +    Intra macroblock refresh period. This sets the period to refresh
> +    the whole frame. With other words, this defines the number of frames

With -> In

> +    for which the whole frame will be intra-refreshed.  An example:
> +    setting period to 1 means that the whole frame will be refreshed,
> +    setting period to 2 means that the half of macroblocks will be
> +    intra-refreshed on frameX and the other half of macroblocks
> +    will be refreshed in frameX + 1 and so on. Setting period to zero
> +    means no period is specified.
> +    Applicable to H264 and HEVC encoders.

I'm confused. Isn't this the same as V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB?
Except that here you don't give the number of macroblocks but instead the number
of frames it will take to fully refresh a frame and leave it to the driver to
calculate the number of macroblocks?

If I am right, then you need to clearly document the relationship between the
two controls, and what happens if you set them both.

It seems the venus driver already supports V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB,
so why add this control as well?

Regards,

	Hans

> +
>  ``V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE (boolean)``
>      Frame level rate control enable. If this control is disabled then
>      the quantization parameter for each frame type is constant and set
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 5cbe0ffbf501..ac44848d2d6e 100644
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
> @@ -1260,6 +1261,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
> +	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 823b214aac0c..54b9072ac49d 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -422,6 +422,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
>  #define V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+227)
>  #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
> +#define V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD	(V4L2_CID_CODEC_BASE+230)
>  
>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
> 

