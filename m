Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0FC930A63E
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 12:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233328AbhBALLZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 06:11:25 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:44307 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233111AbhBALLY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 06:11:24 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6X6LlvAM3efbk6X6PlgJ8O; Mon, 01 Feb 2021 12:10:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612177841; bh=k7XvEqsBC7bcNOg0zjPfcOkYLx7D9V/L2aLQPgX7CsU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RclMAo3i5fIXLP0QhPrBTixnN65teTphdKfrtsCw8/t6+xJsAdWuoJ/qSpNEoC52D
         j1sJLibWQia4Y5w4XjCAFRlq2UyHM6Mk7DXoYXR6Ab4JciTIfS/sq9dpT3UAiUgfLs
         WjnyENh+VnlGFixhM5NolMavxJMqlOjbzFyrKkdAxDd+HUSRrD/XfjOri6f9XGHqc3
         RP4vGCilgnec+7gvPwcyNPGKfM8T7WptmLhg+FDQ4wGLiRwhaC3vAUglcpmtlGnkYM
         wqycW2RxaNkZghrAq5yAayRD/PQdtNZXFtY7+bGg01Th0Ng9ZaG1KrzCQgmlyAUdxL
         xdLusXfewoZUQ==
Subject: Re: [PATCH v6 1/2] media: v4l2-ctrl: add controls for long term
 reference.
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1611553919-17919-1-git-send-email-dikshita@codeaurora.org>
 <1611553919-17919-2-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9b5bd3aa-ca42-0c0f-dfde-de86b27affe4@xs4all.nl>
Date:   Mon, 1 Feb 2021 12:10:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1611553919-17919-2-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOc4NvLP67ObFJSxe+3fAIL6QL0HFM2ei6OhPQQAb1b64+tbKV6/8JJiqD/psszXSoHK2KzXBFJvjBDnWhGrlE9mv7RVkwFyfkhqhRf+BTlFs+SI+zZt
 i7FX+IcuaOqLlp0taH8F1jsoL406gkvwl7c4lRB7b7y/4ABZt5rqY0AFghVONuB+rbv1oIu9UE0fCxEcQhiITCP990JvzLhE+8PI83H5i+SlQHUaRF0GXUBe
 xWJj/RVuX1XZl2MCSte+oUDspTYEwOVbqafv89ZXRxNAZxMVl1T8tCKKcIQOA3GfoRndSOQjZZk2FE2oOJg04886X2Gug1aJ9nAgEuHWdFcVtnyfz4vGiKuu
 UVs8wDa40r9GVcDtUTSdFL0iWOCuyGUy8II/eWmO9NSBAXwK9os=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/01/2021 06:51, Dikshita Agarwal wrote:
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
> index 400774c..a37d460 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -3637,3 +3637,21 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>        - Selecting this value specifies that HEVC slices are expected
>          to be prefixed by Annex B start codes. According to :ref:`hevc`
>          valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
> +
> +``V4L2_CID_MPEG_VIDEO_LTR_COUNT (integer)``
> +       Specifies the number of Long Term Reference (LTR) frames encoder needs

frames encoder -> frames the encoder

> +       to generate or keep. This is applicable to the H264 and HEVC encoders.

Isn't this really the maximum number of LTR frames? I.e., the actual number
of LTR frames is something that is determined by userspace, right?

And you say 'generate or keep': but the encoder doesn't generate LTR frames,
they are marked as such by userspace. So this text would be just: "to keep".

Or am I wrong?

Regards,

	Hans

> +
> +``V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX (integer)``
> +       The current frame is marked as a Long Term Reference (LTR) frame
> +       and given this LTR index which ranges from 0 to LTR_COUNT-1.
> +       This is applicable to the H264 and HEVC encoders and can be applied using
> +       Request API.
> +       Source Rec. ITU-T H.264 (06/2019); Table 7.9
> +
> +``V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES (bitmask)``
> +       Specifies the Long Term Reference (LTR) frame(s) to be used for
> +       encoding the current frame.
> +       This provides a bitmask which consists of bits [0, LTR_COUNT-1].
> +       This is applicable to the H264 and HEVC encoders and can be applied using
> +       Request API.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 16ab54f..84c1eb8 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -950,6 +950,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
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

