Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B88B219FE7F
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 21:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgDFTx4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 15:53:56 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42404 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbgDFTx4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 15:53:56 -0400
Received: by mail-lj1-f195.google.com with SMTP id q19so1048244ljp.9;
        Mon, 06 Apr 2020 12:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QEAzK7b0u2ss864W21oMnrNk924PkZ/JBDmjfBzTVEg=;
        b=QWujv4RzXQtuEVv4DLH1RqoOyioGG8TfYWsPAM1z1a8U5hXilnwudjqTQDqU2uL0/Z
         AIl0iExMoc5gGLgjmmUuTuYqbJVa7rtr+i44JexPT2cQDljk/jVHuIder8gvHdE44EDB
         4PyWtxBjBGWK5721nSe9RGxI9ai/Fze3Uefktb02YesRGRyfsGDhXb6FCbA8upxw7Rsc
         XDEPWGJlf/F7F22nRJZEzEvQJ+YeaOe/KwhDX9YFb/HvCJbe+DA9bxjts6h6UQPXykMv
         LCuL+UKQKXg3ez+e0Wt6fFowImdedh6LL66nnBTAnDcfEcaog9u4k2o8jWPAk4X2xP6e
         8Zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QEAzK7b0u2ss864W21oMnrNk924PkZ/JBDmjfBzTVEg=;
        b=noG/i4yahCi+WQX1AQO3riHibGScIxA4qj0VabjPgP8fGqaDfcTDEHeMqCh31SvIyl
         iMfQjObECopaKAb2ebEfOBHRwxIHMYHIsATGYy6Z4LBiiZu4Uun7IuRgSXSEdJ3eOxWb
         7zMvF6hwz5mJ5y8tMqAoTFZMdLrpiGQV9zLG52t+IPVsHZYVqsf1m+r2k3Wn03Cwhl37
         Us1wPZdE34JyFw0bbGK/lpYy9MKhOOCzka/+0AbNnlZ9EXboRBoDDONyPWcbtywe/qm8
         bdRbV4dRNSBgDfdn/JBIwDHjIVQ5eiIUwgr2NFfCZfBPZyRi2cU0t4mrbwwYBRfsRxR7
         ugpw==
X-Gm-Message-State: AGi0PuYh+NNaug5Z5t26/Uvb1EIJv00l81oaKiKh/BGpGs8LzckaALHg
        ma3j1zcNcSysXZIorqdIsfTmGIIk
X-Google-Smtp-Source: APiQypLKWt3nl3ocBDP9LHP4kzT5aHOE+NAZLzKLXcli2wWaMewGefGw9f0h5nTLabCr7e6h8KNSgQ==
X-Received: by 2002:a05:651c:23a:: with SMTP id z26mr7476ljn.179.1586202832949;
        Mon, 06 Apr 2020 12:53:52 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id 64sm10460457ljj.41.2020.04.06.12.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 12:53:52 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <38d921a7-5cdf-8d0a-2772-4399dd1a96a0@gmail.com>
 <9b8cf37b-d2ad-9df2-aad8-216c2c954e69@nvidia.com>
 <1a12974a-7cc7-2c3a-3995-076b9956714d@gmail.com>
 <66cc8646-43d3-3fc8-c31d-d0d2efac505f@nvidia.com>
 <f000f6b9-0f05-b2a5-6dad-37b09803711d@gmail.com>
 <fe6a17c1-fae2-a365-4dd6-6d3a25d47d54@nvidia.com>
 <9038ce90-ac53-93e7-ce65-57f6ff1e9b30@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <abe82fd1-0464-0627-6c97-39c896e53dd0@gmail.com>
Date:   Mon, 6 Apr 2020 22:53:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9038ce90-ac53-93e7-ce65-57f6ff1e9b30@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.04.2020 20:02, Sowjanya Komatineni пишет:
> 
> On 4/6/20 9:37 AM, Sowjanya Komatineni wrote:
>>
>> On 4/6/20 9:29 AM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 06.04.2020 19:12, Sowjanya Komatineni пишет:
>>>> On 4/6/20 9:05 AM, Dmitry Osipenko wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> 06.04.2020 18:35, Sowjanya Komatineni пишет:
>>>>> ...
>>>>>>>> +     /* wait for syncpt counter to reach frame start event
>>>>>>>> threshold */
>>>>>>>> +     err = host1x_syncpt_wait(chan->frame_start_sp, thresh,
>>>>>>>> + TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
>>>>>>>> +     if (err) {
>>>>>>>> +             dev_err(&chan->video.dev,
>>>>>>>> +                     "frame start syncpt timeout: %d\n", err);
>>>>>>>> +             /* increment syncpoint counter for timedout events */
>>>>>>>> + host1x_syncpt_incr(chan->frame_start_sp);
>>>>>>> Why incrementing is done while hardware is still active?
>>>>>>>
>>>>>>> The sync point's state needs to be completely reset after resetting
>>>>>>> hardware. But I don't think that the current upstream host1x driver
>>>>>>> supports doing that, it's one of the known-long-standing problems of
>>>>>>> the
>>>>>>> host1x driver.
>>>>>>>
>>>>>>> At least the sp->max_val incrementing should be done based on the
>>>>>>> actual
>>>>>>> syncpoint value and this should be done after resetting hardware.
>>>>>> upstream host1x driver don't have API to reset or to equalize max
>>>>>> value
>>>>>> with min/load value.
>>>>>>
>>>>>> So to synchronize missed event, incrementing HW syncpt counter.
>>>>>>
>>>>>> This should not impact as we increment this in case of missed events
>>>>>> only.
>>>>> It's wrong to touch sync point while hardware is active and it's
>>>>> active
>>>>> until being reset.
>>>>>
>>>>> You should re-check the timeout after hw resetting and manually put
>>>>> the
>>>>> syncpoint counter back into sync only if needed.
>>>> There is possibility of timeout to happen any time even during the
>>>> capture also and is not related to hw reset.
>>>>
>>>> Manual synchronization is needed when timeout of any frame events
>>>> happen
>>>> otherwise all subsequence frames will timeout due to mismatch in event
>>>> counters.
>>> My point is that hardware is stopped only after being reset, until then
>>> you should assume that sync point could be incremented by HW at any
>>> time.
>>>
>>> And if this happens that HW increments sync point after the timeout,
>>> then the sync point counter should become out-of-sync in yours case,
>>> IIUC. Because host1x_syncpt_incr() doesn't update the cached counter.
>>
>> We wait for enough time based on frame rate for syncpt increment to
>> happen and if it doesn't happen by then definitely its missed event
>> and we increment HW syncpoint for this timed event.
>>
>> cached value gets updated during syncpt wait for subsequent event.
>>
>> syncpt increment happens for all subsequent frame events during video
>> capture.
>>
> Just to be clear, syncpt max value increment happens first and syncpt
> trigger condition is programmed. hw syncpt increment happens based on HW
> events.
> 
> Wait time for HW syncpt to reach threshold is tuned to work for all
> frame rates. So if increment doesn't happen by then, its definitely
> missed event.

This is questionable. Technically, speculating about whether the tuned
value is good for all possible cases is incorrect thing to do.

Although, I guess in practice it should be good enough for the starter
and could be improved later on, once the host1x driver will be improved.

> In case of missed HW event corresponding to syncpt condition, hw syncpt
> increment does not happen and driver increments it on timeout.
> 
> As there is not API to equialize max with min incase of timeout/reset,
> incrementing HW syncpt for timed out event.
> 
> syncpt cached value gets updated during syncpt wait when it loads from
> HW syncpt.
> 
> As syncpt condition is already triggered, without compensating timeout
> events or leaving syncpt max and hw syncpt in non synchronized state for
> missed events, subsequent streamings will all timeout even on real events.
> 

