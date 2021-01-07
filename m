Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025AC2EE647
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 20:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbhAGTjx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 14:39:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbhAGTjw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 14:39:52 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B20FC0612F5;
        Thu,  7 Jan 2021 11:39:12 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id a12so17349519lfl.6;
        Thu, 07 Jan 2021 11:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ffFy7U5GHTO2EDTarXBfsvng3yi/U0HlVmDD4XbAyvk=;
        b=Wyed8+zva/LYFJ10gJQ7x+ViNyXTsElCtmMUOpgTb/1YDegkPcwMsRWfb6bnPT+iKb
         yyIaGP48HD/upBYUEQjlmhnaGmrTDy9me1CdAxCQI1Rt9cCh1vfk83W55UpQWTrfx4fq
         on3q+XX+gRqs1lF4J6Dzk0wEr9tXNiH+ySbd07plWndwWUiv4F0ykGda/gBwJEg5vYOK
         ATsgATXXNyU6xMDyYcnyAnQ213ZoX/ZXl6yf3ac43tSt0qdPngmmF29bG1+eUDSwgUw1
         AzFECZcWDk9At66ZrGB8CFVrd2+qabP6np+CVOMLQJhpLToWrA6wWVQzNGJpmAyDhR53
         AsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ffFy7U5GHTO2EDTarXBfsvng3yi/U0HlVmDD4XbAyvk=;
        b=nnkPIL+qmU7Pn9VV85Gqtyn9aDzojv5jm4mgl6ANhcy2fERHVf6LQo8NHnwL1lfCbD
         dMs8CrczlWd7oi5j8NB4zKMhVUdIIKzOVtfQ0ETx7WItg++NOOQAwDosj4qkKziOaRkv
         wpNWmJ0ObPp4xf3BNE/m1+vcxZQpIZho0kERmhuzSQSuue50e0Y4jq1AoikyqDD48JfM
         Krb/Sl5qB9gIeHDV3iAOFWkt7tt7Pq/n1148mz6J3N6jpmbuigGv6QsVB9b/HsBBQIvU
         kPJLRwi9T59wJL0ZJAOUaXfbEh+wGJruL16ePbzxcUnV7IUJ1nhaXEAejgTKncLruCZx
         7SNg==
X-Gm-Message-State: AOAM532uG5IfBPQJvyjteKNSU+30/4nF46zgIxRQMZs5dkQconHHP2PZ
        o3fbMMZj3rWyOZMNuGcDwFDn91MM8Og=
X-Google-Smtp-Source: ABdhPJwcjsVwi672lMyB3VRDqyLku+RskEcHu3FcswkJW1KB+hkV/1FIv9p7umOsoz2IRKSWh6yzhA==
X-Received: by 2002:a19:230d:: with SMTP id j13mr148331lfj.378.1610048350619;
        Thu, 07 Jan 2021 11:39:10 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id q21sm1369032lff.280.2021.01.07.11.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 11:39:09 -0800 (PST)
Subject: Re: [PATCH v2 00/48] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
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
 <20210105171111.GC26301@kozik-lap>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <988cf951-ff81-4b48-6baf-b393bd1613d2@gmail.com>
Date:   Thu, 7 Jan 2021 22:39:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210105171111.GC26301@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

05.01.2021 20:11, Krzysztof Kozlowski пишет:
> On Thu, Dec 17, 2020 at 09:05:50PM +0300, Dmitry Osipenko wrote:
>> Introduce core voltage scaling for NVIDIA Tegra20/30 SoCs, which reduces
>> power consumption and heating of the Tegra chips. Tegra SoC has multiple
>> hardware units which belong to a core power domain of the SoC and share
>> the core voltage. The voltage must be selected in accordance to a minimum
>> requirement of every core hardware unit.
>>
>> The minimum core voltage requirement depends on:
>>
>>   1. Clock enable state of a hardware unit.
>>   2. Clock frequency.
>>   3. Unit's internal idling/active state.
>>
>> This series is tested on Acer A500 (T20), AC100 (T20), Nexus 7 (T30),
>> Ouya (T30), TK1 (T124) and some others. I also added voltage scaling to
>> the Ventana (T20) and Cardhu (T30) boards which are tested by NVIDIA's CI
>> farm. Tegra30 is now couple degrees cooler on Nexus 7 and stays cool on
>> Ouya (instead of becoming burning hot) while system is idling. It should
>> be possible to improve this further by implementing a more advanced power
>> management features for the kernel drivers.
>>
>> The DVFS support is opt-in for all boards, meaning that older DTBs will
>> continue to work like they did it before this series. It should be possible
>> to easily add the core voltage scaling support for Tegra114+ SoCs based on
>> this grounding work later on, if anyone will want to implement it.
> 
> The same comment as for your interconnect work: for sets touching
> multiple systems please mention the dependencies between patches in the
> cover letter. Not as a reply to such remark like I make here, but as a
> separate entry in the cover letter.

I'll describe all the dependencies in the next revision, thanks.
