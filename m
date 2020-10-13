Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B82328D0B3
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 16:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730733AbgJMOxl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 10:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730680AbgJMOxl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 10:53:41 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DDDFC0613D2
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 07:53:39 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e2so255403wme.1
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 07:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ICA433YLVPyv3I1rgIU4450Td5T15hPLGw65X99wt5w=;
        b=AVmot0cP21LCXeJdujf2T9X1noKBH4J9OY0UMUHT4RuJHo/5djzpdSMt4wJ+M10uSl
         5NQPlk38qC+JlOII/rFLxqmWmXrxNCIyh8tNu87hYBR9RWQlN5S2d4UKTAl60HaTQaS6
         MC6SNmdf8MtJMgfsPaDy22df0lIO9EkoUnyAbu0TiKZ1+KgHwRp17c9xg6Gw9NHyaFue
         WAaPdzOKun0zSXo7ynUUaRWtwVTA29G6SqtBgydTRKpE/7OHEYSvvsTFyeSD4IY4Yj9Y
         faeG8+kokuOo8kMjfaIQtmnXGkCYx5qu95joyrvn0+zZzD+O26jAwrR/lxQKYIQsIDkb
         Qvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ICA433YLVPyv3I1rgIU4450Td5T15hPLGw65X99wt5w=;
        b=a6RuReCFpbAR8r7VLnhyiUzBtk/DFOfFzNpxyCSTioaVnFsP3lGGeGww8NVXxdcyju
         jegVD/3ujuPqqBEQr6v0uaR1IRa8CR3ZEnujK8ZaiEl0FW0GPH2PbdHhSxk67veB1eSe
         i2BzrHBliSLePR3iHArgg3ZaKzzsXlfhxMf6rX+ZW03GBuR4/4u/ls1s/mlUVXPLef1S
         4MaWdH5KwrSiIE4EuYNaDEGIUnWcHVgp3AZI9W3L63CsCXNYFUXZmEAZpuwkclZnXWt9
         BrS/irWM+/kpvw9rBJ2Uxwr0qnALJ88qaxyPv5p0ZzPlYXUP7yawn5NLVOFdayQ9Vnt1
         99Yw==
X-Gm-Message-State: AOAM533R16xU8OoIFC6DSMJ17QOh5HOXCXvMWSiCFAvzI/NJ5/pXigYI
        3a65y8ejtgpgQbP/+9RJ6xC/xQ==
X-Google-Smtp-Source: ABdhPJyytUe+8cg9UghMuCNms09YWh5SWHVFkoHdHScdYAc9fDtyKFOJEPE+HeCCgiCAA92/BINc1w==
X-Received: by 2002:a7b:cd9a:: with SMTP id y26mr205313wmj.101.1602600817957;
        Tue, 13 Oct 2020 07:53:37 -0700 (PDT)
Received: from [192.168.1.8] (hst-221-112.medicom.bg. [84.238.221.112])
        by smtp.googlemail.com with ESMTPSA id c18sm29424956wrq.5.2020.10.13.07.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 07:53:37 -0700 (PDT)
Subject: Re: [PATCH] v4l: Add source change event for colorimetry
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20200702100017.24700-1-stanimir.varbanov@linaro.org>
 <8dafbb4b-4626-5191-c57a-f3ef19c14618@linaro.org>
 <d11da037-92e5-2ee7-8723-10162d16eba9@linaro.org>
 <CAAFQd5AYvMrZQtZ2UBOEG6Nar06bZrRZdE57Y6N7+6dZxJ0m_A@mail.gmail.com>
 <7db412a2-8fd3-6657-4fcd-1fbfde4b2c0e@linaro.org>
 <CAAFQd5Cw-23aE09+Gj35JN5ue_HHZQ8nyE+Bwfg5=GKA7WXTnw@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <aa04e5d7-8a98-82c7-a0fe-8afe84a1d9d0@linaro.org>
Date:   Tue, 13 Oct 2020 17:53:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5Cw-23aE09+Gj35JN5ue_HHZQ8nyE+Bwfg5=GKA7WXTnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/13/20 5:07 PM, Tomasz Figa wrote:
> On Tue, Oct 13, 2020 at 3:53 PM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>>
>>
>> On 10/13/20 4:40 PM, Tomasz Figa wrote:
>>> On Tue, Oct 13, 2020 at 11:03 AM Stanimir Varbanov
>>> <stanimir.varbanov@linaro.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 7/2/20 2:52 PM, Stanimir Varbanov wrote:
>>>>> Hi,
>>>>>
>>>>> Once we have this event there is still open question how the client will
>>>>> know the data buffer on which the new colorspace is valid/applied.
>>>>>
>>>>> The options could be:
>>>>>  * a new buffer flag and
>>>>>  * some information in the v4l2_event structure.
>>>>>
>>>>> Thoughts?
>>>>
>>>> Kindly ping.
>>>>
>>>
>>> The event itself sounds good to me, but how do we know which buffer is
>>> the first to have the new colorimetry?
>>
>> I think Hans have a very good idea to have width/height and colorspace
>> specifiers in v4l2_ext_buffer [1].
>>
>> [1] https://lkml.org/lkml/2020/9/9/531
>>
> 
> Hmm, I think that would basically make the event obsolete and without
> solving that problem I suspect the event is not very useful, because
> one could already receive and display (incorrectly) some buffers
> before realizing that they have different colorimetry

Yes, I agree. I wasn't sure does Hans's idea will be well received, thus
I pinged.

> 
> I believe for now we would have to handle this like a resolution
> change - flush the CAPTURE queue and the next buffer after the flush
> would have the new colorimetry. With the new API we could optimize the

I'm not sure what you mean by flush capture queue? Dequeue until LAST
flag (EPIPE) and stop streaming g_fmt(capture queue) and decide what is
changed and start streaming ?

> decoding by getting rid of the flushes and relying on the in-bound
> information.
> 
> Best regards,
> Tomasz
> 
>>>
>>> Best regards,
>>> Tomasz
>>>
>>>>>
>>>>> On 7/2/20 1:00 PM, Stanimir Varbanov wrote:
>>>>>> This event indicate that the source colorspace is changed
>>>>>> during run-time. The client has to retrieve the new colorspace
>>>>>> identifiers by getting the format (G_FMT).
>>>>>>
>>>>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>>>>> ---
>>>>>>  .../userspace-api/media/v4l/vidioc-dqevent.rst        | 11 ++++++++++-
>>>>>>  .../userspace-api/media/videodev2.h.rst.exceptions    |  1 +
>>>>>>  include/uapi/linux/videodev2.h                        |  1 +
>>>>>>  3 files changed, 12 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>>>> index a9a176d5256d..3f69c753db58 100644
>>>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>>>> @@ -381,7 +381,16 @@ call.
>>>>>>      that many Video Capture devices are not able to recover from a temporary
>>>>>>      loss of signal and so restarting streaming I/O is required in order for
>>>>>>      the hardware to synchronize to the video signal.
>>>>>> -
>>>>>> +    * - ``V4L2_EVENT_SRC_CH_COLORIMETRY``
>>>>>> +      - 0x0002
>>>>>> +      - This event gets triggered when a colorspace change is detected at
>>>>>> +    an input. By colorspace change here we include also changes in the
>>>>>> +    colorspace specifiers (transfer function, Y'CbCr encoding and
>>>>>> +    quantization). This event can come from an input or from video decoder.
>>>>>> +    Once the event has been send to the client the driver has to update
>>>>>> +    the colorspace specifiers internally so that they could be retrieved by
>>>>>> +    client. In that case queue re-negotiation is not needed as this change
>>>>>> +    only reflects on the interpretation of the data.
>>>>>>
>>>>>>  Return Value
>>>>>>  ============
>>>>>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>>> index ca05e4e126b2..54fc21af852d 100644
>>>>>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>>> @@ -492,6 +492,7 @@ replace define V4L2_EVENT_CTRL_CH_FLAGS ctrl-changes-flags
>>>>>>  replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
>>>>>>
>>>>>>  replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
>>>>>> +replace define V4L2_EVENT_SRC_CH_COLORIMETRY src-changes-flags
>>>>>>
>>>>>>  replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
>>>>>>
>>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>>>> index 303805438814..b5838bc4e3a3 100644
>>>>>> --- a/include/uapi/linux/videodev2.h
>>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>>> @@ -2351,6 +2351,7 @@ struct v4l2_event_frame_sync {
>>>>>>  };
>>>>>>
>>>>>>  #define V4L2_EVENT_SRC_CH_RESOLUTION                (1 << 0)
>>>>>> +#define V4L2_EVENT_SRC_CH_COLORIMETRY               (1 << 1)
>>>>>>
>>>>>>  struct v4l2_event_src_change {
>>>>>>      __u32 changes;
>>>>>>
>>>>>
>>>>
>>>> --
>>>> regards,
>>>> Stan
>>
>> --
>> regards,
>> Stan

-- 
regards,
Stan
