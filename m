Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7271C0687
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 21:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgD3Tdt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 15:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgD3Tdt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 15:33:49 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBACC035494;
        Thu, 30 Apr 2020 12:33:48 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z22so2061985lfd.0;
        Thu, 30 Apr 2020 12:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N21UHwUtojGFrYGUsgpMdiZpUK/5e8XahCdaTyz1hic=;
        b=Flnu8AmltNiSqSEdZAhCz6x974hUmqtWxh2iiF2EnCS+b0uFjxFN2M8Rp1Y3Gln8PY
         HHblTtK4rcJMbneYQ/z+L2Zq6xAbpaodd/sFjl1FSYwSxRzp4VbCuVUpWK56QsD5bO0S
         4kcZG3uit7qXR/JemhYNh9RX2fr61HhXEgusahwTlcCJiyNayonTBnS1E+8BBRoRvB0C
         mrOimLOoPGFJJCiMV5h+4BtW00mncQv4v51GpYEPBojASPOj/OsxD9NHfbUV6HrktXfC
         t0V5DuXASYBTd51iPDYGNZ6B78VRTw+wiC1G8QoxviJrnWM2uiTifh17n3p5RJ6RYJmC
         uwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N21UHwUtojGFrYGUsgpMdiZpUK/5e8XahCdaTyz1hic=;
        b=qIVH3+vjpnF3GhhWUuj001a6Ectrw/6S2p/5thkxxDcezhJ0xY20cvKF//H82VlrCi
         EzO/Zhkbgim4tvew14NmVeJQdXtj3z1vzVLUJrum6zUZGF1l6GTcDWL2jQhF07IsG57P
         5hg6PHGD5zwTUhAm72Kb5VWDrpo5LpDaxMq/nPh0zpuSQ/keLecn0BDUlI0hVh5AKI8H
         WvosZHHUkt0qO/Xcl1hMcgCeWVRnKCgIrc8fqrlIMTwebwPYv9rIcVQBeKIf0YBtv2oz
         eBs4T4H0tiHoNZ0sXulEnIkmRDvNI0zfgh5DXxiD9MlpojgNhPyJ/zVNUB0T7bR0fyMY
         eQlw==
X-Gm-Message-State: AGi0PuYXZpkO0MXQeLyCbmEViQtnvR3XMT9mX7gCLY57LgaeVpT0g7Bt
        wVE8otVREROpWWNhVMrc3bk4rpdp
X-Google-Smtp-Source: APiQypKcJeTLicQiy3MA/QNzKLfjDr3UefC+JvTUATlunfuuHaaXCBh6cS+f/mZY1ETyyN5p/RjqIw==
X-Received: by 2002:a19:f70c:: with SMTP id z12mr160047lfe.78.1588275226646;
        Thu, 30 Apr 2020 12:33:46 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id 25sm449422lft.68.2020.04.30.12.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 12:33:45 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <71532440-f455-cc24-74f7-9ccad5947099@gmail.com>
Date:   Thu, 30 Apr 2020 22:33:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f6088e0f-4ac7-a6be-3ede-0233dc88ef2c@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

30.04.2020 22:09, Sowjanya Komatineni пишет:
> 
> On 4/30/20 11:18 AM, Sowjanya Komatineni wrote:
>>
>> On 4/30/20 10:06 AM, Sowjanya Komatineni wrote:
>>>
>>> On 4/30/20 9:29 AM, Sowjanya Komatineni wrote:
>>>>
>>>> On 4/30/20 9:04 AM, Sowjanya Komatineni wrote:
>>>>>
>>>>> On 4/30/20 7:13 AM, Dmitry Osipenko wrote:
>>>>>> 30.04.2020 17:02, Dmitry Osipenko пишет:
>>>>>>> 30.04.2020 16:56, Dmitry Osipenko пишет:
>>>>>>>> 30.04.2020 01:00, Sowjanya Komatineni пишет:
>>>>>>>>> +static int chan_capture_kthread_finish(void *data)
>>>>>>>>> +{
>>>>>>>>> +    struct tegra_vi_channel *chan = data;
>>>>>>>>> +    struct tegra_channel_buffer *buf;
>>>>>>>>> +
>>>>>>>>> +    set_freezable();
>>>>>>>>> +
>>>>>>>>> +    while (1) {
>>>>>>>>> +        try_to_freeze();
>>>>>>>> I guess it won't be great to freeze in the middle of a capture
>>>>>>>> process, so:
>>>>>>>>         if (list_empty(&chan->done))
>>>>>>>>             try_to_freeze();
>>>>>>> And here should be some locking protection in order not race with
>>>>>>> the
>>>>>>> chan_capture_kthread_start because kthread_finish could freeze
>>>>>>> before
>>>>>>> kthread_start.
>>>>>> Or maybe both start / finish threads should simply be allowed to
>>>>>> freeze
>>>>>> only when both capture and done lists are empty.
>>>>>>
>>>>>> if (list_empty(&chan->capture) &&
>>>>>>      list_empty(&chan->done))
>>>>>>     try_to_freeze();
>>>>>
>>>>> good to freeze when not in middle of the frame capture but why
>>>>> should we not allow freeze in between captures?
>>>>>
>>>>> Other drivers do allow freeze in between frame captures.
>>>>>
>>>>> I guess we can freeze before dequeue for capture and in finish
>>>>> thread we can freeze after capture done. This also don't need to
>>>>> check for list_empty with freeze to allow between frame captures.
>>>>>
>>>> Also if we add check for both lists empty, freeze is not allowed as
>>>> long as streaming is going on and in case of continuous streaming
>>>> freeze will never happen.
>>>
>> To allow freeze b/w frames (but not in middle of a frame),
>>
>> for capture_start thread, probably we can do unconditional
>> try_to_freeze()

Is it possible to use wait_event_freezable()?

https://www.kernel.org/doc/Documentation/power/freezing-of-tasks.txt

Will the wait_event_interruptible() be woken up when system freezes?

>> for capture_finish thread, at end of capture done we can do
>> try_to_freeze() only when done list is empty

This doesn't prevent situation where the done-list is empty and the
"finish" thread freezes, in the same time the "start" thread issues new
capture and then freezes too.

1. "start" thread issues capture

2. "finish" thread wakes and waits for the capture to complete

3. "start" thread begins another capture, waits for FRAME_START

4. system freezing activates

5. "finish" thread completes the capture and freezes because done-list
is empty

6. "start" thread gets FRAME_START, issues another capture and freezes

> My understanding is buffer updates/release should not happen after
> frozen state. So we should let frame capture of outstanding buffer to
> finish before freezing in capture_finish thread.
> 
> But for capture_start thread we can unconditionally freeze before
> dequeuing next buffer for capture.
> 
> With this when both threads are in frozen state and no buffer
> updates/captures will happen after frozen state.
> 
> I think its not required to finish streaming of all frames completely to
> let threads to enter frozen state as streaming can be continuous as well.

Yes, only freezing in the middle of IO should be avoided.

https://lwn.net/Articles/705269/

>>> Hi Dmitry,
>>>
>>> Will update in v12 to not allow freeze in middle of a frame capture.
>>>
>>> Can you please confirm on above if you agree to allow freeze to
>>> happen in b/w frame captures?
>>>
>>> Also as most feedback has been received from you by now, appreciate
>>> if you can provide all in this v11 if you have anything else so we
>>> will not have any new changes after v12.

I'll take another look tomorrow / during weekend and let you know.
