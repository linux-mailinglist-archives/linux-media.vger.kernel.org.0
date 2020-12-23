Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4AF2E2191
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 21:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgLWUiG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 15:38:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgLWUiF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 15:38:05 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14200C061794;
        Wed, 23 Dec 2020 12:37:25 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 23so245997lfg.10;
        Wed, 23 Dec 2020 12:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wCsb7WW/M2bzd7/pDZtZYPCJvx1YT3sUxGJbbavSmFg=;
        b=ZvZCwqyFAc/Ql/wxh66l/3Pl+CYJdEHVkuisgepgy43WMHQBLq7lqEbSWNFjyq1ZV7
         /Q8eZ//xtNKvGYwTVFKhvCqR6IX4wUEOjUuLVxma61Kdhn6mm7nF89yQA1nn43DX/U/x
         wbXLmPyX4MgPZeHb5ZJ7iOTMePG7hqFxLKBIKHiuOfdyP7qQ3p1EqWbGETRRjCRn0AaJ
         qWkN1PAfvH67YturxexyosOWCqX3ti4sO/mvJRpXPRBV1xoRkXoL/5f6CADo5wxPBb6/
         gqxFM+QiZr7IeIQBHgXM66Oq+WzF9SNBaYYUtdUGbU+Ga1VkUuk5Qfwq4SfZ5OQ40AT8
         Ep3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wCsb7WW/M2bzd7/pDZtZYPCJvx1YT3sUxGJbbavSmFg=;
        b=KbrI4dVGRgmTcSdVpVL/4/gJBaBodijZhP24kGZuC3y9oetYI6xwz1K3J0nmDjAp7G
         EMExuZdYy0MCk4+v6lFkJkbcLy2NxyqoVyV6UG+rsLSdhzErRzNmYAhJuygC8O/VPFNn
         0zYFViJfOkZ7gFqYw9RGfvqFwXBsIAOhLnrgYZqDDp3VV30gFzddRZSRWBKXKQv3Jm26
         hYdogSKT8l7V5G+b9koHq/WboIy4PIuvq5i7srHQVa52PtEPO6FzqQfIp6Hh1L6t+6Mx
         XD+4tFJUn8lIuYISu/SvzqXhoVSK7SqLT6yRPimaH0RNdWCj9NC4u7yWKdkHRZCqji0U
         wPxg==
X-Gm-Message-State: AOAM533rUkNeQifKIY+81gpzlQKD1CnJKtE2OKwvHqkcpyegC1c8KDHT
        369J0PKsbZKFjm9OV7CrExIZybGT95U=
X-Google-Smtp-Source: ABdhPJxGiooPS8lo4Avau8/JweSYhcD8EGyLO2HFPmvlGDoqO2i9U3oI4uzk966QuJ/9xSInUThU1g==
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr10919526lfq.232.1608755843340;
        Wed, 23 Dec 2020 12:37:23 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id u8sm3649057ljj.1.2020.12.23.12.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Dec 2020 12:37:22 -0800 (PST)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <239642ad-d7e9-364e-80d3-1da67625e247@gmail.com>
Date:   Wed, 23 Dec 2020 23:37:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201223055715.2n5eba7fohrwpgr5@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

23.12.2020 08:57, Viresh Kumar пишет:
> On 22-12-20, 22:39, Dmitry Osipenko wrote:
>> 22.12.2020 22:21, Dmitry Osipenko пишет:
>>>>> +	if (IS_ERR(opp)) {
>>>>> +		dev_err(&genpd->dev, "failed to find OPP for level %u: %pe\n",
>>>>> +			level, opp);
>>>>> +		return PTR_ERR(opp);
>>>>> +	}
>>>>> +
>>>>> +	err = dev_pm_opp_set_voltage(&genpd->dev, opp);
>>>> IIUC, you implemented this callback because you want to use the voltage triplet
>>>> present in the OPP table ?
>>>>
>>>> And so you are setting the regulator ("power") later in this patch ?
>>> yes
>>>
>>>> I am not in favor of implementing this routine, as it just adds a wrapper above
>>>> the regulator API. What you should be doing rather is get the regulator by
>>>> yourself here (instead of depending on the OPP core). And then you can do
>>>> dev_pm_opp_get_voltage() here and set the voltage yourself. You may want to
>>>> implement a version supporting triplet here though for the same.
>>>>
>>>> And you won't require the sync version of the API as well then.
>>>>
>>> That's what I initially did for this driver. I don't mind to revert back
>>> to the initial variant in v3, it appeared to me that it will be nicer
>>> and cleaner to have OPP API managing everything here.
>>
>> I forgot one important detail (why the initial variant wasn't good)..
>> OPP entries that have unsupportable voltages should be filtered out and
>> OPP core performs the filtering only if regulator is assigned to the OPP
>> table.
>>
>> If regulator is assigned to the OPP table, then we need to use OPP API
>> for driving the regulator, hence that's why I added
>> dev_pm_opp_sync_regulators() and dev_pm_opp_set_voltage().
>>
>> Perhaps it should be possible to add dev_pm_opp_get_regulator() that
> 
> What's wrong with getting the regulator in the driver as well ? Apart from the
> OPP core ?

The voltage syncing should be done for each consumer regulator
individually [1].

Secondly, regulator core doesn't work well today if the same regulator
is requested more than one time for the same device.

>> will return the OPP table regulator in order to allow driver to use the
>> regulator directly. But I'm not sure whether this is a much better
>> option than the opp_sync_regulators() and opp_set_voltage() APIs.
> 
> set_voltage() is still fine as there is some data that the OPP core has, but
> sync_regulator() has nothing to do with OPP core.
> 
> And this may lead to more wrapper helpers in the OPP core, which I am afraid of.
> And so even if it is not the best, I would like the OPP core to provide the data
> and not get into this. Ofcourse there is an exception to this, opp_set_rate.
> 

The regulator_sync_voltage() should be invoked only if voltage was
changed previously [1].

The OPP core already has the info about whether voltage was changed and
it provides the necessary locking for both set_voltage() and
sync_regulator(). Perhaps I'll need to duplicate that functionality in
the PD driver, instead of making it all generic and re-usable by other
drivers.

[1]
https://elixir.bootlin.com/linux/v5.10.2/source/drivers/regulator/core.c#L4107
