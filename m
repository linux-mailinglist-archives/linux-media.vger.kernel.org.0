Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C31E4309C6
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 10:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfEaIBQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 04:01:16 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37121 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfEaIBP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 04:01:15 -0400
Received: by mail-lj1-f194.google.com with SMTP id h19so8678185ljj.4
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 01:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KX91va6f7Z+53lDjzWHfHOph+OO8BCuoBgOWht/3odk=;
        b=fYWJE6ZpvakQiIXRNcGnOarA2CMQh+ck6S4ai9uVBZ/iKfaxGcDupXCcWfMj6868nV
         +HBVbFfpXN257LlQO9qhYrHXu29wZ8x27+LkFGd/oUPSUgpjI1sEHoR92t0LneBN4rlu
         FDEz51AQ/Ve36FEKogBbYjg1f9y1/12fGpJPhtLuINdPLIPB7D2Askh1nzZ2vFxKPTYY
         nSLGd/iN0QmmhQPUXQgzuaQcevb0IM/vDWG1zaUGC4fZaEpwmjemcnJnoVZJmP41UCcV
         FRpu5P951J+nhYWV9jrbK8iHdvY1Mtk4x7hCX9a6aawF7/5juWTsjSDl5zhmD7+UMQwf
         oA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KX91va6f7Z+53lDjzWHfHOph+OO8BCuoBgOWht/3odk=;
        b=q+PfGJo4hANDJh2zIgHjOgGTtLnKSlXT7IurH0JR+tY2o0095MkP185HuZBG77ZOMN
         q3fHi7RtUPlA7cUYRODvpTWIX9ts+Rnf/SKVVDeK43KniFIvufVfAjwMdlEM/caUpJqL
         ExWUbOlFoPKrI8c6Z/+CllxYmTtIIy0A1LPYeE3nHJGYrpzy8JPtqFs8Uh6hbyYCzAPs
         o7fUCurBzyKpx85T6BVYzzNoJe6MxVvFTvQ6VWWpryre5u3szipN1gtTDG3016IQ8yNJ
         7SmC2iHpce10OGNdB+7271Fbyvru9jfvZoK3VMTG54QYy7JH7OfOVf0JJOuuOkKf8LPq
         FC9w==
X-Gm-Message-State: APjAAAXp0lIOtdVqqNmDJnIgJUKoRWg4nvbvzGHyHNOu278cPr3MYGsL
        kLQFv799rkQB0x1m8J5APbm6tg==
X-Google-Smtp-Source: APXvYqxYSuqOAm08fJBd/1t9mZ/1MlcqK2dBmWBAyiQ5D2j40poQLd/Y5wwAKUwvVqu+pm8R6BgJag==
X-Received: by 2002:a2e:908d:: with SMTP id l13mr4925290ljg.125.1559289673090;
        Fri, 31 May 2019 01:01:13 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id q7sm468497ljc.45.2019.05.31.01.01.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 01:01:11 -0700 (PDT)
Subject: Re: [PATCH 10/10] venus: dec: make decoder compliant with stateful
 codec API
To:     Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
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
 <a9b11ba0-adca-f974-67a5-a0fe54689bba@xs4all.nl>
 <CAAFQd5CMpQ4ODyeBPnOv4w9ktqPsiqJtSkpRhAx+XgQ=Lz9crQ@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <ee62fdb0-d8fa-0695-9088-5aaef48e485f@linaro.org>
Date:   Fri, 31 May 2019 11:01:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5CMpQ4ODyeBPnOv4w9ktqPsiqJtSkpRhAx+XgQ=Lz9crQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/27/19 11:18 AM, Tomasz Figa wrote:
> On Mon, May 27, 2019 at 4:39 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 5/27/19 5:51 AM, Tomasz Figa wrote:
>>> On Tue, May 21, 2019 at 9:27 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>
>>>> On 5/21/19 11:09 AM, Tomasz Figa wrote:
>>>>> Hi Stan,
>>>>>
>>>>> On Mon, May 20, 2019 at 11:47 PM Stanimir Varbanov
>>>>> <stanimir.varbanov@linaro.org> wrote:
>>>>>>
>>>>>> Hi Tomasz,
>>>>>>
>>>>>> On 4/24/19 3:39 PM, Tomasz Figa wrote:
>>>>>>> On Wed, Apr 24, 2019 at 9:15 PM Stanimir Varbanov
>>>>>>> <stanimir.varbanov@linaro.org> wrote:
>>>>>>>>
>>>>>>>> Hi Hans,
>>>>>>>>
>>>>>>>> On 2/15/19 3:44 PM, Hans Verkuil wrote:
>>>>>>>>> Hi Stanimir,
>>>>>>>>>
>>>>>>>>> I never paid much attention to this patch series since others were busy
>>>>>>>>> discussing it and I had a lot of other things on my plate, but then I heard
>>>>>>>>> that this patch made G_FMT blocking.
>>>>>>>>
>>>>>>>> OK, another option could be to block REQBUF(CAPTURE) until event from hw
>>>>>>>> is received that the stream is parsed and the resolution is correctly
>>>>>>>> set by application. Just to note that I'd think to this like a temporal
>>>>>>>> solution until gstreamer implements v4l events.
>>>>>>>>
>>>>>>>> Is that looks good to you?
>>>>>>>
>>>>>>> Hmm, I thought we concluded that gstreamer sets the width and height
>>>>>>> in OUTPUT queue before querying the CAPTURE queue and so making the
>>>>>>> driver calculate the CAPTURE format based on what's set on OUTPUT
>>>>>>> would work fine. Did I miss something?
>>>>>>
>>>>>> Nobody is miss something.
>>>>>>
>>>>>> First some background about how Venus implements stateful codec API.
>>>>>>
>>>>>> The Venus firmware can generate two events "sufficient" and
>>>>>> "insufficient" buffer requirements (this includes decoder output buffer
>>>>>> size and internal/scratch buffer sizes). Presently I always set minimum
>>>>>> possible decoder resolution no matter what the user said, and by that
>>>>>> way I'm sure that "insufficient" event will always be triggered by the
>>>>>> firmware (the other reason to take this path is because this is the
>>>>>> least-common-divider for all supported Venus hw/fw versions thus common
>>>>>> code in the driver). The reconfiguration (during codec Initialization
>>>>>> sequence) is made from STREAMON(CAPTURE) context. Now, to make that
>>>>>> re-configuration happen I need to wait for "insufficient" event from
>>>>>> firmware in order to know the real coded resolution.
>>>>>>
>>>>>> In the case of gstreamer where v4l2_events support is missing I have to
>>>>>> block (wait for firmware event) REQBUF(CAPTURE) (vb2::queue_setup) or
>>>>>> STREAMON(CAPTURE) (vb2::start_streaming).
>>>>>>
>>>>>> I tried to set the coded resolution to the firmware as-is it set by
>>>>>> gstreamer but then I cannot receive the "sufficient" event for VP8 and
>>>>>> VP9 codecs. So I return back to the solution with minimum resolution above.
>>>>>>
>>>>>> I'm open for suggestions.
>>>>>
>>>>> I think you could still keep setting the minimum size and wait for the
>>>>> "insufficient" event. At the same time, you could speculatively
>>>>> advertise the expected "sufficient" size on the CAPTURE queue before
>>>>> the hardware signals those. Even if you mispredict them, you'll get
>>>>> the event, update the CAPTURE resolution and send the source change
>>>>> event to the application, which would then give you the correct
>>>>> buffers. Would that work for you?
>>>>
>>>> As I understand it this still would require event support, which gstreamer
>>>> doesn't have.
>>>
>>> I don't think it matches what I remember from the earlier discussion.
>>> As long as Gstreamer sets the visible resolution (from the container
>>> AFAIR) on OUTPUT, the driver would adjust it to something that is
>>> expected to be the right framebuffer resolution and so Gstreamer would
>>> be able to continue. Of course if the expected value doesn't match, it
>>> wouldn't work, but it's the same as currently for Coda AFAICT.
>>>
>>>>
>>>> I think it is OK to have REQBUFS sleep in this case. However, I would only
>>>
>>> Why REQBUFS? While that could possibly allow us to allocate the right
>>> buffers, Gstreamer wouldn't be able to know the right format, because
>>> it would query it before REQBUFS, wouldn't it?
>>
>> Oops, you are right. It's got to be in G_FMT(CAPTURE), but *only* if
>> nobody subscribed to the SOURCE_CHANGE event.
>>
>>>
>>> For this reason, s5p-mfc makes G_FMT(CAPTURE) blocking and if we
>>> decide to forcefully keep the compatibility, even with in drivers, we
>>> should probably do the same here.
>>>
>>>> enable this behavior if the application didn't subscribe to the SOURCE_CHANGE
>>>> event. That's easy enough to check in the driver. And that means that if the
>>>> application is well written, then the driver will behave in a completely
>>>> standard way that the compliance test can check.
>>>
>>> I guess one could have some helpers for this. They would listen to the
>>> source change events internally and block / wake-up appropriate ioctls
>>> whenever necessary.
>>
>> I really do not want this for new drivers. gstreamer should be fixed.
>> A blocking G_FMT is just plain bad. Only those drivers that do this, can
>> still block if nobody subscribed to EVENT_SOURCE_CHANGE.
> 
> Yeah and that's why I just suggested to mimic coda, which doesn't
> block, but apparently gstreamer still works with it.

Unfortunately in Venus case that is not an easy task (as I tried to
explain why above).

To have an unified and common code for all different SoCs and
firmware/hardware versions I decided to set the minimum supported
resolution for the decoder (no matter what the user said) and trigger
the reconfiguration event always. Something more, I need the event also
to retrieve the minimum capture buffers
(V4L2_CID_MIN_BUFFERS_FOR_CAPTURE) and sizes for capture and
internal/scratch buffers as well, thus I really need to wait for that
event.

So, just to confirm - you are fine with blocking G_FMT (not REQBUF) when
the user doesn't subscribe for v4l2 events?

> 
>>
>>> Another question: If we intend this to be implemented in new drivers
>>> too, should it be documented in the spec?
>>
>> We most certainly do NOT want to implement this in new drivers.
>>
> 
> Makes sense.
> 
> When venus was merged initially, did it already have a blocking G_FMT?

No it isn't.

-- 
regards,
Stan
