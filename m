Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146113F00D4
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 11:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbhHRJnu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 05:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbhHRJnr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 05:43:47 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BABFC0613D9
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 02:43:12 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id a20so1384921vsh.4
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FWBxn1z3ekg3JNnkDjY46sh+PpWR/RlGELWeBu4tA3E=;
        b=FFftuENs27XO7ikAVlt9sNRrRCsBTJZ805lZ/o142pXQXR8nF52pmq8IvezPLEiFO+
         Gjq2WoPiQzk8jZ4uYInc1khmBed8qd46T4LWYngy8i354Jfy5RYYZeNPcPQwV7Hi+puI
         QZhCeWMwHzHrHaXIuivtbzApdiybJQ4pVhpGU7feoyKgCWA/npF/0W2iJeG8VztzaEt+
         ZJsxwI7r8+xAuOc7l8/VyUsTvFlBfoIdxOUMdDlAHZYFe7MoAJNwUSTgdHCwo6ucQZJA
         BERjK6oUxjMO7UroxyK/oZD8pD+R5orBQwvbmOc6wkXjZrFZ4z5k2EAhTN/3qtONaHMN
         ycCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FWBxn1z3ekg3JNnkDjY46sh+PpWR/RlGELWeBu4tA3E=;
        b=Ct0s7UH+dQVV99THDBnH3DzHC0ZK+SCxSXZ7kcVlLaOzoW1LQVKuGGMcLTT/2+BWwr
         yO6uFQfN0Sn3xsTzyLWdQM3cbtZonQnZy3qXHDUeuf8+Ul8ddRw6IBfAN+cgr5qG1hGY
         kwK5UN2YJHder6Hhb+cP2ZdpiAqFLibviI3d2PUODAeJjbw+G0Bh90Ps3SY7bFX7rxrY
         0DkPNVEOLaam0nLdxDdysMPrEdnucloZCQxNA8FQc2T11SjJlsarHRX+pznzDvrlJ5Yx
         csoIgWKgcyPF9pyJ2bAYsKNVf+KcB2yKcIUSbnb5Y5lYM4LS2w0SBA8N6SKVWrh0EKKW
         76VQ==
X-Gm-Message-State: AOAM532CwsKDmUgKBDJsmSbwTVM0D6mTmFwJ+wlpfFst9aXFmVy71ArS
        4yP3UtxQuSVIh4RPekI/zByxAXthSF/5qP+nlRuGyg==
X-Google-Smtp-Source: ABdhPJy9niDJz5mgkUvErbKV42Yn+Ms0EJBjGcIKiTYQBlrHgHjEZyzYRmP0dMsZPekoMsC63913LnT1iekm3nfsXZM=
X-Received: by 2002:a67:7949:: with SMTP id u70mr6382807vsc.55.1629279791962;
 Wed, 18 Aug 2021 02:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210818035533.ieqkexltfvvf2p4n@vireshk-i7> <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7> <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7> <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7> <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7> <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7> <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
In-Reply-To: <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 18 Aug 2021 11:42:35 +0200
Message-ID: <CAPDyKFrgGEOEFsqah3sQfPbjeRySPfFxokpO-BcMcPmEMrv-kg@mail.gmail.com>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
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

On Wed, 18 Aug 2021 at 11:41, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Wed, 18 Aug 2021 at 11:14, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 18-08-21, 10:29, Ulf Hansson wrote:
> > > Me and Dmitry discussed adding a new genpd callback for this. I agreed
> > > that it seems like a reasonable thing to add, if he insists.
> > >
> > > The intent was to invoke the new callback from __genpd_dev_pm_attach()
> > > when the device has been attached to its genpd. This allows the
> > > callback, to invoke clk_get_rate() and then dev_pm_opp_set_rate(), to
> > > update the vote according to the current state of the HW.
> >
> > I wouldn't call dev_pm_opp_set_rate() from there, since it means
> > configure and enable (both) for different resources, clk, regulator,
> > genpd, etc..
>
> Right, good point!
>
> dev_pm_opp_set_rate() is best called from consumer drivers, as they
> need to be in control.
>
> >
> > What we need here is just configure. So something like this then:
> >
> > - genpd->get_performance_state()
> >   -> dev_pm_opp_get_current_opp() //New API
> >   -> dev_pm_genpd_set_performance_state(dev, current_opp->pstate);
> >
> > This can be done just once from probe() then.
>
> How would dev_pm_opp_get_current_opp() work? Do you have a suggestion?
>
> >
> > > I am not sure if/why that approach seemed insufficient?
> > >
> > > Another option to solve the problem, I think, is simply to patch
> > > drivers to let them call dev_pm_opp_set_rate() during ->probe(), this
> > > should synchronize the HW state too.
> >
> > Dmitry already mentioned that this will make the device start
> > consuming power, and he doesn't want that, else we need an explicit
> > disble call as well.
>
> I am sure I understand the problem. When a device is getting probed,

/s/I am sure/I am not sure

> it needs to consume power, how else can the corresponding driver
> successfully probe it?
>
> >
> > --
> > viresh
>
> Kind regards
> Uffe
