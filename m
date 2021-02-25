Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0393324DD7
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 11:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhBYKPo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 05:15:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232926AbhBYKNc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 05:13:32 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE3AC06178A
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:12:23 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t15so4627193wrx.13
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Vn11HK/QHBg9CE9WbeXOr9LshINBA4CLu+MxA7Mzfr8=;
        b=ARngZ/D3Nv0+1s9emEGhMEfClMcW9kRfI/HDZnEbj0gN0Qizegn6IxEOdYvRKfaiFe
         ESoncKtaNWD/tJee02gmhCWvSei3s08zNq4ACeYQzncAyYQtRy1cevgY8P8LRm0BAaAX
         qBzn95S0ueYmqmuoJ8kkLiPeEqUmGNreEaP+C1NRUgpD+SWkGzcbhOLKw8ZtKTt1biii
         zNRtV8+qHYzymc/suBEvQV7JstsmuXgW764ZXnxlGNLQhTXAIb69lxlQL2FTsImnM3tk
         eY9MgEYt17ltmUas4CcP5seoaIgX/jr6Or9D1pa67bHmaIpxQZrM8qJB2v1VLC6gQnWO
         SEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vn11HK/QHBg9CE9WbeXOr9LshINBA4CLu+MxA7Mzfr8=;
        b=FQi4LN/nkx+i9QFluCCUhGaj3j1RJMQAINE8mdfk7nBE+KabqDsxdN00vjsn/YI82N
         T0simYTEU5j061+roPRXqw47y6fxBooBr6mB5JLFSGLyq3+CopYq8I+Mlpl28uzrkkUK
         dUWJYWNERv9to6JJQbI5ykm3kV7v1379mmxsaUiUChgUn6TUEX7VFhQxm99eG/G1F6Yx
         L6pcvw3rts/D7OcWlX+rY5kHjkniQ0OglllxT8JlzYIwkzMQDovdqmoi7IavoPVvrjhD
         0klelJ2+CuXRPziyruT8XYa8Srs+gAAtKJBIIPei6Y+X+6YI7/pE+MdmtZTWdX9X4KKf
         abFg==
X-Gm-Message-State: AOAM530PBZycE4hQSEufRx4NIV+rbkfuXuzw1e0pYwk4ciBgJxYH/nPE
        sRgqdrMB+PgY26w6jl1pWJFm8g==
X-Google-Smtp-Source: ABdhPJw9oXOdq41JUnkKdXWSKCNJgCwMqYBDMRm14Ga8eqPrv9ZLgU8NeKG4wBtwX06W7igRUEsxmQ==
X-Received: by 2002:a5d:658a:: with SMTP id q10mr2634713wru.285.1614247942139;
        Thu, 25 Feb 2021 02:12:22 -0800 (PST)
Received: from [192.168.0.4] (hst-221-21.medicom.bg. [84.238.221.21])
        by smtp.googlemail.com with ESMTPSA id l7sm8292289wrn.11.2021.02.25.02.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 02:12:21 -0800 (PST)
Subject: Re: [PATCH 1/2] v4l2-ctrl: Add decoder conceal color control
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210209094527.2173690-1-stanimir.varbanov@linaro.org>
 <20210209094527.2173690-2-stanimir.varbanov@linaro.org>
 <cccae00e-e30e-6691-d954-27379a104115@xs4all.nl>
 <489f1417-085d-4057-f2e8-1cc8db0ed161@linaro.org>
 <70c04719-39ac-9ba7-cd2f-6c5b9d5f2275@xs4all.nl>
 <12b37304-84d1-63fe-1d85-60268502d8bc@linaro.org>
 <eb410d2c-9650-2251-cff8-4306663f41f9@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <4e85add8-3ddf-1d36-f1ab-2866aa9327f8@linaro.org>
Date:   Thu, 25 Feb 2021 12:12:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <eb410d2c-9650-2251-cff8-4306663f41f9@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/16/21 10:58 AM, Hans Verkuil wrote:
> On 16/02/2021 09:56, Stanimir Varbanov wrote:
>>
>>
>> On 2/15/21 1:57 PM, Hans Verkuil wrote:
>>> On 15/02/2021 12:32, Stanimir Varbanov wrote:
>>>>
>>>>
>>>> On 2/9/21 1:05 PM, Hans Verkuil wrote:
>>>>> On 09/02/2021 10:45, Stanimir Varbanov wrote:
>>>>>> Add decoder v4l2 control to set conceal color.
>>>>>>
>>>>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>>>>> ---
>>>>>>  .../media/v4l/ext-ctrls-codec.rst             | 20 +++++++++++++++++++
>>>>>>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++++++
>>>>>>  include/uapi/linux/v4l2-controls.h            |  1 +
>>>>>>  3 files changed, 30 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>> index 00944e97d638..994650052333 100644
>>>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>> @@ -674,6 +674,26 @@ enum v4l2_mpeg_video_frame_skip_mode -
>>>>>>      is currently displayed (decoded). This value is reset to 0 whenever
>>>>>>      the decoder is started.
>>>>>>  
>>>>>> +``V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR (integer64)``
>>>>>> +    This control sets conceal color in YUV color space. It describes the
>>>>>> +    client preference of error conceal color in case of error where
>>>>>> +    reference frame is missing. The decoder would paint the reference
>>>>>> +    buffer with preferred color and use it for future decoding.
>>>>>> +    Applicable to decoders.
>>>>>
>>>>> You should mention explicitly that this is using 16-bit color components
>>>>> and expects Limited Range.
>>>>
>>>> I don't want to limit the client to Limited range only. I'll mention in
>>>> the description that both ranges are valid.
>>>
>>> OK, but then you need to describe what the color format depends on. See more
>>> below.
>>>
>>>>
>>>>>
>>>>>> +
>>>>>> +.. flat-table::
>>>>>> +    :header-rows:  0
>>>>>> +    :stub-columns: 0
>>>>>> +
>>>>>> +    * - Bit 0:15
>>>>>> +      - Y luminance
>>>>>> +    * - Bit 16:31
>>>>>> +      - Cb chrominance
>>>>>> +    * - Bit 32:47
>>>>>> +      - Cr chrominance
>>>>>> +    * - Bit 48:63
>>>>>> +      - Must be zero
>>>>>> +
>>
>> The table how the bits are spread into int64.
>>
>>>>>>  ``V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE (boolean)``
>>>>>>      If enabled the decoder expects to receive a single slice per buffer,
>>>>>>      otherwise the decoder expects a single frame in per buffer.
>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>>> index 016cf6204cbb..a3b9d28a00b7 100644
>>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>>> @@ -945,6 +945,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>>>>  	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:			return "VBV Buffer Size";
>>>>>>  	case V4L2_CID_MPEG_VIDEO_DEC_PTS:			return "Video Decoder PTS";
>>>>>>  	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:			return "Video Decoder Frame Count";
>>>>>> +	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:		return "Video Decoder Conceal Color";
>>>>>>  	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:			return "Initial Delay for VBV Control";
>>>>>>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:		return "Horizontal MV Search Range";
>>>>>>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
>>>>>> @@ -1430,6 +1431,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>>>>>  		*max = 0x7fffffffffffffffLL;
>>>>>>  		*step = 1;
>>>>>>  		break;
>>>>>> +	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
>>>>>> +		*type = V4L2_CTRL_TYPE_INTEGER64;
>>>>>> +		*min = 0;
>>>>>> +		/* default for 8bit black, luma is 16, chroma is 128 */
>>>>>
>>>>> Since this is 16 bit the actual default luma value for black is 4096 and for chroma use
>>>>> 32768 (i.e. both values are times 256).
>>>>
>>>> If we follow this for pixel format with 10bit per channel we have to
>>>> multiply by 64?
>>>
>>> No, you multiply by 4. 12 bit depth will multiple by 16, and 16 bit depth by 256.
>>>
>>> But how do you format this? Using bits 29-0? Or use 9-0 for one color component,
>>> 25-16 for another and 41-32 for the last component?
>>
>> I described this in the table above:
>>
>> Bit  0:15 - Y luminance
>> Bit 16:31 - Cb chrominance
>> Bit 32:47 - Cr chrominance
>> Bit 48:63 - Must be zero
>>
>> So depending on the bit depth of the current pixel format:
>>
>>  8bit - 0:7  Y', 16:23 Cb, 32:39 Cr
>> 10bit - 0:9  Y', 16:25 Cb, 32:41 Cr
>> 12bit - 0:11 Y', 16:27 Cb, 32:43 Cr

^^^^

> 
> Apologies, I missed that table!

Hans, do you want me to update with the above ^^^^ components bits or
something else?

-- 
regards,
Stan
