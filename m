Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B70E2CBF26
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 15:10:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389025AbgLBOKU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 09:10:20 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:59723 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389011AbgLBOKU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 09:10:20 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kSp0kEZ3PN7XgkSp3ktOxl; Wed, 02 Dec 2020 15:09:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606918174; bh=8It+mUhWcNhF0vzprQdPV2Le0KNPLwCD1U2+v68bzUo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vXCSGQe7jYBcuWZBYxKr7+xUM8qqIvOPES4wii+Mj/wKErDcYpT98eOqP5nLVNl1F
         +DPLfKDIsbHytSY0smL6jKSr0E9Um8Q0tf3SMHOQy+WApnrhuoB7tnMeLOr5CQkQkv
         G4ixqlPOy2QOC9axIDZLYzyQrh4saIehyRU+uZHrATWOn0sBmB14MLJzPg9M+0ZSjU
         9tr6uHCnRHH3kY7HMDeF5kLID3yPxpGGCh8R5Uxg1huU38zxnsUn80ja5tT7l3bztz
         Lsgm3afZ2/t9H48AJh+Pcc2UpLiLZb11TNl0dyD2LIYYJqxvO1mipVJi7hQAILubld
         W+FkKGe5cirpw==
Subject: Re: [PATCH 1/4] v4l2-ctrl: Make display delay and display enable std
 controls
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20201109173541.10016-1-stanimir.varbanov@linaro.org>
 <20201109173541.10016-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e0a49eb2-f4d0-0532-52e0-5bc58ce85ad9@xs4all.nl>
Date:   Wed, 2 Dec 2020 15:09:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109173541.10016-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH4z1F2rSCh2o7ovDglbE7I63h5pvR0H4mAQBXX/CsvJ5Ai4XMH7fKhDjKKSS6Wubw6B6axvK3MnaxI+Z5fYdTMVz8rVmsKZhmxMavbwNcupviDfc6vf
 4bRzpJBgOGj8aH+6/9Tv/HpValbnVb/TjYR8ASRh2ejbVVLR/JGbrGmvVOaw1yVE8QQ8we3EJyBCzRgZqcAjiK7K22P1TcIWYgMw7epXSl7KW6o/PxVWYZ8F
 +yz70WxsT+0wgx2qLiQsRpeGOWjAU2FYvgyWcKsE550ZBXhqcdEwhonkJVg3btdO9h+ITaTvMnyfB2syuLBCbtyDho5Unvbh8jMyUxophvHTtjOB8Fffckyy
 ddhg+CqkQX/qTBR75JGikszM5/awJ4uh9aoGIPL2h1f4s/5X9GO/8dWPoPhLOPX1NOj+iFrEAGlDxxDKQGYOjcCdBzKSbKI71A91YW++Qs5SVoC0e5Nis09Z
 oDdsquDlsjYoeVRdqzg+1Ov/DgOvLMsfduopx5rZu7FApqHaJC74eairhQmCuws9nGzn8tCNP9wxPJsZUsSvgSWt3X++Pdb0JuvCQA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/11/2020 18:35, Stanimir Varbanov wrote:
> Make display delay and display delay enable MFC controls standard v4l
> controls. This will allow reuse of the controls for other decoder
> drivers. Also the new proposed controls are now codec agnostic because
> they could be used for any codec.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst   | 15 +++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c              |  4 ++++
>  include/uapi/linux/v4l2-controls.h                |  2 ++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index ce728c757eaf..82c9cda40270 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -679,6 +679,21 @@ enum v4l2_mpeg_video_frame_skip_mode -
>      otherwise the decoder expects a single frame in per buffer.
>      Applicable to the decoder, all codecs.
>  
> +``V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE (boolean)``

I'd use _DEC_ instead of _DECODER_.

> +    If the display delay is enabled then the decoder is forced to return
> +    a CAPTURE buffer (decoded frame) after processing a certain number
> +    of OUTPUT buffers. The delay can be set through
> +    ``V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY``. This
> +    feature can be used for example for generating thumbnails of videos.
> +    Applicable to the decoder.

Hmm. Is this: "after processing the first 'display delay' number of OUTPUT buffers."
Or is this: "every 'display delay' number of OUTPUT buffers."

I.e., is it a one-shot thing or a periodical thing?

If it is a one-shot thing, then this should probably be a button type, not
a boolean.

> +
> +``V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY (integer)``
> +    Display delay value for decoder. The decoder is forced to
> +    return a decoded frame after the set 'display delay' number of
> +    frames. If this number is low it may result in frames returned out
> +    of display order, in addition the hardware may still be using the
> +    returned buffer as a reference picture for subsequent frames.

Can this be 0? And if so, what does that mean?

> +
>  ``V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE (boolean)``
>      Enable writing sample aspect ratio in the Video Usability
>      Information. Applicable to the H264 encoder.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index bd7f330c941c..4a21802e026b 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -874,6 +874,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
>  	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
>  	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
> +	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY:		return "Display Delay";
> +	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE:	return "Display Delay Enable";
>  	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
> @@ -1221,6 +1223,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_FLASH_READY:
>  	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
>  	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
> +	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE:
>  	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
>  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
>  	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
> @@ -1256,6 +1259,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
> +	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 7035f4fb182c..d6b19f8d0022 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -773,6 +773,8 @@ enum v4l2_mpeg_video_frame_skip_mode {
>  	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT	= 1,
>  	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT	= 2,
>  };
> +#define V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY		(V4L2_CID_MPEG_BASE + 647)
> +#define V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE	(V4L2_CID_MPEG_BASE + 648)

This will need to be rebased once this PR is merged:
https://patchwork.linuxtv.org/project/linux-media/patch/d68da172-b251-000f-653d-38a8a4c7b715@xs4all.nl/

>  
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
> 

Regards,

	Hans
