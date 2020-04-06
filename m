Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 809F919FA21
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729331AbgDFQaB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:30:01 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39500 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728789AbgDFQaA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:30:00 -0400
Received: by mail-lf1-f66.google.com with SMTP id m2so1083985lfo.6;
        Mon, 06 Apr 2020 09:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6s1RomBLaAaLYjYEtNzLrGXH4D7zjKQWtC32MsL6TUY=;
        b=LSprrJcm3y6O68ykXfq0AwAcOXpXeo3pGt4YLZBoeWDaR66qrtXxzAelikL6s/AXDu
         FGHPtdNoSflFkLVTLd8QGYdiDg6euW5aBbWHTixMjNECj2/+fyKXqZUyr1q35+D3Y8LV
         jAzi3i9rcDH5CWJmpU1cvSgb8e4GhesT4mDs2vwz7UZCsIk/zRwij2GhEr3osByaaPP8
         7AQuK+sVZow8NUK7mYPS5k0deg3BerX6FOWDd5wkrtmgjcFTxSJA9wOPtbJS/1sCGh71
         f2cSYUOfE16Mm7B4ko6/HUTwI71+jGkY325iGIgz+0Ps6jznZnqGTBNBKf3YNoFx/Q9y
         HKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6s1RomBLaAaLYjYEtNzLrGXH4D7zjKQWtC32MsL6TUY=;
        b=YO2drf//51T4IKoyFtBJ/3iHhkbw2tBJQufwREBCRMC4mJgbTrchdSw88+e4KxCTSR
         VqEeWgB1FUOOkZkDRPTQLR7x186hBtlWJ7SrkgF4IIWVMVt3dNKgJn0JjoNxRU0gLo8b
         4RmAoEqjWjU2q5DkFhrjbHDvBwoL1NjWrlR048VHBw2+fBfZ4ZU/OvAsaZTmNEHwx9Xq
         fItD1Ana3/pCojh2YO6RvUMaObcptLOeRGwApko+oVYqGPIv5hKzhCUeuXxRsdhcABCW
         4bi+pxTT8Cez3ZVT6VSJ8goVktw7TQ4hs0j9JpB9TpvWhc+3LUnWcp5iFP9h/Ys/FHMj
         od4A==
X-Gm-Message-State: AGi0PuZS7kSo+y2slepDjApV4tfei7OeCS0QI66d9Mkpc1uodjYTxvjR
        jE6y1dPpStvVRBRmVPz8yTbBwiVc
X-Google-Smtp-Source: APiQypJbe1lJWnXFExH2l4+Uev/fYbSRZkAaZ/gonD7P6gbu5LIxn7YaRhzchCFdPfJWvG/UV5o85g==
X-Received: by 2002:a19:c8cf:: with SMTP id y198mr9870475lff.197.1586190596953;
        Mon, 06 Apr 2020 09:29:56 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id j19sm11701904lfe.17.2020.04.06.09.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 09:29:54 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f000f6b9-0f05-b2a5-6dad-37b09803711d@gmail.com>
Date:   Mon, 6 Apr 2020 19:29:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <66cc8646-43d3-3fc8-c31d-d0d2efac505f@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.04.2020 19:12, Sowjanya Komatineni пишет:
> 
> On 4/6/20 9:05 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 06.04.2020 18:35, Sowjanya Komatineni пишет:
>> ...
>>>>> +     /* wait for syncpt counter to reach frame start event
>>>>> threshold */
>>>>> +     err = host1x_syncpt_wait(chan->frame_start_sp, thresh,
>>>>> +                              TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
>>>>> +     if (err) {
>>>>> +             dev_err(&chan->video.dev,
>>>>> +                     "frame start syncpt timeout: %d\n", err);
>>>>> +             /* increment syncpoint counter for timedout events */
>>>>> +             host1x_syncpt_incr(chan->frame_start_sp);
>>>> Why incrementing is done while hardware is still active?
>>>>
>>>> The sync point's state needs to be completely reset after resetting
>>>> hardware. But I don't think that the current upstream host1x driver
>>>> supports doing that, it's one of the known-long-standing problems of
>>>> the
>>>> host1x driver.
>>>>
>>>> At least the sp->max_val incrementing should be done based on the
>>>> actual
>>>> syncpoint value and this should be done after resetting hardware.
>>> upstream host1x driver don't have API to reset or to equalize max value
>>> with min/load value.
>>>
>>> So to synchronize missed event, incrementing HW syncpt counter.
>>>
>>> This should not impact as we increment this in case of missed events
>>> only.
>> It's wrong to touch sync point while hardware is active and it's active
>> until being reset.
>>
>> You should re-check the timeout after hw resetting and manually put the
>> syncpoint counter back into sync only if needed.
> 
> There is possibility of timeout to happen any time even during the
> capture also and is not related to hw reset.
> 
> Manual synchronization is needed when timeout of any frame events happen
> otherwise all subsequence frames will timeout due to mismatch in event
> counters.

My point is that hardware is stopped only after being reset, until then
you should assume that sync point could be incremented by HW at any time.

And if this happens that HW increments sync point after the timeout,
then the sync point counter should become out-of-sync in yours case,
IIUC. Because host1x_syncpt_incr() doesn't update the cached counter.
