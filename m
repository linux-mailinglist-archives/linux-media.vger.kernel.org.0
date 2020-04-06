Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C14F19F9A8
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729268AbgDFQFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:05:36 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35016 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729058AbgDFQFg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:05:36 -0400
Received: by mail-lf1-f68.google.com with SMTP id r17so8735174lff.2;
        Mon, 06 Apr 2020 09:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UlEB5mGfZfrR2ICgj85sakIeAX6bWAMpBvZEq4sclhs=;
        b=hMnqzACejUMzIgLKjfDtgPf/VuejCHWZs65xvT1bS8bVxb8suPbcvAd15qTR5U4P0g
         9fDauAF6ltaIGvTsqYfLaeVxlgkn46wpEufbxT4dptigxbccuIXGsYzbsRtRSOGECD67
         G7CnfYjyn/LK2es30KIM7suDdloc3hwupo8NxITZgvAXpa7Wrr+RaAVg3EIC31B6BaC6
         Y9AKM2vJURufQXg5vUF0ciBmgWNNl6d8ZnDsbL39B4uymtlKom6zPxEi0VGAeJL9+Aff
         GEBBOK20kyNdtHh6abEOaI4L1WlK6l38B1XcIseSzQmXANclXhRVcHyU5zK8mZ6+iaDV
         oWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UlEB5mGfZfrR2ICgj85sakIeAX6bWAMpBvZEq4sclhs=;
        b=LSiNBINORBqO4I1oVtmwr9sOFqr7ptTvhkReZ8XEVmMpktPJHQo3y8PlMokFIQuQVa
         1oJkydgfIjkwg6Is2wni4Jclu6AEqDHT+nmVVTJRCLS3OZwyYxTbZfFBgb0P1qck77Pw
         LiiVYM8ImlMQOkJXsQB8WT7A+Gf8vk77G4Icqh+1Ubdz/ft9uaM44xO/+mJ/KBQ76a8P
         EN70K2JU2oS2+GW5x3db6ScK/1lN2ViheUY2Js4nq/+gtCSRLc5TWfijUgEuxQWqP2el
         AsvfWqPvWaGppsQzgO0hJSFt9smx+hkLhAJFB4ybssMixHKOMK5mobH66mWiUcOt95fu
         +RJg==
X-Gm-Message-State: AGi0PuYjI41bG6Yr3LFiSs9CEE5LBxCOiz3ZbHZ4teccNa+Y9y7hxrSp
        P0Ejh8pecmspqNho9TG5x2s58m05
X-Google-Smtp-Source: APiQypLjG2SSlcN4OQg20r8eqrjVwnmiP/cugPGrrukYx2188O2RBBAD2rTfh2StJg+t9ezqr+LcYQ==
X-Received: by 2002:a05:6512:52c:: with SMTP id o12mr13295963lfc.217.1586189133488;
        Mon, 06 Apr 2020 09:05:33 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id z4sm9860769ljk.51.2020.04.06.09.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 09:05:30 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1a12974a-7cc7-2c3a-3995-076b9956714d@gmail.com>
Date:   Mon, 6 Apr 2020 19:05:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9b8cf37b-d2ad-9df2-aad8-216c2c954e69@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.04.2020 18:35, Sowjanya Komatineni пишет:
...
>>> +     /* wait for syncpt counter to reach frame start event threshold */
>>> +     err = host1x_syncpt_wait(chan->frame_start_sp, thresh,
>>> +                              TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
>>> +     if (err) {
>>> +             dev_err(&chan->video.dev,
>>> +                     "frame start syncpt timeout: %d\n", err);
>>> +             /* increment syncpoint counter for timedout events */
>>> +             host1x_syncpt_incr(chan->frame_start_sp);
>> Why incrementing is done while hardware is still active?
>>
>> The sync point's state needs to be completely reset after resetting
>> hardware. But I don't think that the current upstream host1x driver
>> supports doing that, it's one of the known-long-standing problems of the
>> host1x driver.
>>
>> At least the sp->max_val incrementing should be done based on the actual
>> syncpoint value and this should be done after resetting hardware.
> 
> upstream host1x driver don't have API to reset or to equalize max value
> with min/load value.
> 
> So to synchronize missed event, incrementing HW syncpt counter.
> 
> This should not impact as we increment this in case of missed events only.

It's wrong to touch sync point while hardware is active and it's active
until being reset.

You should re-check the timeout after hw resetting and manually put the
syncpoint counter back into sync only if needed.
