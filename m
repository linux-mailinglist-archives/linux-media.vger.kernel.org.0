Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F8A28CEBF
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 14:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgJMMwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 08:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728264AbgJMMwQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 08:52:16 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05764C0613D2
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 05:52:15 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g12so23882093wrp.10
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 05:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LS+HMgito630Z8wdvbTvwB3oR4AOb/+K/YWZe6JSBwQ=;
        b=SSGZcyzIr776WTsuIhH9HiaHbRPNmlM4yqL9xNAmigJQj2MC+C/DVDBuqNrtCwarPA
         Fvcm9O1myYeCph+0gQ8AOw+q4fAqwbyvnbQ42wwLic3SpfEzjiWpWx9JN46/GB8KEG09
         Ap30EREazTEBq/XvkpsiSjAolG23UyS+tCxSq1UjjQh8fLby//jHq+yaBqm+S21VAtrk
         v2QXL3r2mTGVdxuBRXfSGWpN7DNdoq0qmKjI0yOR0oY6DUhsVKVBWvR7C0cR1JBs/aiI
         /KAVnG2+EjPDMuC1u7LFeHzucVnu/G2T4pqjCBejvMHx+R8hzI0Kq1GJe6P7T1cbzqfW
         uPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LS+HMgito630Z8wdvbTvwB3oR4AOb/+K/YWZe6JSBwQ=;
        b=RAL2oyi3DdCkQonRiw7VoWtLWhj3X+rYXMmLxljte6kV/r64y4kosCkWmVI93Yukss
         Z9q3ApRNFNDKl/pBw8lbqWOk7FB23nTDe9Li8OjdMDVVAL5wjHfZqjqtz2moZb14/Zgc
         pt7n6Xy7h+RzkabjgwxepgdcBnWCPpoWxPcjItqVCjIV5JpXihbMyEkZq2y8tuslqhuc
         T3EFB4TDM60qMuLp235xraEII0Hrtb1KchsWd2zma40Lu7cUmbyaWRs5v4s5k3drz7cz
         lRIbIQ4lI59y+/DMvST6IerIKlZyXDgU9+Ag4UDgHDwuKiiQIAw3qfY51sEKW6Nooqwc
         KY0g==
X-Gm-Message-State: AOAM533pXgEyYvOBnZw+9LVf335iLhbucTp6jzqPxPvcYc9wXGFFipVX
        T513Aeb9yEjo5BPEuh7acr2aml0Hvj/VkA==
X-Google-Smtp-Source: ABdhPJzG1B24xEhxPwzT1OZRd9Dhno3qLc+usyxzYOsTo4fUHqZY+f0jJxTPMSfwonsmm0p/RYjCww==
X-Received: by 2002:adf:814f:: with SMTP id 73mr15669899wrm.174.1602593533669;
        Tue, 13 Oct 2020 05:52:13 -0700 (PDT)
Received: from [192.168.1.8] (hst-221-122.medicom.bg. [84.238.221.122])
        by smtp.googlemail.com with ESMTPSA id t6sm32248867wre.30.2020.10.13.05.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 05:52:13 -0700 (PDT)
Subject: Re: [PATCH] v4l2-ctrl: add control for thumnails
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20200526085446.30956-1-stanimir.varbanov@linaro.org>
 <65ac9697-a43f-7025-e6fe-69c4a44c6d9a@xs4all.nl>
 <ce28a840-a763-6700-16dd-d708e570d55c@linaro.org>
 <d02c6cd0-a502-dc52-519e-54b6328d5373@linaro.org>
 <544b19dd-4883-bae0-b488-46c856eb207d@xs4all.nl>
 <6f71931a-9060-a399-835c-a1cf1f05dc79@linaro.org>
 <1bc10e88-8cbe-3da9-daeb-d015f42d7acc@xs4all.nl>
 <CAAFQd5Aorm-O7OMcHsnRUEGQq2qoPDRtAuukiLHgC9g54oAW9Q@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <de40cdf1-0b84-a252-0137-a550f078d28b@linaro.org>
Date:   Tue, 13 Oct 2020 15:52:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5Aorm-O7OMcHsnRUEGQq2qoPDRtAuukiLHgC9g54oAW9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/4/20 3:57 PM, Tomasz Figa wrote:
> On Thu, Jun 4, 2020 at 2:56 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 04/06/2020 14:34, Stanimir Varbanov wrote:
>>> Hi Hans,
>>>
>>> On 6/4/20 12:08 PM, Hans Verkuil wrote:
>>>> On 04/06/2020 11:02, Stanimir Varbanov wrote:
>>>>> Hi Hans,
>>>>>
>>>>> On 5/27/20 12:53 AM, Stanimir Varbanov wrote:
>>>>>> Hi Hans,
>>>>>>
>>>>>> On 5/26/20 3:04 PM, Hans Verkuil wrote:
>>>>>>> On 26/05/2020 10:54, Stanimir Varbanov wrote:
>>>>>>>> Add v4l2 control for decoder thumbnail.
>>>>>>>>
>>>>>>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>>>>>>> ---
>>>>>>>>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 7 +++++++
>>>>>>>>  drivers/media/v4l2-core/v4l2-ctrls.c                      | 2 ++
>>>>>>>>  include/uapi/linux/v4l2-controls.h                        | 2 ++
>>>>>>>>  3 files changed, 11 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>>>> index d0d506a444b1..e838e410651b 100644
>>>>>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>>>> @@ -3726,6 +3726,13 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>>>>>>>      disables generating SPS and PPS at every IDR. Setting it to one enables
>>>>>>>>      generating SPS and PPS at every IDR.
>>>>>>>>
>>>>>>>> +``V4L2_CID_MPEG_VIDEO_DECODER_THUMBNAIL (button)``
>>>>>>>> +    Instructs the decoder to produce immediate output. The decoder should
>>>>>>>> +    consume first input buffer for progressive stream (or first two buffers
>>>>>>>> +    for interlace). Decoder should not allocate more output buffers that it
>>>>>>>> +    is required to consume one input frame. Usually the decoder input
>>>>>>>> +    buffers will contain only I/IDR frames but it is not mandatory.
>>>>>>>
>>>>>>> This is very vague. It doesn't explain why the control is called 'THUMBNAIL',
>>>>>>> but more importantly it doesn't explain how this relates to normal decoding.
>>>>>>
>>>>>> If in the normal decode the capture queue buffers are 5, in the
>>>>>> thumbnail mode the number of buffers will be only 1 (if the bitstream is
>>>>>> progressive) and this will guarantee low memory usage. The other
>>>>>> difference is that the decoder will produce decoded frames (without
>>>>>> errors) only for I/IDR (sync frames).
>>>>
>>>> Isn't this really a "DECODE_SYNC_FRAMES_ONLY" control? That's what it does,
>>>> right? Skip any B/P frames and only decode sync frames.
>>>
>>> Yes, it is.
>>> To me V4L2_CID_MPEG_VIDEO_DECODE_SYNC_FRAMES sounds better. If you are
>>> fine I can send a new patch.
>>>
>>> The definition of "sync frames" is a bit difficult for codec-agnostic
>>> controls. Is it sound better "INTRA", DECODE_INTRA_FRAMES (ONLY)?
>>
>> INTRA is better. DECODE_INTRA_FRAMES_ONLY is a good name, I think.
>>
>> Thumbnail creation can be given as an example in the description of the
>> control, but that's just a use-case.
> 
> How about the other aspect of the behavior?
> 
> "Decoder should not allocate more output buffers that it
> is required to consume one input frame."
> 

In fact I have to refine this; It looks like that picture type decode vs
thumbnail are two different modes.

Thumbnail mode - first frame decode without additional memory (one input
buffer and one output buffer). The first frame can be even non-intra
frame as well. Also no matter frame parser is sending, the decoder will
try to produce output for thumbnail generation.

> Best regards,
> Tomasz
> 
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>>>
>>>> That this is useful for creating thumbnails is just a specific use-case.
>>>>
>>>> Regards,
>>>>
>>>>      Hans
>>>>
>>>>>>
>>>>>>>
>>>>>>> I.e. if you are decoding and 'press' this control, what happens then?
>>>>>>
>>>>>> Might be the button type wasn't great idea. In fact the control should
>>>>>> be set before streamon so that the driver returns min_capture_bufs 1.
>>>>>>
>>>>>>>
>>>>>>> What exactly is the use-case?
>>>>>>
>>>>>> It could be used to generate thumbnails of all video clips in a folder
>>>>>> or when you open a Gallery application on your phone.
>>>>>>
>>>>>
>>>>> What is your opinion on that control? I could consider to make it Venus
>>>>> custom control but from the use-case it looks other drivers also can
>>>>> benefit of it.
>>>>>
>>>>> I tried to make more generic one [1] but it looks it will be too difficult.
>>>>>
>>>>
>>>
>>

-- 
regards,
Stan
