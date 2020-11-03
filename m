Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 200D22A41E3
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 11:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgKCKaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 05:30:21 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:53801 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725988AbgKCKaV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 05:30:21 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZtZskFXTFlQTrZtZwk8PKj; Tue, 03 Nov 2020 11:30:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604399418; bh=XW6g+Sp1Rd+1NkyLeSdpgSTFvj4baApnJo9OSUzUBE4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=W2Lm/8n7S8PI4WgufywOV5i5BlOYS0SnYXRgjwXXm381UC2PH7Dbes3tG64VSRcAc
         rHXOYk0hhJ4enZXCaGNgzA572z2wSSyAr2HlxdNUX2mmkKa3WYxKqeli0VbpSakifx
         uxcbOZG/3irAm+fXuFx6hH9W93p587plmB+EXjTrdVsJ7X/H6jmziJNYWxDGliuhiY
         BHvUHvHFwBJu2hoe3EpcAi2LnyPNUn3hx3xgTFj/FGoLTlHhHHbPoTzbvNmCkuKJ9N
         skOnrqRYB5imlu2Z5xDaO//1k7tCqEEVEBHjVTkSI+QSDLzO3Jt/yt+JS1VE9srTw7
         ln4ThRLKeflZA==
Subject: Re: [PATCH] v4l: Add source change event for colorimetry
To:     Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20200702100017.24700-1-stanimir.varbanov@linaro.org>
 <8dafbb4b-4626-5191-c57a-f3ef19c14618@linaro.org>
 <d11da037-92e5-2ee7-8723-10162d16eba9@linaro.org>
 <CAAFQd5AYvMrZQtZ2UBOEG6Nar06bZrRZdE57Y6N7+6dZxJ0m_A@mail.gmail.com>
 <7db412a2-8fd3-6657-4fcd-1fbfde4b2c0e@linaro.org>
 <CAAFQd5Cw-23aE09+Gj35JN5ue_HHZQ8nyE+Bwfg5=GKA7WXTnw@mail.gmail.com>
 <aa04e5d7-8a98-82c7-a0fe-8afe84a1d9d0@linaro.org>
 <CAAFQd5DP0qMExsBY4UEhP9gLNUfwokzn3S7sgkAZPMTkkt7M6w@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5f4684bb-ae62-805b-1175-68cb107cd1af@xs4all.nl>
Date:   Tue, 3 Nov 2020 11:30:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5DP0qMExsBY4UEhP9gLNUfwokzn3S7sgkAZPMTkkt7M6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOwMDSiGmHhB0lXesWLSE5d4/2WcTgo/wy/O5G47MlzSspC5WV3ymAYOX1XL6Nbykzgv1mMOwmNw7Ysf7mnGcFJuu/nWxIXrhksBY15drG6sb3aj+8KO
 VgfLdVOrfBUhL/3ZVIGrq7nhWwGfTGIJZG9noadovXKLzoQrFFpCmJY4R010/O408RPQDbfCtPRECZ80HxhPQ98zXTZHCtglaFTkNLYC2eefYqQxX5eyyKne
 eJo1GWS1qug/sqnweD8OMfkRLn8AuU+1JTxfZfvPcH1mKM5hbe0esx5Yl5IJwxzqSHZ+HUSOTHB2qq8VcnZECZwu1ooGTlxNZaFh0aplrHz/L/B2PNFbq336
 DPrtQ4Gat3Ab5ExV8/wTCZ9k4QSgdQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/10/2020 16:56, Tomasz Figa wrote:
> On Tue, Oct 13, 2020 at 4:53 PM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>>
>>
>> On 10/13/20 5:07 PM, Tomasz Figa wrote:
>>> On Tue, Oct 13, 2020 at 3:53 PM Stanimir Varbanov
>>> <stanimir.varbanov@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 10/13/20 4:40 PM, Tomasz Figa wrote:
>>>>> On Tue, Oct 13, 2020 at 11:03 AM Stanimir Varbanov
>>>>> <stanimir.varbanov@linaro.org> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 7/2/20 2:52 PM, Stanimir Varbanov wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> Once we have this event there is still open question how the client will
>>>>>>> know the data buffer on which the new colorspace is valid/applied.
>>>>>>>
>>>>>>> The options could be:
>>>>>>>  * a new buffer flag and
>>>>>>>  * some information in the v4l2_event structure.
>>>>>>>
>>>>>>> Thoughts?
>>>>>>
>>>>>> Kindly ping.
>>>>>>
>>>>>
>>>>> The event itself sounds good to me, but how do we know which buffer is
>>>>> the first to have the new colorimetry?
>>>>
>>>> I think Hans have a very good idea to have width/height and colorspace
>>>> specifiers in v4l2_ext_buffer [1].
>>>>
>>>> [1] https://lkml.org/lkml/2020/9/9/531
>>>>
>>>
>>> Hmm, I think that would basically make the event obsolete and without
>>> solving that problem I suspect the event is not very useful, because
>>> one could already receive and display (incorrectly) some buffers
>>> before realizing that they have different colorimetry
>>
>> Yes, I agree. I wasn't sure does Hans's idea will be well received, thus
>> I pinged.

I think we should wait with this patch. If this can be added to the
proposed extended buffer API, then that will solve this issue in a
clean way.

For the time being I'll mark this patch as RFC in patchwork.

Regards,

	Hans

>>
>>>
>>> I believe for now we would have to handle this like a resolution
>>> change - flush the CAPTURE queue and the next buffer after the flush
>>> would have the new colorimetry. With the new API we could optimize the
>>
>> I'm not sure what you mean by flush capture queue? Dequeue until LAST
>> flag (EPIPE) and stop streaming g_fmt(capture queue) and decide what is
>> changed and start streaming ?
> 
> Yes, although no strict need to stop streaming, other ways are defined
> as well, e.g. DEC_CMD_START.
> 
> Of course we would need to make appropriate changes to the spec and so
> I'd just unify it with the resolution change sequence. I think we
> could rename it to "Stream parameter change".
> 
>>
>>> decoding by getting rid of the flushes and relying on the in-bound
>>> information.
>>>
>>> Best regards,
>>> Tomasz
>>>
>>>>>
>>>>> Best regards,
>>>>> Tomasz
>>>>>
>>>>>>>
>>>>>>> On 7/2/20 1:00 PM, Stanimir Varbanov wrote:
>>>>>>>> This event indicate that the source colorspace is changed
>>>>>>>> during run-time. The client has to retrieve the new colorspace
>>>>>>>> identifiers by getting the format (G_FMT).
>>>>>>>>
>>>>>>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>>>>>>> ---
>>>>>>>>  .../userspace-api/media/v4l/vidioc-dqevent.rst        | 11 ++++++++++-
>>>>>>>>  .../userspace-api/media/videodev2.h.rst.exceptions    |  1 +
>>>>>>>>  include/uapi/linux/videodev2.h                        |  1 +
>>>>>>>>  3 files changed, 12 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>>>>>> index a9a176d5256d..3f69c753db58 100644
>>>>>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>>>>>> @@ -381,7 +381,16 @@ call.
>>>>>>>>      that many Video Capture devices are not able to recover from a temporary
>>>>>>>>      loss of signal and so restarting streaming I/O is required in order for
>>>>>>>>      the hardware to synchronize to the video signal.
>>>>>>>> -
>>>>>>>> +    * - ``V4L2_EVENT_SRC_CH_COLORIMETRY``
>>>>>>>> +      - 0x0002
>>>>>>>> +      - This event gets triggered when a colorspace change is detected at
>>>>>>>> +    an input. By colorspace change here we include also changes in the
>>>>>>>> +    colorspace specifiers (transfer function, Y'CbCr encoding and
>>>>>>>> +    quantization). This event can come from an input or from video decoder.
>>>>>>>> +    Once the event has been send to the client the driver has to update
>>>>>>>> +    the colorspace specifiers internally so that they could be retrieved by
>>>>>>>> +    client. In that case queue re-negotiation is not needed as this change
>>>>>>>> +    only reflects on the interpretation of the data.
>>>>>>>>
>>>>>>>>  Return Value
>>>>>>>>  ============
>>>>>>>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>>>>> index ca05e4e126b2..54fc21af852d 100644
>>>>>>>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>>>>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>>>>> @@ -492,6 +492,7 @@ replace define V4L2_EVENT_CTRL_CH_FLAGS ctrl-changes-flags
>>>>>>>>  replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
>>>>>>>>
>>>>>>>>  replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
>>>>>>>> +replace define V4L2_EVENT_SRC_CH_COLORIMETRY src-changes-flags
>>>>>>>>
>>>>>>>>  replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
>>>>>>>>
>>>>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>>>>>> index 303805438814..b5838bc4e3a3 100644
>>>>>>>> --- a/include/uapi/linux/videodev2.h
>>>>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>>>>> @@ -2351,6 +2351,7 @@ struct v4l2_event_frame_sync {
>>>>>>>>  };
>>>>>>>>
>>>>>>>>  #define V4L2_EVENT_SRC_CH_RESOLUTION                (1 << 0)
>>>>>>>> +#define V4L2_EVENT_SRC_CH_COLORIMETRY               (1 << 1)
>>>>>>>>
>>>>>>>>  struct v4l2_event_src_change {
>>>>>>>>      __u32 changes;
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>> --
>>>>>> regards,
>>>>>> Stan
>>>>
>>>> --
>>>> regards,
>>>> Stan
>>
>> --
>> regards,
>> Stan

