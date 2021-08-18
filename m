Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E116F3EFA7E
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 08:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238035AbhHRGBZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 02:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238038AbhHRGBM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 02:01:12 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E30C0613D9
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 23:00:37 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id e15so1116449plh.8
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 23:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jSLfXbs59mtRstzo4Hk2BNosvMcxHU6QjHDYVbvhF94=;
        b=IZiDZuRS1dgbax2OIM0qBL1zjf9wYlmKLTEfzJy5RuUwQu4eQ6Cqmnd2ZfQ9EnnS5E
         Jr1fAcgL/JdFgkFZ89xjBuBPSORKqFiw+3e1WhRfjnkRI6XhhARyc2h+l5KPSXucToC1
         5NtBgghBSCisOGicrsb9AX3gqpRGgB9wryJPh6wD220SUglcmvJcuJFjUggtI/Et9Qhq
         yJL8iRXbbCgl4lZdUfxZejEJadW6CurxesAMbeYQ33LbfTu1KA1dNxOq6HMfw0FLGwDr
         OcBg18AVZFD7ZTL3PphKIXIDGtjeF3qBwk12Pxl3ByoW3VLzL+hvaHjyLcAcizZ3cE8S
         xzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jSLfXbs59mtRstzo4Hk2BNosvMcxHU6QjHDYVbvhF94=;
        b=o86N7dAbhQmwdF8PWyKctq3OuNrTsH4KwF+U6dGyF5lqdlIxMVEPdp8Rnf81rWzX0K
         M9FGf5sGCMkpi0iiIvuuNOz8gkMTKjDMYD89sO942tu8yAzoo7IHFNJl2TAOf24/E/fl
         ZnMykBbmgpOD5zYFZ9hAa3cSYcuDedb8uovMjdxfmqBLP0i5l5Q2PCBsM2VPHT48m8S3
         ge9UZmaQbX7U45RZcwLuAZc3lsOTdaZk4iLMvt+82rAdVwxbCxG6i/OqfvvDKsj0OmdR
         rGJ9361UajkercUTwcSCAxRwD5KpxH0GS9y82j4o/htDY3yglCF8XUfV1lAuM4/9ECv8
         mwAA==
X-Gm-Message-State: AOAM531ska9UAMtN31poHaDiI1Lvdg0hWBvXkA3jDc6mE+BFk+GOLTe/
        qAIoDLUk376fupB+3EBxhdNKEg==
X-Google-Smtp-Source: ABdhPJz6nHvt8tLhRUxNLQv5z93Dx/TL1iQrf7p3Xot0rNlhIhtJA6nFhb5bwd/3tPACvE5mJ3aZJA==
X-Received: by 2002:a17:902:edc8:b029:12d:4a06:1c25 with SMTP id q8-20020a170902edc8b029012d4a061c25mr5874222plk.61.1629266436958;
        Tue, 17 Aug 2021 23:00:36 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id 136sm6020660pge.77.2021.08.17.23.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:00:36 -0700 (PDT)
Date:   Wed, 18 Aug 2021 11:30:34 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210818060034.tdu3ocbqlnao336u@vireshk-i7>
References: <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18-08-21, 11:28, Viresh Kumar wrote:
> On 18-08-21, 08:21, Dmitry Osipenko wrote:
> > Yes, GENPD will cache the perf state across suspend/resume and initially
> > cached value is out of sync with h/w.
> > 
> > Nothing else. But let me clarify it all again.
> 
> Thanks for your explanation.
> 
> > Initially the performance state of all GENPDs is 0 for all devices.
> > 
> > The clock rate is preinitialized for all devices to a some default rate
> > by clk driver, or by bootloader or by assigned-clocks in DT.
> > 
> > When device is rpm-resumed, the resume callback of a device driver
> > enables the clock.
> > 
> > Before clock is enabled, the voltage needs to be configured in
> > accordance to the clk rate.
> > 
> > So now we have a GENPD with pstate=0 on a first rpm-resume, which
> > doesn't match the h/w configuration. Calling dev_pm_opp_sync() sets the
> > pstate in accordance to the h/w config.
> 
> What about calling dev_pm_opp_set_rate(dev, clk_get_rate(dev)) here
> instead ? That will work, right ? The advantage is it works without
> any special routine to do so.
> 
> I also wonder looking at your gr3d.c changes, you set a set-opp
> helper, but the driver doesn't call set_opp_rate at all. Who calls it
> ?
> 
> And if it is all about just syncing the genpd core, then can the genpd
> core do something like what clk framework does? i.e. allow a new
> optional genpd callback, get_performance_state() (just like
> set_performance_state()), which can be called initially by the core to
> get the performance to something other than zero. opp-set-rate is
> there to set the performance state and enable the stuff as well.
> That's why it looks incorrect in your case, where the function was
> only required to be called once, and you are ending up calling it on
> each resume. Limiting that with another local variable is bad as well.

Ulf, this last part is for you :)

-- 
viresh
