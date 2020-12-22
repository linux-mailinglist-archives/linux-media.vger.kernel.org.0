Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48FE2E0ED1
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 20:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgLVTTH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 14:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgLVTTG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 14:19:06 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E87E4C0613D3;
        Tue, 22 Dec 2020 11:18:25 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id a12so34541813lfl.6;
        Tue, 22 Dec 2020 11:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lcB/y6qU20WLnd5c6LTo3G6tp/OwhO3SBtrWVG5rCFc=;
        b=EejIC70QVALti28WPnuavpGynvc0S9z9Vat1lwcwhaT/aIgj9d4pqxEwv3zOyTaIDP
         wGnbYvDmOM6vimG54VEZjIQp4HBfaJWqDOmjLZ/8vaQ6pr2vm+hcXu+xBS1YQKE6uu/q
         kr+/N6OrkpQtpLJ8kOlg9V+0EWS9C9q8vkq77I+5GgvFDikfZsnl+6INCAImnw1+EMTk
         f0qcHVrmlK+RsBEVlZ6PyDiIHvFqVURHyeE0Q0HQ0L7Dw2nQxQ5thn19hiB9bz6Mr+nX
         WDGhtJrdSJtXUrKHzMntzzgWLTBClIU28dTWDdENyX/ey1+pWizesNNPD1LK+s6g9qni
         ZyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lcB/y6qU20WLnd5c6LTo3G6tp/OwhO3SBtrWVG5rCFc=;
        b=fxg09ODRUXYucO5b86Myr2rddl5TOX53EivosLjFg587736DIUFP7ai49S55C5xnUZ
         5uCGUuKHCWJhC2b4PsRKCNQaegA4tCwY26vYY9BHOByeOiBiQ03p+FhCji0CL/sAsCHF
         j1YE4bmYx1fh4yvPaXyVK9RolFJtHwX+OLpMjRiSEIPbU1Z28dJtIE7TIpHx/AaspD15
         ttWKnV1TSg7EiASWkZEBRiGXMWLlb7WSVMFdEmAVEYK1Syai38BgHmfg0kVIw3z8pTWb
         Uw7KfVEcfx0CnVMfc6HQUpHMWWpf2UHXs3U1xotczugiYNkr4KPWjtZpeAYvCJ+cqgAx
         QdnA==
X-Gm-Message-State: AOAM53084zj7QdRvJhEUP6wqUghMg4DP1FH3bL6oaewvchxUFz2xMiep
        zZyFiK+4Rl7f0OToRCNHvqcMbnFwy6U=
X-Google-Smtp-Source: ABdhPJxW/f8t8lnOY/9IpSrJMD5QC3Uvhw+YOcc4pHXTNt7pE46dn90vPQ/S9qMKb9XmV6y5yqIGrQ==
X-Received: by 2002:a19:950:: with SMTP id 77mr9116995lfj.133.1608664704345;
        Tue, 22 Dec 2020 11:18:24 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id b5sm2782768lfg.13.2020.12.22.11.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 11:18:23 -0800 (PST)
Subject: Re: [PATCH v2 15/48] opp: Support set_opp() customization without
 requiring to use regulators
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
 <20201217180638.22748-16-digetx@gmail.com>
 <20201222090139.vopgc2ju72kr4ujy@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8fb90b3c-dcfe-e5e2-124e-bbb6d4bda0ad@gmail.com>
Date:   Tue, 22 Dec 2020 22:18:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222090139.vopgc2ju72kr4ujy@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

22.12.2020 12:01, Viresh Kumar пишет:
> On 17-12-20, 21:06, Dmitry Osipenko wrote:
>> Support set_opp() customization without requiring to use regulators. This
>> is needed by drivers which want to use dev_pm_opp_set_rate() for changing
>> rates of a multiple clocks and don't need to touch regulator.
>>
>> One example is NVIDIA Tegra30/114 SoCs which have two sibling 3D hardware
>> units which should be use to the same clock rate, meanwhile voltage
>> scaling is done using a power domain. In this case OPP table doesn't have
>> a regulator, causing a NULL dereference in _set_opp_custom().
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/opp/core.c | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
>> index 3d02fe33630b..625dae7a5ecb 100644
>> --- a/drivers/opp/core.c
>> +++ b/drivers/opp/core.c
>> @@ -828,17 +828,25 @@ static int _set_opp_custom(const struct opp_table *opp_table,
>>  			   struct dev_pm_opp_supply *old_supply,
>>  			   struct dev_pm_opp_supply *new_supply)
>>  {
>> -	struct dev_pm_set_opp_data *data;
>> +	struct dev_pm_set_opp_data *data, tmp_data;
>> +	unsigned int regulator_count;
>>  	int size;
>>  
>> -	data = opp_table->set_opp_data;
>> +	if (opp_table->set_opp_data) {
>> +		data = opp_table->set_opp_data;
>> +		regulator_count = opp_table->regulator_count;
>> +	} else {
>> +		data = &tmp_data;
>> +		regulator_count = 0;
>> +	}
>> +
>>  	data->regulators = opp_table->regulators;
>> -	data->regulator_count = opp_table->regulator_count;
>> +	data->regulator_count = regulator_count;
>>  	data->clk = opp_table->clk;
>>  	data->dev = dev;
>>  
>>  	data->old_opp.rate = old_freq;
>> -	size = sizeof(*old_supply) * opp_table->regulator_count;
>> +	size = sizeof(*old_supply) * regulator_count;
>>  	if (!old_supply)
>>  		memset(data->old_opp.supplies, 0, size);
>>  	else
> 
> I don't see you making use of this in this patchset. How did you get this to
> crash ?
> 

Please see patch 38 where 3d driver makes use of
devm_pm_opp_register_set_opp_helper().

The opp_table->set_opp_data=NULL and opp_table->regulator_count=-1 if
OPP table doesn't use a regulator, hence the crash happens.
