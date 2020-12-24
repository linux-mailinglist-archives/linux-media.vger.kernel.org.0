Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A972E270D
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 14:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbgLXNBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Dec 2020 08:01:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727372AbgLXNBd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Dec 2020 08:01:33 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F462C061794;
        Thu, 24 Dec 2020 05:00:53 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id m25so4539040lfc.11;
        Thu, 24 Dec 2020 05:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PPrH0JQSkYTBUDfxgE5s9c2FpdNYSs+ZfAVKTdSJpOU=;
        b=h35B/CGskQN9x2gajXsHnapJAn/oOdmJUPQzEUHvzlPUdoaVdWOHSvn0gRhd+h4Ola
         kRThB7EwzP4zCJ6I/cDBaa2jz7i8GwFBJ3G3UgCUXtUfsT2g52TetI+SjB06v4QccX98
         yOgW4XRztBS1Rb1sUB+HjV5efgFf1R3v/2FDKAIhyUg38TSfby9FdbMS/BOhsmpV8q93
         2PXIilSxhr+6+5vRNFV8pb+G4eE9EQA1e1YzsE81H7g6mvgl8zL3naGYGYHQKfwNKpkP
         FkcD6cP+0rX2PGwAlkOUF9fsFJlC40+sqMoNc+qDnwDTa8+wBi9oi10CEnKiniae650p
         1/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PPrH0JQSkYTBUDfxgE5s9c2FpdNYSs+ZfAVKTdSJpOU=;
        b=Dru+WFqKfQoeVwsu6JWjGquf9Rpvnsi2Klbb9fDUBucX6JCekDXcdk32mzMnhFQu53
         ft/V8BgvMeO+s3osfZQleS8SpMtKI4SVszorEV6sSJZTu09fvmQR0Ase+G5SA/5iBq0o
         iq6zsP92ubCVxBIUUx6zTDCZdVd4pBADD6+DOEnNukRojyTHMWjqM/xHRyev1iVhv/XZ
         VVdgXNjnRB3mTT4ERua/lIs6E3xtOw2FB3bLFKK9/VNdrxE2m5C1//2GF/d2JphJdIOn
         +jarpqcbHRpTQLeHd5IBxQSMtXPM4ngPwm1xNbIpDyXfhQOpbKvb0q4cAZKEhel5QqGQ
         1CSw==
X-Gm-Message-State: AOAM530uw+ZyjIg1kVdGjUIbVzXeNbmQvJVPslp2NWcskK1MnyzyEtFI
        cBvXx0QKgeMUF2wFBZmSVQw2m0cIh+w=
X-Google-Smtp-Source: ABdhPJy4dUISU54G6I/fcsUIBl9m9poD0jxB1pYpBLDFT4iw28ge43cAa/UiLwCH2jmZTgAPqvlFag==
X-Received: by 2002:a05:6512:52c:: with SMTP id o12mr12294057lfc.559.1608814851636;
        Thu, 24 Dec 2020 05:00:51 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id b4sm3594686lfa.261.2020.12.24.05.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Dec 2020 05:00:50 -0800 (PST)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <780db190-d93d-3bca-4819-790010f82c62@gmail.com>
Date:   Thu, 24 Dec 2020 16:00:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201224064339.zngidobhstnlu2a3@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.12.2020 09:43, Viresh Kumar пишет:
> On 23-12-20, 23:37, Dmitry Osipenko wrote:
>> 23.12.2020 07:19, Viresh Kumar пишет:
>>> On 22-12-20, 22:15, Dmitry Osipenko wrote:
>>>> 22.12.2020 09:42, Viresh Kumar пишет:
>>>>> On 17-12-20, 21:06, Dmitry Osipenko wrote:
>>>>>> Add a ceil version of the dev_pm_opp_find_level(). It's handy to have if
>>>>>> levels don't start from 0 in OPP table and zero usually means a minimal
>>>>>> level.
>>>>>>
>>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>
>>>>> Why doesn't the exact version work for you here ?
>>>>>
>>>>
>>>> The exact version won't find OPP for level=0 if levels don't start with
>>>> 0, where 0 means that minimal level is desired.
>>>
>>> Right, but why do you need to send 0 for your platform ?
>>>
>>
>> To put power domain into the lowest performance state when device is idling.
> 
> I see. So you really want to set it to the lowest state or just take the vote
> out ? Which may end up powering off the domain in the worst case ?
> 

In a device driver I want to set PD to the lowest performance state by
removing the performance vote when dev_pm_opp_set_rate(dev, 0) is
invoked by the driver.

The OPP core already does this, but if OPP levels don't start from 0 in
a device-tree for PD, then it currently doesn't work since there is a
need to get a rounded-up performance state because
dev_pm_opp_set_voltage() takes OPP entry for the argument (patches 9 and
28).

The PD powering off and performance-changes are separate from each other
in the GENPD core. The GENPD core automatically turns off domain when
all devices within the domain are suspended by system-suspend or RPM.

The performance state of a power domain is controlled solely by a device
driver. GENPD core only aggregates the performance requests, it doesn't
change the performance state of a domain by itself when device is
suspended or resumed, IIUC this is intentional. And I want to put domain
into lowest performance state when device is suspended.
