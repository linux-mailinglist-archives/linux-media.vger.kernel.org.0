Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EED71DF3A9
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2020 02:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387486AbgEWA5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 20:57:35 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:43366 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731169AbgEWA5e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 20:57:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590195452; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=sEpcdEWIc5PkHmTljSDAUL6sLApmL0r5AlRIU84/8D8=;
 b=M5+Q2WOmTBcivYu3qtMhLi+oiVtR3hdQ4L9Roy74gg2XcchSl0ksWBQtXCSq/xW75yhfy9Wk
 fz+/mp9ieFY44Tpjwr8JDaTLkzRrGxIaOPN9a5/HYedk6+tfxH43swCGdw3654CDzFCV0H0H
 LOoJXF9Jj031gcIfUP42c9Usypg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec874ed.7f82d3f64ce0-smtp-out-n05;
 Sat, 23 May 2020 00:57:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AFCEAC433CA; Sat, 23 May 2020 00:57:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: majja)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 96BB3C433C6;
        Sat, 23 May 2020 00:57:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 22 May 2020 17:57:16 -0700
From:   majja@codeaurora.org
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     mchehab@kernel.org, paul.kocialkowski@bootlin.com,
        p.zabel@pengutronix.de, ezequiel@collabora.com, jonas@kwiboo.se,
        boris.brezillon@collabora.com, posciak@chromium.org,
        ribalda@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, tglx@linutronix.de, sumitg@nvidia.com
Subject: Re: [PATCH] media: v4l2-ctrls: Add encoded frame quality controls
In-Reply-To: <b35cca3a-6444-1124-41da-2982a7711cff@xs4all.nl>
References: <1589836035-16579-1-git-send-email-majja@codeaurora.org>
 <11481ef8fcee02aba17ef527c56c78d2@codeaurora.org>
 <b35cca3a-6444-1124-41da-2982a7711cff@xs4all.nl>
Message-ID: <c37b4f10a1b47dde630510735b1a82d8@codeaurora.org>
X-Sender: majja@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the suggestion. I will update the patch accordingly.

Regards,
     Maheshwar.


On 2020-05-18 23:45, Hans Verkuil wrote:
> Hi Maheshwar,
> 
> On 18/05/2020 23:09, majja@codeaurora.org wrote:
>> Hi,
>> 
>> Regarding below patch -
>> 
>> HEIF/HEIC image encoding uses HEVC/AVC encoders and client can set 
>> image
>> quality level using
>> V4L2_CID_MPEG_VIDEO_FRAME_QUALITY control.
>> 
>> Reference BITRATE_MODE_CQ at
>> https://developer.android.com/reference/android/media/MediaCodecInfo.EncoderCapabilities#BITRATE_MODE_CQ
> 
> So what you are really introducing here is a new enum
> v4l2_mpeg_video_bitrate_mode
> mode: V4L2_MPEG_VIDEO_BITRATE_MODE_CQ.
> 
> Why not just add that new mode, then add 
> V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY
> which is only used if the bitrate mode is MODE_CQ.
> 
> That builds nicely on top of the already existing
> V4L2_CID_MPEG_VIDEO_BITRATE_MODE
> control.
> 
> Regards,
> 
> 	Hans
> 
>> 
>> Regards,
>>      Maheshwar.
>> 
>> 
>> On 2020-05-18 14:07, Maheshwar Ajja wrote:
>>> When frame quality control is enabled encoder will choose
>>> the appropriate quantization parameter and bitrate to
>>> produce the client requested frame quality level.
>>> When frame quality control is disabled then frame quality
>>> is decided based on appropriate controls (i.e.
>>> V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE and/or
>>> V4L2_CID_MPEG_VIDEO_BITRATE_MODE)
>>> 
>>> Signed-off-by: Maheshwar Ajja <majja@codeaurora.org>
>>> ---
>>>  .../userspace-api/media/v4l/ext-ctrls-codec.rst          | 16
>>> ++++++++++++++++
>>>  drivers/media/v4l2-core/v4l2-ctrls.c                     |  3 +++
>>>  include/uapi/linux/v4l2-controls.h                       |  2 ++
>>>  3 files changed, 21 insertions(+)
>>> 
>>> diff --git 
>>> a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> index d0d506a..495b39b 100644
>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> @@ -1081,6 +1081,22 @@ enum v4l2_mpeg_video_h264_entropy_mode -
>>>      Macroblock level rate control enable. Applicable to the MPEG4 
>>> and
>>>      H264 encoders.
>>> 
>>> +``V4L2_CID_MPEG_VIDEO_FRAME_QUALITY_ENABLE (boolean)``
>>> +    Encoded frame quality control enable. If this control is enabled
>>> then
>>> +    the quality level of the encoded frame is set with control
>>> +    ``V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY``. If this control is
>>> disabled
>>> +    then the quality level of encoded frame is adjusted with
>>> appropriate
>>> +    controls (e.g. ``V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE`` or
>>> +    ``V4L2_CID_MPEG_VIDEO_BITRATE_MODE``). Applicable to encoders.
>>> +
>>> +``V4L2_CID_MPEG_VIDEO_FRAME_QUALITY (integer)``
>>> +    Encoded frame quality control. If the control
>>> +    ``V4L2_CID_MPEG_VIDEO_FRAME_QUALITY_ENABLE`` is enabled then the
>>> +    quality of encoded frame is set with this control. Valid range 
>>> is
>>> 1 to
>>> +    100 where 1 indicates lowest quality and 100 indicates highest
>>> quality.
>>> +    Encoder will decide the appropriate quantization parameter and
>>> bitrate
>>> +    to produce requested frame quality. Applicable to encoders.
>>> +
>>>  ``V4L2_CID_MPEG_VIDEO_MPEG4_QPEL (boolean)``
>>>      Quarter pixel motion estimation for MPEG4. Applicable to the 
>>> MPEG4
>>>      encoder.
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c
>>> b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> index 1c617b4..1477198 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> @@ -982,6 +982,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice
>>> Parameters";
>>>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode
>>> Mode";
>>>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start 
>>> Code";
>>> +	case V4L2_CID_MPEG_VIDEO_FRAME_QUALITY_ENABLE:		return "Frame 
>>> Quality
>>> Enable";
>>> +	case V4L2_CID_MPEG_VIDEO_FRAME_QUALITY:			return "Frame Quality";
>>> 
>>>  	/* CAMERA controls */
>>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>>> @@ -1178,6 +1180,7 @@ void v4l2_ctrl_fill(u32 id, const char **name,
>>> enum v4l2_ctrl_type *type,
>>>  	case V4L2_CID_FLASH_READY:
>>>  	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
>>>  	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
>>> +	case V4L2_CID_MPEG_VIDEO_FRAME_QUALITY_ENABLE:
>>>  	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
>>>  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
>>>  	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
>>> diff --git a/include/uapi/linux/v4l2-controls.h
>>> b/include/uapi/linux/v4l2-controls.h
>>> index 0ba1005..d97a934 100644
>>> --- a/include/uapi/linux/v4l2-controls.h
>>> +++ b/include/uapi/linux/v4l2-controls.h
>>> @@ -742,6 +742,8 @@ enum 
>>> v4l2_cid_mpeg_video_hevc_size_of_length_field
>>> {
>>>  #define 
>>> V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE
>>> + 642)
>>>  #define 
>>> V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE
>>> + 643)
>>>  #define 
>>> V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE
>>> + 644)
>>> +#define V4L2_CID_MPEG_VIDEO_FRAME_QUALITY_ENABLE	(V4L2_CID_MPEG_BASE 
>>> +
>>> 645)
>>> +#define V4L2_CID_MPEG_VIDEO_FRAME_QUALITY		(V4L2_CID_MPEG_BASE + 
>>> 646)
>>> 
>>>  /*  MPEG-class control IDs specific to the CX2341x driver as defined
>>> by V4L2 */
>>>  #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 
>>> 0x1000)
