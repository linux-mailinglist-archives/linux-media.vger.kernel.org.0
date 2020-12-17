Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D1F2DDABF
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 22:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbgLQVUe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 16:20:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728777AbgLQVUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 16:20:34 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0013C06138C
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 13:19:53 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id a12so27989353wrv.8
        for <linux-media@vger.kernel.org>; Thu, 17 Dec 2020 13:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XsBwmgyFbdlnXiRdAhxB0KnsdRP9EX0fo8+7p/onVeM=;
        b=NyRQdJQ0TIiT6H5yuKllL5V1o0PMFLt7UrTUtmH/FewUN6IbxVKuEto8NkC2CLuJq0
         EYevYM/zZ/UNBngzu6G93EgAGA43alT1OUSBO2eHb0uZO56DXAsCGLdnR/Vs9w6H3oT2
         A59Irsjd3PGIB1rGOaQCDkvqK1ZcPEBjVRf5ZR2e9VZIvLYMkpL9oA1nRXpC5CJj8hO/
         wedNTokq3HhmiyhkviQNxhYAeRfhaswc/0hj0/uPVKZMCjcbJ7W4dBGEOkcSrtExG12h
         3KIFmdEMMLGNW2R0kHOelk52IHkiN9yqwVHqN4ZyOzJa8k5A+avRgs9jLGBhjHltfj8E
         IEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XsBwmgyFbdlnXiRdAhxB0KnsdRP9EX0fo8+7p/onVeM=;
        b=dF2uvtS6UzgjrhmA7XziyFGbBCqJb4onqnnLiu3IxFmokFGX9+jn7nPQCnUPQgJDgz
         qRpS/O/Fyi49u/WRHSMKyqChFLyxH5K0Wd0BpMhSvSQYiXkms2yHgXD53n8ghpBUjFJ7
         Bu8gs0zCak4zhp6vmStDtreUiLsV0wQgzhXJf8g1dM4ci3IvyK2GmYICe4AVc9COAgP6
         P+iEdFW0HjlcLj1TrGbg5qC6NWydxIB/TceM59Ze4r/+10I/y1+POyviEwz1shOPHLvM
         mt0wjeH9M0f7Kt+JWVnjWtp/NmTrBxKObM6XhtQx70CDcZoMLXWJ2+4C/lZAu50cdLKk
         gYaQ==
X-Gm-Message-State: AOAM531AzZoiQX8tObvmjKi2ir0fULY5STqcw3oQE5+RU/6LXtUuIccn
        NF3oKq9Skdyko37LFbV/0XWzyQ==
X-Google-Smtp-Source: ABdhPJz9z6Hdbu62U7P0AH8ARVxVDI3D8QgrHz9wPCZhkt1X0+MQdkHm0xs8xAdE9USd0/9DVxv2OQ==
X-Received: by 2002:adf:f101:: with SMTP id r1mr806378wro.112.1608239992221;
        Thu, 17 Dec 2020 13:19:52 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:ccb6:ce78:2bcd:4ead? ([2a01:e34:ed2f:f020:ccb6:ce78:2bcd:4ead])
        by smtp.googlemail.com with ESMTPSA id m8sm9617258wmc.27.2020.12.17.13.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 13:19:51 -0800 (PST)
Subject: Re: [PATCH v2 47/48] ARM: tegra: ventana: Support CPU voltage scaling
 and thermal throttling
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
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
        Michael Turquette <mturquette@baylibre.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-48-digetx@gmail.com>
 <91139f8b-0b83-dd8a-ba53-8e7a499e6344@linaro.org>
 <b39ebfc1-42b3-1fa7-efe4-6ecbc8cfcb50@gmail.com>
 <776e0e84-e395-2bfb-f1ee-c34864b1cf16@linaro.org>
 <ce603c74-3a20-7331-36a7-d7bc43ce36b6@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <6afaf91c-d0ce-265d-4b71-0ea8da19918b@linaro.org>
Date:   Thu, 17 Dec 2020 22:19:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ce603c74-3a20-7331-36a7-d7bc43ce36b6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/12/2020 21:28, Dmitry Osipenko wrote:
> 17.12.2020 22:36, Daniel Lezcano пишет:
>>>>> +					type = "critical";
>>>>> +				};
>>>>> +			};
>>>>> +
>>>>> +			cooling-maps {
>>>>> +				map0 {
>>>>> +					trip = <&trip0>;
>>>>> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>>> You should add all CPUs here.
>>>
>>> All CPU cores are coupled on Tegra in regards to CPUFreq, hence I think
>>> it won't make any difference if secondary CPU cores will be added here,
>>> isn't it?
>> The explanation is in the description of commit ef4734500407ce4d
> 
> I think that really only makes sense if CPU cores have independent clock
> rate management. 

ATM I did not see any ARM platform having a clock line per CPU but I may
be wrong.

> IIRC, I actually made some research about this in the
> past and intentionally removed the secondary cores from the
> cooling-device since they didn't make any difference for a coupled CPU
> cores.
> 
> That commit also says:
> 
> "But as soon as this CPU ordering changes and any other CPU is used to
> bring up the cooling device, we will start seeing failures."
> 
> I don't quite understand to what "failures" that commit referrers. I
> tried to change the cpu0 to cpu1 in the cooling-device and don't see any
> failures. Could you please clarify this?
> 
> In general it should be fine to add all the cores to the cooling-device
> and I'll do it in v3, but I want to make it clear why this is needed.

AFAIR, if CPU0 is unplugged the cooling device can not rebind to CPU1.
And if CPU0 is plugged in again, the cooling device fails to initialize.

And, if the CPUs are mapped with the physical CPU0 to Linux numbering
CPU1, the cooling device mapping will fail.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
