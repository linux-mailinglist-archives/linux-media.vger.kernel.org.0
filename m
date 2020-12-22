Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D43C2E0621
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 07:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgLVGlO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 01:41:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgLVGlN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 01:41:13 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89AFAC06179C
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 22:40:33 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id g15so2860704pgu.9
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 22:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=58if8R3c+oDYrkVVIdvCMuB/HRUSZCNfm9pXzo2Jxis=;
        b=xrayxzNVWoBOOUTllKsBsgUMpNC6xjZxfZRPwCLEzoXU/sg5+VOejq6aNdvm2F+h2l
         oH0+TkshTv1ugzupTG92EKZ/M+hvjdg0PJI86pwt4TR1v8JqJdT8Pz61vnx9sJ5e5IhD
         0EmBrUKXKuIbpIgXqOaGOBgmjNnR7tKFoe67MoGdHqq/3HpwUSPXpkKjhoVhd8YJ7Eol
         V682sF5RTwD5LSJkgu7VcNMjDxbWuqm/SMYLAkqsFi0U43LQmIqScaYNgn8+0Pf4UE6X
         FlNsocE3fBXkr36MtWwlASa3aY1opWbBf4DS7Gh+PnwPpww69IKJ7asp4rk18Z4vqVBQ
         ibyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=58if8R3c+oDYrkVVIdvCMuB/HRUSZCNfm9pXzo2Jxis=;
        b=J/DPJcAXRaQVomDNFYIDnC+dN5fFHbVl10u1Z6s5on42fUmpTI8HXSZejNuc8vdfmu
         7mn7vhIreBpYBGjSFillEKvr/Uz29bHCU+DSGnP1VlHsdqPbU2jZD+ykpHPj+/DRaHZa
         ZpVce7EYeXrum3ipQ323pbPuswsB6Nu4PPSC9BdP6nYObHFCXArPg3JSHKTgUnm9ngCr
         61JW82pha5wuZWqTgihy4ibmISz2F+ytMbDwOfY17OWpJDD2SB4rpjlIOUbk1PYYDleK
         PVJSwJ0RPvH1YiJvRHSCaeuoFOb0Njrtpss+XkvN+NYQcc7bInZk+L0ZyUTAAmg5uEmi
         YXNQ==
X-Gm-Message-State: AOAM532Ak8wHuo2RTt5CSatkBtiiLW7Qg9eVwCWGYNsXftXTa2EEBSky
        4rimpof4rvzg2Sy4mloBHqNxCg==
X-Google-Smtp-Source: ABdhPJy/vJr+NNSCt7f3w3qkCyZMIzMDucjtinh/w3AD+sfsU1ChxDwkeoH4189p2G8BBp09nYpz6Q==
X-Received: by 2002:a63:1f10:: with SMTP id f16mr14879515pgf.111.1608619232743;
        Mon, 21 Dec 2020 22:40:32 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id 197sm19176671pgg.43.2020.12.21.22.40.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Dec 2020 22:40:31 -0800 (PST)
Date:   Tue, 22 Dec 2020 12:10:29 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
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
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
Message-ID: <20201222064029.duuzcsj53rt7xzvt@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-29-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-29-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17-12-20, 21:06, Dmitry Osipenko wrote:
> +++ b/drivers/soc/tegra/core-power-domain.c
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * NVIDIA Tegra SoC Core Power Domain Driver
> + */
> +
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
> +#include <linux/slab.h>
> +
> +#include <soc/tegra/common.h>
> +
> +static struct lock_class_key tegra_core_domain_lock_class;
> +static bool tegra_core_domain_state_synced;
> +
> +static int tegra_genpd_set_performance_state(struct generic_pm_domain *genpd,
> +					     unsigned int level)
> +{
> +	struct dev_pm_opp *opp;
> +	int err;
> +
> +	opp = dev_pm_opp_find_level_ceil(&genpd->dev, &level);

We don't need ceil or floor versions for level, but rather _exact() version. Or
maybe just call it dev_pm_opp_find_level().

> +	if (IS_ERR(opp)) {
> +		dev_err(&genpd->dev, "failed to find OPP for level %u: %pe\n",
> +			level, opp);
> +		return PTR_ERR(opp);
> +	}
> +
> +	err = dev_pm_opp_set_voltage(&genpd->dev, opp);

IIUC, you implemented this callback because you want to use the voltage triplet
present in the OPP table ?

And so you are setting the regulator ("power") later in this patch ?

I am not in favor of implementing this routine, as it just adds a wrapper above
the regulator API. What you should be doing rather is get the regulator by
yourself here (instead of depending on the OPP core). And then you can do
dev_pm_opp_get_voltage() here and set the voltage yourself. You may want to
implement a version supporting triplet here though for the same.

And you won't require the sync version of the API as well then.

-- 
viresh
