Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A81A81D905A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 08:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgESGxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 02:53:15 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:58061 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726841AbgESGxP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 02:53:15 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id aw7hj0Ey2tKAsaw7kjOvD7; Tue, 19 May 2020 08:53:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589871193; bh=Ua/Rh1jOjXzr3/TuekSvHN/AoVWwSnLpt91fLWvkvRQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=L+oC/Jmjh2cFpViFqxKFurLG7iiTd+9gLDUXeMbolCH4lXYIiL4ALwmyqG5EZLCnd
         8mhpwp+PG3Y360zqPOMhNNm/Gc/sKxe5TKNbmwvNArCMiALAFKxNt5nVqC2Edu3gJN
         k4VCN1C6RoMeySee8kjvUHPA4RO2ho+cJXt5HflxHdAqof/RGTUi69aEbqncNsSd/k
         rqYk8diCyTv4GdgtSjHOsxAUu8AonrXXVveOhn3k/f91gDTG3jiF3daQJQ+uv42xRj
         UZb+gpEZpscL2SFm9um+jCYKy5GwAVeVi/zeLZk40OCZhxXx+B6fRrPyt76Yss2dS6
         DdpPeaOPvW5aA==
Subject: Re: [PATCH] media: v4l2-ctrls: add encoder skip frames control
To:     Maheshwar Ajja <majja@codeaurora.org>, mchehab@kernel.org,
        ezequiel@collabora.com, p.zabel@pengutronix.de,
        paul.kocialkowski@bootlin.com, jonas@kwiboo.se,
        posciak@chromium.org, boris.brezillon@collabora.com,
        ribalda@kernel.org, tglx@linutronix.de, sumitg@nvidia.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1589853951-27948-1-git-send-email-majja@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ba650d43-2d1d-bba7-383a-db55e9ce4f8a@xs4all.nl>
Date:   Tue, 19 May 2020 08:53:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1589853951-27948-1-git-send-email-majja@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBdGLGyDxqJBDhS4e1zv0v3mcuFZ3y4Tg1jyH0FDCqJs3x5d04ojQqEHC1xdyvODYpHRanzoCnfo6paJpmIeNZANOqQxM4a3CnU89qHsyoQcXYdPJyNt
 Bl+1zahgUy6nYGflF2HRpW1ZAzWclHG42GZD6BpD0MZ7Ytfzb9RmvBLbUt9NRNjvrG7aOmajIhRt9WVIzehFp2zCpZh+m3/Sp6q35+oTFdpO/ym5uc+VGkk5
 z/svh8k3hj/xIzLgwOeROGqqMBkS9JK+5e0CvyC1s5THeJ9zT0ytRm6GPjTEMBZv1fbjCWr85XQcTxHLgvd4DFz8dooMvkRVhekw9DbA7TXixNn5hueez/Fe
 EKZAA38iBr7QrcdCpsSnOubQkRLgWNqU3QnhDOTzVmre3yMqxyd/p0Hwvgf6hc5sfZi9aOu+BSeXy9KYl8VSn8zIK1raV67KTNQRHfS4vHepglyI901jy3rG
 l6uG1HtZPeE1ez+Ua/0NdubrXpXXh4uEU8QPa5I5oEuggfjB8p6ycVrE34bOIWsBfWjCVcvPhwPtsSkL4zKo0Phz8tGc/1zJa7TSEn3xF/a0XMhZ2tYOCQOS
 LdQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/05/2020 04:05, Maheshwar Ajja wrote:
> If V4L2_CID_MPEG_VIDEO_ENC_SKIP_FRAMES control is enabled
> encoder can drop frames, if required, to achieve target bitrate
> instead of modifying the quantization parameter which lowers
> the encoded frame quality.
> 
> Reference: 4.3.8.1 OMX_Video_ControlRateConstantSkipFrames
> https://www.khronos.org/registry/OpenMAX-IL/specs/OpenMAX_IL_1_1_2_Specification.pdf
> 
> Signed-off-by: Maheshwar Ajja <majja@codeaurora.org>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 7 +++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                      | 2 ++
>  include/uapi/linux/v4l2-controls.h                        | 1 +
>  3 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index d0d506a..bc9265d 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1081,6 +1081,13 @@ enum v4l2_mpeg_video_h264_entropy_mode -
>      Macroblock level rate control enable. Applicable to the MPEG4 and
>      H264 encoders.
>  
> +``V4L2_CID_MPEG_VIDEO_ENC_SKIP_FRAMES (boolean)``
> +    Encoder skip frames enable. This control is applicable only if
> +    ``V4L2_CID_MPEG_VIDEO_BITRATE_MODE`` control is set. If this control
> +    is enabled encoder can drop frames, if required, to achieve target
> +    bitrate instead of modifying the quantization parameter which lowers
> +    the encoded frame quality.

It's a bit unclear for which bitrate modes this control is valid: only for
MODE_CBR, or also for the constant quality bitrate mode? Or both?

The phrase 'control is set' is meaningless for a menu control: it really is
always 'set'. So that needs to be reworked so it is more explicit.

Also note that there is an Exynos MFC control that appears to do something
similar: V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE.

To what extent does that overlap with the functionality proposed here?

It looks like this proposed control is basically the equivalent of setting
V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE to V4L2_MPEG_MFC51_FRAME_SKIP_MODE_LEVEL_LIMIT.

So perhaps this MFC control should be promoted to a standard MPEG control instead
of inventing a new control?

Regards,

	Hans

> +
>  ``V4L2_CID_MPEG_VIDEO_MPEG4_QPEL (boolean)``
>      Quarter pixel motion estimation for MPEG4. Applicable to the MPEG4
>      encoder.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 1c617b4..d2cb766 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -914,6 +914,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless Parameters";
>  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>  	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
> +	case V4L2_CID_MPEG_VIDEO_ENC_SKIP_FRAMES:		return "Encoder Skip Frames";
>  
>  	/* VPX controls */
>  	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
> @@ -1180,6 +1181,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
>  	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
>  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
> +	case V4L2_CID_MPEG_VIDEO_ENC_SKIP_FRAMES:
>  	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
>  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 0ba1005..d3bc015 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -742,6 +742,7 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
>  #define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 642)
>  #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
>  #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
> +#define V4L2_CID_MPEG_VIDEO_ENC_SKIP_FRAMES		(V4L2_CID_MPEG_BASE + 645)
>  
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
> 

