Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8517E253E75
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 08:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgH0G7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 02:59:33 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:42598 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726266AbgH0G7c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 02:59:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598511570; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TqJw7zVx0yYmXZ8LApzC4RLV+IwHsqsHzaga/yqDV+g=;
 b=dWtHFpEMTI9urOHOmj1tAx2pa/gRqKoQdCclLFjnXquKCfStJfhBAws/KUcNVJFmh1T6uCq1
 7B70BzxFNb3RE0vvvrhTJLrde9n1yTNBPkezGciyLks8mBFm1ZJFkr4/3RPiQqdMc+mc2RHA
 xind71nQ+PFyG7nnbYe5WktX3j4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f4759bff4c0f8ce20e4f8bf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 27 Aug 2020 06:59:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 44C4FC433CB; Thu, 27 Aug 2020 06:59:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 194D3C433CA;
        Thu, 27 Aug 2020 06:59:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 27 Aug 2020 12:29:09 +0530
From:   dikshita@codeaurora.org
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
        nicolas@ndufresne.ca, majja@codeaurora.org,
        stanimir.varbanov@linaro.org, vgarodia@codeaurora.org
Subject: Re: [PATCH v2] media: v4l2-ctrl: add control for long term reference.
In-Reply-To: <506c9e88-e54b-2534-0df9-f7855456dcd8@xs4all.nl>
References: <1597382967-32729-1-git-send-email-dikshita@codeaurora.org>
 <506c9e88-e54b-2534-0df9-f7855456dcd8@xs4all.nl>
Message-ID: <b6c14a61a5a63b68a07a539f39b88477@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for your comments.

On 2020-08-25 15:34, Hans Verkuil wrote:
> On 14/08/2020 07:29, Dikshita Agarwal wrote:
>> LTR (Long Term Reference) frames are the frames that are encoded
>> sometime in the past and stored in the DPB buffer list to be used
>> as reference to encode future frames.
>> This change adds controls to enable this feature.
>> 
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> ---
>>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 23 
>> ++++++++++++++++++++++
>>  drivers/media/v4l2-core/v4l2-ctrls.c               |  6 ++++++
>>  include/uapi/linux/v4l2-controls.h                 |  4 ++++
>>  3 files changed, 33 insertions(+)
>> 
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst 
>> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index d0d506a..6d1b005 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -4272,3 +4272,26 @@ enum v4l2_mpeg_video_hevc_size_of_length_field 
>> -
>>        - Selecting this value specifies that HEVC slices are expected
>>          to be prefixed by Annex B start codes. According to 
>> :ref:`hevc`
>>          valid start codes can be 3-bytes 0x000001 or 4-bytes 
>> 0x00000001.
>> +
>> +``V4L2_CID_MPEG_VIDEO_LTRCOUNT (enum)``
> 
> I prefer _LTR_COUNT (same for the other control defines).
> 
> I assume 'enum' is a mistake? This should be 'integer', right?
Right, I will correct it at all the places.
> 
>> +	Specifies the number of Long Term Reference frames encoder needs to
>> +	generate or keep.
>> +	This control is used to query or configure the number of Long Term
>> +	Reference frames.
> 
> Add something like: "Applicable to the H264 and HEVC encoder."
Sure.
> 
>> +
>> +``V4L2_CID_MPEG_VIDEO_MARKLTRFRAME (enum)``
>> +	This control is used to mark current frame as Long Term Reference
>> +	frame.
> 
> enum -> integer
> _MARK_LTR_FRAME
> 
> How about renaming this to: "_FRAME_LTR_INDEX"?
You are suggesting to rename it to V4L2_CID_MPEG_VIDEO_MARK_LTR_FRAME or 
V4L2_CID_MPEG_VIDEO_MARK_FRAME_LTR_INDEX ?
> 
> I would also suggest having the range as 0..LTR_COUNT where 0 means 
> that
> this is not a LTR frame. An alternative is to have two controls: one 
> boolean
> that determines if the frame is a LTR frame or not, and one control 
> containing
> the LTR index.
> 
> Is the LTR index 0 or 1 based according to the standard? I think that 
> if it is
> 1 based you can use 0 to mean 'not an LTR frame'. If it is 0 based in
> the standard,
> then having two controls might be better.
> 
> A third alternative might be to use -1 as the value to indicate that it 
> is not
> an LTR frame, but it feels hackish. I'm not sure yet.
> 
Could you please help me to understand how this info will be helpful?
This control won't be set by client for every frame. So a frame for 
which this control is not set
is not a LTR frame and a frame for which this control is set is a LTR 
frame and will be marked with
LTR index ranging from 0 to LTR_COUNT-1 (range is according to standard)
>> +	this provides a Long Term Reference index that ranges from 0
>> +	to LTR count-1 and then the particular frame will be marked with 
>> that
>> +	Long Term Reference index.
> 
> Add something like: "Applicable to the H264 and HEVC encoder."
sure, will add.
> 
> This only makes sense when used with requests, right? Otherwise you 
> cannot
> reliably associate this control with a frame. That should be mentioned 
> here.
Sure, will add.
> 
>> +
>> +``V4L2_CID_MPEG_VIDEO_USELTRFRAME (enum)``
> 
> enum -> bitmask
> _USE_LTR_FRAMES
Will correct this in next patch.
> 
>> +	Specifies the Long Term Reference frame(s) to be used for encoding
>> +	the current frame.
>> +	This provides a bitmask which consists of bits [0, 15]. A total of N
>> +	LSB bits of this field are valid, where N is the maximum number of
>> +	Long Term Reference frames supported.
>> +	All the other bits are invalid and should be rejected.
>> +	The LSB corresponds to the Long Term Reference index 0. Bit N-1 from
>> +	the LSB corresponds to the Long Term Reference index max LTR 
>> count-1.
> 
> Add something like: "Applicable to the H264 and HEVC encoder."
> 
> This too only makes sense when using requests, correct? That should be 
> mentioned
> here.
Sure, will do.
> 
> I assume that this must be set to 0 for LTR frames? Or at least this
> control will
> be ignored for LTR frames.
Yes, frames marked as LTR frames will not be encoded by using any other 
LTR frame as a reference.
So this control won't be set for LTR frames.
This will be set only for the frames which needs to be encoded by using 
an LTR frame as a reference.
> 
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c 
>> b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index 3f3fbcd..3138c72 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -991,6 +991,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice 
>> Parameters";
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode 
>> Mode";
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
>> +	case V4L2_CID_MPEG_VIDEO_LTRCOUNT:		return "LTR Count";
>> +	case V4L2_CID_MPEG_VIDEO_MARKLTRFRAME:		return "Mark LTR";
>> +	case V4L2_CID_MPEG_VIDEO_USELTRFRAME:		return "Use LTR";
> 
> "Use LTR Frames"
> 
>> 
>>  	/* CAMERA controls */
>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>> @@ -1224,6 +1227,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, 
>> enum v4l2_ctrl_type *type,
>>  		break;
>>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
>>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
>> +	case V4L2_CID_MPEG_VIDEO_LTRCOUNT:
>> +	case V4L2_CID_MPEG_VIDEO_MARKLTRFRAME:
>> +	case V4L2_CID_MPEG_VIDEO_USELTRFRAME:
>>  		*type = V4L2_CTRL_TYPE_INTEGER;
>>  		break;
>>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>> diff --git a/include/uapi/linux/v4l2-controls.h 
>> b/include/uapi/linux/v4l2-controls.h
>> index 6227141..f2daa86 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -742,6 +742,10 @@ enum 
>> v4l2_cid_mpeg_video_hevc_size_of_length_field {
>>  #define 
>> V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 642)
>>  #define 
>> V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
>>  #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE 
>> + 644)
>> +#define V4L2_CID_MPEG_VIDEO_LTRCOUNT	(V4L2_CID_MPEG_BASE + 645)
>> +#define V4L2_CID_MPEG_VIDEO_MARKLTRFRAME	(V4L2_CID_MPEG_BASE + 646)
>> +#define V4L2_CID_MPEG_VIDEO_USELTRFRAME		(V4L2_CID_MPEG_BASE + 647)
>> +
>> 
>>  /*  MPEG-class control IDs specific to the CX2341x driver as defined 
>> by V4L2 */
>>  #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
>> 
> 
> Regards,
> 
> 	Hans

Thanks,
Dikshita
