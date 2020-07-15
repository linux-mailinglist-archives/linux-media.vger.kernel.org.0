Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345DD221161
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 17:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgGOPmg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 11:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgGOPmg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 11:42:36 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1C9C061755
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2020 08:42:35 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id a1so2621892ejg.12
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2020 08:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=atHKqaEFyhPKLRlFs+aSX/wC++TiPh0/8Gboy7TmwdM=;
        b=Za4agzh0zGbSdNgOAJs3GVPJRNXGe9e83bA40iCplS87rlP93Em3M6mFy562u0FkKv
         aHFZrluW4wSJX1GeuhXH+BpRLv331njTpGIUoKQOa5RAVzWgWS/zkwaQSyNnuQydkT3y
         Sw+97TkRvXOQLXMVxg3Ju2+aRGF02tlIPxzdVNvAGnFJ6NVNblftLJu992/+uY7ylM+H
         yO7R40G2z5E5w2yQtt0RHX6xv4bVhLF8FHmLk0I9cBuqZUu6/pB96zpWbOND2JsiRH57
         hwT4fwpKfxOZGlxjxe06WYMtgyvkWsH5uyJ6GkHzUyyD4KFSRjo482DerV11VEGxs86o
         WK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=atHKqaEFyhPKLRlFs+aSX/wC++TiPh0/8Gboy7TmwdM=;
        b=pyrEP/GXHvOdI4w1AF8ypdtw3SRg0P2+Wo9RAojqllxb9zJKCVNBHY41zcBwLNDhYp
         I0r0QWpW50J8EeDahYaIttfbxOU96z4+RaDGI7aClWcQ6m8L8cFkMVk6qdFfHoPnI9OI
         +LADrjF2cJ3vrKIO1i03tosbwPogZNLJK5RZK5EnFDV+/XPK4HSCf5PoaxiX496WBBa4
         sHh19p2DCWyeBQOM80BQ/LqNbWl7mf9Xbl1eTms126GEUxqDwwi7gQJB7S9DX35TGSvl
         q9gVmCrfXg7TRgqV84wvJF2sxvklz4vaPY5E4JgE5Pw5hY938vImrhRZOc7Zx05Ssxii
         q1qw==
X-Gm-Message-State: AOAM533oDwst6Q+1YTosw4z0HdMXRbyfMvN3H0k+Rbt/hEg2B4sWmYrB
        oxslgIDiF3dYEA6L4+H4ZZ37eQ==
X-Google-Smtp-Source: ABdhPJwaSs0VOlc/io39oYLV1f8wqKHBzAWJbfUdCDxUjrbfAHHTpyjNQUWkgk0CYcmYV7mUB2LZPw==
X-Received: by 2002:a17:906:81d2:: with SMTP id e18mr9550885ejx.341.1594827754398;
        Wed, 15 Jul 2020 08:42:34 -0700 (PDT)
Received: from [192.168.1.2] (212-5-158-188.ip.btc-net.bg. [212.5.158.188])
        by smtp.googlemail.com with ESMTPSA id qc16sm2404599ejb.33.2020.07.15.08.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 08:42:33 -0700 (PDT)
Subject: Re: [PATCH 1/4] media: v4l2-ctrl: Add frame-skip std encoder control
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Maheshwar Ajja <majja@codeaurora.org>
References: <20200705121128.5250-1-stanimir.varbanov@linaro.org>
 <20200705121128.5250-2-stanimir.varbanov@linaro.org>
 <e9ce36f9de4ef216028832dd78fd7ebc88d6ecb1.camel@ndufresne.ca>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <513fd919-56a2-08b4-c8a7-5d37d7743129@linaro.org>
Date:   Wed, 15 Jul 2020 18:42:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e9ce36f9de4ef216028832dd78fd7ebc88d6ecb1.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On 7/7/20 11:53 PM, Nicolas Dufresne wrote:
> Le dimanche 05 juillet 2020 à 15:11 +0300, Stanimir Varbanov a écrit :
>> Adds encoders standard v4l2 control for frame-skip. The control
>> is a copy of a custom encoder control so that other v4l2 encoder
>> drivers can use it.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  .../media/v4l/ext-ctrls-codec.rst             | 32 +++++++++++++++++++
>>  drivers/media/v4l2-core/v4l2-ctrls.c          | 10 ++++++
>>  include/uapi/linux/v4l2-controls.h            |  6 ++++
>>  3 files changed, 48 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index d0d506a444b1..a8b4c0b40747 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -592,6 +592,38 @@ enum v4l2_mpeg_video_bitrate_mode -
>>      the average video bitrate. It is ignored if the video bitrate mode
>>      is set to constant bitrate.
>>  
>> +``V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE (enum)``
>> +
>> +enum v4l2_mpeg_video_frame_skip_mode -
>> +    Indicates in what conditions the encoder should skip frames. If
>> +    encoding a frame would cause the encoded stream to be larger then a
>> +    chosen data limit then the frame will be skipped. Possible values
>> +    are:
> 
> I have nothing against this API, in fact it's really nice to generalize
> as this is very common. Though, I think we are missing two things. This
> documentation refer to the "chosen data limit". Is there controls to
> configure these *chosen* limit ? The other issue is the vagueness of
> the documented mode, see lower...
> 
>> +
>> +
>> +.. tabularcolumns:: |p{9.2cm}|p{8.3cm}|
>> +
>> +.. raw:: latex
>> +
>> +    \small
>> +
>> +.. flat-table::
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +
>> +    * - ``V4L2_MPEG_FRAME_SKIP_MODE_DISABLED``
>> +      - Frame skip mode is disabled.
>> +    * - ``V4L2_MPEG_FRAME_SKIP_MODE_LEVEL_LIMIT``
>> +      - Frame skip mode enabled and buffer limit is set by the chosen
>> +	level and is defined by the standard.
> 
> At least for H.264, a level is compose of 3 limits. One is the maximum
> number of macroblocks, this is is evidently not use for frame skipping
> and already constrained in V4L2 (assuming the driver does not ignore
> the level control of course). The two other limits are decoded
> macroblocks/s and encoded kbits/s. Both are measure over time, which
> means the M2M encoder needs to be timing aware. I think the time source
> should be documented. Perhaps it is mandatory to set a frame interval
> for this to work ? Or we need some timestamp to allow variable frame
> interval ? (I don't think the second is really an option without
> extending the API again, and confusingly, since I think we have used
> the timestamp for other purpose already)

Do you want to say that the encoder input timestamp, bitrate control
(V4L2_CID_MPEG_VIDEO_BITRATE) and S_PARM is not enough to describe
FRAME_SKIP_MODE_LEVEL_LIMIT mode?

> 
>> +    * - ``V4L2_MPEG_FRAME_SKIP_MODE_BUF_LIMIT``
>> +      - Frame skip mode enabled and buffer limit is set by the VBV
>> +	(MPEG1/2/4) or CPB (H264) buffer size control.
> 
> The notion of VBV an CPB is unlikely well known. If my memory is right,
> these are constrained in buffering: in bytes (VBV) or bits per frame
> over a window of n-frames (or the gop size for some less flexible
> encoder) (CPB). I think these should be somehow chosen by application
> (with controls), directly or indirectly, and documented here to ensure
> we get consistent implementation across drivers.

I guess you want me to add here references to the following controls:

V4L2_CID_MPEG_VIDEO_VBV_SIZE
V4L2_CID_MPEG_VIDEO_VBV_DELAY
V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE

?

> 
>> +
>> +.. raw:: latex
>> +
>> +    \normalsize
>> +
>>  ``V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION (integer)``
>>      For every captured frame, skip this many subsequent frames (default
>>      0).
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index 3f3fbcd60cc6..d088acfa6dd8 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -590,6 +590,12 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>  		"External",
>>  		NULL,
>>  	};
>> +	static const char * const mpeg_video_frame_skip[] = {
>> +		"Disabled",
>> +		"Level Limit",
>> +		"VBV/CPB Limit",
>> +		NULL,
>> +	};
>>  
>>  	switch (id) {
>>  	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
>> @@ -651,6 +657,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>  		return flash_strobe_source;
>>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
>>  		return header_mode;
>> +	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
>> +		return mpeg_video_frame_skip;
>>  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
>>  		return multi_slice;
>>  	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
>> @@ -844,6 +852,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
>>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
>>  	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
>> +	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
>>  	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
>>  	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
>>  	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
>> @@ -1265,6 +1274,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>  	case V4L2_CID_FLASH_LED_MODE:
>>  	case V4L2_CID_FLASH_STROBE_SOURCE:
>>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
>> +	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
>>  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
>>  	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
>>  	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index 62271418c1be..4e1526175a4c 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -742,6 +742,12 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
>>  #define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 642)
>>  #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
>>  #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
>> +#define V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE		(V4L2_CID_MPEG_BASE + 645)
>> +enum v4l2_mpeg_video_frame_skip_mode {
>> +	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED	= 0,
>> +	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT	= 1,
>> +	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT	= 2,
>> +};
>>  
>>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>>  #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
> 

-- 
regards,
Stan
