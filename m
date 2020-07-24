Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B8922CF6A
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 22:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgGXU3S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 16:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726493AbgGXU3S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 16:29:18 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7936C0619E4
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 13:29:17 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b6so9367996wrs.11
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 13:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L07tsuhny1pQ7gNIGv0W+sGyHA4OEZwfZ804u+Y4cII=;
        b=DF8nOXoT5Vpgt5UR6qZs0jtHQo5QYKFVieQgdfBl355rWZ5o6OF2ubY2W+OsiUJo+L
         TTLdQ+kh40Uc6VBzZNTZlL3+oOoCxwGFLbDlBIo+5qK2f6OK6eo+8HkI5qUhJo0CIhca
         of1dMvtPvfGzP0LWYxnx968z2i1CyYPTpr3/oju2NLvy5TaCEK4cZkBEm0gFYTa52YnT
         +tEMmhMSNBm9LVO+7P+PJqq5fzV2bFFDUMaAU+KV+zZDWHNEPRp+MxDpDravrZDoO+Kq
         vweLC6A6lGwFY0xvHgeq3uP/62zVLowcZAQULZwRZur40JClapS7VycUIsBp+Uyh8pNp
         Epsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L07tsuhny1pQ7gNIGv0W+sGyHA4OEZwfZ804u+Y4cII=;
        b=rmrdGbrn7mRAC/8hZwglE280+3nSa1/houMQxXiUqdlB6LuM1SL+IRa1z8WkuHTeCE
         uw31HgYc1jQ9IJyQBQ9v3aiBq8QhJlhCDZUz22gcGUDGntsPHUhus3YUMow3WiGlBIvp
         g+Y+4L4a3osNFcPtWoQScEhDSVZ8I4+GruIqIGWhUakDydPBVmS16hyBabA4EleeZiMZ
         ZCk+ZUcwbHCyf29Q6QtGHsdo7A0rOkaw9g47uTTgDslxA0f863RewUgnO7R5p/uno8SY
         6nQuWLlfonH27nniE7eiMRb4h1RTDpbU2SIz9AQF1VNRXGlbQg+vTPry9kqL6iIOAeX4
         9H+w==
X-Gm-Message-State: AOAM531BuPab8Jt321xv+L5t2kKyn3Suoc62xDaLQcWq7vCUqHRHw6+J
        jkdZI5/Ui/KVCwl5KjEzQMPbPw==
X-Google-Smtp-Source: ABdhPJyzRdzYTFbYtKdMcntCUB597vb1oJdNYRyDUSK/27uPOgqo14mViDSwcS8m67v1HoLFvNo+Pg==
X-Received: by 2002:a05:6000:8b:: with SMTP id m11mr5955036wrx.245.1595622556568;
        Fri, 24 Jul 2020 13:29:16 -0700 (PDT)
Received: from [192.168.1.4] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id b63sm8622338wme.41.2020.07.24.13.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 13:29:15 -0700 (PDT)
Subject: Re: [PATCH] v4l2-ctrl: Add VP9 codec levels
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200713081501.28609-1-stanimir.varbanov@linaro.org>
 <dade9f23deba2f12ad8ab2f277e08047af73f46c.camel@ndufresne.ca>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <08d230f6-b017-df6a-f43e-77e7511e8afd@linaro.org>
Date:   Fri, 24 Jul 2020 23:29:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dade9f23deba2f12ad8ab2f277e08047af73f46c.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/14/20 7:09 PM, Nicolas Dufresne wrote:
> Le lundi 13 juillet 2020 à 11:15 +0300, Stanimir Varbanov a écrit :
>> Add menu control for VP9 codec levels. A total of 14 levels are
>> defined for Profile 0 (8bit) and Profile 2 (10bit). Each level
>> is a set of constrained bitstreams coded with targeted resolutions,
>> frame rates, and bitrates.
> 
> Looks good to me. Perhaps literally put the link in the message ?
> 
> https://www.webmproject.org/vp9/levels/

sure, I will do that.

> 
>>
>> The definition has been taken from webm project.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  .../media/v4l/ext-ctrls-codec.rst             | 42 +++++++++++++++++++
>>  drivers/media/v4l2-core/v4l2-ctrls.c          | 21 ++++++++++
>>  include/uapi/linux/v4l2-controls.h            | 17 ++++++++
>>  3 files changed, 80 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index d0d506a444b1..d49bdafa768a 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -3316,6 +3316,48 @@ enum v4l2_mpeg_video_vp9_profile -
>>      * - ``V4L2_MPEG_VIDEO_VP9_PROFILE_3``
>>        - Profile 3
>>  
>> +.. _v4l2-mpeg-video-vp9-level:
>> +
>> +``V4L2_CID_MPEG_VIDEO_VP9_LEVEL (enum)``
>> +
>> +enum v4l2_mpeg_video_vp9_level -
>> +    This control allows selecting the level for VP9 encoder.
>> +    This is also used to enumerate supported levels by VP9 encoder or decoder.
>> +    Possible values are:
> 
> Shall we add some hint in the doc itself upon where these levels are
> from so one can figure-out what constraints they impose.

Fine by me. The same link as in the commit message?

> 
> Also, as for other levels (H264/HEVC), all drivers are mostly dummy and
> don't validate any of this, shall we keep it this way ? Levels are in
> fact complex, because some of the constraints are in image size, and
> most of the other constraints are raw or compressed size over time, so
> requires timing information for let's say a CBR encoder to enforce it,
> for the S_FMT function for the raw constraints.

I think this should be a driver responsibility.

> 
>> +
>> +.. flat-table::
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +
>> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_1_0``
>> +      - Level 1
>> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_1_1``
>> +      - Level 1.1
>> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_2_0``
>> +      - Level 2
>> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_2_1``
>> +      - Level 2.1
>> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_3_0``
>> +      - Level 3
>> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_3_1``
>> +      - Level 3.1
>> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_4_0``
>> +      - Level 4
>> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_4_1``
>> +      - Level 4.1
>> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_5_0``
>> +      - Level 5
>> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_5_1``
>> +      - Level 5.1
>> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_5_2``
>> +      - Level 5.2
>> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_6_0``
>> +      - Level 6
>> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_6_1``
>> +      - Level 6.1
>> +    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_6_2``
>> +      - Level 6.2
>> +
>>  
>>  High Efficiency Video Coding (HEVC/H.265) Control Reference
>>  ===========================================================
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index 3f3fbcd60cc6..359dc737053d 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -474,6 +474,23 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>  		"3",
>>  		NULL,
>>  	};
>> +	static const char * const vp9_level[] = {
>> +		"1",
>> +		"1.1",
>> +		"2",
>> +		"2.1",
>> +		"3",
>> +		"3.1",
>> +		"4",
>> +		"4.1",
>> +		"5",
>> +		"5.1",
>> +		"5.2",
>> +		"6",
>> +		"6.1",
>> +		"6.2",
>> +		NULL,
>> +	};
>>  
>>  	static const char * const flash_led_mode[] = {
>>  		"Off",
>> @@ -685,6 +702,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>  		return vp8_profile;
>>  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
>>  		return vp9_profile;
>> +	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
>> +		return vp9_level;
>>  	case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:
>>  		return jpeg_chroma_subsampling;
>>  	case V4L2_CID_DV_TX_MODE:
>> @@ -938,6 +957,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP:		return "VPX P-Frame QP Value";
>>  	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:			return "VP8 Profile";
>>  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:			return "VP9 Profile";
>> +	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:			return "VP9 Level";
>>  	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:		return "VP8 Frame Header";
>>  
>>  	/* HEVC controls */
>> @@ -1294,6 +1314,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>  	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL:
>>  	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
>>  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
>> +	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
>>  	case V4L2_CID_DETECT_MD_MODE:
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index 62271418c1be..1b0bc79c1bc3 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -650,6 +650,23 @@ enum v4l2_mpeg_video_vp9_profile {
>>  	V4L2_MPEG_VIDEO_VP9_PROFILE_2				= 2,
>>  	V4L2_MPEG_VIDEO_VP9_PROFILE_3				= 3,
>>  };
>> +#define V4L2_CID_MPEG_VIDEO_VP9_LEVEL			(V4L2_CID_MPEG_BASE+513)
>> +enum v4l2_mpeg_video_vp9_level {
>> +	V4L2_MPEG_VIDEO_VP9_LEVEL_1_0	= 0,
>> +	V4L2_MPEG_VIDEO_VP9_LEVEL_1_1	= 1,
>> +	V4L2_MPEG_VIDEO_VP9_LEVEL_2_0	= 2,
>> +	V4L2_MPEG_VIDEO_VP9_LEVEL_2_1	= 3,
>> +	V4L2_MPEG_VIDEO_VP9_LEVEL_3_0	= 4,
>> +	V4L2_MPEG_VIDEO_VP9_LEVEL_3_1	= 5,
>> +	V4L2_MPEG_VIDEO_VP9_LEVEL_4_0	= 6,
>> +	V4L2_MPEG_VIDEO_VP9_LEVEL_4_1	= 7,
>> +	V4L2_MPEG_VIDEO_VP9_LEVEL_5_0	= 8,
>> +	V4L2_MPEG_VIDEO_VP9_LEVEL_5_1	= 9,
>> +	V4L2_MPEG_VIDEO_VP9_LEVEL_5_2	= 10,
>> +	V4L2_MPEG_VIDEO_VP9_LEVEL_6_0	= 11,
>> +	V4L2_MPEG_VIDEO_VP9_LEVEL_6_1	= 12,
>> +	V4L2_MPEG_VIDEO_VP9_LEVEL_6_2	= 13,
>> +};
>>  
>>  /* CIDs for HEVC encoding. */
>>  
> 

-- 
regards,
Stan
