Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4A35865AA
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 09:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbiHAHcQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 03:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiHAHcO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 03:32:14 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33762C122
        for <linux-media@vger.kernel.org>; Mon,  1 Aug 2022 00:32:13 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id u12so7467631qtk.0
        for <linux-media@vger.kernel.org>; Mon, 01 Aug 2022 00:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kUKDAQZf5I2blIR+AUaciEIYQ3CQhPKMxZp4utZZqrg=;
        b=a72bmV5vaAoP6w2s5uelKUwNMoVUzIEtnLolEMGAoJ8GJEELiOq+vpQn2aMdPuAEq7
         Ud09zCGaLM9Epl++ptCjcNrK96/vg7SqWO+BWpGzdtpIP6JwmeuwBiKTzr4hjYdxqWXx
         qrgUm7X9cP0yNjx+ERh3fg66flkeAAEr7ynAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kUKDAQZf5I2blIR+AUaciEIYQ3CQhPKMxZp4utZZqrg=;
        b=LvRIJVf50XL31c/Ao2XiulqECFfQvCgQxEIGZbmlEknA/WQrpp4wkxtzay0D/nSccY
         7SYpR9lzV36fQVRNt+o6PBf08DoeeutkVEuUDQx0u1bir4h/eIfOvwZOJ0MYVcKlN3/I
         doi8z/hWAyRHG5K8fMP0PV5BBf88fZIn98NY+JgfSIuD9OwoCFwZQUIAcPkIKB8qPdXa
         f1Fg1C4jAfL+lbprZadD7lbiHq8/Gd2o2LS5gf8R7v6TQOuOfd5Q/eTXl/TxGBdJ39tr
         g88j5uY7H+IUcNCLjLo0ItmC/aMfcU4NLNcUHo3qtwwzY97dB1cne583C1XN5jtuZ4uj
         DiFA==
X-Gm-Message-State: AJIora/5LlrKvbTjJBKQEYh8f1PPXrrAIZglcHRzm0LvV9x88MZWLYok
        lpbMEXrjhs1k0NwKCi+pyznw4nwXZHLRxQ==
X-Google-Smtp-Source: AGRyM1vDJVmx7qsp4kMxsuk6GtSQXBel62hwaTd+GhMhyDaSXVWcKx2Ebkl48JP83DbPM600Gwt+Lg==
X-Received: by 2002:ac8:594c:0:b0:31e:f951:cce2 with SMTP id 12-20020ac8594c000000b0031ef951cce2mr12850737qtz.519.1659339132872;
        Mon, 01 Aug 2022 00:32:12 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id br18-20020a05620a461200b006b6641c4c35sm8005992qkb.79.2022.08.01.00.32.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 00:32:12 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 204so16447257yba.1
        for <linux-media@vger.kernel.org>; Mon, 01 Aug 2022 00:32:12 -0700 (PDT)
X-Received: by 2002:a25:6e85:0:b0:676:a971:a1a4 with SMTP id
 j127-20020a256e85000000b00676a971a1a4mr10818489ybc.1.1659338645522; Mon, 01
 Aug 2022 00:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <YitLit9LC2zlOfdh@paasikivi.fi.intel.com> <YitMt7hVA2okuQ8x@pendragon.ideasonboard.com>
 <YitPaq2yYnrKsq4f@paasikivi.fi.intel.com> <Yi3rQGmeXQD70Tkh@pendragon.ideasonboard.com>
 <Yi3z2nR8j+ee4E4m@paasikivi.fi.intel.com> <Yi38zOHsh68FrrKK@pendragon.ideasonboard.com>
 <Yi+e/IK+eVpKit/F@paasikivi.fi.intel.com> <Yi+gEVB0FuOcY5qn@pendragon.ideasonboard.com>
 <Yi+vdvMeXqb/BvKo@paasikivi.fi.intel.com> <YkMDfvuhAvsrjbON@pendragon.ideasonboard.com>
 <YlfplRQYDYhFvc5U@paasikivi.fi.intel.com> <CAAFQd5C7-OuNpnduwKpZXFUPQKDeqkz2xkvP+JBBs+aNjB87FQ@mail.gmail.com>
In-Reply-To: <CAAFQd5C7-OuNpnduwKpZXFUPQKDeqkz2xkvP+JBBs+aNjB87FQ@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 1 Aug 2022 16:23:54 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bgx2u6quaCobrKEFjMPqP1S-HihCo-XP0k_OhAEUDm-g@mail.gmail.com>
Message-ID: <CAAFQd5Bgx2u6quaCobrKEFjMPqP1S-HihCo-XP0k_OhAEUDm-g@mail.gmail.com>
Subject: Re: [PATCH v2] media: ov5640: Use runtime PM
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>, Arec Kao <arec.kao@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, rafael@kernel.org,
        linux-acpi@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        bingbu.cao@intel.com, andriy.shevchenko@intel.com,
        "hidenorik@chromium.org" <hidenorik@chromium.org>,
        jacopo mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[Fixed Jacopo's email address.]

On Mon, Aug 1, 2022 at 4:17 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Thu, Apr 14, 2022 at 6:30 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Laurent,
> >
> > On Tue, Mar 29, 2022 at 04:02:54PM +0300, Laurent Pinchart wrote:
> > > Hi Sakari,
> > >
> > > On Mon, Mar 14, 2022 at 11:11:18PM +0200, Sakari Ailus wrote:
> > > > On Mon, Mar 14, 2022 at 10:05:37PM +0200, Laurent Pinchart wrote:
> > > > ...
> > > > > > > Yes, after reading the version register (or doing any other h=
arware
> > > > > > > access). Actually the full code would be
> > > > > > >
> > > > > > >
> > > > > > >       pm_runtime_enable(dev);
> > > > > > >       pm_runtime_resume_and_get(dev);
> > > > > > >
> > > > > > >       /* Hardware access */
> > > > > > >
> > > > > > >       pm_runtime_set_autosuspend_delay(dev, 1000);
> > > > > > >       pm_runtime_use_autosuspend(dev);
> > > > > > >       pm_runtime_put_autosuspend(dev);
> > > > > > >
> > > > > > > (plus error handling).
> > > > > > >
> > > > > > > If the probe function doesn't need to access the hardware, th=
en
> > > > > > > the above becomes
> > > > > > >
> > > > > > >       pm_runtime_enable(dev);
> > > > > > >       pm_runtime_set_autosuspend_delay(dev, 1000);
> > > > > > >       pm_runtime_use_autosuspend(dev);
> > > > > > >
> > > > > > > instead of having to power up the device just in case !PM.
> > > > > > >
> > > > > > > > Also the latter only works on DT-based systems so it's not =
an option for
> > > > > > > > most of the drivers.
> > >
> > > Does the former work on ACPI systems ?
> >
> > Yes (i.e. the one that was above the quoted text).
> >
> > >
> > > > > > > How so, what's wrong with the above for ACPI-based system ?
> > > > > >
> > > > > > I=E6=B6=8E devices are already powered on for probe on ACPI bas=
ed systems.
> > > > >
> > > > > Not through RPM I suppose ?
> > > >
> > > > Runtime PM isn't involved, this takes place in the ACPI framework (=
via
> > > > dev_pm_domain_attach() called in i2c_device_probe()).
> > >
> > > How can we fix this ? It may have made sense a long time ago, but it'=
s
> > > making RPM handling way too difficult in I2C drivers now. We need
> > > something better instead of continuing to rely on cargo-cult for prob=
e
> > > functions. Most drivers are broken.
> >
> > Some could be broken, there's no question of that. A lot of drivers sup=
port
> > either ACPI or DT, too, so not _that_ many need to work with both. Albe=
it
> > that number is probably increasing constantly for the same devices are =
used
> > on both.
> >
> > Then there are drivers that prefer not powering on the device in probe =
(see
> > <URL:https://lore.kernel.org/linux-acpi/20210210230800.30291-2-sakari.a=
ilus@linux.intel.com/T/>),
> > it gets complicated to support all the combinatios of DT/ACPI (with or
> > without the flag / property for waiving powering device on for probe) a=
nd
> > CONFIG_PM enabled/disabled.
> >
> > What I think could be done to add a flag for drivers that handle power =
on
> > their own, or perhaps rather change how I2C_DRV_ACPI_WAIVE_D0_PROBE fla=
g
> > works. Right now it expects a property on the device but that check cou=
ld
> > be moved to existing drivers using the flag. Not many drivers are curre=
ntly
> > using the flag. I think this would simplify driver implementation as bo=
th
> > firmware interfaces would work the same way in this respect.
> >
> > You'd have to change one driver at a time, and people should be encoura=
ged
> > to write new drivers with that flag. Or add the flag to all existing
> > drivers and not accept new ones with it.
> >
> > These devices I think are all I=E6=B6=8E but my understanding is that s=
uch
> > differences exist elsewhere in the kernel, too. If they are to be
> > addressed, it would probably be best to have a unified approach towards=
 it.
> >
> > Added a few more people and lists to cc.
>
> + Hidenori from my team for visibility.
>
> I think we may want to take a step back and first define the problem
> itself. To do that, let's take a look separately at DT and ACPI cases
> (is platform data still relevant? are there any other firmware
> interfaces that deal with I2C devices?).
> For simplicity, let's forget about the ACPI waived power on in probe.
>
> DT:
>  1) hardware state unknown when probe is called
>  2) claim any independently managed resources (e.g. GPIOs)
>  3) enable runtime PM
>  4) if driver wants to access the hardware:
>     a) runtime PM get
>     b) enable any independently controlled resources (e.g. reset GPIO)
>     c) [do access]
>     d) disable any independently controlled resources
>     e) runtime PM put
>  5) after probe returns, regulators, clocks (and other similarly
> managed resources) would be force disabled if their enable count is 0
>  6) hardware state is off (after the runtime PM state settles)
>
> ACPI:
>  1) hardware state is active when probe is called
>  2) [n/a]
>  3) tell runtime PM framework that the state is active and then enable
> runtime PM
>  4) if driver wants to access the hardware:
>     a) runtime PM get
>     b) [n/a]
>     c) [do access]
>     d) [n/a]
>     e) runtime PM put
>  5) [n/a]
>  6) hardware state is off (after the runtime PM state settles)
>
> It seems like the relevant difference here is that for ACPI, the
> driver needs to know that the initial state is active and also relay
> this knowledge to the runtime PM subsystem. If we could make the ACPI
> PM domain work the same way as regulators and clocks and eventually
> power off some time later when the enable count is 0, then perhaps we
> could avoid the problem in the first place?
>
> Best regards,
> Tomasz
