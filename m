Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EACE019FEB5
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 22:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgDFUFq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 16:05:46 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:4335 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgDFUFq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 16:05:46 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8b8b330000>; Mon, 06 Apr 2020 13:04:03 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 06 Apr 2020 13:05:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 06 Apr 2020 13:05:45 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr
 2020 20:05:45 +0000
Received: from [10.2.164.193] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr 2020
 20:05:43 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <38d921a7-5cdf-8d0a-2772-4399dd1a96a0@gmail.com>
 <9b8cf37b-d2ad-9df2-aad8-216c2c954e69@nvidia.com>
 <1a12974a-7cc7-2c3a-3995-076b9956714d@gmail.com>
 <66cc8646-43d3-3fc8-c31d-d0d2efac505f@nvidia.com>
 <f000f6b9-0f05-b2a5-6dad-37b09803711d@gmail.com>
 <fe6a17c1-fae2-a365-4dd6-6d3a25d47d54@nvidia.com>
 <9038ce90-ac53-93e7-ce65-57f6ff1e9b30@nvidia.com>
 <abe82fd1-0464-0627-6c97-39c896e53dd0@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <36b5627a-8639-6244-8620-4f23828e0638@nvidia.com>
Date:   Mon, 6 Apr 2020 13:05:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <abe82fd1-0464-0627-6c97-39c896e53dd0@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586203443; bh=/cQeQIFkotsxVl4iOAXgB7AypQjT4YsAA1hb19W7EoY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=LJRaJOIkLv6YKhIRIfeTh+coVu/yi4RULJDCuKHuc5G7ydBH0pTlTgPX09GwKSw/N
         7busPDL5R0eOzF3zX82nUdrtwTU4zo5xNOnl79u2aZPi5aZQkxjmxp2S6htrvZ8U8C
         RYm6gjNqGAwgFYBwjc3lAelcwkWX++ayI1N4wOE/Tj7r8hRd7Dq08DV8vshkggOY6d
         QNlVQx8D1DO/sBUQbgMhN7uVIS8Oq6CNwy+Nl4/2MiUUYL0kTWbECP0vNf8QXauWpP
         E9af5mWqT3EHet7lgpG0Uixtia9TqyhZ0y1dl6/bfRkircQODDGV53OYIvoVCapRLv
         kpO7/pyF7q83g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/6/20 12:53 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 06.04.2020 20:02, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/6/20 9:37 AM, Sowjanya Komatineni wrote:
>>> On 4/6/20 9:29 AM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 06.04.2020 19:12, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On 4/6/20 9:05 AM, Dmitry Osipenko wrote:
>>>>>> External email: Use caution opening links or attachments
>>>>>>
>>>>>>
>>>>>> 06.04.2020 18:35, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>> ...
>>>>>>>>> +     /* wait for syncpt counter to reach frame start event
>>>>>>>>> threshold */
>>>>>>>>> +     err =3D host1x_syncpt_wait(chan->frame_start_sp, thresh,
>>>>>>>>> + TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
>>>>>>>>> +     if (err) {
>>>>>>>>> +             dev_err(&chan->video.dev,
>>>>>>>>> +                     "frame start syncpt timeout: %d\n", err);
>>>>>>>>> +             /* increment syncpoint counter for timedout events =
*/
>>>>>>>>> + host1x_syncpt_incr(chan->frame_start_sp);
>>>>>>>> Why incrementing is done while hardware is still active?
>>>>>>>>
>>>>>>>> The sync point's state needs to be completely reset after resettin=
g
>>>>>>>> hardware. But I don't think that the current upstream host1x drive=
r
>>>>>>>> supports doing that, it's one of the known-long-standing problems =
of
>>>>>>>> the
>>>>>>>> host1x driver.
>>>>>>>>
>>>>>>>> At least the sp->max_val incrementing should be done based on the
>>>>>>>> actual
>>>>>>>> syncpoint value and this should be done after resetting hardware.
>>>>>>> upstream host1x driver don't have API to reset or to equalize max
>>>>>>> value
>>>>>>> with min/load value.
>>>>>>>
>>>>>>> So to synchronize missed event, incrementing HW syncpt counter.
>>>>>>>
>>>>>>> This should not impact as we increment this in case of missed event=
s
>>>>>>> only.
>>>>>> It's wrong to touch sync point while hardware is active and it's
>>>>>> active
>>>>>> until being reset.
>>>>>>
>>>>>> You should re-check the timeout after hw resetting and manually put
>>>>>> the
>>>>>> syncpoint counter back into sync only if needed.
>>>>> There is possibility of timeout to happen any time even during the
>>>>> capture also and is not related to hw reset.
>>>>>
>>>>> Manual synchronization is needed when timeout of any frame events
>>>>> happen
>>>>> otherwise all subsequence frames will timeout due to mismatch in even=
t
>>>>> counters.
>>>> My point is that hardware is stopped only after being reset, until the=
n
>>>> you should assume that sync point could be incremented by HW at any
>>>> time.
>>>>
>>>> And if this happens that HW increments sync point after the timeout,
>>>> then the sync point counter should become out-of-sync in yours case,
>>>> IIUC. Because host1x_syncpt_incr() doesn't update the cached counter.
>>> We wait for enough time based on frame rate for syncpt increment to
>>> happen and if it doesn't happen by then definitely its missed event
>>> and we increment HW syncpoint for this timed event.
>>>
>>> cached value gets updated during syncpt wait for subsequent event.
>>>
>>> syncpt increment happens for all subsequent frame events during video
>>> capture.
>>>
>> Just to be clear, syncpt max value increment happens first and syncpt
>> trigger condition is programmed. hw syncpt increment happens based on HW
>> events.
>>
>> Wait time for HW syncpt to reach threshold is tuned to work for all
>> frame rates. So if increment doesn't happen by then, its definitely
>> missed event.
> This is questionable. Technically, speculating about whether the tuned
> value is good for all possible cases is incorrect thing to do.
>
> Although, I guess in practice it should be good enough for the starter
> and could be improved later on, once the host1x driver will be improved.

By tuned value I meant about 200ms wait timeout for frame event to=20
happen is what we have been using in downstream and with BSP release=20
images which works good for all sensors and bridges we supported so far.

>
>> In case of missed HW event corresponding to syncpt condition, hw syncpt
>> increment does not happen and driver increments it on timeout.
>>
>> As there is not API to equialize max with min incase of timeout/reset,
>> incrementing HW syncpt for timed out event.
>>
>> syncpt cached value gets updated during syncpt wait when it loads from
>> HW syncpt.
>>
>> As syncpt condition is already triggered, without compensating timeout
>> events or leaving syncpt max and hw syncpt in non synchronized state for
>> missed events, subsequent streamings will all timeout even on real event=
s.
>>
