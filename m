Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C709D305B60
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:30:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343515AbhA0M3n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 07:29:43 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:51963 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233266AbhA0M0w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 07:26:52 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 4jtDlXrtHI2394jtHlhHxa; Wed, 27 Jan 2021 13:25:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611750347; bh=5pnR9efidnDm0mE/2lo2491Qu6WM408Ua+znGofrnok=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vafleieXoGTn0LiFzQRDJhPuIWcKMPDuK47p9kQRA8sT02yjTJrQGmRPaFtXnDPbS
         jdfaV0lSUQix+L/n25N/UOb+S+icROm8r3e/owC/CPQ58aDKsudbZsUcAitxGICMRB
         gm94zN2950r5DsXz9mbrxfqvi1UJ4CYY4KQ6bp7m0agloO+1nDiTgqth/6lGzbQl/w
         AV0WY3drm7AgfuCksec2LdwyvyuVyxTAJuzOYgRSTrV0L9NlBuE/jLwQgWXvY55m05
         VFnyFYK+dgpB/dHXb4gP77Pm75DylUP+FDv3iF9vriUUHzivHfF01wajSH808LR92k
         /bhgefovyw0Pw==
Subject: Re: [PATCH v2 1/4] v4l2-ctrl: Make display delay and display enable
 std controls
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210115092607.29849-1-stanimir.varbanov@linaro.org>
 <20210115092607.29849-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <22d84616-b7d1-095b-3bec-e894e19b72ca@xs4all.nl>
Date:   Wed, 27 Jan 2021 13:25:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115092607.29849-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOAL65zyTC//yHf/SmChGe0Jj5VEkIjPCNGV7ilNw4tN8cO5MWSM5f3QdN+ufKM58/AmsOQO6nCGisvrRbS4o/dhFAJuVkb9X6ylRBP/QdPyVfKH4RH3
 E0XWsN8GxEAv4AmTIpoUb9D3NLEnEbS1lYrn4GhJQecYVmVuusHQmw/0drz8ROI62ZXeXkdL8P6VVopyBQ71xFPwIb3qiQJq1YPL2px3ccG9uiEMp6ku7J2o
 +aZBgpRLKqKEd/FaRHk21gZvubkwEl+R4VEU2b56LbebblSLuhctk1357AX4LHjUdjWpmeKOeQAtUNYYB9KjS2mpNa/troYb0nYVkPBadeaTelhpQjwVBWKK
 eDLvOXiNhxBEpFHYZI1KTW+QV9yUxQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/01/2021 10:26, Stanimir Varbanov wrote:
> Make display delay and display delay enable MFC controls standard v4l
> controls. This will allow reuse of the controls for other decoder
> drivers. Also the new proposed controls are now codec agnostic because
> they could be used for any codec.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst   | 15 +++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c              |  4 ++++
>  include/uapi/linux/v4l2-controls.h                |  3 +++
>  3 files changed, 22 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 00944e97d638..5d7c47837035 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -679,6 +679,21 @@ enum v4l2_mpeg_video_frame_skip_mode -
>      otherwise the decoder expects a single frame in per buffer.
>      Applicable to the decoder, all codecs.
>  
> +``V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE (boolean)``
> +    If the display delay is enabled then the decoder is forced to return
> +    a CAPTURE buffer (decoded frame) after processing a certain number
> +    of OUTPUT buffers. The delay can be set through
> +    ``V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY``. This
> +    feature can be used for example for generating thumbnails of videos.
> +    Applicable to the decoder.
> +
> +``V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY (integer)``
> +    Display delay value for decoder. The decoder is forced to
> +    return a decoded frame after the set 'display delay' number of
> +    frames. If this number is low it may result in frames returned out
> +    of display order, in addition the hardware may still be using the
> +    returned buffer as a reference picture for subsequent frames.
> +
>  ``V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE (boolean)``
>      Enable writing sample aspect ratio in the Video Usability
>      Information. Applicable to the H264 encoder.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index f7b310240af2..2ae305d6db01 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -874,6 +874,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
>  	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
>  	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
> +	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:		return "Display Delay";
> +	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:	return "Display Delay Enable";
>  	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
> @@ -1241,6 +1243,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_FLASH_READY:
>  	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
>  	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
> +	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
>  	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
>  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
>  	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
> @@ -1276,6 +1279,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
> +	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 039c0d7add1b..4b361fdce231 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -797,6 +797,9 @@ enum v4l2_mpeg_video_frame_skip_mode {
>  #define V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP        (V4L2_CID_CODEC_BASE + 651)
>  #define V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP        (V4L2_CID_CODEC_BASE + 652)
>  
> +#define V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY		(V4L2_CID_CODEC_BASE + 653)
> +#define V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE	(V4L2_CID_CODEC_BASE + 654)
> +
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
>  #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)
> 

