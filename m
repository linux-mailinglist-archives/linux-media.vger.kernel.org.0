Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A711C267F
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 17:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgEBPQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 11:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728163AbgEBPQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 May 2020 11:16:50 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3331C061A0C;
        Sat,  2 May 2020 08:16:48 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id f11so5361540ljp.1;
        Sat, 02 May 2020 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Gx0Is5+F4FiiACKex8epswIclEUCgzGlDdmsu44R9Ts=;
        b=WnNt4r+R8/umeNLEcst79H/Ils9choOMCTryjQF/BJo1cnv0fbBrBFcYa5BobGLMAR
         6lNRMIPSC0V2+wwoKVWD9Bnuwkgpl4NWnQeLVLotGRQhQUnf6NWndSh7KTUc5gLtgI0/
         bKJc6njY5UsZbVrmhyS9PjcIbWnMX7rxpPH3jnsTwX10dt58Mv66H+Dq4zB8Eooqa1aV
         v55TVyXRuBLGdWoUCoqV0zcDs2OT6mHMCHnx6tOv2fwK0GXJb0VfHHpTBnD2E+TI2oVk
         +KzvDkt0bxczZMv2CE7Zkxz4Z051AIOWrUeWp4F8LgccoNEpRqMumdDTmD0J8OOzQ8Y3
         pCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gx0Is5+F4FiiACKex8epswIclEUCgzGlDdmsu44R9Ts=;
        b=L0xRiZZVAiq9NsrfLSJ67WJEUOAZOlxS9IHZYvsGOJrZzVZiPZ9jAumSYGV/z6Gp0A
         A6xUtm0Fk3W91W0CZKlDt3QQ4Qoe+zRCdzdfe1bpqxgNdQz7WZOkHOgI3w2YnvuuQjuL
         AbUfY2Oe9JKmtS8V/UoUrTJF1ygtt39wca7Ihwqk4WL0FpZE+ec0a7Sb0gwjiQMyJ5Vo
         tpAvdHalZx8wi04RpyqGt4jl/yBM8/rrz5CBCvZ456bnUPcGGq7MDtaVERbqUqnRnV+A
         M35wk25RXxAgEC548pFg5FweOkp2T39JbALEt5q6Upj9c6TMijNb7V3vshqkJ+60liad
         K+9w==
X-Gm-Message-State: AGi0PubBibmhCd6SqPnB1O1XI1U7GwrjEWckCl2x4GhXzzdvRZicF8y+
        ilvKWTzsd92oz1pgF98DRHt2M2Wv
X-Google-Smtp-Source: APiQypL9ApnElSz/U5f/02s2TZkR00EZDvqCa4/qW9iy3WiMejVjfpJZF2y/UQQpmSDmYaO1UBj1Vg==
X-Received: by 2002:a2e:593:: with SMTP id 141mr5060908ljf.271.1588432607004;
        Sat, 02 May 2020 08:16:47 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id r2sm4102245ljm.8.2020.05.02.08.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2020 08:16:46 -0700 (PDT)
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <71532440-f455-cc24-74f7-9ccad5947099@gmail.com>
 <b3238987-5e8a-32f2-7ce7-924e86bc6e9e@nvidia.com>
 <298187f6-2425-4813-1ae1-f256c179623e@nvidia.com>
 <9c942bc9-703e-3bbb-eeab-f37e69dc1ded@nvidia.com>
 <b72b9d5c-7d02-1b58-20f7-30f94e230d58@gmail.com>
 <668d9b65-9590-cc97-41c3-2c1a5cfbbe61@nvidia.com>
 <289d9c92-383f-3257-de7b-46179724285a@nvidia.com>
 <9aa64f21-7b23-7228-b5eb-d2ff092682ad@nvidia.com>
 <668cc4a0-2c81-0d87-b801-9fbf64e19137@nvidia.com>
 <bf3f654e-b8f8-d560-fc5e-03d73cb7eab0@nvidia.com>
 <525e481b-9137-6fdd-bbf9-3779a5704e6b@nvidia.com>
 <fe7ebad6-0368-b1f0-4f58-648baa5e3f79@nvidia.com>
 <4f095181-2338-3b71-316c-f8bbfc7865cc@nvidia.com>
 <50e872bb-913a-7b47-3264-af6b1cedb0e2@nvidia.com>
 <e17a8a49-be53-465d-f64c-3f4c77391d98@nvidia.com>
 <da5154b4-85f9-3e56-a440-f75debaec3a8@nvidia.com>
 <cbb047ae-97dc-8b9a-a5ba-8e2a5dab3771@nvidia.com>
 <6ae2d00d-7955-d12b-5b56-955ef72ece26@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f9073b28-f1f1-636c-be53-764fb0a531a1@gmail.com>
Date:   Sat, 2 May 2020 18:16:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6ae2d00d-7955-d12b-5b56-955ef72ece26@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

02.05.2020 06:55, Sowjanya Komatineni пишет:
> 
> On 5/1/20 8:39 PM, Sowjanya Komatineni wrote:
>>
>>
>> On 5/1/20 2:05 PM, Sowjanya Komatineni wrote:
>>>
>>>
>>> On 5/1/20 1:58 PM, Sowjanya Komatineni wrote:
>>>>
>>>>
>>>> On 5/1/20 1:44 PM, Sowjanya Komatineni wrote:
>>>>>
>>>>>
>>>>> On 5/1/20 11:03 AM, Sowjanya Komatineni wrote:
>>>>>>
>>>>>>
>>>>>> On 4/30/20 4:33 PM, Sowjanya Komatineni wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 4/30/20 4:14 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>>> And in this case synchronization between start/finish
>>>>>>>>>>>>>> threads should be
>>>>>>>>>>>>>> needed in regards to freezing.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Was thinking to have counter to track outstanding frame
>>>>>>>>>>>>> w.r.t single shot issue b/w start and finish and allow to
>>>>>>>>>>>>> freeze only when no outstanding frames in process.
>>>>>>>>>>>>>
>>>>>>>>>>>>> This will make sure freeze will not happen when any buffers
>>>>>>>>>>>>> are in progress
>>>>>>>>>>>>>
>>>>>>>>>>>>>> Note that this could be a wrong assumption, I'm not
>>>>>>>>>>>>>> closely familiar
>>>>>>>>>>>>>> with how freezer works.
>>>>>>>>>>>>
>>>>>>>>>>>> kthread_start can unconditionally allow try_to_freeze before
>>>>>>>>>>>> start of frame capture
>>>>>>>>>>>>
>>>>>>>>>>>> We can compute captures inflight w.r.t single shot issued
>>>>>>>>>>>> during capture start and finished frames by kthread_finish
>>>>>>>>>>>> and allow kthread_finish to freeze only when captures
>>>>>>>>>>>> inflight is 0.
>>>>>>>>>>>>
>>>>>>>>>>>> This allows freeze to happen b/w frames but not in middle of
>>>>>>>>>>>> frame
>>>>>>>>> will have caps inflight check in v12 to allow freeze finish
>>>>>>>>> thread only when no captures are in progress
>>>>>>>>
>>>>>>>>
>>>>>>>> try_to_freeze() returns thread frozen state and looks like we
>>>>>>>> can use this in kthread finish to allow finish thread to freeze
>>>>>>>> only when kthread_start is already frozen and no buffers in
>>>>>>>> progress/initiated for capture.
>>>>>>>>
>>>>>>> chan->capture_frozen holds frozen state returned from
>>>>>>> try_to_freeze() in start kthread
>>>>>>>
>>>>>>> chan->capture_reqs increments after every single shot issued.
>>>>>>>
>>>>>>>
>>>>>>> static int chan_capture_kthread_finish(void *data)
>>>>>>>
>>>>>>> {
>>>>>>>     struct tegra_vi_channel *chan = data;
>>>>>>>     struct tegra_channel_buffer *buf;
>>>>>>>     int caps_inflight;
>>>>>>>
>>>>>>>     set_freezable();
>>>>>>>
>>>>>>>     while (1) {
>>>>>>>         wait_event_interruptible(chan->done_wait,
>>>>>>>                      !list_empty(&chan->done) ||
>>>>>>>                      kthread_should_stop());
>>>>>>>
>>>>>>>         /* dequeue buffers and finish capture */
>>>>>>>         buf = dequeue_buf_done(chan);
>>>>>>>         while (buf) {
>>>>>>>             tegra_channel_capture_done(chan, buf);
>>>>>>>             buf = dequeue_buf_done(chan);
>>>>>>>         }
>>>>>>>
>>>>>>>         if (kthread_should_stop())
>>>>>>>             break;
>>>>>>>
>>>>>>>         caps_inflight = chan->capture_reqs - chan->sequence;
>>>>>>>         if (chan->capture_frozen && !caps_inflight)
>>>>>>>             try_to_freeze();
>>>>>>>     }
>>>>>>>
>>>>>>>     return 0;
>>>>>>> }
>>>>>>
>>>>>>
>>>>>> Freezing happens prior to suspend() during suspend entry and when
>>>>>> we implement suspend/resume during suspend we stop streaming where
>>>>>> we stop threads anyway.
>>>>>>
>>>>>> So, was thinking why we need these threads freezable here?
>>>>>>
>>>>>>
>>>>> Hi Dmitry,
>>>>>
>>>>> Did some testing and below are latest observation and fix I tested.
>>>>>
>>>>> wait_event_interruptible() uses schedule() which blocks the freezer.
>>>>> When I do suspend while keeping streaming active in background, I
>>>>> see freezing of these threads fail and call trace shows __schedule
>>>>> -> __switch_to from these kthreads.
>>>>>
>>>>> wait_event_freezable() uses freezable_schedule() which should not
>>>>> block the freezer but we can't use this here as we need conditional
>>>>> try_to_freeze().
>>>>>
>>>>>
>>>>> So, doing below sequence works where we set PF_FREEZER_SKIP flag
>>>>> thru freezer_not_count() before wait_event which calls schedule()
>>>>> and remove PF_FREEZER_SKIP after schedule allows try_to_freeze to
>>>>> work and also conditional try_to_freeze below prevents freezing
>>>>> thread in middle of capture.
>>>>>
>>>>> while (1) {
>>>>>     freezer_not_count()
>>>>>     wait_event_interruptible()
>>>>>     freezer_count()
>>>>>     ...
>>>>>     ...
>>>>>     if (chan->capture_frozen && !caps_inflight)
>>>>>         try_to_freeze()
>>>>> }
>>>>>
>>>>> Please comment if you agree with above sequence. Will include this
>>>>> in v12.
>>>>>
>>> sorry, freezer_count() does try_to_freeze after clearing skip flag.
>>> So, dont think we can use this as we need conditional try_to_freeze.
>>> Please ignore above sequence.
>>>>>
>>>> Or probably we can take closer look on this later when we add
>>>> suspend/resume support as it need more testing as well.
>>>>
>>>> As this is initial series which has TPG only I think we shouldn't
>>>> get blocked on this now. Series-2 and 3 will be for sensor support
>>>> and on next series when we add suspend/resume will look into this.
>>>>
>>>>
>> When freeze activity starts and in case if finish thread freezes prior
>> to start thread issuing capture, its the VI hardware writes data to
>> the allocated buffer address.
>>
>> finish thread just checks for the event from the hardware and we don't
>> handle/process directly on memory in this driver.
>>
>> So even we freeze done thread when single shot is issued frame buffer
>> gets updated.
>>
>> In case if capture thread is frozen there will not buffers queued to
>> process by finish thread. So, this will not be an issue.
>>
>> So, probably we don't need to do conditional try_to_freeze and what we
>> have should work good in this corner case.
>>
> I still need to change wait_event_interruptible() to
> wait_event_freezable() but no need to synchronize finish thread freeze
> with start thread as even on issuing capture start its vi hardware that
> does frame buffer update and finish thread just checks for mw_ack event
> and returns buffer to application.

The problem we are primarily trying to avoid is to have suspending being
done in the middle of IO.

IIUC, even if system will be suspended in the middle of VI IO, it won't
be fatal. In worst case the buffer capture should fail on resume from
suspend. Could you please try to simulate this potential issue and see
what result will be on suspending in the middle of VI IO?

We don't want to suspend system / stop streaming in the middle of IO, so
this problem of a proper threads tear-down still exists. It should
become easier to resolve the problem in a case of a proper suspending
callback because the "start" thread could be turned down at any time, so
it should be easier to maintain a proper tear-down order when threads
are fully controlled by the driver, i.e. the "start" thread goes down
first and the "finish" is second, blocking until the capture is completed.

I think yours suggestion about dropping the freezing from the threads
for now and returning back to it later on (once a proper suspend/resume
support will be added) sounds reasonable.

But if you'd want to keep the freezing, then the easy solution could be
like that:

  1. "start" thread could freeze at any time
  2. "finish" thread could freeze only when the "start" thread is frozen
and capture isn't in-progress. Use frozen(kthread_start_capture) to
check the freezing state.

https://elixir.bootlin.com/linux/v5.7-rc3/source/include/linux/freezer.h#L25
