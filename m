Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFFC22E21D0
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 22:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729122AbgLWU7t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 15:59:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728898AbgLWU7s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 15:59:48 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE68C061794;
        Wed, 23 Dec 2020 12:59:08 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id m12so396405lfo.7;
        Wed, 23 Dec 2020 12:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Paa/2Zgj9P95KKc/EM4S7akG+ebzd49b55aHgCq35nI=;
        b=XibHKH3lzyJ51D/2fdl3IDTxBo+rRPAAso0PTw2bRoWelBOVEL12b7vwet0Ap9n5W/
         iHT5gL1JD+4QKml3ZP2aP0n3RBt0RN7ir97YoOWNTIZ2D2FPDYG0Bu1MtIl59JE7bwYj
         dwB82UnkgMsHeCO1nayJVc0DLP4LtQ0gf4Lomocpe3wkhJRzC22NNd1qM4yBYcMAR9je
         G94iZSSXqDfiIUFnvAGE74PDAnS0pUxSheRKscYATXlTPxodyK0omHX01vBF9Md28k9L
         vf+lyl2JX91DHr/gEYGq3R08Fe+EGuPHqDa9SLOJLqi0ncmOusUTwTDaN7y0qYK1D85b
         A5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Paa/2Zgj9P95KKc/EM4S7akG+ebzd49b55aHgCq35nI=;
        b=a8S5FN2lKI2VIxsnfAGL80nvLpi2n78yCpuGBvRWHHTVssJbnT9qAZZIK0kvb7UQZD
         jUDCqRUDpAIA1FqEyKzV5MHbmSHhklAxkrVkuoOSq6TaOLi2qiMip0DW3nq6Dg6wc4fv
         9G9XecSTiTsTnxORuAN+OwUlPcnTqUO33A6DODEk9oMuk1OzlYRAn9xsnhcIs0G1rQMx
         exLCQzkOtdAOTfTNfZx51O1cz6XaW+Qu6YKdwy7hXPbBgAF0yyjb06aqud7NijGlf8Vl
         oaSYSpFdsVriJnTXWjCU2eMPup26+NFNIQ//wG8Mim0sKNx5e6YAv5OGLI7FMSL/CGJl
         ukCQ==
X-Gm-Message-State: AOAM531x/+YU3MBLpimsjdn0k+J4l/SBRE9ZKBhX9lYS1vhB84SIrzxZ
        okezDqr/uADPEBOS1M4YQgdIPS0jrAI=
X-Google-Smtp-Source: ABdhPJwgEzvh9ANtO8Hu+EE0UE3MF2J6XaYsYVTo0A5GcIAKl9dNfg1svW44bV8UGc4vRAGfTLm3lQ==
X-Received: by 2002:a19:801:: with SMTP id 1mr11053288lfi.113.1608757146318;
        Wed, 23 Dec 2020 12:59:06 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id p24sm3346902lfo.53.2020.12.23.12.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Dec 2020 12:59:05 -0800 (PST)
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
From:   Dmitry Osipenko <digetx@gmail.com>
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
Message-ID: <2298c089-827c-40a5-3ebe-3a91f3918ad5@gmail.com>
Date:   Wed, 23 Dec 2020 23:59:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <239642ad-d7e9-364e-80d3-1da67625e247@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

23.12.2020 23:37, Dmitry Osipenko пишет:
> 23.12.2020 08:57, Viresh Kumar пишет:
>> On 22-12-20, 22:39, Dmitry Osipenko wrote:
>>> 22.12.2020 22:21, Dmitry Osipenko пишет:
>>>>>> +	if (IS_ERR(opp)) {
>>>>>> +		dev_err(&genpd->dev, "failed to find OPP for level %u: %pe\n",
>>>>>> +			level, opp);
>>>>>> +		return PTR_ERR(opp);
>>>>>> +	}
>>>>>> +
>>>>>> +	err = dev_pm_opp_set_voltage(&genpd->dev, opp);
>>>>> IIUC, you implemented this callback because you want to use the voltage triplet
>>>>> present in the OPP table ?
>>>>>
>>>>> And so you are setting the regulator ("power") later in this patch ?
>>>> yes
>>>>
>>>>> I am not in favor of implementing this routine, as it just adds a wrapper above
>>>>> the regulator API. What you should be doing rather is get the regulator by
>>>>> yourself here (instead of depending on the OPP core). And then you can do
>>>>> dev_pm_opp_get_voltage() here and set the voltage yourself. You may want to
>>>>> implement a version supporting triplet here though for the same.
>>>>>
>>>>> And you won't require the sync version of the API as well then.
>>>>>
>>>> That's what I initially did for this driver. I don't mind to revert back
>>>> to the initial variant in v3, it appeared to me that it will be nicer
>>>> and cleaner to have OPP API managing everything here.
>>>
>>> I forgot one important detail (why the initial variant wasn't good)..
>>> OPP entries that have unsupportable voltages should be filtered out and
>>> OPP core performs the filtering only if regulator is assigned to the OPP
>>> table.
>>>
>>> If regulator is assigned to the OPP table, then we need to use OPP API
>>> for driving the regulator, hence that's why I added
>>> dev_pm_opp_sync_regulators() and dev_pm_opp_set_voltage().
>>>
>>> Perhaps it should be possible to add dev_pm_opp_get_regulator() that
>>
>> What's wrong with getting the regulator in the driver as well ? Apart from the
>> OPP core ?
> 
> The voltage syncing should be done for each consumer regulator
> individually [1].
> 
> Secondly, regulator core doesn't work well today if the same regulator
> is requested more than one time for the same device.
> 
>>> will return the OPP table regulator in order to allow driver to use the
>>> regulator directly. But I'm not sure whether this is a much better
>>> option than the opp_sync_regulators() and opp_set_voltage() APIs.
>>
>> set_voltage() is still fine as there is some data that the OPP core has, but
>> sync_regulator() has nothing to do with OPP core.
>>
>> And this may lead to more wrapper helpers in the OPP core, which I am afraid of.
>> And so even if it is not the best, I would like the OPP core to provide the data
>> and not get into this. Ofcourse there is an exception to this, opp_set_rate.
>>
> 
> The regulator_sync_voltage() should be invoked only if voltage was
> changed previously [1].
> 
> The OPP core already has the info about whether voltage was changed and
> it provides the necessary locking for both set_voltage() and
> sync_regulator(). Perhaps I'll need to duplicate that functionality in
> the PD driver, instead of making it all generic and re-usable by other
> drivers.
> 
> [1]
> https://elixir.bootlin.com/linux/v5.10.2/source/drivers/regulator/core.c#L4107
> 

I just realized that the locking is missing in the v2 patches, something
to fix in the next revision :)

Still I'm in favor of extending the OPP API with the new common
functions. But if you have a strong opinion about that, then I'll try to
work around it in the PD driver in v3.
