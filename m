Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB1F645B969
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 12:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240996AbhKXLrW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 06:47:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbhKXLrS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 06:47:18 -0500
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11A4C061574;
        Wed, 24 Nov 2021 03:44:07 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id pqgzmeLNgCMnApqh2mvgKM; Wed, 24 Nov 2021 12:44:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637754244; bh=+V7auKfyf1wKv90AUgg2SVaaY0W1hdiUsSSI5fceQ8M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=clvZGTOPvxfxE8yIilR39u4+eLhAG+q1XpdcTUB+thgtT3aHvrXEl0f6uJHMpF4vz
         7wxTixdz/dYHXjllj86eK46xLyk0C6n9KAx62EGIN50tTk/6FQwF6aD5I8nmQayeZj
         fjxtpGFlv+191Sz3CQIFlRIkn6ukyqVHq15Ry/8kcqg3K1GRgHMTs+2pFrHVyTOy0X
         ZQ3UVH8VcmZYQa+F8NMcu/3ZDAIclA64nItP/LFh2yiBeBCmh1diL6xJlVymsTtrTE
         8yXY/x64z9hfX3iDlIG5PvpCPObGakpC62/bsesOBs1xef1gqNTPAmHpx2yFSRduk0
         Bs8YCBhRfDReA==
Subject: Re: [EXT] Re: [PATCH] media: docs: dev-decoder: add restrictions
 about CAPTURE buffers
To:     Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Ming Qian <ming.qian@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20211018091427.88468-1-acourbot@chromium.org>
 <9cb4f64e2ec3959df44b71dd69ef95697920dc4b.camel@ndufresne.ca>
 <AM6PR04MB634130FEB433CCA352CE98FBE7879@AM6PR04MB6341.eurprd04.prod.outlook.com>
 <dc7496db-9ba3-fa7b-8563-1157b63c9b0d@linaro.org>
 <b8f877c9ba2cbd0d6839ac86892725a41097391a.camel@ndufresne.ca>
 <CAPBb6MVE3+=BXQver3FZtonHW-OoCvfhKeegWv+hE75cFJFTDA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <07d055d6-d139-24c2-3711-14726cd3e441@xs4all.nl>
Date:   Wed, 24 Nov 2021 12:44:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MVE3+=BXQver3FZtonHW-OoCvfhKeegWv+hE75cFJFTDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEsB7zSbcjGFaBA1qqESZWBe+FcBKKgCmPdVuk4GCaUu9gUbyNuDypE/XM2PD8kmJ+bKQgyL/rqKDMKTj0ELIHF4EsLX9TdYu2VIsr3GNpkwclzK5lWS
 NQTFI4Q1MTIqnFEzKcW4k/T2E0/LPwUdpaiO5gy5ygplB+mQS0PrhiLByLQSoqbA0cFxagcudBbCkbwbSZ/OLqIUkeHnkD13xnUiTete1b9ddwqG7C3gEyyi
 kN7uE9FbD4dkMmhIuvqL5KYKPsZISR+nrpMTlrNS95AQrY4gkESjtgSNquad+PlF97Ri6nPy7nGSS/bsT9RIb9Vvb1qqwUF1AwmQCDYCrCjZHpZzwFj/zZRF
 AcTKDxQjvYRNMTP/B6XIW8QHjbM41eFMyizoy770/ec+E4yhlaOY1vz15FAIctIXablCh1n7FH+GIQ8mk3iqzM4VwlckHg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/11/2021 23:58, Alexandre Courbot wrote:
> Thanks for the comments. It looks like we are having a consensus that
> the described behavior is the current (untold) expectation, and how a
> client should behave if it wants to support all V4L2 decoders. OTOH it
> would also be nice to be able to signal the client that CAPTURE
> buffers are not used by the hardware and can thus be overwritten/freed
> at will.
> 
> I have discussed a bit with Nicolas on IRC and we were wondering where
> such a flag signaling that capability should be. We could have:
> 
> 1) Something global to the currently set format, i.e. maybe take some
> space from the reserved area of v4l2_pix_format_mplane to add a flag.
> The property would then be global to all buffers, and apply between
> calls to STREAMON and STREAMOFF.

VIDIOC_ENUM_FMT is already used to signal format flags, so it could be
put there.

Regards,

	Hans

> 
> 2) An additional flag to the v4l2_buffer structure that would signal
> whether the buffer is currently writable. This means the writable
> property of buffers can be signaled on a finer grain (i.e. reference
> frames would not be writable, but non-reference ones would be), and we
> can even update the status of a given buffer after it is not used as a
> reference (the client would have to QUERYBUF to get the updated status
> though). OTOH a client that needs to know whether the buffers are
> writable before streaming would need to query them all one-by-one.
> 
> I am not sure whether we need something as precise as 2), or whether
> 1) would be enough and globally simpler. Any more thoughts?
> 
> Cheers,
> Alex.
> 
> On Mon, Nov 1, 2021 at 11:52 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>>
>> Le vendredi 29 octobre 2021 à 10:28 +0300, Stanimir Varbanov a écrit :
>>>
>>> On 10/29/21 5:10 AM, Ming Qian wrote:
>>>>> -----Original Message-----
>>>>> From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
>>>>> Sent: Tuesday, October 26, 2021 10:12 PM
>>>>> To: Alexandre Courbot <acourbot@chromium.org>; Mauro Carvalho Chehab
>>>>> <mchehab@kernel.org>; Hans Verkuil <hverkuil-cisco@xs4all.nl>; Tomasz Figa
>>>>> <tfiga@chromium.org>
>>>>> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org
>>>>> Subject: [EXT] Re: [PATCH] media: docs: dev-decoder: add restrictions about
>>>>> CAPTURE buffers
>>>>>
>>>>> Caution: EXT Email
>>>>>
>>>>> Le lundi 18 octobre 2021 à 18:14 +0900, Alexandre Courbot a écrit :
>>>>>> CAPTURE buffers might be read by the hardware after they are dequeued,
>>>>>> which goes against the general idea that userspace has full control
>>>>>> over dequeued buffers. Explain why and document the restrictions that
>>>>>> this implies for userspace.
>>>>>>
>>>>>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>>>>>> ---
>>>>>>  .../userspace-api/media/v4l/dev-decoder.rst     | 17
>>>>> +++++++++++++++++
>>>>>>  1 file changed, 17 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>>>>> b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>>>>> index 5b9b83feeceb..3cf2b496f2d0 100644
>>>>>> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>>>>> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>>>>> @@ -752,6 +752,23 @@ available to dequeue. Specifically:
>>>>>>       buffers are out-of-order compared to the ``OUTPUT`` buffers):
>>>>> ``CAPTURE``
>>>>>>       timestamps will not retain the order of ``OUTPUT`` timestamps.
>>>>>>
>>>>>> +.. note::
>>>>>> +
>>>>>> +   The backing memory of ``CAPTURE`` buffers that are used as reference
>>>>> frames
>>>>>> +   by the stream may be read by the hardware even after they are
>>>>> dequeued.
>>>>>> +   Consequently, the client should avoid writing into this memory while the
>>>>>> +   ``CAPTURE`` queue is streaming. Failure to observe this may result in
>>>>>> +   corruption of decoded frames.
>>>>>> +
>>>>>> +   Similarly, when using a memory type other than
>>>>> ``V4L2_MEMORY_MMAP``, the
>>>>>> +   client should make sure that each ``CAPTURE`` buffer is always queued
>>>>> with
>>>>>> +   the same backing memory for as long as the ``CAPTURE`` queue is
>>>>> streaming.
>>>>>> +   The reason for this is that V4L2 buffer indices can be used by drivers to
>>>>>> +   identify frames. Thus, if the backing memory of a reference frame is
>>>>>> +   submitted under a different buffer ID, the driver may misidentify it and
>>>>>> +   decode a new frame into it while it is still in use, resulting in corruption
>>>>>> +   of the following frames.
>>>>>> +
>>>>>
>>>>> I think this is nice addition, but insufficient. We should extend the API with a
>>>>> flags that let application know if the buffers are reference or secondary. For the
>>>>> context, we have a mix of CODEC that will output usable reference frames and
>>>>> needs careful manipulation and many other drivers where the buffers *maybe*
>>>>> secondary, meaning they may have been post-processed and modifying these
>>>>> in- place may have no impact.
>>>>>
>>>>> The problem is the "may", that will depends on the chosen CAPTURE format. I
>>>>> believe we should flag this, this flag should be set by the driver, on CAPTURE
>>>>> queue. The information is known after S_FMT, so Format Flag, Reqbufs
>>>>> capabilities or querybuf flags are candidates. I think the buffer flags are the
>>>>> best named flag, though we don't expect this to differ per buffer. Though,
>>>>> userspace needs to call querybuf for all buf in order to export or map them.
>>>>>
>>>>> What userspace can do with this is to export the DMABuf as read-only, and
>>>>> signal this internally in its own context. This is great to avoid any unwanted
>>>>> side effect described here.
>>>>
>>>> I think a flag should be add to tell a buffer is reference or secondary.
>>>> But for some codec, it's hard to determine the buffer flag when reqbufs.
>>>> The buffer flag should be dynamically updated by driver.
>>>> User can check the flag after dqbuf every time.
>>>
>>> +1
>>>
>>> I'm not familiar with stateless decoders where on the reqbuf time it
>>> could work, debut for stateful coders it should be a dynamic flag on
>>> every capture buffer.
>>
>> This isn't very clear request here, on which C structure to you say you would
>> prefer this ?
>>
>> There is no difference for stateful/stateless for this regard. The capture
>> format must have been configured prior to reqbuf, so nothing post S_FMT(CAPTURE)
>> can every be very dynamic. I think the flag in S_FMT is miss-named and would
>> create confusion. struct v4l2_reqbufs vs struc v4l2_buffer are equivalent. The
>> seconds opens for flexibility.
>>
>> In fact, for some certain CODEC, there exist B-Frames that are never used as
>> references, so these could indeed can be written to even if the buffer are not
>> secondary. I think recommending to flag this in v4l2_buffer, and read through
>> VIDIOC_QUERYBUF would be the best choice.
>>
>>>
>>>>
>>>>>
>>>>>>  During the decoding, the decoder may initiate one of the special
>>>>>> sequences, as  listed below. The sequences will result in the decoder
>>>>>> returning all the  ``CAPTURE`` buffers that originated from all the
>>>>>> ``OUTPUT`` buffers processed
>>>>>
>>>>
>>>
>>
>>

