Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E45C32E0EEA
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 20:27:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgLVTZR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 14:25:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgLVTZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 14:25:16 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51348C0613D3;
        Tue, 22 Dec 2020 11:24:36 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id l11so34635605lfg.0;
        Tue, 22 Dec 2020 11:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bAwwHu8Zr+LCIdaN1acypQRIs//vA5Gvg6O61PVJ5mE=;
        b=c2K1a/cpIhUUaOI0qDQpFJM2ZCQd5hThZcs2neSK9H1wGNa8CimSkraGF0sL1scq/8
         WswPZF4gZBN9DVesn7KAGoVxq3+CKFwEFKk8eMLcQwmI8tXlheOlQToM5e+qq5x9CH7d
         gGRnePeI58LqvhhZAh0PDxDXGBGsFxAbPqQ1eT7AdcAZSTO/TVQ/YqJC7j/D6x5lmzkY
         2rhI+dRUkVgurQcXCc1VApxu6CelcvRBFzPcKnKksOnC41AncyxrO8+GRWqQq4tHF1bj
         iB16a4iL8DG35UcBGIPZnG4mgTkXMbKFZAqjBJmhYgupC5zTIdYps8IKTSrONTFdafOj
         69Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bAwwHu8Zr+LCIdaN1acypQRIs//vA5Gvg6O61PVJ5mE=;
        b=s6xb257ABVcWG03ZLfWdONaFHVH3RTyfhnx2ydOq5b2FiGgnNhbVzX6zrsd10cemxM
         kWS9Yx4YFbRvJOhX8Dx6RqyXrg+mtcbBe+8LjVPOvzASLleZdF0Som3JUjQF+QNEh1s4
         j9SH3iJZc1mLIsFjoP+AgbPT0R5O9aEdAj5Ri4ABA9kF3jlA3SuFk9mIzfgCvZKJOo4o
         /hoB+MFv9WUNTW9ezIMizOF598BPonqfkbSXKs/fQ/38aqveu08XC6/Cnc55kIz37sTH
         7u2FuafSxw7hXkBPBopUkCkuvQIllCJ6tRM41M25bsfY/pqTtfEtVLm9qGjWw9zxKgLA
         xiRA==
X-Gm-Message-State: AOAM533CxBEky40dDbvxIlR9vVBBv37zHhE/uIWyGPiiNVsfZr3hzKju
        of2LNxiiR7EvccY149eAMUCK1V1AxHo=
X-Google-Smtp-Source: ABdhPJx317Mwb/pjlxKQylOoep3u9EFCLyet/MQ0xMeM0WG7ENaXqps6+2cF3iNKM4R0oCScJj45zw==
X-Received: by 2002:ac2:5ec1:: with SMTP id d1mr8840565lfq.589.1608665074730;
        Tue, 22 Dec 2020 11:24:34 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id n22sm2806790lfe.230.2020.12.22.11.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 11:24:34 -0800 (PST)
Subject: Re: [PATCH v2 43/48] ARM: tegra: Add OPP tables and power domains to
 Tegra20 device-tree
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
 <20201217180638.22748-44-digetx@gmail.com>
 <20201222054745.2am4bcbk5df5aqzj@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e3ed3b17-b549-860b-1dc2-cb1d6eb3b90b@gmail.com>
Date:   Tue, 22 Dec 2020 22:24:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222054745.2am4bcbk5df5aqzj@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

22.12.2020 08:47, Viresh Kumar пишет:
> On 17-12-20, 21:06, Dmitry Osipenko wrote:
>> diff --git a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
>> index b84afecea154..7e015cdfbc55 100644
>> --- a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
>> +++ b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
>> @@ -1,6 +1,46 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  
>>  / {
>> +	core_opp_table: core-power-domain-opp-table {
>> +		compatible = "operating-points-v2";
>> +		opp-shared;
>> +
>> +		core_opp_950: opp@950000 {
>> +			opp-microvolt = <950000 950000 1300000>;
>> +			opp-level = <950000>;
>> +		};
> 
> I am not sure I fully understand this, why does it have both microvolt and level
> properties ?
> 

The level is used by everything related to GENPD, while voltage is used
by the domain driver.

I think it's cleaner to separate the level from voltage, even though
they are set to the same values, which is done purely for convenience.
The 0,1,2,3 levels are meaningless in the context of this power domain,
while voltages make total sense.
