Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71D5E2AF77
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 09:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfE0Hjp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 03:39:45 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:54193 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725869AbfE0Hjp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 03:39:45 -0400
Received: from [IPv6:2001:983:e9a7:1:f4bd:6355:63eb:2e52] ([IPv6:2001:983:e9a7:1:f4bd:6355:63eb:2e52])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VAEOhZ8u3sDWyVAEPhXnKi; Mon, 27 May 2019 09:39:42 +0200
Subject: Re: [PATCH 10/10] venus: dec: make decoder compliant with stateful
 codec API
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Malathi Gottam <mgottam@codeaurora.org>
References: <20190117162008.25217-1-stanimir.varbanov@linaro.org>
 <20190117162008.25217-11-stanimir.varbanov@linaro.org>
 <60b3efff-31c1-bc04-8af9-deebb8bc013a@xs4all.nl>
 <fe51ae1e-6d2e-36bd-485a-d85520ad2386@linaro.org>
 <CAAFQd5Co3G1J4+HOcjtCb7p3rhLcm+1E=mPr2d=AtdOSuF_eKg@mail.gmail.com>
 <c56930e0-be6f-2ade-fcea-8ee0ff6247ec@linaro.org>
 <CAAFQd5CNGsnqjpLsWSTf=8r+hSfyOgD8SU-tn5EbHCCuuSgH6A@mail.gmail.com>
 <01b6683f-9378-e6f2-501f-e2213e6c690d@xs4all.nl>
 <CAAFQd5Dw-1A2gXuC54Z7808L6Vm9mjPpE7Kbj-TZC18_k_FgVA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a9b11ba0-adca-f974-67a5-a0fe54689bba@xs4all.nl>
Date:   Mon, 27 May 2019 09:39:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5Dw-1A2gXuC54Z7808L6Vm9mjPpE7Kbj-TZC18_k_FgVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP/KlNMUpI8R5BYs77TLAQQpb7XPrT/Q7FQW/9jjzWxU0gK9jSERXE2vWgoHtc8gKV48bA83Qt+62pLbBCyHlf2cvHrjyp5CqYS4fFJGLXiLBwq/jI9c
 hDq9Idy8JzJI+TCm9X9vX8wxHPMEL6lKNgy+iy0TLmkFwWX/0jDE6KvfDJvi+5bhUPQdA7VjcJzONb7wRB+Pi62MCK/GiCKLLtJW1QuVyIXXQh0Yz3ayCMM3
 /9G4xg2jLk6kZMq25trnWTnSUZiLoGr6Ln25TSWe4qZLw/iHQ/mpxfPHWHIkIQw5IWkJcOJ/WRkjcscZxz7AD3WCSA1wgkRvkf6oZLBzDl9DZf82qdO94+K0
 nVx9GiUbhAFS+oVCSink8KPdAY2wkqDQ2csnvHoaiJc0a1fzNRPo/psWIzxGj+7fgnV2bw6WWx5I/dbNoremu6MqgDyKIqD18Vbn/NX7pwBZBdmvfDxfIi2b
 ZTDdE8WOzge1lP4qDPRR/GHpUmUnMi0dJ5VgLdTbJ+9EcaLCuuM0X/rWuT7pGzfUXyFrfentz+yHsfwlumZV5Vpak5oFPIwyhzgKog==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/27/19 5:51 AM, Tomasz Figa wrote:
> On Tue, May 21, 2019 at 9:27 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 5/21/19 11:09 AM, Tomasz Figa wrote:
>>> Hi Stan,
>>>
>>> On Mon, May 20, 2019 at 11:47 PM Stanimir Varbanov
>>> <stanimir.varbanov@linaro.org> wrote:
>>>>
>>>> Hi Tomasz,
>>>>
>>>> On 4/24/19 3:39 PM, Tomasz Figa wrote:
>>>>> On Wed, Apr 24, 2019 at 9:15 PM Stanimir Varbanov
>>>>> <stanimir.varbanov@linaro.org> wrote:
>>>>>>
>>>>>> Hi Hans,
>>>>>>
>>>>>> On 2/15/19 3:44 PM, Hans Verkuil wrote:
>>>>>>> Hi Stanimir,
>>>>>>>
>>>>>>> I never paid much attention to this patch series since others were busy
>>>>>>> discussing it and I had a lot of other things on my plate, but then I heard
>>>>>>> that this patch made G_FMT blocking.
>>>>>>
>>>>>> OK, another option could be to block REQBUF(CAPTURE) until event from hw
>>>>>> is received that the stream is parsed and the resolution is correctly
>>>>>> set by application. Just to note that I'd think to this like a temporal
>>>>>> solution until gstreamer implements v4l events.
>>>>>>
>>>>>> Is that looks good to you?
>>>>>
>>>>> Hmm, I thought we concluded that gstreamer sets the width and height
>>>>> in OUTPUT queue before querying the CAPTURE queue and so making the
>>>>> driver calculate the CAPTURE format based on what's set on OUTPUT
>>>>> would work fine. Did I miss something?
>>>>
>>>> Nobody is miss something.
>>>>
>>>> First some background about how Venus implements stateful codec API.
>>>>
>>>> The Venus firmware can generate two events "sufficient" and
>>>> "insufficient" buffer requirements (this includes decoder output buffer
>>>> size and internal/scratch buffer sizes). Presently I always set minimum
>>>> possible decoder resolution no matter what the user said, and by that
>>>> way I'm sure that "insufficient" event will always be triggered by the
>>>> firmware (the other reason to take this path is because this is the
>>>> least-common-divider for all supported Venus hw/fw versions thus common
>>>> code in the driver). The reconfiguration (during codec Initialization
>>>> sequence) is made from STREAMON(CAPTURE) context. Now, to make that
>>>> re-configuration happen I need to wait for "insufficient" event from
>>>> firmware in order to know the real coded resolution.
>>>>
>>>> In the case of gstreamer where v4l2_events support is missing I have to
>>>> block (wait for firmware event) REQBUF(CAPTURE) (vb2::queue_setup) or
>>>> STREAMON(CAPTURE) (vb2::start_streaming).
>>>>
>>>> I tried to set the coded resolution to the firmware as-is it set by
>>>> gstreamer but then I cannot receive the "sufficient" event for VP8 and
>>>> VP9 codecs. So I return back to the solution with minimum resolution above.
>>>>
>>>> I'm open for suggestions.
>>>
>>> I think you could still keep setting the minimum size and wait for the
>>> "insufficient" event. At the same time, you could speculatively
>>> advertise the expected "sufficient" size on the CAPTURE queue before
>>> the hardware signals those. Even if you mispredict them, you'll get
>>> the event, update the CAPTURE resolution and send the source change
>>> event to the application, which would then give you the correct
>>> buffers. Would that work for you?
>>
>> As I understand it this still would require event support, which gstreamer
>> doesn't have.
> 
> I don't think it matches what I remember from the earlier discussion.
> As long as Gstreamer sets the visible resolution (from the container
> AFAIR) on OUTPUT, the driver would adjust it to something that is
> expected to be the right framebuffer resolution and so Gstreamer would
> be able to continue. Of course if the expected value doesn't match, it
> wouldn't work, but it's the same as currently for Coda AFAICT.
> 
>>
>> I think it is OK to have REQBUFS sleep in this case. However, I would only
> 
> Why REQBUFS? While that could possibly allow us to allocate the right
> buffers, Gstreamer wouldn't be able to know the right format, because
> it would query it before REQBUFS, wouldn't it?

Oops, you are right. It's got to be in G_FMT(CAPTURE), but *only* if
nobody subscribed to the SOURCE_CHANGE event.

> 
> For this reason, s5p-mfc makes G_FMT(CAPTURE) blocking and if we
> decide to forcefully keep the compatibility, even with in drivers, we
> should probably do the same here.
> 
>> enable this behavior if the application didn't subscribe to the SOURCE_CHANGE
>> event. That's easy enough to check in the driver. And that means that if the
>> application is well written, then the driver will behave in a completely
>> standard way that the compliance test can check.
> 
> I guess one could have some helpers for this. They would listen to the
> source change events internally and block / wake-up appropriate ioctls
> whenever necessary.

I really do not want this for new drivers. gstreamer should be fixed.
A blocking G_FMT is just plain bad. Only those drivers that do this, can
still block if nobody subscribed to EVENT_SOURCE_CHANGE.

> Another question: If we intend this to be implemented in new drivers
> too, should it be documented in the spec?

We most certainly do NOT want to implement this in new drivers.

Regards,

	Hans

> 
> Best regards,
> Tomasz
> 

