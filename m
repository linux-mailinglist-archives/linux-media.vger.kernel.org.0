Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5612F32CC
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 15:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbhALOSC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 09:18:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbhALOSC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 09:18:02 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40026C061795
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 06:17:22 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id 73so852660uac.8
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 06:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rLiwQ7Aisx/Fct40RlEWj5FexYeUpewbEHaYhQmapwI=;
        b=BUyDdDviQzrGZtoD8G/L9ZZzmGO6GemK7todlsnlbd0rVa7KTW3u8IrJKPqb/8RHKL
         xt2iSJp/n2fSg29NSed4RkVMbmCY64pJk4yh7AVcQfnvne84NBA9w56RGBVMYKqI3fRE
         Tq7hdSv4A9tFde3hyUPmWis4D9CECTR5ZOdPSK7wSCCE/6MsIM8KvytoZYs0X7OeeIYd
         fmFiJFHJmrcC10fGMedE740yhIxTmzk+SKoFVsQfpm5CfXLl1A5hCR0uMvRGQOAhZ2GM
         UH1T8K+YAivhtItsg+Q8OspPcDBKzVVBbLJNw/kjIV6J/m/IQ3Xey0Xy8SDGNdYBm/26
         yoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rLiwQ7Aisx/Fct40RlEWj5FexYeUpewbEHaYhQmapwI=;
        b=oUMs59FauybU6syCAL1LYRrTr/PZXqVCBYNaX29Sf1IEohn1ytASewi2NdvDiEdyON
         A8rG07ovy4xDVpqXR1eyLyrd3FI4XnAM8W4MVAb7ZCBldNmGn4wlQ4rwEk07hUuSD/HQ
         wcZREo8g3HSniB/ZzrwQCK0p9iBrG2cvU+ZGKX3PJFX0INjh7YUNvjyf3m24GL6/zcmJ
         8JE0oH98pgM78iRylTMFr55ah7nW8zeCVgkDwruAwIQzOcTc1+Iqz/Xq2NCL+YUfCS4f
         gAQUSQgL9+qEGElSky66v3jOtN8r1OLSzOaucIv6Uui7mmlsdOe/9P69PjaKk1oljfUz
         IkjA==
X-Gm-Message-State: AOAM5334Ra/z7vUB/dCxjGXCFRhJGyRQRFVeF2aD8GOlhHCVEIf7OJiw
        u4UAVaUarU/UlF+6Jb6/wRc2lm3sAs+6ljSPVxWMRw==
X-Google-Smtp-Source: ABdhPJwERNzz9D9S6H23pmXXFcX/wNzEGNdMuoeIpmrclPBW5Q0rU9hEo0YNznVcrhbk/kGGj8fHyudcoc/ZIKkrLR4=
X-Received: by 2002:ab0:2e99:: with SMTP id f25mr3740445uaa.104.1610461041138;
 Tue, 12 Jan 2021 06:17:21 -0800 (PST)
MIME-Version: 1.0
References: <20201217180638.22748-1-digetx@gmail.com> <20201217180638.22748-36-digetx@gmail.com>
In-Reply-To: <20201217180638.22748-36-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 12 Jan 2021 15:16:44 +0100
Message-ID: <CAPDyKFpQUFTYJ8K2hPMeQCCbQTF_TCE_B+xkXpcL4Fi7h2ReHw@mail.gmail.com>
Subject: Re: [PATCH v2 35/48] drm/tegra: dc: Support OPP and SoC core voltage scaling
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- trimmed cc-list

On Thu, 17 Dec 2020 at 19:08, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add OPP and SoC core voltage scaling support to the display controller
> driver. This is required for enabling system-wide DVFS on pre-Tegra186
> SoCs.
>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 66 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 65 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index b6676f1fe358..105ad786e432 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -11,9 +11,12 @@
>  #include <linux/interconnect.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>
> +#include <soc/tegra/common.h>
>  #include <soc/tegra/pmc.h>
>
>  #include <drm/drm_atomic.h>
> @@ -1699,6 +1702,48 @@ int tegra_dc_state_setup_clock(struct tegra_dc *dc,
>         return 0;
>  }
>
> +static void tegra_dc_update_voltage_state(struct tegra_dc *dc,
> +                                         struct tegra_dc_state *state)
> +{
> +       unsigned long rate, pstate;
> +       struct dev_pm_opp *opp;
> +       int err;
> +
> +       /* calculate actual pixel clock rate which depends on internal divider */
> +       rate = DIV_ROUND_UP(clk_get_rate(dc->clk) * 2, state->div + 2);
> +
> +       /* find suitable OPP for the rate */
> +       opp = dev_pm_opp_find_freq_ceil(dc->dev, &rate);
> +
> +       if (opp == ERR_PTR(-ERANGE))
> +               opp = dev_pm_opp_find_freq_floor(dc->dev, &rate);
> +
> +       /* -ENOENT means that this device-tree doesn't have OPP table */
> +       if (opp == ERR_PTR(-ENOENT))
> +               return;
> +
> +       if (IS_ERR(opp)) {
> +               dev_err(dc->dev, "failed to find OPP for %luHz: %pe\n",
> +                       rate, opp);
> +               return;
> +       }
> +
> +       pstate = dev_pm_opp_get_voltage(opp);
> +       dev_pm_opp_put(opp);
> +
> +       /*
> +        * The minimum core voltage depends on the pixel clock rate (which
> +        * depends on internal clock divider of the CRTC) and not on the
> +        * rate of the display controller clock. This is why we're not using
> +        * dev_pm_opp_set_rate() API and instead controlling the power domain
> +        * directly.
> +        */
> +       err = dev_pm_genpd_set_performance_state(dc->dev, pstate);

As you state above, in general we should not need to call the
dev_pm_genpd_set_performance_state() directly for the consumer driver.

Even if this looks like a special case to me, I would appreciate a
confirmation from Viresh that this is the way he also would like to
move forward from the opp library perspective.

> +       if (err)
> +               dev_err(dc->dev, "failed to set power domain state to %lu: %d\n",
> +                       pstate, err);
> +}
> +

[...]

Kind regards
Uffe
