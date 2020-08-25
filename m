Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A87E251635
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 12:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729456AbgHYKEW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 06:04:22 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:52713 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726000AbgHYKEV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 06:04:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id AVoOkYOrquuXOAVoPk7QX1; Tue, 25 Aug 2020 12:04:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1598349858; bh=5CZunLEd5xnbFkpUz48qiQTHttRCVtgcuUVGBoE7kro=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BSD13bCELTO0+DqrZut+HtzDsKSgizA6NSozwCTaZfkSKtNvXjKyXMZE8dtV+CUgQ
         XnjAXzWZ87TL5j1e8PZeP23sm0ukDTg2DUXiwQGmcSEQ9PY6gUMRBYfubL5VncN9u9
         57dnI5oQMCx+twgoNOV32k7jC4KMHv3DJ5WQB0QZ8df1zWNUQjs+T4YmlxHLxx/kQF
         wK7F3x+Jtztb5FPRUYBVUkmzGukBjP5kDfOyfS9yfTGrTVy5l3LdzP8bZLylvTo1u5
         yczYJy4qJXaqFZCLgaUcfZRuSSmC6clMWI1JzxQHRj5T7OUfRDS79RNfZ5QAtsKF2+
         jEIswMo0fohDg==
Subject: Re: [PATCH v2] media: v4l2-ctrl: add control for long term reference.
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     mchehab@kernel.org, nicolas@ndufresne.ca, majja@codeaurora.org,
        stanimir.varbanov@linaro.org, vgarodia@codeaurora.org
References: <1597382967-32729-1-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <506c9e88-e54b-2534-0df9-f7855456dcd8@xs4all.nl>
Date:   Tue, 25 Aug 2020 12:04:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597382967-32729-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDdiqtOo6GCNqu7J8S9J81dzKRyGJWwRTup/WEpb3WTphfrTWQ+rHNZvYdI8lycVuu1b1Ce98t4ppZFrYepQvav6ujHwxSPexMQqCvw8DdwRi/fBLJ5l
 QNqTj0pyZ/NWcdEkp4zn6E3uHv959/FPzZW0cfjJg3YSMGKxn1WixNBWQ2WxWGGihWiez/BVzSR2yvnzrTY0pzPQ8W0/zjL3hJH/kOdRDfM6ZAWXPm2R6t7F
 wVcrIHTkbb+JryRxrN1P85xBNRWJ+CjcI6Oz5R4O2xX4negHvSZho53z50myGsGLC8VVshqQ3kaO+OmCvjxg19VnUVGOvZmywXueyxpd2C4KYy8kt67q5Ryv
 7DHv6JrItQ3/dqZz96ZGPJvtAH9OY6V7y6GHaNYiusCj0G44NjwC0G4FvAHtgCt/+WRdBdHgOnQPFkTd3mbg7NLSz7H0U8i7MEA27842ei53SxIvs3gvNnhC
 4TpLzd1G70pml98F3MKJ0ncQt7pKyZ1OoVsJd8eVjU+crluIS/i9WC5ouCvrwJzkTJ8BcQFymDIqlY9PXzjRxXv5TquYSmrY5yKOYji+ugoxo/GEq3TWNgFS
 3+8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/08/2020 07:29, Dikshita Agarwal wrote:
> LTR (Long Term Reference) frames are the frames that are encoded
> sometime in the past and stored in the DPB buffer list to be used
> as reference to encode future frames.
> This change adds controls to enable this feature.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 23 ++++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c               |  6 ++++++
>  include/uapi/linux/v4l2-controls.h                 |  4 ++++
>  3 files changed, 33 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index d0d506a..6d1b005 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -4272,3 +4272,26 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>        - Selecting this value specifies that HEVC slices are expected
>          to be prefixed by Annex B start codes. According to :ref:`hevc`
>          valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
> +
> +``V4L2_CID_MPEG_VIDEO_LTRCOUNT (enum)``

I prefer _LTR_COUNT (same for the other control defines).

I assume 'enum' is a mistake? This should be 'integer', right?

> +	Specifies the number of Long Term Reference frames encoder needs to
> +	generate or keep.
> +	This control is used to query or configure the number of Long Term
> +	Reference frames.

Add something like: "Applicable to the H264 and HEVC encoder."

> +
> +``V4L2_CID_MPEG_VIDEO_MARKLTRFRAME (enum)``
> +	This control is used to mark current frame as Long Term Reference
> +	frame.

enum -> integer
_MARK_LTR_FRAME

How about renaming this to: "_FRAME_LTR_INDEX"?

I would also suggest having the range as 0..LTR_COUNT where 0 means that
this is not a LTR frame. An alternative is to have two controls: one boolean
that determines if the frame is a LTR frame or not, and one control containing
the LTR index.

Is the LTR index 0 or 1 based according to the standard? I think that if it is
1 based you can use 0 to mean 'not an LTR frame'. If it is 0 based in the standard,
then having two controls might be better.

A third alternative might be to use -1 as the value to indicate that it is not
an LTR frame, but it feels hackish. I'm not sure yet.

> +	this provides a Long Term Reference index that ranges from 0
> +	to LTR count-1 and then the particular frame will be marked with that
> +	Long Term Reference index.

Add something like: "Applicable to the H264 and HEVC encoder."

This only makes sense when used with requests, right? Otherwise you cannot
reliably associate this control with a frame. That should be mentioned here.

> +
> +``V4L2_CID_MPEG_VIDEO_USELTRFRAME (enum)``

enum -> bitmask
_USE_LTR_FRAMES

> +	Specifies the Long Term Reference frame(s) to be used for encoding
> +	the current frame.
> +	This provides a bitmask which consists of bits [0, 15]. A total of N
> +	LSB bits of this field are valid, where N is the maximum number of
> +	Long Term Reference frames supported.
> +	All the other bits are invalid and should be rejected.
> +	The LSB corresponds to the Long Term Reference index 0. Bit N-1 from
> +	the LSB corresponds to the Long Term Reference index max LTR count-1.

Add something like: "Applicable to the H264 and HEVC encoder."

This too only makes sense when using requests, correct? That should be mentioned
here.

I assume that this must be set to 0 for LTR frames? Or at least this control will
be ignored for LTR frames.

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 3f3fbcd..3138c72 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -991,6 +991,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
> +	case V4L2_CID_MPEG_VIDEO_LTRCOUNT:		return "LTR Count";
> +	case V4L2_CID_MPEG_VIDEO_MARKLTRFRAME:		return "Mark LTR";
> +	case V4L2_CID_MPEG_VIDEO_USELTRFRAME:		return "Use LTR";

"Use LTR Frames"

>  
>  	/* CAMERA controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1224,6 +1227,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
> +	case V4L2_CID_MPEG_VIDEO_LTRCOUNT:
> +	case V4L2_CID_MPEG_VIDEO_MARKLTRFRAME:
> +	case V4L2_CID_MPEG_VIDEO_USELTRFRAME:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 6227141..f2daa86 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -742,6 +742,10 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
>  #define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 642)
>  #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
>  #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
> +#define V4L2_CID_MPEG_VIDEO_LTRCOUNT	(V4L2_CID_MPEG_BASE + 645)
> +#define V4L2_CID_MPEG_VIDEO_MARKLTRFRAME	(V4L2_CID_MPEG_BASE + 646)
> +#define V4L2_CID_MPEG_VIDEO_USELTRFRAME		(V4L2_CID_MPEG_BASE + 647)
> +
>  
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
> 

Regards,

	Hans
