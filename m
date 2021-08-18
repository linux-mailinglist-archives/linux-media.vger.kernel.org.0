Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4FC03EFF25
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 10:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239225AbhHRIaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 04:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238436AbhHRIaw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 04:30:52 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B3BC06179A
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 01:30:18 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id v26so1322239vsa.0
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IKqcflYMaSUyzwd/eHbHpOkvH7hAYsOOplnEzRxLbhU=;
        b=R/YglmSTFalwgblF0J7z+xo4QD/viWueOMjtEA3qajPeKluQA8KyZlPIazxZCmQcOV
         ypXroUN/dz8G8KIy2PndGeFR9trr2TXk1MLEpZYZHSdEPDIvmCIDK5BOf+7ryOnDMlAz
         KKZOIcOvNnsfQADPruS78lcAX/NT/qxMC6OewVDoFYGt5hY5K9huXDQ6tsxV07Sxs/Du
         uf/zCLpMusk1iMjpoom1MA3j5kIRz40ZYONDbw9Bk+/YXVmdr5o2bmiJpfJC1CERXXmo
         E0BgAf1avWcJ6cYGmW6zCxZHRihbaxeLgDmifTSo359uCk7uScIh0CC8oShYygGDo0u/
         CxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IKqcflYMaSUyzwd/eHbHpOkvH7hAYsOOplnEzRxLbhU=;
        b=PcErUvqXHirQnaY2tjDpRuv/7oRTbZKRWpybBpzAl7MbWFyHcgIAsdUoxwmaBdMXd0
         X1AZowDi0c/tPe3A2UZIE6xIzTmdTHkIrVMbOqUv4R/S04Y+EZOpDAPtNuWiYkPRf9Ot
         1N1+HB3/UQASpDdohP2oU8aaIOpfZJs2KaDCDaAjLTqbkD6qr66oFaJZ9fXGpBcInYfv
         ueLOHfEjjy/K7QiAZ7hJe5YvKxUWi31oBuqk3x1oxT+EX54oEa/ufgZ3uVgI8nKYSj3e
         gjEu1GlHWAvci/mmT91PVeCs+88HmGtqQkrugOQy6643G3VMdUbtTmO5OQneSzo+cQoJ
         lA7g==
X-Gm-Message-State: AOAM531uWOVzZXkHsneImjBWEkkboeDKXYV860zyjpKCKfd3a154umEu
        NJOtDdjGXp8S6nSFYmkBSIZFI9ESPsBuAvok/BVqyg==
X-Google-Smtp-Source: ABdhPJwKrtdwLrtqnGeoY6XyZUUGVixFdE7Mg0poY1hljrcpole6+hd3NjZWSpGJ4mjLJUHBolVYDumnC7t4U+ynnmc=
X-Received: by 2002:a67:3212:: with SMTP id y18mr6323760vsy.19.1629275417181;
 Wed, 18 Aug 2021 01:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7> <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7> <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7> <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7> <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7> <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
In-Reply-To: <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 18 Aug 2021 10:29:40 +0200
Message-ID: <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 18 Aug 2021 at 08:27, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 18-08-21, 09:22, Dmitry Osipenko wrote:
> > 18.08.2021 08:58, Viresh Kumar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > What about calling dev_pm_opp_set_rate(dev, clk_get_rate(dev)) here
> > > instead ? That will work, right ? The advantage is it works without
> > > any special routine to do so.
> >
> > It will work, but a dedicated helper is nicer.
> >
> > > I also wonder looking at your gr3d.c changes, you set a set-opp
> > > helper, but the driver doesn't call set_opp_rate at all. Who calls it
> > > ?
> >
> > dev_pm_opp_sync() calls it from _set_opp().
>
> Okay, please use dev_pm_opp_set_rate() instead then. New helper just
> adds to the confusion and isn't doing anything special apart from
> doing clk_get_rate() for you.
>
> > > And if it is all about just syncing the genpd core, then can the genp=
d
> > > core do something like what clk framework does? i.e. allow a new
> > > optional genpd callback, get_performance_state() (just like
> > > set_performance_state()), which can be called initially by the core t=
o
> > > get the performance to something other than zero. opp-set-rate is
> > > there to set the performance state and enable the stuff as well.
> > > That's why it looks incorrect in your case, where the function was
> > > only required to be called once, and you are ending up calling it on
> > > each resume. Limiting that with another local variable is bad as well=
.
> >
> > We discussed variant with get_performance_state() previously and Ulf
> > didn't like it either since it still requires to touch 'internals' of G=
ENPD.
>
> Hmm, I wonder if that would be a problem since only genpd core is
> going to call that routine anyway.

Me and Dmitry discussed adding a new genpd callback for this. I agreed
that it seems like a reasonable thing to add, if he insists.

The intent was to invoke the new callback from __genpd_dev_pm_attach()
when the device has been attached to its genpd. This allows the
callback, to invoke clk_get_rate() and then dev_pm_opp_set_rate(), to
update the vote according to the current state of the HW.

I am not sure if/why that approach seemed insufficient?

Another option to solve the problem, I think, is simply to patch
drivers to let them call dev_pm_opp_set_rate() during ->probe(), this
should synchronize the HW state too.

Dmitry, can you please elaborate on this?

Kind regards
Uffe
