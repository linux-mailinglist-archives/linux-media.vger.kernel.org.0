Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 434662DDA0D
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 21:31:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731493AbgLQUaA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 15:30:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731562AbgLQU3k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 15:29:40 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F309C0617B0;
        Thu, 17 Dec 2020 12:29:00 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id o13so37812151lfr.3;
        Thu, 17 Dec 2020 12:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GKljy0FefLQb5prsvrnmqmrfVAtuVTCWN2SoJppsiGI=;
        b=VYw3hMep39JaWr4RwvGdOrkGOk9i1d6L30sa3pEZc7Jv57OKRk5xzJobClTKgPsGz4
         Ux2rqCf61N62ecUxjuf+FhwgZuq6/I5KHRjnZ7diKnsWDfTW/SukvhsBUZlxuHES2tBx
         KA6mi1x/TTsvr79mP2iIAy6rt5BtlZov6lwj0Q/GroxAz5jbgQjbT6zgJMSIwELBKf2g
         /n0gYoohxBFjsnmUc/HOVz4oKc+nh6akNPzNKQgP+4u5qyrHWzuQTI0sEJ5e7lGr1KM4
         Iv71/evpjH/o4eVLGPr6hFsFvEMIGycEsSNOAE3yZWz2nbBq0cBhHetzYDI877dr1BgC
         x8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GKljy0FefLQb5prsvrnmqmrfVAtuVTCWN2SoJppsiGI=;
        b=bK8dPBLTb8IUT9lE59gABev/dSI8K0ab6YMycEYDMtItFYXtyulsgW38kChZ0tM+yr
         dpUrB+atiAuncAV+FgSUUIacOupUShfMRMAkDtyQIOyqA6OGStnOeq+aBxi3pJrAVx9q
         2oGHDl5aQ0iFWW466oRcSDSwbJa8cAC20wBkws5OM+vJGHRTYLFgNZPKxGHNvsjPic3X
         VZglFVDmvfqoscAiCGMmKbR7C9GbroR1kFW5ZLBwgxvltXhHqsqivdZ4UqRjsmyXKgxn
         d7KSoCwAx7C+kgb1EaXnMCgymGtHLLL/bhALeEcBZ7stWlSPy9IG3Sw5bE0BiwtDvvHi
         TjUg==
X-Gm-Message-State: AOAM533dLwv83/AkseijTMyZjQDvZDvYlL8gBy2S47e2BmoYYjtDje/j
        bzYr2LuNxgbRDd7LKIXVZon2RPHAna0=
X-Google-Smtp-Source: ABdhPJyk0uEwMqjubAd1x7PylZGa1gcruRNAfNVBuufl026RTe1WSf8KkEES9wW9uq7xDnyQwzJAbA==
X-Received: by 2002:a05:651c:101:: with SMTP id a1mr421137ljb.277.1608236938516;
        Thu, 17 Dec 2020 12:28:58 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id z26sm781859ljn.98.2020.12.17.12.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 12:28:57 -0800 (PST)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ce603c74-3a20-7331-36a7-d7bc43ce36b6@gmail.com>
Date:   Thu, 17 Dec 2020 23:28:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <776e0e84-e395-2bfb-f1ee-c34864b1cf16@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

17.12.2020 22:36, Daniel Lezcano пишет:
>>>> +					type = "critical";
>>>> +				};
>>>> +			};
>>>> +
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&trip0>;
>>>> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>> You should add all CPUs here.
>>
>> All CPU cores are coupled on Tegra in regards to CPUFreq, hence I think
>> it won't make any difference if secondary CPU cores will be added here,
>> isn't it?
> The explanation is in the description of commit ef4734500407ce4d

I think that really only makes sense if CPU cores have independent clock
rate management. IIRC, I actually made some research about this in the
past and intentionally removed the secondary cores from the
cooling-device since they didn't make any difference for a coupled CPU
cores.

That commit also says:

"But as soon as this CPU ordering changes and any other CPU is used to
bring up the cooling device, we will start seeing failures."

I don't quite understand to what "failures" that commit referrers. I
tried to change the cpu0 to cpu1 in the cooling-device and don't see any
failures. Could you please clarify this?

In general it should be fine to add all the cores to the cooling-device
and I'll do it in v3, but I want to make it clear why this is needed.
