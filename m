Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43C2B2E26C0
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 13:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbgLXMO4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Dec 2020 07:14:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgLXMOz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Dec 2020 07:14:55 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0124C061794;
        Thu, 24 Dec 2020 04:14:14 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id o19so4418233lfo.1;
        Thu, 24 Dec 2020 04:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8PDZgsN8e1S8iAJgIQWFmcr5fqcA+olCtue62G+IMw8=;
        b=TzwQmYoGBJneEduxVkHeih8tyjwayvE8Paw1EAbvJPYfRWwf5wl7gJpHoffaWPAqzA
         gkxltgA/7vOHWv9svpEcEc3IG2HxGpkghaYBf2XIMzsinMqbBtujP+Jw2pjyCRGMKs06
         ZiLF3z/136SRi41HS5B8JsCPEaANBUpc/yqLFNv+8dNU7lSqEnUdID+8+NdFN1+Au+iQ
         ZPbnoxblSmR/SdnhZOU7IzD7+ZrjASKOXESjqeA+j6UYLymmX8rArmcX3yOGAJeNGJT9
         Fp0+pe5erEjpIwmBUZmB2TzoQw+geHtOf8EFHq7qDATHcIOYEmmHR/WG0FDtfzNC1TqU
         27lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8PDZgsN8e1S8iAJgIQWFmcr5fqcA+olCtue62G+IMw8=;
        b=TvHDzHumZOCIQup7ZrkqoOlJruW0tvq60Jhp0AOfoSF/2f4wpqZil87A1dmsFd8O/l
         G2TqxiAWUDEcGyk3Mo1RfWNearQyKstkAM4KToUzoXZmMJRfh1EOhFUFUy608ND/BSo8
         j+BSmXZWZ9Bj2Ioa5vCjjEEWif4Y5Hh+OIboJuqrihja7HLzmqSaWptZclk4b9p1RM/R
         nPMSnZB9nN9u6Ux8L5DTEX5TrWJU55gAGPfUt41xZPefCHW7b+FKpv2RBuK5HXa3DAjV
         lQn1BFhzLEmvvBa2bW7ROPq7keCOYmwZEyzfhDzcP0s29BLv3a6wBDYh7bEOgUg1Rv23
         ihmA==
X-Gm-Message-State: AOAM5337s15etv//bR3k6atcOvfzfaWDc8m9PMZCUpVclwSzyJVxZH70
        1yUPZw/82NWvbMWUyvxrzfjaDCvI8Xw=
X-Google-Smtp-Source: ABdhPJy0FtRlrX1oY3an/KZ/D2LqStJoY/x45Ai7s8zxNVRWUuDeJ92oqKSWsgI+TI+TTfP1kTILOg==
X-Received: by 2002:a19:4c06:: with SMTP id z6mr13550389lfa.284.1608812053002;
        Thu, 24 Dec 2020 04:14:13 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id k20sm3898808ljc.61.2020.12.24.04.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Dec 2020 04:14:12 -0800 (PST)
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
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
 <20201217180638.22748-29-digetx@gmail.com>
 <20201222064029.duuzcsj53rt7xzvt@vireshk-i7>
 <c130f78d-3d97-9b26-be77-951fee0d8680@gmail.com>
 <3a5c00e5-2cdd-35ce-2714-d4ffbf9d516a@gmail.com>
 <20201223055715.2n5eba7fohrwpgr5@vireshk-i7>
 <239642ad-d7e9-364e-80d3-1da67625e247@gmail.com>
 <20201224065142.7rhfx37wgg3ejjqm@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a1e3c706-9a8a-00b2-6ccb-08b95ee0b45b@gmail.com>
Date:   Thu, 24 Dec 2020 15:14:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201224065142.7rhfx37wgg3ejjqm@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.12.2020 09:51, Viresh Kumar пишет:
> On 23-12-20, 23:37, Dmitry Osipenko wrote:
>> 23.12.2020 08:57, Viresh Kumar пишет:
>>> What's wrong with getting the regulator in the driver as well ? Apart from the
>>> OPP core ?
>>
>> The voltage syncing should be done for each consumer regulator
>> individually [1].
>>
>> Secondly, regulator core doesn't work well today if the same regulator
>> is requested more than one time for the same device.
> 
> Hmm...
> 
>>>> will return the OPP table regulator in order to allow driver to use the
>>>> regulator directly. But I'm not sure whether this is a much better
>>>> option than the opp_sync_regulators() and opp_set_voltage() APIs.
>>>
>>> set_voltage() is still fine as there is some data that the OPP core has, but
>>> sync_regulator() has nothing to do with OPP core.
>>>
>>> And this may lead to more wrapper helpers in the OPP core, which I am afraid of.
>>> And so even if it is not the best, I would like the OPP core to provide the data
>>> and not get into this. Ofcourse there is an exception to this, opp_set_rate.
>>>
>>
>> The regulator_sync_voltage() should be invoked only if voltage was
>> changed previously [1].
>>
>> The OPP core already has the info about whether voltage was changed and
>> it provides the necessary locking for both set_voltage() and
>> sync_regulator(). Perhaps I'll need to duplicate that functionality in
>> the PD driver, instead of making it all generic and re-usable by other
>> drivers.
>>
>> [1]
>> https://elixir.bootlin.com/linux/v5.10.2/source/drivers/regulator/core.c#L4107
> 
> Lets do it in the OPP core and see where we go.
> 

Alright, thank you.
