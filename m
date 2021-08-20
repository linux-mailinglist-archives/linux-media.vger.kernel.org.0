Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04B83F2CD4
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 15:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240675AbhHTNJ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 09:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240722AbhHTNJZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 09:09:25 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05DEDC0613CF
        for <linux-media@vger.kernel.org>; Fri, 20 Aug 2021 06:08:47 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id ay4so4104327uab.3
        for <linux-media@vger.kernel.org>; Fri, 20 Aug 2021 06:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1jeLsd0F5nu8VxBSxWPjs9ij/vCzMSfR5Tmv5iuwd6s=;
        b=WC/dbJiZXZbYao7JhIntQY4TZ71VEiAo3x28NE7fEM5kyH3E5QMkrYaKxo+tOHuBq2
         4fOoN/8kF20QYOvTlDeczofK7BcIqjasNY7CBq53XfqL9k8ztpMQHfVcSzVO71rO64Zq
         McT44tin8yfog5Tj3F9uEcMm8s9RXuEY0am/zJIYxZIPBOSKQ0gPSUGTqV2fLnNdUMyA
         Udra5icYrRXmu3Bub8tb1oL++vAVtV4op8H5c4RaKOsboeh/aX+gQt/xKF7m6+TffsNV
         KpFsGCqib0Qpb9uD4iaINA3IeiJAs50v1pCyq6JF3tpma3/8Ou1apbdGh5FgySUdxEte
         6zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1jeLsd0F5nu8VxBSxWPjs9ij/vCzMSfR5Tmv5iuwd6s=;
        b=j5hQzUElscQZp4nrL7WeBC8R7GC97EZO3IRWPbAL1mC3592cWYtj5R2vS2zrylsiE4
         R4zNwkp89PwKjt2NAraMJyuATyEGWxmoT4sU1Mr0HSKDzDUgMAh/dn+/NtKlWv0FPHtB
         Sp3t5mHSJdIbPvvWTJAHAfdJlLWfBctb8SfdN7k7sPydkK3l4+dN8JK4L3yOmP0J+ww3
         W728VjSZFAuOFKIjg+ueSiQQdzCZ1VZQdn5ft4BrG9rL9rLdygdFP0OO4zRUGQ5FPITW
         kQdtsttK1BpGb9YbiDQ/PadWuUBSnFRKCnfP5GvkZ6NtGhk/1CuM57/taTcAOXDn/hxY
         AumQ==
X-Gm-Message-State: AOAM5302diLSxY9Bcg+rhw0w8RSIOh65EQT1K9gW2q2Memsm+cWgKx5H
        PBmDgkqGueEBgaIaS2/Uzwp4ILdKHbL4qCZn/13/cA==
X-Google-Smtp-Source: ABdhPJyudXWst0uOFOvLTh4dvpAObwIHCZFQbOR7Ax2SinJKzLNlpYWdAnSEO7YQ/BLnbTZWMq48nnebeaOpVOjUigE=
X-Received: by 2002:ab0:60a9:: with SMTP id f9mr15039087uam.19.1629464926939;
 Fri, 20 Aug 2021 06:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210817012754.8710-1-digetx@gmail.com> <20210817012754.8710-8-digetx@gmail.com>
 <YR0UBi/ejy+oF4Hm@orome.fritz.box> <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
 <YR04YHGEluqLIZeo@orome.fritz.box> <ad99db08-4696-1636-5829-5260f93dc681@gmail.com>
 <YR6Mvips3HAntDy0@orome.fritz.box> <e17bbe8d-7c0f-fc3d-03c7-d75c54c24a43@gmail.com>
 <YR+VDZzTihmpENp6@orome.fritz.box>
In-Reply-To: <YR+VDZzTihmpENp6@orome.fritz.box>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 20 Aug 2021 15:08:10 +0200
Message-ID: <CAPDyKFpJ+TK0w1GZEA7G=rtAjq5ipmVR4P0wy7uHiEGVWRk5yA@mail.gmail.com>
Subject: Re: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[...]

> >
> > I'm creating platform device for the clocks that require DVFS. These
> > clocks don't use regulator, they are attached to the CORE domain.
> > GENPD framework manages the performance state, aggregating perf votes
> > from each device, i.e. from each clock individually.
> >
> > You want to reinvent another layer of aggregation on top of GENPD.
> > This doesn't worth the effort, we won't get anything from it, it
> > should be a lot of extra complexity for nothing. We will also lose
> > from it because pm_genpd_summary won't show you a per-device info.
> >
> > domain                          status          children                           performance
> >     /device                                             runtime status
> > ----------------------------------------------------------------------------------------------
> > heg                             on                                                 1000000
> >     /devices/soc0/50000000.host1x                       active                     1000000
> >     /devices/soc0/50000000.host1x/54140000.gr2d         suspended                  0
> > mpe                             off-0                                              0
> > vdec                            off-0                                              0
> >     /devices/soc0/6001a000.vde                          suspended                  0
> > venc                            off-0                                              0
> > 3d1                             off-0                                              0
> >     /devices/genpd:1:54180000.gr3d                      suspended                  0
> > 3d0                             off-0                                              0
> >     /devices/genpd:0:54180000.gr3d                      suspended                  0
> > core-domain                     on                                                 1000000
> >                                                 3d0, 3d1, venc, vdec, mpe, heg
> >     /devices/soc0/7d000000.usb                          active                     1000000
> >     /devices/soc0/78000400.mmc                          active                     950000
> >     /devices/soc0/7000f400.memory-controller            unsupported                1000000
> >     /devices/soc0/7000a000.pwm                          active                     1000000
> >     /devices/soc0/60006000.clock/tegra_clk_pll_c        active                     1000000
> >     /devices/soc0/60006000.clock/tegra_clk_pll_e        suspended                  0
> >     /devices/soc0/60006000.clock/tegra_clk_pll_m        active                     1000000
> >     /devices/soc0/60006000.clock/tegra_clk_sclk         active                     1000000
> >
>
> I suppose if there's really no good way of doing this other than
> providing a struct device, then so be it. I think the cleaned up sysfs
> shown in the summary above looks much better than what the original
> would've looked like.
>
> Perhaps an additional tweak to that would be to not create platform
> devices. Instead, just create struct device. Those really have
> everything you need (.of_node, and can be used with RPM and GENPD). As I
> mentioned earlier, platform device implies a CPU-memory-mapped bus,
> which this clearly isn't. It's kind of a separate "bus" if you want, so
> just using struct device directly seems more appropriate.

Just a heads up. If you don't use a platform device or have a driver
associated with it for probing, you need to manage the attachment to
genpd yourself. That means calling one of the dev_pm_domain_attach*()
APIs, but that's perfectly fine, ofcourse.

>
> We did something similar for XUSB pads, see drivers/phy/tegra/xusb.[ch]
> for an example of how that was done. I think you can do something
> similar here.
>
> Thierry

Kind regards
Uffe
