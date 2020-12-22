Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85F82E0EE1
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 20:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgLVTVr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 14:21:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbgLVTVq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 14:21:46 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12019C0613D3;
        Tue, 22 Dec 2020 11:21:06 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id y19so34401813lfa.13;
        Tue, 22 Dec 2020 11:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0YzH8qFTgwShSHXjPQ/ih8sk32BJvJHUfZ62MJdnb4Q=;
        b=cjuuNVp8wJ4Py/jZcvkjtwd+gc2aYRuxADY9gxQQ1BFMmuGUB+QpXlnKsJc4t6BtCL
         KnGX5HHkPLoHg8NcbTRi//P/INJ7hF0Mt7Mg696geYuEi3wXX1JvDW6EQE3Sovz8NX+t
         lFaTGtAHKDD5oXV+3gr2TFkuTLzSI6ZGfCmsppPN3+9iVTJmuVeFHGF8Fe2bKRhm87pv
         bB6x6iQQhjZqDFLIAdl2dOjsTocH/K/GqNBn2WMEe3LKWzJstYv2DfJBuLBpNrjeZnvJ
         GVJM4YnrqqstFT9iWTlRzs4LU5FMJbnvxzZWYbtw6Ps7yPs1l9ZSuum5Z9IQvJftfOSJ
         zYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0YzH8qFTgwShSHXjPQ/ih8sk32BJvJHUfZ62MJdnb4Q=;
        b=al4QxrVSCDc96CuiOTtRudL9r3hTn1HI2s3Z4BAU8PAJ4YoFoHIAyNr7Fe2gfq+sdh
         UuKX7Z17HkzMAUffSu/zA36Fvqbc9HaUgKJXtevRHADZxrFT79bGMRTtGDbubCjmH8tL
         qCcmpMQ+9+juRBA/k5m/iOFCPVSfEsw6BeQfnDik3gdFrACbB758ThLnYW6t8L6mcVux
         27mkl5c+99wdBKM67ytslwE0KZs6D17ZKfPdNmqMym4ZIboi3c+CcPCWhf6gTCfLAHRZ
         jZNCMTitbS+5WPUP/R0lMMgoFDLyrkhl2RbxhcQxo0TLaQ7+GOJfYH+rpVqHMTtVt8PS
         uEVw==
X-Gm-Message-State: AOAM530iX0q92ByPlWBtT5PaVvH+hl5xOd7gr/vVqLIFTB/eZ33QDY76
        WYeMwlTVCSmZWcYfS6gpldw3fCjY4PA=
X-Google-Smtp-Source: ABdhPJyTfRbQjmFtVPw92Y7UsE4CBIej0hVl2LRd1tte7JNX6Oy7N+3jhVtpYSR71T820OH/ZDlnJA==
X-Received: by 2002:ac2:5597:: with SMTP id v23mr4071397lfg.649.1608664864385;
        Tue, 22 Dec 2020 11:21:04 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id k2sm2771430lfo.256.2020.12.22.11.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 11:21:03 -0800 (PST)
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
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
 <20201217180638.22748-29-digetx@gmail.com>
 <20201222064029.duuzcsj53rt7xzvt@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c130f78d-3d97-9b26-be77-951fee0d8680@gmail.com>
Date:   Tue, 22 Dec 2020 22:21:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222064029.duuzcsj53rt7xzvt@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

22.12.2020 09:40, Viresh Kumar пишет:
> On 17-12-20, 21:06, Dmitry Osipenko wrote:
>> +++ b/drivers/soc/tegra/core-power-domain.c
>> @@ -0,0 +1,125 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * NVIDIA Tegra SoC Core Power Domain Driver
>> + */
>> +
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/pm_opp.h>
>> +#include <linux/slab.h>
>> +
>> +#include <soc/tegra/common.h>
>> +
>> +static struct lock_class_key tegra_core_domain_lock_class;
>> +static bool tegra_core_domain_state_synced;
>> +
>> +static int tegra_genpd_set_performance_state(struct generic_pm_domain *genpd,
>> +					     unsigned int level)
>> +{
>> +	struct dev_pm_opp *opp;
>> +	int err;
>> +
>> +	opp = dev_pm_opp_find_level_ceil(&genpd->dev, &level);
> 
> We don't need ceil or floor versions for level, but rather _exact() version. Or
> maybe just call it dev_pm_opp_find_level().

The _exact() version won't find OPP for level=0 if levels don't start
with 0.

>> +	if (IS_ERR(opp)) {
>> +		dev_err(&genpd->dev, "failed to find OPP for level %u: %pe\n",
>> +			level, opp);
>> +		return PTR_ERR(opp);
>> +	}
>> +
>> +	err = dev_pm_opp_set_voltage(&genpd->dev, opp);
> 
> IIUC, you implemented this callback because you want to use the voltage triplet
> present in the OPP table ?
> 
> And so you are setting the regulator ("power") later in this patch ?

yes

> I am not in favor of implementing this routine, as it just adds a wrapper above
> the regulator API. What you should be doing rather is get the regulator by
> yourself here (instead of depending on the OPP core). And then you can do
> dev_pm_opp_get_voltage() here and set the voltage yourself. You may want to
> implement a version supporting triplet here though for the same.
> 
> And you won't require the sync version of the API as well then.
> 

That's what I initially did for this driver. I don't mind to revert back
to the initial variant in v3, it appeared to me that it will be nicer
and cleaner to have OPP API managing everything here.
