Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A726C1A17BC
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 00:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgDGWIB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 18:08:01 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:63451 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726407AbgDGWIB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Apr 2020 18:08:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586297280; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=UsOpSVJVYUqIakS8yQGLQSYuYx2FpvLz7lbcHu0i67o=;
 b=p8znqJwPazih1WgFGNuP8F4d5K28tL+YCNpuV72UnUdzXSaIUmNFLD0wf8YT9g1AFCgVQeIO
 IWBkFl8DCvwyhk4m5oMdpTmC1cuGaDf/QbZUkeJ5p8oD5aeF21wOsQJTU3WJg+uBgcGFNcrk
 EiU9T7UaDZbP1Jxd5Z/uVpHjhyM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8cf9b0.7f79e634cb90-smtp-out-n02;
 Tue, 07 Apr 2020 22:07:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BBAFCC43636; Tue,  7 Apr 2020 22:07:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: majja)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 32BC5C433F2;
        Tue,  7 Apr 2020 22:07:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 07 Apr 2020 15:07:43 -0700
From:   majja@codeaurora.org
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-ctrl: Add H264 profile and levels
In-Reply-To: <225cb4d6-ca56-8e61-0cd1-a2aa183e446a@xs4all.nl>
References: <1584398550-19727-1-git-send-email-majja@codeaurora.org>
 <225cb4d6-ca56-8e61-0cd1-a2aa183e446a@xs4all.nl>
Message-ID: <6f67f16bff4623b6bef75ce346594589@codeaurora.org>
X-Sender: majja@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you, I have posted a patch with below subject to update the 
documentation.
[PATCH] media: uapi: h264: Add new profile and levels

Regards,
     Maheshwar

On 2020-03-30 04:20, Hans Verkuil wrote:
> Hi Maheshwar,
> 
> The patch looks good, but you also need to update the documentation
> in Documentation/media/uapi/v4l/ext-ctrls-codec.rst, adding the new
> profile/levels.
> 
> You can just post a separate patch for that, and I'll take them both.
> 
> Regards,
> 
> 	Hans
> 
> On 3/16/20 11:42 PM, Maheshwar Ajja wrote:
>> Add H264 profile "Contrained High" and H264 levels "5.2",
>> "6.0", "6.1" and "6.2".
>> 
>> Signed-off-by: Maheshwar Ajja <majja@codeaurora.org>
>> ---
>>  drivers/media/v4l2-core/v4l2-ctrls.c | 5 +++++
>>  include/uapi/linux/v4l2-controls.h   | 5 +++++
>>  2 files changed, 10 insertions(+)
>> 
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c 
>> b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index 2928c5e..67ce711 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -336,6 +336,10 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>  		"4.2",
>>  		"5",
>>  		"5.1",
>> +		"5.2",
>> +		"6.0",
>> +		"6.1",
>> +		"6.2",
>>  		NULL,
>>  	};
>>  	static const char * const h264_loop_filter[] = {
>> @@ -362,6 +366,7 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>  		"Scalable High Intra",
>>  		"Stereo High",
>>  		"Multiview High",
>> +		"Constrained High",
>>  		NULL,
>>  	};
>>  	static const char * const vui_sar_idc[] = {
>> diff --git a/include/uapi/linux/v4l2-controls.h 
>> b/include/uapi/linux/v4l2-controls.h
>> index 5a7bede..fbe3f82d 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -467,6 +467,10 @@ enum v4l2_mpeg_video_h264_level {
>>  	V4L2_MPEG_VIDEO_H264_LEVEL_4_2	= 13,
>>  	V4L2_MPEG_VIDEO_H264_LEVEL_5_0	= 14,
>>  	V4L2_MPEG_VIDEO_H264_LEVEL_5_1	= 15,
>> +	V4L2_MPEG_VIDEO_H264_LEVEL_5_2	= 16,
>> +	V4L2_MPEG_VIDEO_H264_LEVEL_6_0	= 17,
>> +	V4L2_MPEG_VIDEO_H264_LEVEL_6_1	= 18,
>> +	V4L2_MPEG_VIDEO_H264_LEVEL_6_2	= 19,
>>  };
>>  #define 
>> V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA	(V4L2_CID_MPEG_BASE+360)
>>  #define 
>> V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA	(V4L2_CID_MPEG_BASE+361)
>> @@ -495,6 +499,7 @@ enum v4l2_mpeg_video_h264_profile {
>>  	V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH_INTRA	= 14,
>>  	V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH		= 15,
>>  	V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH		= 16,
>> +	V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH		= 17,
>>  };
>>  #define 
>> V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT	(V4L2_CID_MPEG_BASE+364)
>>  #define 
>> V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH	(V4L2_CID_MPEG_BASE+365)
>> 
