Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78B528CF85
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 15:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387583AbgJMNx3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 09:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728852AbgJMNx3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 09:53:29 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C462DC0613D2
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 06:53:28 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id n15so24181789wrq.2
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 06:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CTB6OvgweI2R52tC86/g7f29zSqU9vcDSQYaOzrbBJA=;
        b=CI7ZJcJmxE1tclSVzoOBMvHls7/4sOCvpghd5DRUHZMd2ZgZEXJraPWape9OEffDN7
         WVeoV21hMblnQ9cz80CdMTf9KYNTjlS31/B9pPZTR26T2O6m2H5i7qnfxb5X0nTkGpUV
         4vjmq0GkYY56WcIobZMsQSlzf6SbShK8E7NIZrHwXKCj2KzdzT4dfVeo4v8xoGGxlSFj
         UcoH8U2znqqzjdw9JVmy74zYb4MX8g8ZGjtfQoa0T8MIqd/rmOsw076TocVyvTPO90Yc
         RlKNgEg+YA6Titr11GpTA4C0rQNJpCX+mnt0dfSEJ9TqZF2OKfmkoJ1+IJQKv+zh9/Sk
         jJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CTB6OvgweI2R52tC86/g7f29zSqU9vcDSQYaOzrbBJA=;
        b=TG8hYn7WSIXYlqjDaeVD+o9Nj2JPEaKSBoCHGmBmddMkLDea9eb3NE675TPU1cMC7x
         5tiZ5zdexex761dq6qJf1JujHdnvbEY66J4MgV0gXTH1O73Q+ESIGPPBPaV3RAxS5cOH
         e08BSy4EVH2omz69PbV2opmKOl+z4bRK/FRT9SoWLqMgwXjwHGt4jzR/RL9n6997L1do
         JHCihM3ZId0vB1fKB/FknSvhpl46V2I51UfO4Lx39JRFJZCtyRq3sAYSvEQmJyT7Sm3C
         KRSILU2Sip5v1e1Xp4PyM3CpOrzEyyDSzr61lXbthLOWZtwDJPHVCaPgejgPPb9tV8K0
         0uMg==
X-Gm-Message-State: AOAM533U2ulomYmjgBTn4ZzpMF1K4O/Ljei1LBBSVBWl/HZPMYiGN2wf
        7Qp5f2kyW/nx3z/yqOBhskPPTQ==
X-Google-Smtp-Source: ABdhPJw6Av1bSuxg1w5gOpe9G92yJ9ckRU8zFQzc8zsNahLtNfD86ENG0QiT+7kn4I62lUe3qU3blg==
X-Received: by 2002:adf:979c:: with SMTP id s28mr36022446wrb.62.1602597207387;
        Tue, 13 Oct 2020 06:53:27 -0700 (PDT)
Received: from [192.168.1.8] (hst-221-88.medicom.bg. [84.238.221.88])
        by smtp.googlemail.com with ESMTPSA id g14sm28510332wrx.22.2020.10.13.06.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 06:53:26 -0700 (PDT)
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
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <7db412a2-8fd3-6657-4fcd-1fbfde4b2c0e@linaro.org>
Date:   Tue, 13 Oct 2020 16:53:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5AYvMrZQtZ2UBOEG6Nar06bZrRZdE57Y6N7+6dZxJ0m_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/13/20 4:40 PM, Tomasz Figa wrote:
> On Tue, Oct 13, 2020 at 11:03 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Hi,
>>
>> On 7/2/20 2:52 PM, Stanimir Varbanov wrote:
>>> Hi,
>>>
>>> Once we have this event there is still open question how the client will
>>> know the data buffer on which the new colorspace is valid/applied.
>>>
>>> The options could be:
>>>  * a new buffer flag and
>>>  * some information in the v4l2_event structure.
>>>
>>> Thoughts?
>>
>> Kindly ping.
>>
> 
> The event itself sounds good to me, but how do we know which buffer is
> the first to have the new colorimetry?

I think Hans have a very good idea to have width/height and colorspace
specifiers in v4l2_ext_buffer [1].

[1] https://lkml.org/lkml/2020/9/9/531

> 
> Best regards,
> Tomasz
> 
>>>
>>> On 7/2/20 1:00 PM, Stanimir Varbanov wrote:
>>>> This event indicate that the source colorspace is changed
>>>> during run-time. The client has to retrieve the new colorspace
>>>> identifiers by getting the format (G_FMT).
>>>>
>>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>>> ---
>>>>  .../userspace-api/media/v4l/vidioc-dqevent.rst        | 11 ++++++++++-
>>>>  .../userspace-api/media/videodev2.h.rst.exceptions    |  1 +
>>>>  include/uapi/linux/videodev2.h                        |  1 +
>>>>  3 files changed, 12 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>> index a9a176d5256d..3f69c753db58 100644
>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>> @@ -381,7 +381,16 @@ call.
>>>>      that many Video Capture devices are not able to recover from a temporary
>>>>      loss of signal and so restarting streaming I/O is required in order for
>>>>      the hardware to synchronize to the video signal.
>>>> -
>>>> +    * - ``V4L2_EVENT_SRC_CH_COLORIMETRY``
>>>> +      - 0x0002
>>>> +      - This event gets triggered when a colorspace change is detected at
>>>> +    an input. By colorspace change here we include also changes in the
>>>> +    colorspace specifiers (transfer function, Y'CbCr encoding and
>>>> +    quantization). This event can come from an input or from video decoder.
>>>> +    Once the event has been send to the client the driver has to update
>>>> +    the colorspace specifiers internally so that they could be retrieved by
>>>> +    client. In that case queue re-negotiation is not needed as this change
>>>> +    only reflects on the interpretation of the data.
>>>>
>>>>  Return Value
>>>>  ============
>>>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>> index ca05e4e126b2..54fc21af852d 100644
>>>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>> @@ -492,6 +492,7 @@ replace define V4L2_EVENT_CTRL_CH_FLAGS ctrl-changes-flags
>>>>  replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
>>>>
>>>>  replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
>>>> +replace define V4L2_EVENT_SRC_CH_COLORIMETRY src-changes-flags
>>>>
>>>>  replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
>>>>
>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>> index 303805438814..b5838bc4e3a3 100644
>>>> --- a/include/uapi/linux/videodev2.h
>>>> +++ b/include/uapi/linux/videodev2.h
>>>> @@ -2351,6 +2351,7 @@ struct v4l2_event_frame_sync {
>>>>  };
>>>>
>>>>  #define V4L2_EVENT_SRC_CH_RESOLUTION                (1 << 0)
>>>> +#define V4L2_EVENT_SRC_CH_COLORIMETRY               (1 << 1)
>>>>
>>>>  struct v4l2_event_src_change {
>>>>      __u32 changes;
>>>>
>>>
>>
>> --
>> regards,
>> Stan

-- 
regards,
Stan
