Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62E3E1A11FE
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 18:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgDGQqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 12:46:23 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44280 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgDGQqX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 12:46:23 -0400
Received: by mail-ed1-f65.google.com with SMTP id i16so4857101edy.11
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 09:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BMeg8/u+aAWyp+BW+T1dMXhjJgPZOJD50ZkqHJzzRoE=;
        b=f5RWEbf+E0nWNJpvEWdEO8ocghgxfw4wvjDh9gLkUt0zvFUzMbiSxfotaP5774Ypuf
         lTmNnoMP6E7bkI5RDgeZqPaGu2ZZNhCC4a9oR8gdn1sr0AhsRh5VOEIieUEMYhlKwF02
         cG9muzV5Wbm2HWH/7PNjnhkB+sSrU9DCGcGwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BMeg8/u+aAWyp+BW+T1dMXhjJgPZOJD50ZkqHJzzRoE=;
        b=M8XJ29Kjkxw6IeKlBV3vM1of++8ucHTIVdjPdDdNWiIm+zfPljgyvzpn4g3+faJvdb
         hpEvP556dnXI9eAXBt5JfjeutK1LSPYYbOQ4IQX8hDvdE6WuYAfWJgL/k35q/MlbS1mv
         xIbgEbz0rSiavtTRXZt22QTGYd1Cv2VDeA78fZsFtyVzb70Hfni892UYoqtfnOUikFIF
         Jt6tmc++9kjEnH3aOnl8mo1BGRXGS4OEYmIf6Lpj/5wAtNq+KrKEP3tmn1GS0GxonXPZ
         inYboJDPJ6ShpqBjlcxTFTzFYCHQJIBW6wCoNy63prfFjNMWgUzNZGGmI05jmMrTkYqj
         KUpg==
X-Gm-Message-State: AGi0PubVhqqnfNY201vTygv0bbH2vmlfLRPDwC4/USraof98R/wlABbJ
        R48cRHAtsiSzJVRt4LAgh1ibPBLLmkkAPA==
X-Google-Smtp-Source: APiQypLsG5yWN/4WVg08iTvYJZE3x/TImRHNwskZTqPjZBtMOYGyjvmv7P1WhSa0fNgKxYVi+LGyzQ==
X-Received: by 2002:a17:907:271a:: with SMTP id w26mr2926464ejk.195.1586277980808;
        Tue, 07 Apr 2020 09:46:20 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id j6sm684077ejs.88.2020.04.07.09.46.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 09:46:20 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id j19so2566852wmi.2
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 09:46:19 -0700 (PDT)
X-Received: by 2002:a1c:a913:: with SMTP id s19mr215349wme.134.1586277979069;
 Tue, 07 Apr 2020 09:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200331133346.372517-2-robert.foss@linaro.org>
 <20200401080705.j4goeqcqhoswhx4u@gilmour.lan> <CAG3jFyvUd08U9yNVPUD9Y=nd5Xpcx34GcHJRhtvAAycoq3qimg@mail.gmail.com>
 <20200403232736.GA6127@valkosipuli.retiisi.org.uk> <20200404093446.vuvwrhn5436h4d3s@gilmour.lan>
 <20200406083506.GE6127@valkosipuli.retiisi.org.uk> <20200407083647.4mocdl7aqa3x737q@gilmour.lan>
 <CAG3jFyvd32pWppubMoOoyH9eO2XLjwUXMC7p4xtv8m+JkPv6vw@mail.gmail.com>
 <20200407123232.ktvaifhqntgzvkap@gilmour.lan> <CAG3jFysSrZJRE2TvL0bWoRFNnscgDGj8yGr-iwWBm4=1wMbJ9A@mail.gmail.com>
 <20200407163916.GL6127@valkosipuli.retiisi.org.uk>
In-Reply-To: <20200407163916.GL6127@valkosipuli.retiisi.org.uk>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 7 Apr 2020 18:46:06 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BGFB5znb9QyyPVL47kc809Ktu33bssvqg5eA-WwvMgOw@mail.gmail.com>
Message-ID: <CAAFQd5BGFB5znb9QyyPVL47kc809Ktu33bssvqg5eA-WwvMgOw@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] media: dt-bindings: ov8856: Document YAML bindings
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 7, 2020 at 6:40 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> On Tue, Apr 07, 2020 at 05:47:41PM +0200, Robert Foss wrote:
> > On Tue, 7 Apr 2020 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi Robert,
> > >
> > > On Tue, Apr 07, 2020 at 01:29:05PM +0200, Robert Foss wrote:
> > > > On Tue, 7 Apr 2020 at 10:36, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > On Mon, Apr 06, 2020 at 11:35:07AM +0300, Sakari Ailus wrote:
> > > > > > > But that 19.2MHz is not a limitation of the device itself, it's a
> > > > > > > limitation of our implementation, so we can instead implement
> > > > > > > something equivalent in Linux using a clk_set_rate to 19.2MHz (to make
> > > > > > > sure that our parent clock is configured at the right rate) and the
> > > > > > > clk_get_rate and compare that to 19.2MHz (to make sure that it's not
> > > > > > > been rounded too far apart from the frequency we expect).
> > > > > > >
> > > > > > > This is doing exactly the same thing, except that we don't encode our
> > > > > > > implementation limitations in the DT, but in the driver instead.
> > > > > >
> > > > > > What I really wanted to say that a driver that doesn't get the clock
> > > > > > frequency from DT but still sets that frequency is broken.
> > > > > >
> > > > > > This frequency is highly system specific, and in many cases only a certain
> > > > > > frequency is usable, for a few reasons: On many SoCs, not all common
> > > > > > frequencies can be used (e.g. 9,6 MHz, 19,2 MHz and 24 MHz; while others
> > > > > > are being used as well), and then that frequency affects the usable CSI-2
> > > > > > bus frequencies directly --- and of those, only safe, known-good ones
> > > > > > should be used. IOW, getting the external clock frequency wrong typically
> > > > > > has an effect that that none of the known-good CSI-2 bus clock frequencies
> > > > > > are available.
> > > > >
> > > > > So clock-frequency is not about the "Frequency of the xvclk clock in
> > > > > Hertz", but the frequency at which that clock must run on this
> > > > > particular SoC / board to be functional?
> > > > >
> > > > > If so, then yeah, we should definitely keep it, but the documentation
> > > > > of the binding should be made clearer as well.
> > > >
> > > > Alright so, let me summarise the desired approach then.
> > >
> > > There's a separate discussion on the same topic here:
> > > https://lore.kernel.org/linux-media/20200407122106.GD4751@pendragon.ideasonboard.com/
> >
> > Thanks for the link.
> >
> > >
> > > > ACPI:
> > > >   - Fetch the "clock-frequency" property
> > > >   - Verify it to be 19.2Mhz
> > > >
> > > > DT:
> > > >   - Fetch the "clock-frequency" property
> > > >   - Verify it to be 19.2Mhz
> > > >   - Get xvclk clock
> > > >   - Get xvclk clock rate
> > > >   - Verify xvclk clock rate to be 19.2Mhz
> > >
> > > The current status is that you should
> > > 's/clock-frequency/link-frequencies/', and in order to replace
> > > assigned-clock-rates, you'll want to have a clk_set_rate to 19.2MHz
> > > between steps 3 and 4
> >
> > Would we want to 's/clock-frequency/link-frequencies/' for ACPI too?
> > I imagine that would cause some breakage.
>
> It would, yes, and it would be no more correct on DT either.
>
> There are basically two possibilities here; either use the clock-frequency
> property and set the frequency, or rely on assigned-clock-rates, and get
> the frequency instead.
>
> The latter, while I understand it is generally preferred, comes with having
> to figure out the register list set that closest matches the frequency
> obtained. The former generally gets around this silently by the clock
> driver setting the closest frequency it can support.

Wouldn't the former actually cause problems, because the closest
frequency the clock driver can support could be pretty far from the
one requested? (E.g. 19.2 MHz vs 24 MHz) The driver needs to check the
resulting frequency anyway.

Perhaps a simplified approach of rounding the result of clk_get_rate()
to a multiple of 100 KHz and comparing it to the hardcoded value would
be enough in practice?
