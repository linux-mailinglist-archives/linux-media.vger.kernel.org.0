Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7799A1505BD
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 13:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbgBCMAC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 07:00:02 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:54921 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727358AbgBCMAB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Feb 2020 07:00:01 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yaOQiSCJVn7E5yaOTi3b1s; Mon, 03 Feb 2020 12:59:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580731198; bh=qnhyVG0KBRfYCvUMy524atjha1LD1Pr5StfWLiE8f28=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tANZdcNYK+ILFjz2PL+KoMamy6AbwTOV1Xm8tBiPqXR4vJ64nE9Vt3bQNWzXnkCcw
         CTVoWzv0zbZpvU++6RmvjQHUcbKZWwSClJyGdWX+OoaiPvcLHY9Y0PQtouC8VwI68Q
         roEjyCGQIn+wneGw6xclZGjoZaa/nbX2kzDGFDfJI3kqlJzGA/ab1KrF9LdwwFYBhE
         G9/QH6NCqskfDT5NeJa+ZXD6wFiPthhCk6MkMyAdSeArMhptYYPYS4pV8jqLUFqLmy
         hpki3IBtcAMXgbP1Rui9IGP2ZZfQ3nuw8Ff4Np5Skp0gE+tFgo5RHJm9FtKBsUvlw4
         elVPyGCQsIn9w==
Subject: Re: [PATCH] media: hantro: Support H264 profile control
To:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hirokazu Honda <hiroh@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191122051608.128717-1-hiroh@chromium.org>
 <767528be59275265072896e5c679e97575615fdd.camel@ndufresne.ca>
 <CAAFQd5D3OpAAtX7_0ktz4-aAgWN_G4YBQMR=Vwp7JPopjvRkRA@mail.gmail.com>
 <f5341ed837529bd38d466d4b655e261d64065912.camel@ndufresne.ca>
 <CAAFQd5Cpk8qG+VgE6+aznBmXu11YG0gNQyCRanZghds-TPKvyg@mail.gmail.com>
 <c88b2822-0dd2-8ea3-eb0b-262df5a30830@xs4all.nl>
 <8b10414a1c198a6e3bd5e131a72bd6f68466bea5.camel@ndufresne.ca>
 <CAAFQd5AZ1DTtz2myuO9YSwjMaxPme0BDNaOBo97tSHLbm4XWPg@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8a6a371d-17cd-eb32-779c-0669da5a8d5e@xs4all.nl>
Date:   Mon, 3 Feb 2020 12:59:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5AZ1DTtz2myuO9YSwjMaxPme0BDNaOBo97tSHLbm4XWPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKgEIUyQM84B5b99RtJdse6y6Orwd9OgeSkGnakeLhCwcAUgr1MPdtJiFYnBf2Zi6QE7Z6h247QLPmFd+ZNdQVZ7rn3ea/rS7FwSmObtKVteDYSekFyT
 s3SFvWME3qRxpJo0XVI39+GvZ+x8q16vcVGzvz20gBjqi3M1WO4KsFRvlGyhOGxoWt1yGREklKATntHKul98PHwU5vTQNVLXOk0rNJf3iLX+e8zr3jV72L1/
 6WN6s6/jOmrve0Wur9DBPS4Kr1ag0uEcy97+fMu7CizAXdHTIqo/Hk9D57rsyAig+vcgDfHtQxXfx7/S9vXidep0/i+VFBs9ErqPFbY3UcGkQu49Vfu/LZm8
 paCU03WOaUhpP9MYFRnE5E/RKBWwi4m3UPnTo9EEIYELt9T2cS2AxDlITRpGhPQ9iWDbOMKvRSiPyDGmleJg5GnGxZZizcbCg9OWhDqxgXX5egUh5TA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/3/20 12:13 PM, Tomasz Figa wrote:
> On Sat, Jan 18, 2020 at 10:31 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>>
>> Le vendredi 10 janvier 2020 à 13:31 +0100, Hans Verkuil a écrit :
>>> On 11/29/19 1:16 AM, Tomasz Figa wrote:
>>>> On Sat, Nov 23, 2019 at 1:52 AM Nicolas Dufresne <nicolas@ndufresne.ca>
>>>> wrote:
>>>>> Le samedi 23 novembre 2019 à 01:00 +0900, Tomasz Figa a écrit :
>>>>>> On Sat, Nov 23, 2019 at 12:09 AM Nicolas Dufresne <nicolas@ndufresne.ca>
>>>>>> wrote:
>>>>>>> Le vendredi 22 novembre 2019 à 14:16 +0900, Hirokazu Honda a écrit :
>>>>>>>> The Hantro G1 decoder supports H.264 profiles from Baseline to High,
>>>>>>>> with
>>>>>>>> the exception of the Extended profile.
>>>>>>>>
>>>>>>>> Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE control, so that the
>>>>>>>> applications can query the driver for the list of supported
>>>>>>>> profiles.
>>>>>>>
>>>>>>> Thanks for this patch. Do you think we could also add the LEVEL
>>>>>>> control
>>>>>>> so the profile/level enumeration becomes complete ?
>>>>>>>
>>>>>>> I'm thinking it would be nice if the v4l2 compliance test make sure
>>>>>>> that codecs do implement these controls (both stateful and stateless),
>>>>>>> it's essential for stack with software fallback, or multiple capable
>>>>>>> codec hardware but with different capabilities.
>>>>>>>
>>>>>>
>>>>>> Level is a difficult story, because it also specifies the number of
>>>>>> macroblocks per second, but for decoders like this the number of
>>>>>> macroblocks per second it can handle depends on things the driver
>>>>>> might be not aware of - clock frequencies, DDR throughput, system
>>>>>> load, etc.
>>>>>>
>>>>>> My take on this is that the decoder driver should advertise the
>>>>>> highest resolution the decoder can handle due to hardware constraints.
>>>>>> Performance related things depend on the integration details and
>>>>>> should be managed elsewhere. For example Android and Chrome OS manage
>>>>>> expected decoding performance in per-board configuration files.
>>>>>
>>>>> When you read datasheet, the HW is always rated to maximum level (and
>>>>> it's a range) with the assumption of a single stream. It seems much
>>>>> easier to expose this as-is, statically then to start doing some math
>>>>> with data that isn't fully exposed to the user. This is about filtering
>>>>> of multiple CODEC instances, it does not need to be rocket science,
>>>>> specially that the amount of missing data is important (e.g. usage of
>>>>> tiles, compression, IPP all have an impact on the final performance).
>>>>> All we want to know in userspace is if this HW is even possibly capable
>>>>> of LEVEL X, and if not, we'll look for another one.
>>>>>
>>>>
>>>> Agreed, one could potentially define it this way, but would it be
>>>> really useful for the userspace and the users? I guess it could enable
>>>> slightly faster fallback to software decoding in the extreme case of
>>>> the hardware not supporting the level at all, but I suspect that the
>>>> majority of cases would be the hardware just being unusably slow.
>>>>
>>>> Also, as I mentioned before, we already return the range of supported
>>>> resolutions, which in practice should map to the part of the level
>>>> that may depend on hardware capabilities rather than performance, so
>>>> exposing levels as well would add redundancy to the information
>>>> exposed.
>>>
>>> There is a lot of discussion here, but it all revolves around a potential
>>> LEVEL control.
>>>
>>> So I gather everyone is OK with merging this patch?
>>
>> I'm ok with this. For me, the level reflects the real time performance
>> capability as define in the spec, while the width/height constraints usually
>> represent an addressing capabicity, which may or may not operate real-time.
>>
> 
> I'd like to see the level control documentation improved before we
> start adding it to the drivers. I'll be okay with that then as long as
> the values are exposed in a consistent and well defined way. :)
> 
> As for this patch, Hans, are you going to apply it?

It's in a PR for 5.7. I had hoped it would go in for v5.6, but it was
too late for that.

Regards,

	Hans

> 
> Best regards,
> Tomasz
> 
>>>
>>> If not, let me know asap.
>>>
>>> Regards,
>>>
>>>       Hans
>>>
>>>>>>>> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
>>>>>>>> ---
>>>>>>>>  drivers/staging/media/hantro/hantro_drv.c | 10 ++++++++++
>>>>>>>>  1 file changed, 10 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/staging/media/hantro/hantro_drv.c
>>>>>>>> b/drivers/staging/media/hantro/hantro_drv.c
>>>>>>>> index 6d9d41170832..9387619235d8 100644
>>>>>>>> --- a/drivers/staging/media/hantro/hantro_drv.c
>>>>>>>> +++ b/drivers/staging/media/hantro/hantro_drv.c
>>>>>>>> @@ -355,6 +355,16 @@ static const struct hantro_ctrl controls[] = {
>>>>>>>>                       .def =
>>>>>>>> V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
>>>>>>>>                       .max =
>>>>>>>> V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
>>>>>>>>               },
>>>>>>>> +     }, {
>>>>>>>> +             .codec = HANTRO_H264_DECODER,
>>>>>>>> +             .cfg = {
>>>>>>>> +                     .id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
>>>>>>>> +                     .min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
>>>>>>>> +                     .max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>>>>>>> +                     .menu_skip_mask =
>>>>>>>> +                     BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
>>>>>>>> +                     .def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
>>>>>>>> +             }
>>>>>>>>       }, {
>>>>>>>>       },
>>>>>>>>  };
>>

