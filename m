Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF3130EBB1
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 06:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhBDFCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 00:02:50 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:40319 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229725AbhBDFCs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Feb 2021 00:02:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612414942; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RiWhMQeAOucPPUpz/FHQEGTSDjaoFEovqQdCTOGDWGE=;
 b=MebxX+c0a7Mm2jrWc1ZvUQwycrk5wIv6E1YMw1P458zUCwJy4GzFn+8jMOR03IqM+QB4Mml1
 XBtvVE1YWED05nCw2EdrE06iR5HsftXtSb3TGEBfC1NgqcJQAjrr+L3ylxav/S+2sJfPXyGy
 a6P+B1ML8M/o6WphpWWpbMoBC9c=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 601b7fc15a2f264828a3670f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 05:01:53
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0E3E5C433C6; Thu,  4 Feb 2021 05:01:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 078ECC433ED;
        Thu,  4 Feb 2021 05:01:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 04 Feb 2021 10:31:51 +0530
From:   dikshita@codeaurora.org
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
Subject: Re: [PATCH v6 1/2] media: v4l2-ctrl: add controls for long term
 reference.
In-Reply-To: <d20ba57f-54a7-5a61-a64b-2d9433b79281@xs4all.nl>
References: <1611553919-17919-1-git-send-email-dikshita@codeaurora.org>
 <1611553919-17919-2-git-send-email-dikshita@codeaurora.org>
 <d20ba57f-54a7-5a61-a64b-2d9433b79281@xs4all.nl>
Message-ID: <6e59d1bee1d0f1b64aab77959bb22e6e@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-02-01 16:50, Hans Verkuil wrote:
> On 25/01/2021 06:51, Dikshita Agarwal wrote:
>> Long Term Reference (LTR) frames are the frames that are encoded
>> sometime in the past and stored in the DPB buffer list to be used
>> as reference to encode future frames.
>> This change adds controls to enable this feature.
>> 
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> ---
>>  .../userspace-api/media/v4l/ext-ctrls-codec.rst        | 18 
>> ++++++++++++++++++
>>  drivers/media/v4l2-core/v4l2-ctrls.c                   | 14 
>> ++++++++++++++
>>  include/uapi/linux/v4l2-controls.h                     |  3 +++
>>  3 files changed, 35 insertions(+)
>> 
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst 
>> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index 400774c..a37d460 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -3637,3 +3637,21 @@ enum v4l2_mpeg_video_hevc_size_of_length_field 
>> -
>>        - Selecting this value specifies that HEVC slices are expected
>>          to be prefixed by Annex B start codes. According to 
>> :ref:`hevc`
>>          valid start codes can be 3-bytes 0x000001 or 4-bytes 
>> 0x00000001.
>> +
>> +``V4L2_CID_MPEG_VIDEO_LTR_COUNT (integer)``
>> +       Specifies the number of Long Term Reference (LTR) frames 
>> encoder needs
>> +       to generate or keep. This is applicable to the H264 and HEVC 
>> encoders.
>> +
>> +``V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX (integer)``
>> +       The current frame is marked as a Long Term Reference (LTR) 
>> frame
>> +       and given this LTR index which ranges from 0 to LTR_COUNT-1.
>> +       This is applicable to the H264 and HEVC encoders and can be 
>> applied using
>> +       Request API.
> 
> You mentioned in reply to my comment that the venus driver didn't 
> support the
> Request API that it is also possible to use it without that API.
> 
> But that requires more precise documentation. I assume that without the 
> Request
> API you would set this control, then queue the buffer containing the 
> frame this
> control should apply to, then wait until it is dequeued. Since that's 
> the only
> way you can be certain this control is applied to the correct frame.
> 
> Is this indeed what you do in your application?
> 
> Regards,
> 
> 	Hans
> 
Hi Hans,

Yes, It is possible without request API as well in a non-synchronized 
way.
And we don't need to wait for the frame to be dequeued.
The driver implementation ensures that whenever the LTR control is 
received,
it applies to the frame received after that. Not to frame which would be 
encoded next.
So that it is at least synchronized between driver & encoder.

Thanks,
Dikshita

>> +       Source Rec. ITU-T H.264 (06/2019); Table 7.9
>> +
>> +``V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES (bitmask)``
>> +       Specifies the Long Term Reference (LTR) frame(s) to be used 
>> for
>> +       encoding the current frame.
>> +       This provides a bitmask which consists of bits [0, 
>> LTR_COUNT-1].
>> +       This is applicable to the H264 and HEVC encoders and can be 
>> applied using
>> +       Request API.
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c 
>> b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index 16ab54f..84c1eb8 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -950,6 +950,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV 
>> Search Range";
>>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence 
>> Header";
>>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
>> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
>> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
>> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice 
>> Parameters";
>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 
>> Quantization Matrices";
>>  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>> @@ -1277,6 +1280,17 @@ void v4l2_ctrl_fill(u32 id, const char **name, 
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
>> index af8dda2..c0bb87b 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -422,6 +422,9 @@ enum v4l2_mpeg_video_multi_slice_mode {
>>  #define 
>> V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+227)
>>  #define 
>> V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
>>  #define 
>> V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
>> +#define V4L2_CID_MPEG_VIDEO_LTR_COUNT			(V4L2_CID_CODEC_BASE+230)
>> +#define 
>> V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX		(V4L2_CID_CODEC_BASE+231)
>> +#define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES		(V4L2_CID_CODEC_BASE+232)
>> 
>>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
>> 
