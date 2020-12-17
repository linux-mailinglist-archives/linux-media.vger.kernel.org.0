Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C93822DDB17
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 22:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731952AbgLQV46 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 16:56:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730937AbgLQV46 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 16:56:58 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC4CC061794;
        Thu, 17 Dec 2020 13:56:17 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id m12so240572lfo.7;
        Thu, 17 Dec 2020 13:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8nG3HAuO5heZzY5IBy8swXxo8V6gUQeM6w2EgX9BXJQ=;
        b=FH7Y4beKxDLn6FrH0io7GO1GcAX5VRh7n2CsH8PTCS52NL/g+LWWVpwhVjPSfruoOQ
         5feO5PmWTZEIKT8KD+uKJxOnCkSmh/oK7rEs6ZU0dpNnmuC+BYgE1edLQspvzqdHce85
         K46dHCsJiwm5jh912Pg12y96Pj9yNyGP/H9uN5s88X7sMd4pMZiioWuUhbS6PAZWq0CC
         flNZnZ8VdVz2LdVZCJj+vLBruo51dfg4tatvoTN4szFr2B2N6KhTg+RWoa6eOEazu6B5
         eLM/se9HsQwagAK1A4dLMLdX6sawyfkSf//yE+th40OP1Wy9rW614MGIGKyPp2zy/ux1
         gM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8nG3HAuO5heZzY5IBy8swXxo8V6gUQeM6w2EgX9BXJQ=;
        b=AknJh3UWgmCQ0yjvPuIqLT7gVoI+3owo4rMrEDlxmV5LXiu4vSpVR/RS7s1FImo0Vt
         691k0uItCsEN41m6cqvMHqP3Ab6Zmp6Vf/lLEADaUWEMcyzu3d69TAu6uWPOB7H5Rybg
         xiFcKkmjSsQusUiR31RVEgjkElpp2ZStQ2zYXvrGuDSLDaAL7bDutDTcpStUXKYrc+fH
         UnATuu2flpsA1kO2Ytqp4MKD6Nvupq4PMuchhgpHU9777uvkUASlXHNhwlIAiY+pxx94
         ugL3dTvqagKsb5o1oHpgtwDPGxNwbsmhwqU6mi3/hPYt+++mtWy7ieYpghkEyXmRGAHs
         hT5g==
X-Gm-Message-State: AOAM530xawG/E8qbps0wGAQfgokPNigP0wjKCRx3YFak761qDkwdZbdA
        AB3MU1EEnItKbCnQmJDM9h4IuhfOHUQ=
X-Google-Smtp-Source: ABdhPJwEQwkebdm0xE5Y65k65p4/uFmrBbkvGqy6QOWj0pr2b6l8lKWwgORn22Sw3y8I8JTXiGH9dQ==
X-Received: by 2002:a05:6512:358d:: with SMTP id m13mr300445lfr.435.1608242175976;
        Thu, 17 Dec 2020 13:56:15 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id 20sm708668lfd.237.2020.12.17.13.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 13:56:15 -0800 (PST)
Subject: Re: [PATCH v2 47/48] ARM: tegra: ventana: Support CPU voltage scaling
 and thermal throttling
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
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
 <6afaf91c-d0ce-265d-4b71-0ea8da19918b@linaro.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d6f5fb01-7fda-d08c-f909-b0f4ae731b74@gmail.com>
Date:   Fri, 18 Dec 2020 00:56:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <6afaf91c-d0ce-265d-4b71-0ea8da19918b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

18.12.2020 00:19, Daniel Lezcano пишет:
> On 17/12/2020 21:28, Dmitry Osipenko wrote:
>> 17.12.2020 22:36, Daniel Lezcano пишет:
>>>>>> +					type = "critical";
>>>>>> +				};
>>>>>> +			};
>>>>>> +
>>>>>> +			cooling-maps {
>>>>>> +				map0 {
>>>>>> +					trip = <&trip0>;
>>>>>> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>>>> You should add all CPUs here.
>>>>
>>>> All CPU cores are coupled on Tegra in regards to CPUFreq, hence I think
>>>> it won't make any difference if secondary CPU cores will be added here,
>>>> isn't it?
>>> The explanation is in the description of commit ef4734500407ce4d
>>
>> I think that really only makes sense if CPU cores have independent clock
>> rate management. 
> 
> ATM I did not see any ARM platform having a clock line per CPU but I may
> be wrong.
> 
>> IIRC, I actually made some research about this in the
>> past and intentionally removed the secondary cores from the
>> cooling-device since they didn't make any difference for a coupled CPU
>> cores.
>>
>> That commit also says:
>>
>> "But as soon as this CPU ordering changes and any other CPU is used to
>> bring up the cooling device, we will start seeing failures."
>>
>> I don't quite understand to what "failures" that commit referrers. I
>> tried to change the cpu0 to cpu1 in the cooling-device and don't see any
>> failures. Could you please clarify this?
>>
>> In general it should be fine to add all the cores to the cooling-device
>> and I'll do it in v3, but I want to make it clear why this is needed.
> 
> AFAIR, if CPU0 is unplugged the cooling device can not rebind to CPU1.
> And if CPU0 is plugged in again, the cooling device fails to initialize.
> 
> And, if the CPUs are mapped with the physical CPU0 to Linux numbering
> CPU1, the cooling device mapping will fail.

Alright, thank you.
