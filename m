Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B432B67C4
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 15:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbgKQOrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 09:47:49 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:41923 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728198AbgKQOrs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 09:47:48 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id f2Ggkp8TI6LFvf2GkkVOGC; Tue, 17 Nov 2020 15:47:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1605624462; bh=ZNewCv5yw7gPIQ0uSlqYOilU68r1FGtpMr8cSacnusU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YgwZqsD4HRTVnQ0dDtiFdaAHBn/AZYQ0MzW0blpykx7khRlBuH3HTQBsSKlRvOrI+
         TltB8HjGLGEaupxoOwBJO1g6gGocrv+KmVganiMhEJClYzuncAOTj/n3rzMw68vhtu
         W9pp/JHXiIJMDENvXRN+iSlodeId5YqZABkunaZYoJFkG+IrePCgapoM/zHqNF0hkz
         oVXouPdIwOk+C2HOGKYQwy3AIELZIAECuz6ViT9LLr8hz0MITGU1FsJHSfoGx5qt4B
         5iGk7iXRH0Y5QKhpmasGX6aQRPewxwoInk5kRMsurXEOoEPLeF3xVihhnCIWXNTe2n
         b2QLEjqbzxbiA==
Subject: Re: [PATCH v3] media: v4l2-ctrl: add control for long term reference.
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     mchehab@kernel.org, ezequiel@collabora.com,
        stanimir.varbanov@linaro.org, vgarodia@codeaurora.org,
        majja@codeaurora.org
References: <1602759716-7584-1-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <395c52eb-e100-7d10-646d-c77b4238d392@xs4all.nl>
Date:   Tue, 17 Nov 2020 15:47:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1602759716-7584-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfL6qFHQvvhBxkrpgoWbOTgBrqfhbdzDJxG7Y122FjkFOBE9216LMW/M0l8YUYCPrCxnFLny6loWGM7LHAbNmf4VLvIEI+mxse7JokFxDEd39WOSyxgZZ
 u0flTXt0mUmHmJXlyowdAPamoWqc6tcM8f6WLyUZAOviVR5Vb6JuZ+GkOMudb2TjHz3wj8z5NCLqY6uqvEY7vmEStoIQRpOjSPBEYkwMjMVH2WvhkeEuDxzm
 sMdh5FAL/1SRJ6Na8wEUIgq0kaKJqxzMyVAFxdeVXTWyRV49ujChLzZq4BZl/92WroLL+lyOg63qBRhn0lFYmyzJqsFbR3pjRpKio1YMg0cmqGDeLh+C4qXQ
 7mI1kqxXdBySoDlRaEpaXi2+dU2cPtH5LQVnwigiKk/IrL1IEF/bwkIqhJMrtpS/I4cerzVA/jd+26a01zBnECzz0nNfxEHQT1FFjfmLjXA/dq/yCuqwVS7n
 ZVwtaYTfNwjwn8mos1yrsR6jdkWjW78IrBWNwg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dikshita,

I'm happy with the controls themselves, but the documentation needs more work:

On 15/10/2020 13:01, Dikshita Agarwal wrote:
> LTR (Long Term Reference) frames are the frames that are encoded
> sometime in the past and stored in the DPB buffer list to be used
> as reference to encode future frames.
> This change adds controls to enable this feature.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 25 ++++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c               | 12 +++++++++++
>  include/uapi/linux/v4l2-controls.h                 |  3 +++
>  3 files changed, 40 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index ce728c75..6e9240a 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -4382,3 +4382,28 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>        - Selecting this value specifies that HEVC slices are expected
>          to be prefixed by Annex B start codes. According to :ref:`hevc`
>          valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
> +
> +``V4L2_CID_MPEG_VIDEO_LTR_COUNT (integer)``
> +       Specifies the number of LTR frames encoder needs to generate or keep.

The term "LTR" isn't explained at all in this and the next two controls.

It is better to replace the first occurrence of "LTR" by:
"Long Term Reference (LTR)".

> +       This control is used to query or configure the number of LTR frames.
> +       If LTR Count is more than max supported LTR count by driver,
> +       it will be rejected.

You can drop this sentence: the driver will specify the maximum value, so you
can't set it to a value larger than the maximum.

> +       This is applicable to H264 and HEVC encoder and can be applied using
> +       request api.

request API -> Request API.

Does this control require the Request API? The next two control do need it, but
is it needed for this one?

Do you have a reference to the section of the H264 and HEVC documentation where
LTR is discussed? It is useful to refer to those sections to help the reader.

> +
> +``V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX (integer)``
> +       This control is used to mark current frame as LTR frame.
> +       this provides a LTR index that ranges from 0 to LTR count-1 and
> +       then the particular frame will be marked with that LTR index.

Rephrase this as:

"The current frame is marked as a Long Term Reference (LTR) frame and given this
 LTR index which ranges from 0 to LTR_COUNT-1."

> +       This is applicable to H264 and HEVC encoder and can be applied using
> +       request api.

Request API.

> +
> +``V4L2_CID_MPEG_VIDEO_USE_LTR_FRAME (bitmask)``

I'd rename this control to V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES since you can select
multiple frames.

> +       Specifies the LTR frame(s) to be used for encoding the current frame.
> +       This provides a bitmask which consists of bits [0, 15]. A total of N

Actually, I expect that the bits range from [0, LTR_COUNT-1], right?

> +       LSB bits of this field are valid, where N is the maximum number of
> +       LTRs supported. All the other bits are invalid and should be rejected.

I'd drop these two lines. This too is implicit in the control range information,
i.e. it is simply impossible to select bits outside the range.

> +       The LSB corresponds to the LTR index 0. Bit N-1 from the LSB corresponds
> +       to the LTR index max LTR count-1.

I would rephrase this to simply: "Bit N corresponds to LTR index N."

> +       This is applicable to H264 and HEVC encoder and can be applied using
> +       request api.

Request API.

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index bd7f330..046198f 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -949,6 +949,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Mark LTR frame index";

Wouldn't "Frame LTR Index" be a better name?

> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAME:			return "Use LTR Frame";

If USE_LTR_FRAME is renamed to USE_LTR_FRAMES, then so should the description.

>  	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
>  	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless Parameters";
> @@ -1258,6 +1261,15 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:

Does this need the V4L2_CTRL_FLAG_EXECUTE_ON_WRITE flag?

> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAME:
> +		*type = V4L2_CTRL_TYPE_BITMASK;
> +		*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>  	case V4L2_CID_PAN_RESET:
>  	case V4L2_CID_TILT_RESET:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index a184c49..3801372 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -415,6 +415,9 @@ enum v4l2_mpeg_video_multi_slice_mode {
>  #define V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+227)
>  #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+228)
>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_MPEG_BASE+229)
> +#define V4L2_CID_MPEG_VIDEO_LTR_COUNT                  (V4L2_CID_MPEG_BASE+230)
> +#define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX            (V4L2_CID_MPEG_BASE+231)
> +#define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAME              (V4L2_CID_MPEG_BASE+232)
>  
>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
> 

Regards,

	Hans
