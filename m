Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECE93370F9
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 12:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbhCKLQT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 06:16:19 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:30635 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232520AbhCKLPu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 06:15:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615461349; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RBjbPs495i1bppqG62aDtERKkn2r3f7Ti8TBo/hFrQM=;
 b=BK6s6Bg7V75+4cwQfkjlQjFXFhNFqhSXh6PALHKf84pO+evca2furwUSJlYbxQND6Q0Wlfr0
 6EIR5PV3Vu4TsIwOfiezmgzJ4bas1z0lYXW+m5NVYNe/I8Oq+TRcr+GeSoyzNT7xDy/4MV3i
 OeQKVBniiuv9ZgzMEBUAYFeoyFw=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6049fbe5b2591bd56880d53a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Mar 2021 11:15:49
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1B18EC43461; Thu, 11 Mar 2021 11:15:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 283CFC433ED;
        Thu, 11 Mar 2021 11:15:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 11 Mar 2021 16:45:48 +0530
From:   dikshita@codeaurora.org
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
Subject: Re: [PATCH v7 1/2] media: v4l2-ctrl: add controls for long term
 reference.
In-Reply-To: <d3309b63-4816-5fc3-cc38-0f78f2affc04@xs4all.nl>
References: <1614769787-26922-1-git-send-email-dikshita@codeaurora.org>
 <1614769787-26922-2-git-send-email-dikshita@codeaurora.org>
 <d3309b63-4816-5fc3-cc38-0f78f2affc04@xs4all.nl>
Message-ID: <14a918d04fe428e38cf9ed2556e66c44@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for your comments.
I Will update the documentation based on your suggestion in the next 
patch.

Thanks,
Dikshita

On 2021-03-05 14:08, Hans Verkuil wrote:
> Hi Dikshita,
> 
> On 03/03/2021 12:09, Dikshita Agarwal wrote:
>> Long Term Reference (LTR) frames are the frames that are encoded
>> sometime in the past and stored in the DPB buffer list to be used
>> as reference to encode future frames.
>> This change adds controls to enable this feature.
>> 
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> ---
>>  .../userspace-api/media/v4l/ext-ctrls-codec.rst         | 17 
>> +++++++++++++++++
>>  drivers/media/v4l2-core/v4l2-ctrls.c                    | 14 
>> ++++++++++++++
>>  include/uapi/linux/v4l2-controls.h                      |  3 +++
>>  3 files changed, 34 insertions(+)
>> 
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst 
>> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index 00944e9..21fa9a5 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -3646,3 +3646,20 @@ enum v4l2_mpeg_video_hevc_size_of_length_field 
>> -
>>      so this has to come from client.
>>      This is applicable to H264 and valid Range is from 0 to 63.
>>      Source Rec. ITU-T H.264 (06/2019); G.7.4.1.1, G.8.8.1.
>> +
>> +``V4L2_CID_MPEG_VIDEO_LTR_COUNT (integer)``
>> +    Specifies the maximum number of Long Term Reference (LTR) frames 
>> at any
>> +    given time that the encoder can keep.
>> +    This is applicable to the H264 and HEVC encoders.
>> +
>> +``V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX (integer)``
>> +    The current frame is marked as a Long Term Reference (LTR) frame
> 
> You mentioned earlier in a reply to me that:
> 
> "The driver implementation ensures that whenever the LTR control is
> received, it applies to the frame received after that. Not to frame
> which would be
> encoded next."
> 
> That behavior is not clear from the text.
> 
> Wouldn't this be a better text:
> 
> "After setting this control the frame that will be queued next
>  will be marked as a Long Term Reference (LTR) frame"
> 
> "current frame" isn't precise enough.
> 
>> +    and given this LTR index which ranges from 0 to LTR_COUNT-1.
>> +    This is applicable to the H264 and HEVC encoders.
>> +    Source Rec. ITU-T H.264 (06/2019); Table 7.9
>> +
>> +``V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES (bitmask)``
>> +    Specifies the Long Term Reference (LTR) frame(s) to be used for
>> +    encoding the current frame.
> 
> Same here. I assume that here too this control applies to the next 
> queued
> frame.
> 
>> +    This provides a bitmask which consists of bits [0, LTR_COUNT-1].
>> +    This is applicable to the H264 and HEVC encoders.
> 
> Regards,
> 
> 	Hans
> 
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c 
>> b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index 016cf62..4d444de 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -951,6 +951,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence 
>> Header";
>>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
>>  	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:		return "Base Layer 
>> Priority ID";
>> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
>> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
>> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice 
>> Parameters";
>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 
>> Quantization Matrices";
>>  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>> @@ -1278,6 +1281,17 @@ void v4l2_ctrl_fill(u32 id, const char **name, 
>> enum v4l2_ctrl_type *type,
>>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
>>  		*type = V4L2_CTRL_TYPE_INTEGER;
>>  		break;
>> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
>> +		*type = V4L2_CTRL_TYPE_INTEGER;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
>> +		*type = V4L2_CTRL_TYPE_INTEGER;
>> +		*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
>> +		*type = V4L2_CTRL_TYPE_BITMASK;
>> +		*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
>> +		break;
>>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>>  	case V4L2_CID_PAN_RESET:
>>  	case V4L2_CID_TILT_RESET:
>> diff --git a/include/uapi/linux/v4l2-controls.h 
>> b/include/uapi/linux/v4l2-controls.h
>> index 039c0d7..fedbb54 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -428,6 +428,9 @@ enum v4l2_mpeg_video_multi_slice_mode {
>>  #define 
>> V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
>>  #define 
>> V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
>>  #define 
>> V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID	(V4L2_CID_CODEC_BASE+230)
>> +#define V4L2_CID_MPEG_VIDEO_LTR_COUNT			(V4L2_CID_CODEC_BASE+231)
>> +#define 
>> V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX		(V4L2_CID_CODEC_BASE+232)
>> +#define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES		(V4L2_CID_CODEC_BASE+233)
>> 
>>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
>> 
