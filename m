Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 508891A11E5
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 18:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgDGQk0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 12:40:26 -0400
Received: from retiisi.org.uk ([95.216.213.190]:52194 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727993AbgDGQk0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Apr 2020 12:40:26 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 0A114634C89;
        Tue,  7 Apr 2020 19:39:17 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jLrFs-0002MN-3d; Tue, 07 Apr 2020 19:39:16 +0300
Date:   Tue, 7 Apr 2020 19:39:16 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
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
Subject: Re: [PATCH v6 1/3] media: dt-bindings: ov8856: Document YAML bindings
Message-ID: <20200407163916.GL6127@valkosipuli.retiisi.org.uk>
References: <20200331133346.372517-2-robert.foss@linaro.org>
 <20200401080705.j4goeqcqhoswhx4u@gilmour.lan>
 <CAG3jFyvUd08U9yNVPUD9Y=nd5Xpcx34GcHJRhtvAAycoq3qimg@mail.gmail.com>
 <20200403232736.GA6127@valkosipuli.retiisi.org.uk>
 <20200404093446.vuvwrhn5436h4d3s@gilmour.lan>
 <20200406083506.GE6127@valkosipuli.retiisi.org.uk>
 <20200407083647.4mocdl7aqa3x737q@gilmour.lan>
 <CAG3jFyvd32pWppubMoOoyH9eO2XLjwUXMC7p4xtv8m+JkPv6vw@mail.gmail.com>
 <20200407123232.ktvaifhqntgzvkap@gilmour.lan>
 <CAG3jFysSrZJRE2TvL0bWoRFNnscgDGj8yGr-iwWBm4=1wMbJ9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFysSrZJRE2TvL0bWoRFNnscgDGj8yGr-iwWBm4=1wMbJ9A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 07, 2020 at 05:47:41PM +0200, Robert Foss wrote:
> On Tue, 7 Apr 2020 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Robert,
> >
> > On Tue, Apr 07, 2020 at 01:29:05PM +0200, Robert Foss wrote:
> > > On Tue, 7 Apr 2020 at 10:36, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > On Mon, Apr 06, 2020 at 11:35:07AM +0300, Sakari Ailus wrote:
> > > > > > But that 19.2MHz is not a limitation of the device itself, it's a
> > > > > > limitation of our implementation, so we can instead implement
> > > > > > something equivalent in Linux using a clk_set_rate to 19.2MHz (to make
> > > > > > sure that our parent clock is configured at the right rate) and the
> > > > > > clk_get_rate and compare that to 19.2MHz (to make sure that it's not
> > > > > > been rounded too far apart from the frequency we expect).
> > > > > >
> > > > > > This is doing exactly the same thing, except that we don't encode our
> > > > > > implementation limitations in the DT, but in the driver instead.
> > > > >
> > > > > What I really wanted to say that a driver that doesn't get the clock
> > > > > frequency from DT but still sets that frequency is broken.
> > > > >
> > > > > This frequency is highly system specific, and in many cases only a certain
> > > > > frequency is usable, for a few reasons: On many SoCs, not all common
> > > > > frequencies can be used (e.g. 9,6 MHz, 19,2 MHz and 24 MHz; while others
> > > > > are being used as well), and then that frequency affects the usable CSI-2
> > > > > bus frequencies directly --- and of those, only safe, known-good ones
> > > > > should be used. IOW, getting the external clock frequency wrong typically
> > > > > has an effect that that none of the known-good CSI-2 bus clock frequencies
> > > > > are available.
> > > >
> > > > So clock-frequency is not about the "Frequency of the xvclk clock in
> > > > Hertz", but the frequency at which that clock must run on this
> > > > particular SoC / board to be functional?
> > > >
> > > > If so, then yeah, we should definitely keep it, but the documentation
> > > > of the binding should be made clearer as well.
> > >
> > > Alright so, let me summarise the desired approach then.
> >
> > There's a separate discussion on the same topic here:
> > https://lore.kernel.org/linux-media/20200407122106.GD4751@pendragon.ideasonboard.com/
> 
> Thanks for the link.
> 
> >
> > > ACPI:
> > >   - Fetch the "clock-frequency" property
> > >   - Verify it to be 19.2Mhz
> > >
> > > DT:
> > >   - Fetch the "clock-frequency" property
> > >   - Verify it to be 19.2Mhz
> > >   - Get xvclk clock
> > >   - Get xvclk clock rate
> > >   - Verify xvclk clock rate to be 19.2Mhz
> >
> > The current status is that you should
> > 's/clock-frequency/link-frequencies/', and in order to replace
> > assigned-clock-rates, you'll want to have a clk_set_rate to 19.2MHz
> > between steps 3 and 4
> 
> Would we want to 's/clock-frequency/link-frequencies/' for ACPI too?
> I imagine that would cause some breakage.

It would, yes, and it would be no more correct on DT either.

There are basically two possibilities here; either use the clock-frequency
property and set the frequency, or rely on assigned-clock-rates, and get
the frequency instead.

The latter, while I understand it is generally preferred, comes with having
to figure out the register list set that closest matches the frequency
obtained. The former generally gets around this silently by the clock
driver setting the closest frequency it can support.

-- 
Regards,

Sakari Ailus
