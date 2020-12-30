Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97232E79DF
	for <lists+linux-media@lfdr.de>; Wed, 30 Dec 2020 15:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgL3OC5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Dec 2020 09:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726547AbgL3OC5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 09:02:57 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBFC9C061799;
        Wed, 30 Dec 2020 06:02:16 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id l11so37890711lfg.0;
        Wed, 30 Dec 2020 06:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kgbDtfqk5fP8ba7WjhXh9EaZlWvPtHxJW5owvXGnu28=;
        b=UhvgoE4yfbHePS8AaVrQlFt/hwDbTrDKwDFCbRhhHEgAe1Hv4O3OeOiKmqtsQSuVUt
         2EzhCLUkVX94507wJTEO5Xcx1y+/WKL+HxJw3rG+NdjkqHYpTIHmHfAD6BDhG9cTHfw/
         vI46uHG3aMxT/34J9JakJmRQGq2WI51algXfdeGu//jRDCGJYh6bFnl478JzLePw7j/B
         PkiZp4Mvwg7KwrUqwWlkYglwRdXL9EVQm3e922wabLwzAcaGgWzj9L4tsiCFYznbDjk8
         mPEUkLquIXzerq6FYZOehyvFtuTnWM/jmFGV4sZIvKmT7wLr8MTGy18L+eHVf9I8UdGN
         c/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kgbDtfqk5fP8ba7WjhXh9EaZlWvPtHxJW5owvXGnu28=;
        b=e3qBoxKZGn4JF5yYU33YgPN84os2XX+j1PKDG21xo7us6kPXXpejhry/nLOZTSI75B
         u1B40/Igafrj+4VEjROKtx9/AMheU+oLzIHfZmqlUJ8q4VNPAIdAAtlHD4OTduaf5B3g
         20BH0acXxhApEMHgYjsrTHjMcvlRJigP+K650awY3vlLq7/mszFl4r7OATXDDc9FDD40
         Akz+3eKdf98Z6yonlLNrGRddFvNnR/bDWXxg8+BgoZZWAu2FORbDRS3uMoMV7OkjoN6L
         6yU7WSJ+7HKtcm+8S72ZIvA7dJ5I5Ajg5AoFXtiKG883l+W/W9m7ifm01+kxH/fJCRFq
         cUSA==
X-Gm-Message-State: AOAM531i+ycErGYsEpaoivzpCIC4vGjRKALo/QB9MEkVgPYQyrC/v8qX
        FpHsQgSN2KjMnixgDB/Aip0tUUQ5HhY=
X-Google-Smtp-Source: ABdhPJw9wWSFuQc16RX9NiqQUb8w4TZ5fG/vmflab4lL/iZ0G+l9QXIErYZJBZgqcLvosb2HGM3QiA==
X-Received: by 2002:a2e:8910:: with SMTP id d16mr25849728lji.357.1609336933615;
        Wed, 30 Dec 2020 06:02:13 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id o12sm5965987lfb.49.2020.12.30.06.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Dec 2020 06:02:12 -0800 (PST)
Subject: Re: [PATCH v2 11/48] opp: Add dev_pm_opp_find_level_ceil()
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-12-digetx@gmail.com>
 <20201222064253.x7vsurh7q5k7qzb5@vireshk-i7>
 <fd7b9f42-d0a7-45eb-2a17-d46779011c58@gmail.com>
 <20201223041931.klnppy4fu3sdgtsz@vireshk-i7>
 <f00e0c74-8d9a-d3d3-81bb-3ac25a74175d@gmail.com>
 <20201224064339.zngidobhstnlu2a3@vireshk-i7>
 <780db190-d93d-3bca-4819-790010f82c62@gmail.com>
 <20201228062254.ui727ka2ftijov4m@vireshk-i7>
 <c4a6336f-e7e6-b23e-4d60-a41d8e09aef3@gmail.com>
 <20201230044637.jjyw5gwe73ovslbd@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7f2385d1-603d-28ab-34e8-3623635045f6@gmail.com>
Date:   Wed, 30 Dec 2020 17:02:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201230044637.jjyw5gwe73ovslbd@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

30.12.2020 07:46, Viresh Kumar пишет:
> On 28-12-20, 17:03, Dmitry Osipenko wrote:
>> 28.12.2020 09:22, Viresh Kumar пишет:
>>> On 24-12-20, 16:00, Dmitry Osipenko wrote:
>>>> In a device driver I want to set PD to the lowest performance state by
>>>> removing the performance vote when dev_pm_opp_set_rate(dev, 0) is
>>>> invoked by the driver.
>>>>
>>>> The OPP core already does this, but if OPP levels don't start from 0 in
>>>> a device-tree for PD, then it currently doesn't work since there is a
>>>> need to get a rounded-up performance state because
>>>> dev_pm_opp_set_voltage() takes OPP entry for the argument (patches 9 and
>>>> 28).
>>>>
>>>> The PD powering off and performance-changes are separate from each other
>>>> in the GENPD core. The GENPD core automatically turns off domain when
>>>> all devices within the domain are suspended by system-suspend or RPM.
>>>>
>>>> The performance state of a power domain is controlled solely by a device
>>>> driver. GENPD core only aggregates the performance requests, it doesn't
>>>> change the performance state of a domain by itself when device is
>>>> suspended or resumed, IIUC this is intentional. And I want to put domain
>>>> into lowest performance state when device is suspended.
>>>
>>> Right, so if you really want to just drop the performance vote, then with a
>>> value of 0 for the performance state the call will reach to your genpd's
>>> callback ->set_performance_state(). Just as dev_pm_opp_set_rate() accepts the
>>> frequency to be 0, I would expect dev_pm_opp_set_rate() to accept opp argument
>>> as NULL and in that case set voltage to 0 and do regulator_disable() as well.
>>> Won't that work better than going for the lowest voltage ?
>>>
>>
>> We can make dev_pm_opp_set_voltage() to accept OPP=NULL in order to
>> disable the regulator, like it's done for dev_pm_opp_set_rate(dev, 0).
>> Although, I don't need this kind of behaviour for the Tegra PD driver,
>> and thus, would prefer to leave this for somebody else to implement in
>> the future, once it will be really needed.
>>
>> Still we need the dev_pm_opp_find_level_ceil() because level=0 means
>> that we want to set PD to the lowest (minimal) performance state, i.e.
>> it doesn't necessarily mean that we want to set the voltage to 0 and
>> disable the PD entirely. GENPD has a separate controls for on/off.
> 
> Ok.
> 

I'll separate the OPP patches from this series and will prepare v3,
thank you for the review!
