Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C891C0906
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 23:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgD3VRY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 17:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726430AbgD3VRX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 17:17:23 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 118EBC035494;
        Thu, 30 Apr 2020 14:17:23 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id t11so2459863lfe.4;
        Thu, 30 Apr 2020 14:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ulSnjrVahD3ngtDTBqJ4GqWuIHf55OLXY1bECTxDS44=;
        b=oc4ISMOVLP5hvC3AL+ELmDB6d1Vldyb8K8cjoSkEGiCH2rfArMnvs44iETFALx+qdK
         /rbI06jovJK7dDH1ey5rcRxBd0BfrzycbzEi8RZxjNh8JFUsMfe6I1BINQYjJUSgkfhO
         AYAAivfMm+DHPVzwQpJVpr7V/Pbg5l021AtYwc1HFUuUGn0m1ePhePFQsWisP7WInlum
         /3ARFJQk4lMIDb5Vit1tNUUm5JSrDEVwpVXXTq0TeOgIL8FoN7weeimkJKprspg3SFZH
         80rfpFrhT1y9sQr1g8LIuP7U2EljqpAszIyfflg8TeJaB3wup6U+XrCeX8eMb6zq0keV
         6ylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ulSnjrVahD3ngtDTBqJ4GqWuIHf55OLXY1bECTxDS44=;
        b=lr+Ko41d/Ej4CM7wP/C9OiQnIbGUagMrihzMwptdqQ/gO4n1O2b2zT/GZdXpwf18r7
         ACih/s/1yxprxoYCVNYhM9nnYr6Ilh00mIraS3mqFYpV1PcVhr5AZ0EqPRIZ1cYQE4yd
         MyCTvpp4EUegK9l9V4XzJGlUmf0GFJ7Zyjdtr5a0dTWx1783lQgSCGGCuImxey7emZLW
         YEPxVxIJl2NABRMZJWSPjP9k3taB6mBWq2PNnw27rP/eVjL6z44v3j9gzh3pHEFowE9U
         HylA6N6E9P2dJGx27hyZiBCSBjAy/fAauHLQEO9pfXm54yzVL48yywKo/cwHEOfG0TEk
         D7ww==
X-Gm-Message-State: AGi0PuatBSnhi25yAXpo4HUXW8u/AEzoOOpCpvQxSlSYjKuVKzb8E19U
        BMdyZpth5R9S98sX6MjQBQSxj5fF
X-Google-Smtp-Source: APiQypKwVKpc68og19f2tP6BDvbtFM8V8QGSMRaDDyTLi9qHIctnxsKr9M+orYSlTHW5xaLOAQchhA==
X-Received: by 2002:a19:e20b:: with SMTP id z11mr403737lfg.156.1588281441041;
        Thu, 30 Apr 2020 14:17:21 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id k18sm827670lfg.81.2020.04.30.14.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 14:17:20 -0700 (PDT)
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <bacc4308-4b95-f566-b80e-096ff96407b5@gmail.com>
 <4da289e6-036f-853b-beb4-379d6462adb0@gmail.com>
 <c6d54885-6f23-f60c-a17b-3481fc4d6adf@gmail.com>
 <b14b9dc5-7ac9-7735-d98d-eebc7e151cba@nvidia.com>
 <7d31d24f-f353-7e82-3ff9-cdba8b773d1e@nvidia.com>
 <06a4a067-8d54-4322-b2a6-14e82eaeda29@nvidia.com>
 <47873bbd-cf90-4595-5a99-7e9113327ecc@nvidia.com>
 <f6088e0f-4ac7-a6be-3ede-0233dc88ef2c@nvidia.com>
 <71532440-f455-cc24-74f7-9ccad5947099@gmail.com>
 <b3238987-5e8a-32f2-7ce7-924e86bc6e9e@nvidia.com>
 <298187f6-2425-4813-1ae1-f256c179623e@nvidia.com>
 <9c942bc9-703e-3bbb-eeab-f37e69dc1ded@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b72b9d5c-7d02-1b58-20f7-30f94e230d58@gmail.com>
Date:   Fri, 1 May 2020 00:17:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9c942bc9-703e-3bbb-eeab-f37e69dc1ded@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

30.04.2020 23:02, Sowjanya Komatineni пишет:
> 
> On 4/30/20 12:53 PM, Sowjanya Komatineni wrote:
>>
>> On 4/30/20 12:46 PM, Sowjanya Komatineni wrote:
>>>
>>> On 4/30/20 12:33 PM, Dmitry Osipenko wrote:
>>>> 30.04.2020 22:09, Sowjanya Komatineni пишет:
>>>>> On 4/30/20 11:18 AM, Sowjanya Komatineni wrote:
>>>>>> On 4/30/20 10:06 AM, Sowjanya Komatineni wrote:
>>>>>>> On 4/30/20 9:29 AM, Sowjanya Komatineni wrote:
>>>>>>>> On 4/30/20 9:04 AM, Sowjanya Komatineni wrote:
>>>>>>>>> On 4/30/20 7:13 AM, Dmitry Osipenko wrote:
>>>>>>>>>> 30.04.2020 17:02, Dmitry Osipenko пишет:
>>>>>>>>>>> 30.04.2020 16:56, Dmitry Osipenko пишет:
>>>>>>>>>>>> 30.04.2020 01:00, Sowjanya Komatineni пишет:
>>>>>>>>>>>>> +static int chan_capture_kthread_finish(void *data)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    struct tegra_vi_channel *chan = data;
>>>>>>>>>>>>> +    struct tegra_channel_buffer *buf;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    set_freezable();
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    while (1) {
>>>>>>>>>>>>> +        try_to_freeze();
>>>>>>>>>>>> I guess it won't be great to freeze in the middle of a capture
>>>>>>>>>>>> process, so:
>>>>>>>>>>>>          if (list_empty(&chan->done))
>>>>>>>>>>>>              try_to_freeze();
>>>>>>>>>>> And here should be some locking protection in order not race
>>>>>>>>>>> with
>>>>>>>>>>> the
>>>>>>>>>>> chan_capture_kthread_start because kthread_finish could freeze
>>>>>>>>>>> before
>>>>>>>>>>> kthread_start.
>>>>>>>>>> Or maybe both start / finish threads should simply be allowed to
>>>>>>>>>> freeze
>>>>>>>>>> only when both capture and done lists are empty.
>>>>>>>>>>
>>>>>>>>>> if (list_empty(&chan->capture) &&
>>>>>>>>>>       list_empty(&chan->done))
>>>>>>>>>>      try_to_freeze();
>>>>>>>>> good to freeze when not in middle of the frame capture but why
>>>>>>>>> should we not allow freeze in between captures?
>>>>>>>>>
>>>>>>>>> Other drivers do allow freeze in between frame captures.
>>>>>>>>>
>>>>>>>>> I guess we can freeze before dequeue for capture and in finish
>>>>>>>>> thread we can freeze after capture done. This also don't need to
>>>>>>>>> check for list_empty with freeze to allow between frame captures.
>>>>>>>>>
>>>>>>>> Also if we add check for both lists empty, freeze is not allowed as
>>>>>>>> long as streaming is going on and in case of continuous streaming
>>>>>>>> freeze will never happen.
>>>>>> To allow freeze b/w frames (but not in middle of a frame),
>>>>>>
>>>>>> for capture_start thread, probably we can do unconditional
>>>>>> try_to_freeze()
>>>> Is it possible to use wait_event_freezable()?
>>>>
>>>> https://www.kernel.org/doc/Documentation/power/freezing-of-tasks.txt
>>>>
>>>> Will the wait_event_interruptible() be woken up when system freezes?
>>>
>>> Based on wait_event_freezable implementation, looks like it similar
>>> to wait_event_interruptible + try_to_free() as it does
>>> freezable_schedule unlike schedule with wait_event_interruptible.
>>>
>>> So using this for capture_start may be ok to allow freeze before
>>> start of frame. But can't use for capture_finish as this is same as
>>> wait_event_interruptible followed by unconditional try_to_freeze.
>>>
>>>>
>>>>>> for capture_finish thread, at end of capture done we can do
>>>>>> try_to_freeze() only when done list is empty
>>>> This doesn't prevent situation where the done-list is empty and the
>>>> "finish" thread freezes, in the same time the "start" thread issues new
>>>> capture and then freezes too.
>>>>
>>>> 1. "start" thread issues capture
>>>>
>>>> 2. "finish" thread wakes and waits for the capture to complete
>>>>
>>>> 3. "start" thread begins another capture, waits for FRAME_START
>>>>
>>>> 4. system freezing activates
>>>>
>>>> 5. "finish" thread completes the capture and freezes because done-list
>>>> is empty
>>>>
>>>> 6. "start" thread gets FRAME_START, issues another capture and freezes
>>>
>>> This will not happen as we allow double buffering done list will not
>>> be empty till stream stop happens
>>>
>>> There will always be 1 outstanding frame in done list
>>
>> Correction, there will always be 1 outstanding buffer except beginning
>> during beginning of stream.
>>
>> Except during beginning frames, done list will not be empty for all
>> subsequent streaming process
> 
> Also to be clear, hardware sees next frame start event prior to previous
> frame mw_ack event as mw_ack event happens after frame end. So once
> initial buffer got queued to done list to finish processes, while
> waiting for mw_ack next frame start happens and pushes next buffer to
> done list.

What about this variant:

1. "start" thread wakes up to start capture

2. system freezing activates

3. "finish" thread wakes up and freezes

4. "start" thread issues capture and freezes

And again, I assume that system's freezing should wake
wait_event_interruptible(), otherwise it won't be possible to freeze
idling threads at all and freezing should fail (IIUC).

And in this case synchronization between start/finish threads should be
needed in regards to freezing.

Note that this could be a wrong assumption, I'm not closely familiar
with how freezer works.
