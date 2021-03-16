Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161D933D3CD
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 13:28:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhCPM1b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 08:27:31 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60213 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231425AbhCPM1G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 08:27:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M8mql1pLe4ywlM8mtlAtwF; Tue, 16 Mar 2021 13:27:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615897623; bh=6iyuWBEaCR9Z2/eYJqI8HRuKApD0UYWpPB8vtpZ/lHQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Ya5O6l5jIa8CzxpJKoAqXPPdejEc4bG410jeYgCnP8+UX6KG/IZNlu4xZtu6jqyO9
         7VfJVbI7C5WNfd4uhLTomc+B6wyqVnW5PnxB5Id3Tz+zkW+1qf6iAGVvwav6BuOm2L
         UWxeagpGEKpA1viy/3fn5wiy2nWTpwuaOD3RFqJd+jfFiRLqgQlGNLJ/7ihGTUbhDV
         vpAiJYpFkuD0c/TfWDjg2/hbVAZaQ4U2tuxflmtwnRL+n0IsiQu2HfnPyhxaZ5IMFW
         aHDW/GteXvAHGn5L9brWXDLR10Tg8Y2yTlo4bi70mFmCa0MCfSArixQqE/+liIUKWh
         1x0qdBWpIxzLg==
Subject: Re: [PATCH v8 1/2] media: v4l2-ctrl: add controls for long term
 reference.
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1615461901-16675-1-git-send-email-dikshita@codeaurora.org>
 <1615461901-16675-2-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <204c7174-b649-497e-5c8d-6afd859ac0e9@xs4all.nl>
Date:   Tue, 16 Mar 2021 13:27:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1615461901-16675-2-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDOp7UJWtycKZnqYiJpFPSMPg5VjlWf08HX8hF924rs3A/z0gRijFA6Hzy7tU3fND/E9EnZuyH5dKWNpOdFN5MlcH9JVuzUutfx+ZjdS/rGaZbrFjKMh
 zDiCNN5UI6Ii1KvBcrgsOdSARQbdWlMT7c9ML8DTn2DB48hFDBG+OKuOsH3+2K+ZZR3s8K1jZGAFqssnxTUpanv+TrAiWi97/u6im56nhmnbK7c7Tn3FjQWC
 CPOxFftWLUJF10XHrWjwe6WRdYoSubdySQcPoNDubbaEpBosZnhqGMCuYp5dD5l3NAP0gW1+yxVUWmv2mEUxQFsaeiFnWg66iBfDJQrxCpx8MXbLoZtUIgjM
 yD+UNPybfpOgzvT539rjPS9UxlIeECBFqUVyylJT45VdjY1xyw8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/03/2021 12:25, Dikshita Agarwal wrote:
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
> index 00944e9..be81bd9 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -3646,3 +3646,21 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>      so this has to come from client.
>      This is applicable to H264 and valid Range is from 0 to 63.
>      Source Rec. ITU-T H.264 (06/2019); G.7.4.1.1, G.8.8.1.
> +
> +``V4L2_CID_MPEG_VIDEO_LTR_COUNT (integer)``
> +    Specifies the maximum number of Long Term Reference (LTR) frames at any
> +    given time that the encoder can keep.
> +    This is applicable to the H264 and HEVC encoders.
> +
> +``V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX (integer)``
> +    After setting this control the frame that will be queued next
> +    will be marked as a Long Term Reference (LTR) frame
> +    and given this LTR index which ranges from 0 to LTR_COUNT-1.
> +    This is applicable to the H264 and HEVC encoders.
> +    Source Rec. ITU-T H.264 (06/2019); Table 7.9
> +
> +``V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES (bitmask)``
> +    Specifies the Long Term Reference (LTR) frame(s) to be used for
> +    encoding the next frame queued after setting this control.
> +    This provides a bitmask which consists of bits [0, LTR_COUNT-1].
> +    This is applicable to the H264 and HEVC encoders.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 016cf62..4d444de 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -951,6 +951,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
>  	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:		return "Base Layer Priority ID";
> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
>  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
> @@ -1278,6 +1281,17 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
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
> index 039c0d7..fedbb54 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -428,6 +428,9 @@ enum v4l2_mpeg_video_multi_slice_mode {
>  #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
>  #define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID	(V4L2_CID_CODEC_BASE+230)
> +#define V4L2_CID_MPEG_VIDEO_LTR_COUNT			(V4L2_CID_CODEC_BASE+231)
> +#define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX		(V4L2_CID_CODEC_BASE+232)
> +#define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES		(V4L2_CID_CODEC_BASE+233)
>  
>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
> 

It was a long journey, but here is finally my coveted:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Congratulations! :-)

I assume that Stan will pick this up this series.

Regards,

	Hans
