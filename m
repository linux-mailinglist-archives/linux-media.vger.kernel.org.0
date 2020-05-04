Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4C01C32B0
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 08:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgEDGY7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 02:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgEDGY7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 02:24:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26995C061A0E
        for <linux-media@vger.kernel.org>; Sun,  3 May 2020 23:24:59 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jVUX7-0004OA-T3; Mon, 04 May 2020 08:24:53 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jVUWx-0000TK-96; Mon, 04 May 2020 08:24:43 +0200
Date:   Mon, 4 May 2020 08:24:43 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Maxime Ripard <maxime@cerno.tech>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v6 2/3] media: ov8856: Add devicetree support
Message-ID: <20200504062443.qgme3pnhzugqeqhk@pengutronix.de>
References: <20200429162437.2025699-1-robert.foss@linaro.org>
 <20200429162437.2025699-3-robert.foss@linaro.org>
 <20200430093524.GB2188@pengutronix.de>
 <20200430094549.GF867@valkosipuli.retiisi.org.uk>
 <20200430095332.GC2188@pengutronix.de>
 <20200430095907.GG867@valkosipuli.retiisi.org.uk>
 <20200430101157.GD2188@pengutronix.de>
 <20200430102018.GI867@valkosipuli.retiisi.org.uk>
 <20200430120740.GG2188@pengutronix.de>
 <CAG3jFytP9=pL=9Qh64BKqQchs7J7E45USfirK_SnGn3NMeCdcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFytP9=pL=9Qh64BKqQchs7J7E45USfirK_SnGn3NMeCdcg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:13:17 up 170 days, 21:31, 171 users,  load average: 0.06, 0.04,
 0.05
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On 20-04-30 18:11, Robert Foss wrote:
> Hey Marco,
> 
> On Thu, 30 Apr 2020 at 14:07, Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > On 20-04-30 13:20, Sakari Ailus wrote:
> > > On Thu, Apr 30, 2020 at 12:11:57PM +0200, Marco Felsch wrote:
> > > > On 20-04-30 12:59, Sakari Ailus wrote:
> > > > > Hi Marco,
> > > > >
> > > > > On Thu, Apr 30, 2020 at 11:53:32AM +0200, Marco Felsch wrote:
> > > > > > Hi Sakari,
> > > > > >
> > > > > > On 20-04-30 12:45, Sakari Ailus wrote:
> > > > > > > Hi Marco,
> > > > > > >
> > > > > > > On Thu, Apr 30, 2020 at 11:35:24AM +0200, Marco Felsch wrote:
> > > >
> > > > ...
> > > >
> > > > > > > > > - if (mclk != OV8856_MCLK) {
> > > > > > > > > -         dev_err(dev, "external clock %d is not supported", mclk);
> > > > > > > > > -         return -EINVAL;
> > > > > > > > > + if (!is_acpi_node(fwnode)) {
> > > > > > > > > +         ov8856->xvclk = devm_clk_get(dev, "xvclk");
> > > > > > > > > +         if (IS_ERR(ov8856->xvclk)) {
> > > > > > > > > +                 dev_err(dev, "could not get xvclk clock (%pe)\n",
> > > > > > > > > +                                 ov8856->xvclk);
> > > > > > > > > +                 return PTR_ERR(ov8856->xvclk);
> > > > > > > > > +         }
> > > > > > > > > +
> > > > > > > > > +         clk_set_rate(ov8856->xvclk, xvclk_rate);
> > > > > > > > > +         xvclk_rate = clk_get_rate(ov8856->xvclk);
> > > > > > > > >   }
> > > > > > > >
> > > > > > > > Why do we handle the clock only in DT case? Is there a problem with the
> > > > > > > > clock handling and ACPI?
> > > > > > >
> > > > > > > Not really, it's just that ACPI does not provide an interface to the clocks
> > > > > > > as such.
> > > > > >
> > > > > > But you will get a clk by devm_clk_get()?
> > > > >
> > > > > No, because ACPI does not expose one to drivers. Effectively the entire
> > > > > power sequences are implemented in ACPI, not in the driver.
> > > > >
> > > >
> > > > Ah okay, thanks for the explanation. I'm really not into the ACPI
> > > > stuff.. So this means the __power_off / power_on should only be done if
> > > > we are using DT's?
> > >
> > > Correct. That's why it bails out early. It could be yet earlier though,
> > > without doing anything.
> >
> > Yes I see. For easier and error less prone handling I would prefer:
> >
> > if (is_acpi_node())
> >         return 0;
> >
> > as first instruction for __power_off/on().
> 
> __ov8856_power_on() does make a check like that, albeit only after
> having run clk_prepare_enable() which won't do anything due to
> ov8856->xvclk==NULL. So this should be fixed and be moved to after the
> ACPI check.

Yep, I saw that. I didn't checked the clk_prepare_enable() function and
just saw that we don't request the clk for the acpi case and enable it
in both cases. This doesn't sound right to me.

> __ov8856_power_off() has no ACPI check, but all of the calls it makes
> are going to do nothing due to v8856->reset_gpio / v8856->reset_gpio /
> ov8856->xvclk all being NULL or dummies. For the sake of clarity an
> early ACPI check+return could be added, but if clarity is the goal a
> comment would work too.

Thanks god that most of the library functions taking NULL into account
=) But I think we have to take the regulator count into account. Again I
don't know how the ACPI part is working. What happens if we request
regulators which aren't listed within the ACPI table? In case of DT
there will be added dummy-regulator. If this is the case for ACPI too we
are ending in an unbalanced regulator enable/disable count since you
enable it for the DT case and disable it in both cases.

> >
> > Also I would refactor the ov8856_check_hwcfg() so the common part can be
> > used by this function and by a ov8856_parse_of() function. But thats
> > only my opinion.
> 
> I'm trying to grok the above paragraph. You'd like to see something in
> the style of tc358743_probe_of()?

You don't have to if Saki is fine with the current patch. Just saying
that it would be a bit easier for the patch review.

Regards,
  Marco

> >
> > Regards,
> >   Marco
> 
