Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A922E219B
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 21:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbgLWUic (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 15:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727147AbgLWUib (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 15:38:31 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A011BC06179C;
        Wed, 23 Dec 2020 12:37:50 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id h205so308521lfd.5;
        Wed, 23 Dec 2020 12:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3ureyQ26WVdvpPiApVvGnYNle5Fa1VHsYVcg9Aec3Z4=;
        b=JB7ZNM87FEjcnjJQONVUuTF17BvJ9V9ZS3hebD+x6uzZg2DGPHE7Lj1X+o+J9ISuus
         85ihjaar8Lr4oCD3QODU4FGkYnl2eCgmVKKIopMmCAmQ/KoYdSiq45M2PLliJt5mggct
         kbQvz4I/RnBpUtpDfvzstCJx9yCv5A+xF1dc3waB/YCRipctvTjPnf7xPX8lKAn0lIyg
         /ebkOqGUMAUeBqGUgJZBD1K+4lyYODAmeakH/EFLCs6V/OvqtWh98BegqF1PG/j41Vcv
         CBmasECEhUJ0viZjm5sowMCRQ1vgelVHsqCnS+LtFcP0F8Jn0Z7f5agO/J+nwc1xMDWE
         EGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3ureyQ26WVdvpPiApVvGnYNle5Fa1VHsYVcg9Aec3Z4=;
        b=YvyV4MLqen4yPJvttMSNZ4CIILgbGNPwi0aiQutrAYh/CKp6sbmbtfMhFFi5MhF8iH
         0FQkeX1y50vFgObCDUO5a/5oVhr+n3fHP/Hl+qxp09rvlrKc2H1b2GJ+8c8mKjb62w+S
         b5tJaE3HKv+pzmCsNvlWG3sPmT9vaBJK82Qtx8w8GBjW32wwODy3m7cFdWEe03lVa4un
         J4W20f/3A2FlXkzALH8r9Q0vtyRVVB4F0Sh1OgeJegvUdrZZ85FKyBVtfXcgJnpW+rQp
         c+2DCnjt99Ow2TTIn0Vn0KWemE9oOILlv2gHk2R+Cvk+mub45fRDdrvCdA3dGW+zrRiO
         X9uw==
X-Gm-Message-State: AOAM532nEetbGsagc0aUs1zi9nZuWbfrCx0NoDmnvKUyzZcaSjMRqnsw
        nmI6l83OXEz1dwW9C7cywZeC0NYKvCY=
X-Google-Smtp-Source: ABdhPJxs2A1nOlz1juXuG3l0yvblA/Eo3IZZbB6Wrfw9MxG4tEEGohUi/FH/Bgb4gz3Fw9m3GGijnw==
X-Received: by 2002:a2e:9f01:: with SMTP id u1mr12029965ljk.386.1608755869072;
        Wed, 23 Dec 2020 12:37:49 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id z14sm3349336lfd.283.2020.12.23.12.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Dec 2020 12:37:48 -0800 (PST)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f00e0c74-8d9a-d3d3-81bb-3ac25a74175d@gmail.com>
Date:   Wed, 23 Dec 2020 23:37:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201223041931.klnppy4fu3sdgtsz@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

23.12.2020 07:19, Viresh Kumar пишет:
> On 22-12-20, 22:15, Dmitry Osipenko wrote:
>> 22.12.2020 09:42, Viresh Kumar пишет:
>>> On 17-12-20, 21:06, Dmitry Osipenko wrote:
>>>> Add a ceil version of the dev_pm_opp_find_level(). It's handy to have if
>>>> levels don't start from 0 in OPP table and zero usually means a minimal
>>>> level.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>
>>> Why doesn't the exact version work for you here ?
>>>
>>
>> The exact version won't find OPP for level=0 if levels don't start with
>> 0, where 0 means that minimal level is desired.
> 
> Right, but why do you need to send 0 for your platform ?
> 

To put power domain into the lowest performance state when device is idling.

https://elixir.bootlin.com/linux/v5.10-rc2/source/drivers/opp/core.c#L897

https://elixir.bootlin.com/linux/v5.10-rc2/source/drivers/opp/core.c#L785

Also please see patch 32, tegra_clock_runtime_suspend().
