Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C07A71A108C
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 17:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbgDGPry (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 11:47:54 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43099 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgDGPry (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 11:47:54 -0400
Received: by mail-oi1-f193.google.com with SMTP id k5so1890973oiw.10
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 08:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C5+Tj/x0seqvn19MWhPZoKn+VlDCEMR9Hc+Aq3tkzY8=;
        b=AqvyHOEKa5D4KldSTXCJnWs49QR2eXk+zF16yQDJ/jO2g384gpvbB+mCb9j8OEA43m
         A6MJ5P+j9YHQ9ALT8li8x+DrQzx4FYzIUF4jzdSTBguXP75zfrh9l/P+mR2yC9oUFmbh
         Yn8a9rA4p42mGrhMH+ty00/pUaHnx9ZPa4dmFBsdcEWiR/R8eLwj7ps7YItEsiliVj9x
         hc7+ZDQQTkrx9SU1xDncAFv/vXs+HvkGPU5/2aEF17mo20t2DhLi36900gUTcWnRYfiV
         5jI4l5PaOBVH08bwik0C/yypiQ4cZP+kcrCOPLy8/Bm/UM9YAF3+Nh+1nBPDRQ+FHO80
         SCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C5+Tj/x0seqvn19MWhPZoKn+VlDCEMR9Hc+Aq3tkzY8=;
        b=mf91FlvlXssWRpl6Fnrd/ZEY6i6hwwtVUrFuG9lXe0Iqo6fEwcdAw6b6bFTV2l1Hp7
         hkdtIa8HCo5ZGTlcvOVjXf2Be5fLxeNVpeGt44bHhZbdaI/7MMLgXoA5AzZkp1/55Xx4
         oVMUhoXVAUn62I6DDKwrfLeWh2cDklH1OivY9sijf3U6l3kE1KJN9E9WCs2SLxos1SSi
         287nYSJPTBvCfnZF1ATpLNotDuF78Kk7/ZSxABnQOCvTwyJ1uNzA7zDXsfzX/4kQbO07
         SJ6x6CAf7DZ2FSwcDbJXrYcxlgI1z/VdKaeroawWxvEGraVWW5GsMc6bZwsP3bAXb4fd
         mGdQ==
X-Gm-Message-State: AGi0PuZ9iPyOVsI3l+GyjluJU9FXmU3ntPZqae0N21OslZD1d0DetIsG
        IcAGidKXx2fH8pq90JWQPKKHYblRKzEgOh8l25yTiQ==
X-Google-Smtp-Source: APiQypJu3SjURBCeHG9XCeUMhTFUk1+T5l/kcmiOEHAKUxA8FMQScTewM/7d0CG0YpkFEyil0R95v+JbbO4tHHpx7Qg=
X-Received: by 2002:aca:ab16:: with SMTP id u22mr2087293oie.133.1586274473098;
 Tue, 07 Apr 2020 08:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200331133346.372517-1-robert.foss@linaro.org>
 <20200331133346.372517-2-robert.foss@linaro.org> <20200401080705.j4goeqcqhoswhx4u@gilmour.lan>
 <CAG3jFyvUd08U9yNVPUD9Y=nd5Xpcx34GcHJRhtvAAycoq3qimg@mail.gmail.com>
 <20200403232736.GA6127@valkosipuli.retiisi.org.uk> <20200404093446.vuvwrhn5436h4d3s@gilmour.lan>
 <20200406083506.GE6127@valkosipuli.retiisi.org.uk> <20200407083647.4mocdl7aqa3x737q@gilmour.lan>
 <CAG3jFyvd32pWppubMoOoyH9eO2XLjwUXMC7p4xtv8m+JkPv6vw@mail.gmail.com> <20200407123232.ktvaifhqntgzvkap@gilmour.lan>
In-Reply-To: <20200407123232.ktvaifhqntgzvkap@gilmour.lan>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 7 Apr 2020 17:47:41 +0200
Message-ID: <CAG3jFysSrZJRE2TvL0bWoRFNnscgDGj8yGr-iwWBm4=1wMbJ9A@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] media: dt-bindings: ov8856: Document YAML bindings
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
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

On Tue, 7 Apr 2020 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Robert,
>
> On Tue, Apr 07, 2020 at 01:29:05PM +0200, Robert Foss wrote:
> > On Tue, 7 Apr 2020 at 10:36, Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Mon, Apr 06, 2020 at 11:35:07AM +0300, Sakari Ailus wrote:
> > > > > But that 19.2MHz is not a limitation of the device itself, it's a
> > > > > limitation of our implementation, so we can instead implement
> > > > > something equivalent in Linux using a clk_set_rate to 19.2MHz (to make
> > > > > sure that our parent clock is configured at the right rate) and the
> > > > > clk_get_rate and compare that to 19.2MHz (to make sure that it's not
> > > > > been rounded too far apart from the frequency we expect).
> > > > >
> > > > > This is doing exactly the same thing, except that we don't encode our
> > > > > implementation limitations in the DT, but in the driver instead.
> > > >
> > > > What I really wanted to say that a driver that doesn't get the clock
> > > > frequency from DT but still sets that frequency is broken.
> > > >
> > > > This frequency is highly system specific, and in many cases only a certain
> > > > frequency is usable, for a few reasons: On many SoCs, not all common
> > > > frequencies can be used (e.g. 9,6 MHz, 19,2 MHz and 24 MHz; while others
> > > > are being used as well), and then that frequency affects the usable CSI-2
> > > > bus frequencies directly --- and of those, only safe, known-good ones
> > > > should be used. IOW, getting the external clock frequency wrong typically
> > > > has an effect that that none of the known-good CSI-2 bus clock frequencies
> > > > are available.
> > >
> > > So clock-frequency is not about the "Frequency of the xvclk clock in
> > > Hertz", but the frequency at which that clock must run on this
> > > particular SoC / board to be functional?
> > >
> > > If so, then yeah, we should definitely keep it, but the documentation
> > > of the binding should be made clearer as well.
> >
> > Alright so, let me summarise the desired approach then.
>
> There's a separate discussion on the same topic here:
> https://lore.kernel.org/linux-media/20200407122106.GD4751@pendragon.ideasonboard.com/

Thanks for the link.

>
> > ACPI:
> >   - Fetch the "clock-frequency" property
> >   - Verify it to be 19.2Mhz
> >
> > DT:
> >   - Fetch the "clock-frequency" property
> >   - Verify it to be 19.2Mhz
> >   - Get xvclk clock
> >   - Get xvclk clock rate
> >   - Verify xvclk clock rate to be 19.2Mhz
>
> The current status is that you should
> 's/clock-frequency/link-frequencies/', and in order to replace
> assigned-clock-rates, you'll want to have a clk_set_rate to 19.2MHz
> between steps 3 and 4

Would we want to 's/clock-frequency/link-frequencies/' for ACPI too?
I imagine that would cause some breakage.
