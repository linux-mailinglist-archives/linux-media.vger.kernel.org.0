Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85FAE2E0EBC
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 20:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbgLVTRM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 14:17:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgLVTRL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 14:17:11 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C8ABC0613D6;
        Tue, 22 Dec 2020 11:16:31 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id y19so34373786lfa.13;
        Tue, 22 Dec 2020 11:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EYz840XL2+BeI0xjEE06TBEE7fdn2tJLjp3OBT5/ex8=;
        b=WO/+jgsIPVHjgU4VTXpX/R+M6h7CBASVoES4t57fsRb+I8UWFF3iEARAY69dC2xVCo
         URYB8ZCwHROXxrMoSQfEtImbj7c/UBbjtf5Wppgok+6BjEEX+4GDdvKCgZ5AiNVejLpV
         yDex70ynkN50VzkRYPfke51Hr/xb70vpCIITCUSAC/xSiApc4ZpftGY2fwtLxBXL9f4o
         uFtfsI5DO6JjUrZu3E+H64hK+PS4wdGDsyEcuHcntfhq4PpnQOaiRcwdyaDXSLj3xdr0
         hkswoi8Ce9rcBbCA5Cfi9t+d9anhhKbMJFEZF4i/qJ7qx+f/j8nhJyFFfvA5v60T4o1v
         8OhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EYz840XL2+BeI0xjEE06TBEE7fdn2tJLjp3OBT5/ex8=;
        b=kRG0kkGjBtvlTtcvGAx8rhO6tiYqOfPww7JcUnekHclTWWAt2N2fze6Vo1XMNt4YkQ
         E1gx21KfQ7HOjKuBE97EieDs/sS+XQ5WF9LeCaz/HfS9rLCRBarDDvyIHSZM/szuIX3T
         HAC5YF96sxyAC85YFBu3p2qnpV4YBqA4XM4KdUI0wtuCahbwK2etdWtbUBWRHVX35u/i
         ia+W1E/YMgZ+D4RTylypHc6yHwpremPX2KYWNbFzD9Ua9jJFsXQCBsqAJYJGqinEh/5e
         hSsl8aKdxkZxeTSdy1lXcNI6EzdNG/Zgi8o7iEgZI/VcsiT7zrZAdIqHIAUzAJF5E2Ph
         4haQ==
X-Gm-Message-State: AOAM533hn2855KFqTTnp3+XSy0GuLVI0Wgo6CN2+Y6OOUGnHyiis56jm
        r1DzXzl91gQSPAzd1G+9tGN0jlweego=
X-Google-Smtp-Source: ABdhPJxxLcLuqNoUidxNTzzW4XSp0tGUe7iGFP3OUZen+YjbkOInSgT8KDKBAzgE8hfiRbLGNlTSMg==
X-Received: by 2002:a05:651c:1123:: with SMTP id e3mr10075574ljo.131.1608664589537;
        Tue, 22 Dec 2020 11:16:29 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id e27sm3037048ljb.6.2020.12.22.11.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 11:16:29 -0800 (PST)
Subject: Re: [PATCH v2 06/48] dt-bindings: clock: tegra: Document clocks
 sub-node
To:     Rob Herring <robh@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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
 <20201217180638.22748-7-digetx@gmail.com>
 <20201222001457.GA891962@robh.at.kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c4ce87e9-0e8d-a0cb-6098-f98e285ebf75@gmail.com>
Date:   Tue, 22 Dec 2020 22:16:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222001457.GA891962@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

22.12.2020 03:14, Rob Herring пишет:
> On Thu, Dec 17, 2020 at 09:05:56PM +0300, Dmitry Osipenko wrote:
>> Document "clocks" sub-node which describes Tegra SoC clocks that require
>> a higher voltage of the core power domain in order to operate properly on
>> a higher rates.
> 
> Seems like an odd reason to have a bunch of child nodes. It very much 
> seems like a problem you'd need to solve after you design the binding 
> which should be fixed within the kernel.

The reason is that multiple root SoC PLL clocks need to have individual
OPP table because proper voltage should be maintained for these clocks
based on the clock rate.

Some of the clocks do not belong to any specific device and there is a
need to specify the OPP table for them. Each child node represents an
individual clock with the clock's OPP table and power domain.

Some clocks belong to a specific device, but don't require high voltages
and it's very convenient that clk device could manage voltage for these
clocks, instead of populating each device with OPP support (PWM, MMC and
etc).

I'll update the commit message with a better explanation in v3.

> This is also above my threshold for 'convert to schema' first...

Alright, will convert it in v3.
