Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A024B2F2C3A
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 11:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403960AbhALKG6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 05:06:58 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:49439 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390366AbhALKG6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 05:06:58 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id zGZ1kDb08VfyLzGZ5kp3UZ; Tue, 12 Jan 2021 11:06:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610445975; bh=9gjTF/3gD6d81SgCtPxdN5K9QJXqD4wWTa2DmR9v9u8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QggJrsmJbSzg8dVGA4/xf1lH4EhIlL6wgAMIvSIQNEXvSH3nOHsd+5nJSBEC1J/Bj
         A7TxwMpfIeXsuWyKmbuq/k9sd4v6vOWQv7+5lhjV8y9XfcnnJTsiVGUQ7EVulcXHJY
         yF7IY7s8z5vvzIv0SFing6e9PzUoOMH8d5cyYuIX2z90a8Spa5QVfnVbL2CifGqLjY
         SL83cwaNvOt/VzMD/zCAc47nHwocfDkj7wuuA+nf/Uj0AhqgLwo4/N0yxAl5f7oplU
         r/nnau7oQKk5z9eI8JdBs5egeqapUoL9nEArrcyWQheBTgPNsq/dujhnQbrILmTqDh
         db75dulO2F0kw==
Subject: Re: [PATCH v2 3/4] media: v4l2-ctrls: Add control for AUD generation
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>
References: <20201206102717.19000-1-stanimir.varbanov@linaro.org>
 <20201206102717.19000-4-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1b46d938-4a8c-148e-70ba-b49816a0ee95@xs4all.nl>
Date:   Tue, 12 Jan 2021 11:06:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201206102717.19000-4-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKxisxu4M+r3Nm3ajkdo4n1m6fBsNiOApuYZ9Wn28b5up+iY49WAOAC7DcDpbyuxwc4/RxNR3dcfVzlQkzIYdFRtCdIz31UUxK6J5dyHILilXYhH3McJ
 W7I3e83Lsmz/t/FLakYcJ3n0JgSE4CNv8liyu1pDzTYkSySTJ7X09m5OXKUUFS72gglVaz99/t9EYeZaBy7BibhVlHiEaUnZi0tC58QJXnWwC0GkKkctt0z6
 7SQ7vpLFk+Pmt/ZUpHBrnp2Y+RLk08MIt5NU5UbwvS0/UlfS0EKn2JSwHzAJ9rlU7nTQVcLDgq2kpa1Mgsw00WSUl8o1Gqex9XoP0ffGo2rGAUKE8eEWwqZM
 jPdmbVkLkms27A/gtkOiu4yMMVHdzxLFDLCNxeRAc4RTxE5avBtIs7MkJdHL/+/Z+r4CH8aTxxKhSaRzbPXe0jv8qSSRRQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/12/2020 11:27, Stanimir Varbanov wrote:
> Add a control to enable inserting of AUD NALU into encoded
> bitstream.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Looks good!

	Hans

> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 5 +++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                      | 2 ++
>  include/uapi/linux/v4l2-controls.h                        | 1 +
>  3 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index d65d7c1381b7..32eb233ee089 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -679,6 +679,11 @@ enum v4l2_mpeg_video_frame_skip_mode -
>      otherwise the decoder expects a single frame in per buffer.
>      Applicable to the decoder, all codecs.
>  
> +``V4L2_CID_MPEG_VIDEO_AU_DELIMITER (boolean)``
> +    If enabled then, AUD (Access Unit Delimiter) NALUs will be generated.
> +    That could be useful to find the start of a frame without having to
> +    fully parse each NALU. Applicable to the H264 and HEVC encoders.
> +
>  ``V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE (boolean)``
>      Enable writing sample aspect ratio in the Video Usability
>      Information. Applicable to the H264 encoder.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index ac44848d2d6e..ea2de8b51e29 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -875,6 +875,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
>  	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
>  	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
> +	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:			return "Generate Access Unit Delimiters";
>  	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
> @@ -1232,6 +1233,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:
> +	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
>  	case V4L2_CID_WIDE_DYNAMIC_RANGE:
>  	case V4L2_CID_IMAGE_STABILIZATION:
>  	case V4L2_CID_RDS_RECEPTION:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 54b9072ac49d..1fb1a3ba3985 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -423,6 +423,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
>  #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
>  #define V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD	(V4L2_CID_CODEC_BASE+230)
> +#define V4L2_CID_MPEG_VIDEO_AU_DELIMITER		(V4L2_CID_CODEC_BASE+231)
>  
>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
> 

