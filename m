Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8AEB2E0EF0
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 20:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbgLVT03 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 14:26:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgLVT03 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 14:26:29 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C87C0613D3;
        Tue, 22 Dec 2020 11:25:48 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 23so34505642lfg.10;
        Tue, 22 Dec 2020 11:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9+keXiLEk5gQGJPiWQkNdVYaSlolI1HV8zcJ2QbRMaQ=;
        b=cwmcOiIr56V+aHnviMOFhw4VD72whd2PBync3o2+Hbov28yOUg+OUoW9TCbUrF9P1z
         iCRrQp9DPbIlRmFAPpxKl10fINbO2txdguE4fAtCEdBTFYfMxy4ma+XExex7QQ3gFSeJ
         nC5LDYQ+63FHdkW7zMlIxWgJ0wJ+v7KvHPjTJB+RafkLgtHDhMnywSssMjo/Gfn6wYeU
         fDyHODxQh4aeFeVk6uVvyTBf9nNKrE+DRPAEGtvHoNOFhgLj6Swvyjx1qn8C2H09a4Ev
         ICJ8rRt14rTpnFJqgWe75rftGv5vf1RMl4t91L00Om2U2JCDPdmm82uzrx5BnSy8/cQ3
         JgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9+keXiLEk5gQGJPiWQkNdVYaSlolI1HV8zcJ2QbRMaQ=;
        b=i9Oc3P2NaujvYsRnOqhStWJY6CUP4BdMtcCehalOLlCrsIAmOBkWSAf7yP+LES/vUY
         nZ0aOStVL382b7N4g2bMwszbAbmz6FrQCQMUAZYzhHuzFVO4wJVT+g9fskHQ0BEdxSZI
         u/gxl5jjpSgnWVFtGz5c6YhCJ8fvKV7Wjg0c9DbY01Ou3KjBaHyZsQF5SHIFaecsjN3W
         2jjZ6LMiRGFZ5PUPaYtCM1lMhIW3bbMaVD2VRq5iT9u76RyBH+NY/sEf+wJ2FQq0/ILG
         qBzOpFQB+sRloHCRMMxpIvL6qSphEJ/cRZKE74O2our2hwg/792PAAUclZbEFV28Rqz4
         jXGQ==
X-Gm-Message-State: AOAM530VLw33VXeYoMGS3VYCQP+gSGdREYWdskHfSjx+NYkUGde4145I
        IY5UvnInMaOB+m7YB/1ewDKi7KHN0U4=
X-Google-Smtp-Source: ABdhPJyXtIjDqUhu/7BRrpZ/tJi+1x7pRk7GyjlCea8ARaozHJ2tNG8EUYgfA3mlRH1V24zHnzlI9w==
X-Received: by 2002:a2e:b8d3:: with SMTP id s19mr10050098ljp.35.1608665147257;
        Tue, 22 Dec 2020 11:25:47 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id d23sm3012942ljj.24.2020.12.22.11.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 11:25:46 -0800 (PST)
Subject: Re: [PATCH v2 44/48] ARM: tegra: Add OPP tables and power domains to
 Tegra30 device-tree
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
 <20201217180638.22748-45-digetx@gmail.com>
 <20201222091408.vvputqs27olywdxq@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c00dbbb3-88fc-6606-e5b1-dcd6a3e60383@gmail.com>
Date:   Tue, 22 Dec 2020 22:25:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222091408.vvputqs27olywdxq@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

22.12.2020 12:14, Viresh Kumar пишет:
> On 17-12-20, 21:06, Dmitry Osipenko wrote:
>> diff --git a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
>> index cbe84d25e726..983db1a06682 100644
>> --- a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
>> +++ b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
>> @@ -1,6 +1,56 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  
>>  / {
>> +	core_opp_table: core-power-domain-opp-table {
>> +		compatible = "operating-points-v2";
>> +		opp-shared;
>> +
>> +		core_opp_950: opp@950000 {
>> +			opp-microvolt = <950000 950000 1350000>;
>> +			opp-level = <950000>;
> 
> Perhaps you don't need to exactly copy the voltage value into the level field.
> The level field can just be kept to 0, 1,2, 3, etc..

It's much more convenient to set both fields to the same value because
the level values are shown in GENPD debugfs and the 0,1,2 values are
meaningless from the debugging perspective.

