Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E682D301A
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 17:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730584AbgLHQpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 11:45:20 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:22842 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729679AbgLHQpU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 11:45:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607445895; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2Y6Ur3rzE9mIuUPhbTq3y+SNHTRJlb8/T4C2ETc6d68=;
 b=OTdwASl8NCpULZ38hDip3Do3J+Gp81/R1aszgVHi0EajPl3EIvf0QbSO6vYivSfnv27H0u8n
 ycMLLuc7WPbdsJNve0kfueP92hpdeZCiHz/SJ2gkwIYaIKY1nDM1VGYeUA2xly/PCZYpG6Yr
 QXUJWzXdkTnwFqoaTYL/w7w8qdA=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fcfad68fab0cd4073e6ba69 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Dec 2020 16:44:24
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 082B8C43463; Tue,  8 Dec 2020 16:44:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D772C433C6;
        Tue,  8 Dec 2020 16:44:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 08 Dec 2020 22:14:22 +0530
From:   dikshita@codeaurora.org
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        stanimir.varbanov@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH v4] media: v4l2-ctrl: add control for long term reference.
In-Reply-To: <47ac36cf-3931-ed68-62e9-821a669378f8@xs4all.nl>
References: <1606810437-2797-1-git-send-email-dikshita@codeaurora.org>
 <47ac36cf-3931-ed68-62e9-821a669378f8@xs4all.nl>
Message-ID: <6b044c9be4a99adc18dd76765b089760@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 2020-12-02 19:18, Hans Verkuil wrote:
> On 01/12/2020 09:13, Dikshita Agarwal wrote:
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
>> index 3b86959..40634f8 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -4450,3 +4450,21 @@ enum v4l2_mpeg_video_hevc_size_of_length_field 
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
>> +       to generate or keep. This is applicable to H264 and HEVC 
>> encoder.
>> +
>> +``V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX (integer)``
>> +       The current frame is marked as a Long Term Reference (LTR) 
>> frame
>> +       and given this LTR index which ranges from 0 to LTR_COUNT-1.
>> +       This is applicable to H264 and HEVC encoder and can be applied 
>> using
>> +       Request Api.
>> +       Source Rec. ITU-T H.264 (06/2019); Table 7.9
>> +
>> +``V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES (bitmask)``
>> +       Specifies the Long Term Reference (LTR) frame(s) to be used 
>> for
>> +       encoding the current frame.
>> +       This provides a bitmask which consists of bits [0, 
>> LTR_COUNT-1].
>> +       This is applicable to H264 and HEVC encoder and can be applied 
>> using
>> +       Request Api.
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c 
>> b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index e5b726f..0b81b39 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -958,6 +958,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV 
>> Search Range";
>>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence 
>> Header";
>>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
>> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
>> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "frame LTR index";
> 
> "Frame LTR Index"
> 
>> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frame(s)";
> 
> Just: "Use LTR Frames". No '(s)'.
> 
>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice 
>> Parameters";
>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 
>> Quantization Matrices";
>>  	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless 
>> Parameters";
>> @@ -1273,6 +1276,17 @@ void v4l2_ctrl_fill(u32 id, const char **name, 
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
>> index e37b85f..710bc53 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -421,6 +421,9 @@ enum v4l2_mpeg_video_multi_slice_mode {
>>  #define 
>> V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+227)
>>  #define 
>> V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+228)
>>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_MPEG_BASE+229)
>> +#define V4L2_CID_MPEG_VIDEO_LTR_COUNT                  
>> (V4L2_CID_MPEG_BASE + 230)
>> +#define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX            
>> (V4L2_CID_MPEG_BASE + 231)
>> +#define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES             
>> (V4L2_CID_MPEG_BASE + 232)
>> 
>>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
>> 
> 
> Note that this and the other patches from you that add
> V4L2_CID_MPEG_VIDEO controls
> will need to be rebased as soon as this PR is merged:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/d68da172-b251-000f-653d-38a8a4c7b715@xs4all.nl/
> 
> I recommend waiting until that's in.
> 
> I currently have the following patches from you adding new controls
> besides this one:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/1606121442-31074-1-git-send-email-dikshita@codeaurora.org/
> https://patchwork.linuxtv.org/project/linux-media/patch/1605682497-29273-2-git-send-email-dikshita@codeaurora.org/
> https://patchwork.linuxtv.org/project/linux-media/patch/1605682497-29273-3-git-send-email-dikshita@codeaurora.org/
> 
> What is missing is driver support for these new controls. I recommend 
> that, once
> the PR mentioned above is merged, you make a new series combining all 
> three
> patches + patches that add support for this to the venus driver.
> 
I will address all comments in the next version and will include driver 
implementation as well.
Once all the driver changes are reviewed, I will make a series with all 
final patches, Hope that's fine.

Thanks,
Dikshita

> Regards,
> 
> 	Hans
