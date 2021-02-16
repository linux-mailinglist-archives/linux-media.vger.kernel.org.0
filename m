Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A90531C7A9
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 09:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhBPI5A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 03:57:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbhBPI44 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 03:56:56 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700B2C0613D6
        for <linux-media@vger.kernel.org>; Tue, 16 Feb 2021 00:56:15 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id bl23so15303435ejb.5
        for <linux-media@vger.kernel.org>; Tue, 16 Feb 2021 00:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=y0U+Rv1TeJysLH2QAkxFhbKDvg78z80oMSWOxlzm+JE=;
        b=y1RHPwDF2YhUvrUGPw24VS6EMScG1Zgn14XKKm48W2InQKoIZF9aQUbLTQaG4qJCn2
         2y/qxd92YuGiWhRi9nScQYQ9lhpPYHOnXb0h2tZKKnQcpL0G01KuZXIFPDFkmPsQaufp
         6NwWprFfNK6NhCTn6UoKurHwhd56VFVRABy21065iqqj1LwPMpetkvmMaFaHnhn3GU7w
         a1VVkgmPzHliuCNQIJYb7YQjkrJ74tQdIIA/ZfEO9Rbw8qseByVUzth2YxB4tmGwfGh1
         VG6mRpqwUP+87dbDZ8t5mwylZikeKPKa41r6P9TKUiLnwp9ybzzyMFBG03wIcKfxrS9C
         Uxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y0U+Rv1TeJysLH2QAkxFhbKDvg78z80oMSWOxlzm+JE=;
        b=XhWj6XulV7Qn53JHFCKl7p1Z53Xur2SkXBHJhIHKSiQhrkvz5DnegJqNIhSQoqRhAb
         WHhA0b+ptMuohOMustcZXfyzmsa5No0gkZUIQAhp5iMWg7bHvpEYI1CN4PlX3yvR+o9K
         PAlqgkXG2gfr+RS9XHCeq+XxGkhsaRXlWcFkNopfDrHWDi2Q/dOw1E6B5wQ1m18W6d5R
         9/JXhnromkBm7CH7HWTKWT0hInVJHXv3ow9/w1cJp/lvcUXObbX75KTk1ikNDrZ7UnCP
         eTUh2rSYF/h5wL2jh/+Gcw+Ei+vYjqUvNVrJdGbRlX1BFw0QmDIr1QtefN4Jtszlpy6z
         wT0g==
X-Gm-Message-State: AOAM5328YZOukC1JECKwEyaBbWsTCHgAERWwaviqDQkg9eHIirH1LfsW
        PPO4BIdwD5OnEa0gYJYiwGAaqw==
X-Google-Smtp-Source: ABdhPJwipzZj/FaptbENabrWwE39A8Wdqu22je1Lx4qVtJR2ICara8AGMxBmu4qozck/oVr4U/+UcQ==
X-Received: by 2002:a17:906:d0c3:: with SMTP id bq3mr18875600ejb.424.1613465772747;
        Tue, 16 Feb 2021 00:56:12 -0800 (PST)
Received: from [192.168.0.4] (hst-221-39.medicom.bg. [84.238.221.39])
        by smtp.googlemail.com with ESMTPSA id n21sm5413028ejl.25.2021.02.16.00.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Feb 2021 00:56:12 -0800 (PST)
Subject: Re: [PATCH 1/2] v4l2-ctrl: Add decoder conceal color control
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210209094527.2173690-1-stanimir.varbanov@linaro.org>
 <20210209094527.2173690-2-stanimir.varbanov@linaro.org>
 <cccae00e-e30e-6691-d954-27379a104115@xs4all.nl>
 <489f1417-085d-4057-f2e8-1cc8db0ed161@linaro.org>
 <70c04719-39ac-9ba7-cd2f-6c5b9d5f2275@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <12b37304-84d1-63fe-1d85-60268502d8bc@linaro.org>
Date:   Tue, 16 Feb 2021 10:56:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <70c04719-39ac-9ba7-cd2f-6c5b9d5f2275@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/15/21 1:57 PM, Hans Verkuil wrote:
> On 15/02/2021 12:32, Stanimir Varbanov wrote:
>>
>>
>> On 2/9/21 1:05 PM, Hans Verkuil wrote:
>>> On 09/02/2021 10:45, Stanimir Varbanov wrote:
>>>> Add decoder v4l2 control to set conceal color.
>>>>
>>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>>> ---
>>>>  .../media/v4l/ext-ctrls-codec.rst             | 20 +++++++++++++++++++
>>>>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++++++
>>>>  include/uapi/linux/v4l2-controls.h            |  1 +
>>>>  3 files changed, 30 insertions(+)
>>>>
>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>> index 00944e97d638..994650052333 100644
>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>> @@ -674,6 +674,26 @@ enum v4l2_mpeg_video_frame_skip_mode -
>>>>      is currently displayed (decoded). This value is reset to 0 whenever
>>>>      the decoder is started.
>>>>  
>>>> +``V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR (integer64)``
>>>> +    This control sets conceal color in YUV color space. It describes the
>>>> +    client preference of error conceal color in case of error where
>>>> +    reference frame is missing. The decoder would paint the reference
>>>> +    buffer with preferred color and use it for future decoding.
>>>> +    Applicable to decoders.
>>>
>>> You should mention explicitly that this is using 16-bit color components
>>> and expects Limited Range.
>>
>> I don't want to limit the client to Limited range only. I'll mention in
>> the description that both ranges are valid.
> 
> OK, but then you need to describe what the color format depends on. See more
> below.
> 
>>
>>>
>>>> +
>>>> +.. flat-table::
>>>> +    :header-rows:  0
>>>> +    :stub-columns: 0
>>>> +
>>>> +    * - Bit 0:15
>>>> +      - Y luminance
>>>> +    * - Bit 16:31
>>>> +      - Cb chrominance
>>>> +    * - Bit 32:47
>>>> +      - Cr chrominance
>>>> +    * - Bit 48:63
>>>> +      - Must be zero
>>>> +

The table how the bits are spread into int64.

>>>>  ``V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE (boolean)``
>>>>      If enabled the decoder expects to receive a single slice per buffer,
>>>>      otherwise the decoder expects a single frame in per buffer.
>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>> index 016cf6204cbb..a3b9d28a00b7 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>> @@ -945,6 +945,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>>  	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:			return "VBV Buffer Size";
>>>>  	case V4L2_CID_MPEG_VIDEO_DEC_PTS:			return "Video Decoder PTS";
>>>>  	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:			return "Video Decoder Frame Count";
>>>> +	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:		return "Video Decoder Conceal Color";
>>>>  	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:			return "Initial Delay for VBV Control";
>>>>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:		return "Horizontal MV Search Range";
>>>>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
>>>> @@ -1430,6 +1431,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>>>  		*max = 0x7fffffffffffffffLL;
>>>>  		*step = 1;
>>>>  		break;
>>>> +	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
>>>> +		*type = V4L2_CTRL_TYPE_INTEGER64;
>>>> +		*min = 0;
>>>> +		/* default for 8bit black, luma is 16, chroma is 128 */
>>>
>>> Since this is 16 bit the actual default luma value for black is 4096 and for chroma use
>>> 32768 (i.e. both values are times 256).
>>
>> If we follow this for pixel format with 10bit per channel we have to
>> multiply by 64?
> 
> No, you multiply by 4. 12 bit depth will multiple by 16, and 16 bit depth by 256.
> 
> But how do you format this? Using bits 29-0? Or use 9-0 for one color component,
> 25-16 for another and 41-32 for the last component?

I described this in the table above:

Bit  0:15 - Y luminance
Bit 16:31 - Cb chrominance
Bit 32:47 - Cr chrominance
Bit 48:63 - Must be zero

So depending on the bit depth of the current pixel format:

 8bit - 0:7  Y', 16:23 Cb, 32:39 Cr
10bit - 0:9  Y', 16:25 Cb, 32:41 Cr
12bit - 0:11 Y', 16:27 Cb, 32:43 Cr

> 
> Also missing is an explanation of which bits are for Y', which for Cb and which for Cr.
> 
> It is surprisingly hard to provide an unambiguous description of this :-)
> 
> Regards,
> 
> 	Hans
> 
>>
>>>
>>>> +		*def = 0x8000800010LL;
>>>> +		*max = 0xffffffffffffLL;
>>>> +		*step = 1;
>>>> +		break;
>>>>  	case V4L2_CID_PIXEL_RATE:
>>>>  		*type = V4L2_CTRL_TYPE_INTEGER64;
>>>>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>>>> index 039c0d7add1b..5e5a3068be2d 100644
>>>> --- a/include/uapi/linux/v4l2-controls.h
>>>> +++ b/include/uapi/linux/v4l2-controls.h
>>>> @@ -428,6 +428,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
>>>>  #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
>>>>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
>>>>  #define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID	(V4L2_CID_CODEC_BASE+230)
>>>> +#define V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+231)
>>>>  
>>>>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>>>>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
>>>>
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>
> 

-- 
regards,
Stan
