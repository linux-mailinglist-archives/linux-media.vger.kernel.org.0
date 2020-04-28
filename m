Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0251BC280
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 17:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbgD1PPn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 11:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727108AbgD1PPn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 11:15:43 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57A1C03C1AB;
        Tue, 28 Apr 2020 08:15:41 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id w145so17221474lff.3;
        Tue, 28 Apr 2020 08:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uSKH1Kc52O3XjkUGBcSYVM1Zhi45kREmU3dNUbXFf4E=;
        b=Ph1UsNazrdNEZAcS7oAUNMsZiNFK/Dm2LKbNmwJ6qYrPgnyvea03nE5LMSs2GQdU1S
         6K+JJgBzcW3hn4W+tqt0jYbKelagW3UITI5yYHIzr5mw5UWrh6xg5nf7HtU6j8huxUbQ
         LkeckTV0KdJb3Tm6d9T+Knv6SSMrHO768X+iNAlv30hUCFCPAxhNYUD+JzqJtoGgxPCz
         +kj4xwJ9xVDPhenDSqAuI1LGSmCGGgrwiDh05NpbUu0bRk/CwNJcX7yIFXzSrIeLZr/J
         DPuASQZhcDm3gADS5FUFY8iIcXVr5xgSpWm6kEipTDrpmZyE/wnhY9Vjtp4m+JWKjP3C
         EhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uSKH1Kc52O3XjkUGBcSYVM1Zhi45kREmU3dNUbXFf4E=;
        b=miIWm4r4ianSve7SmGtRaUTZRYB9I8h2LGbNjh+5WCxOwgoWYzCrjA2k7F50c2u+Zo
         q3s0aFtsE0WYG3K4LxkHF0IzBOBxDBfd8uwRZn00wV1652QPXmcMk8iG/T+aWxHx72my
         /ZwfdJ696KnOxervZBEuZooH6rI4nfaNkC52yy/CP0WHxbxEfH2no4u9NUmi5VzkcQWM
         DCs9m69TppM8DzPvQVzUaUrQVwuVDU2ytxlcmA40c7pe4QT/cKYwov0GvSjst8P2pqWI
         9dQ8GENqAJlnjc6q4QhxJuY3e2FYGB/cPmNzKtuvY4/jdW8WyF649OfEcQEX6BkcCHx6
         PcKg==
X-Gm-Message-State: AGi0PuatkAa4H8hrC719RXwPbptFL4F0z/uy6ab6s1TuhBAdZGi2dpJd
        L5x8SiPSOkEGgrzLUCaJP/M78m+a
X-Google-Smtp-Source: APiQypIzzXLgYj6k0CaqrxFm7qETup3hnNTTDV3J9nuffj6CaBCrVCDXNxj24ij/cZSlyMrgrQUbxg==
X-Received: by 2002:ac2:523c:: with SMTP id i28mr19379463lfl.36.1588086940141;
        Tue, 28 Apr 2020 08:15:40 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id u7sm14313236lfg.20.2020.04.28.08.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 08:15:39 -0700 (PDT)
Subject: Re: [RFC PATCH v1 3/5] media: tegra-video: Move PM runtime handle to
 streaming
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
 <1588047650-29402-4-git-send-email-skomatineni@nvidia.com>
 <631390cb-9aff-0e3f-6c39-81d6c565987e@gmail.com>
 <3ef69413-a606-b475-f530-d5534760b73b@nvidia.com>
 <2b334095-fadb-bf0a-f7a8-62fc798c2bd2@gmail.com>
 <18a7b095-7f0f-7819-c786-7e011cfd14ed@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ce31e273-f424-f13e-5cd6-0db2589a2a10@gmail.com>
Date:   Tue, 28 Apr 2020 18:15:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <18a7b095-7f0f-7819-c786-7e011cfd14ed@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

28.04.2020 18:08, Sowjanya Komatineni пишет:
> 
> On 4/28/20 7:59 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 28.04.2020 17:51, Sowjanya Komatineni пишет:
>>> On 4/28/20 6:59 AM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 28.04.2020 07:20, Sowjanya Komatineni пишет:
>>>>> diff --git a/drivers/staging/media/tegra-video/csi.c
>>>>> b/drivers/staging/media/tegra-video/csi.c
>>>>> index b3dd0c3..29ccdae 100644
>>>>> --- a/drivers/staging/media/tegra-video/csi.c
>>>>> +++ b/drivers/staging/media/tegra-video/csi.c
>>>>> @@ -272,8 +272,25 @@ static int tegra_csi_s_stream(struct v4l2_subdev
>>>>> *subdev, int enable)
>>>>>         struct tegra_vi_channel *chan =
>>>>> v4l2_get_subdev_hostdata(subdev);
>>>>>         struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>>>>>         struct tegra_csi *csi = csi_chan->csi;
>>>>> +     int ret;
>>>>> +
>>>>> +     if (enable && atomic_add_return(1, &csi->clk_refcnt) == 1) {
>>>>> +             ret = pm_runtime_get_sync(csi->dev);
>>>>> +             if (ret < 0) {
>>>>> +                     dev_err(csi->dev,
>>>>> +                             "failed to get runtime PM: %d\n", ret);
>>>>> +                     pm_runtime_put_noidle(csi->dev);

Why this pm_runtime_put_noidle() is needed? This should be wrong, please
remove it.

>>>>> +                     atomic_dec(&csi->clk_refcnt);
>>>>> +                     return ret;
>>>>> +             }
>>>>> +     }
>>>>> +
>>>>> +     ret = csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
>>>>>
>>>>> -     return csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
>>>>> +     if ((ret < 0 || !enable) &&
>>>>> atomic_dec_and_test(&csi->clk_refcnt))
>>>>> +             pm_runtime_put_sync(csi->dev);
>>>> Runtime PM maintains its own refcount, why these
>>>> clk_refcnt/power_on_refcnt are needed?
>>> Streaming is per channel and we can't turn power/clocks off while other
>>> channels may still be running.
>>>
>> All channels use the same CSI device. You should remove the custom
>> refcounting.
>>
>> BTW, next time you'll really need to do refcounting, use the generic
>> kref.
> 
> Before channel stream we enable power/clocks and after streaming we stop.
> 
> So without refcount, on stream stop of any of the channel RPM put turns
> power/clock but other channels will still be streaming.
> 

Runtime PM uses its own refcounting. Please consult the RPM code and
documentation.

https://elixir.bootlin.com/linux/v5.7-rc3/source/include/linux/pm_runtime.h#L78
https://elixir.bootlin.com/linux/v5.7-rc3/source/drivers/base/power/runtime.c#L1079
