Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0142F2AA1
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 10:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405844AbhALJCO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 04:02:14 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:57069 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405818AbhALJCN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 04:02:13 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id zFYLkDEFWVfyLzFYOkoont; Tue, 12 Jan 2021 10:01:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610442090; bh=PLv5Zm/5yN/UlNFm/B3Y5TFJb1kCSq8q5lmCw3WqoN0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Xvn8QPL/2GqTGjKTDvZ5aXGKZUY9JJwRXiTASA53aRVvV1OjHlLpEvPo7M8uJhxxR
         dbznOruhgE2nO4vA6xL2AHjOz2wdzc2uOK9SqOQJjlO0QOjvNoq3SDnavWjuDEPrrg
         llNOUwdByDv7jZrAqdSpKx4H/q2moxOESMZomWjWi5Ap0p4583bNpu29E1AXmOQHcl
         GyZWq01k+7ybeKNXBfWQZZuWRF2AhXfZf3jeVeRNdQw4i2VkOxLaXg8Gs/rNzIEiR5
         lrUfk528HJSRb4mr2PbuRRaB+7r0KBfmReWBt7Au+UBtEr8U+uwl9aZnGiDXjKJhOv
         4Zf9TVylexEoQ==
Subject: Re: [PATCH v5 1/2] media: v4l2-ctrl: add control for long term
 reference.
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1609736971-14454-1-git-send-email-dikshita@codeaurora.org>
 <1609736971-14454-2-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <28e89e0c-3fd4-4d19-e4d2-5014e2be9398@xs4all.nl>
Date:   Tue, 12 Jan 2021 10:01:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1609736971-14454-2-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNTpl36iStQ8onR9MKi02JJTNL/r26c3ARVETgkBPILENvbEPhrZF6/v0HXd58vR5IJNUNMuXjVSV1kWXKty0cy46WBfiOPqYo7ccrWiHuXnegmWcg6j
 reJDjAK+Ywn/ZmRr25yfPwIIgssDJg/Gju7p3ZgLJmYRtYaM5jkhxXC4akElDJ8Fjmi59P996fu7nbHIe1irUldGivzrggIJA/moVztYgUSrozQnz2Sz+Ka7
 SyzaZ5VZ0qK6YKMN/TAZTdBSkXaLIM8qRceI9RPCyl1A9BZdan+Y4gKd7k6i+gWWc/qWnBeG010VBlRpS5LKE2L9cYzt4OvG3Z97PhZfnGWGWYouEhhxu/2j
 uJxpxOJVL4BWuCdJJjlsFSsi0q6RoCZuZM65Zb84uVq9l90IKtA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/01/2021 06:09, Dikshita Agarwal wrote:
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
> index 400774c..1675bcf 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -3637,3 +3637,21 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>        - Selecting this value specifies that HEVC slices are expected
>          to be prefixed by Annex B start codes. According to :ref:`hevc`
>          valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
> +
> +``V4L2_CID_MPEG_VIDEO_LTR_COUNT (integer)``
> +       Specifies the number of Long Term Reference (LTR) frames encoder needs
> +       to generate or keep. This is applicable to H264 and HEVC encoder.

This is applicable to the H264 and HEVC encoders.

> +
> +``V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX (integer)``
> +       The current frame is marked as a Long Term Reference (LTR) frame
> +       and given this LTR index which ranges from 0 to LTR_COUNT-1.
> +       This is applicable to H264 and HEVC encoder and can be applied using
> +       Request Api.

This is applicable to the H264 and HEVC encoders

Request Api -> the Request API

> +       Source Rec. ITU-T H.264 (06/2019); Table 7.9
> +
> +``V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES (bitmask)``
> +       Specifies the Long Term Reference (LTR) frame(s) to be used for
> +       encoding the current frame.
> +       This provides a bitmask which consists of bits [0, LTR_COUNT-1].
> +       This is applicable to H264 and HEVC encoder and can be applied using
> +       Request Api.

This is applicable to the H264 and HEVC encoders

Request Api -> the Request API

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 16ab54f..2ad6b5a 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -950,6 +950,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "frame LTR index";

Use proper capitals:

"Frame LTR Index"

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

Regards,

	Hans
