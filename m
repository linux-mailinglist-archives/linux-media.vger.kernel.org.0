Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6E721A2335
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 15:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgDHNnY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 09:43:24 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:59159 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726754AbgDHNnY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Apr 2020 09:43:24 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 6783A396;
        Wed,  8 Apr 2020 09:43:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 08 Apr 2020 09:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=IUoT2yqEtBHFAFuB79MrspiA7L+
        Ga6nqd4foadbxsMg=; b=mfY0kAUfTRZ2C1hAupkKRm0gFngfrT5dPTCoj7Zlfov
        YnaX/2F4BxoCAi16ZiI82GDXn9SmvJkwKUTG1MlNUqEoUs6GXyeAkaT2wZBEviib
        B68JHA1+5uZv7tX2wzYM67xmeIVukgQ8wRimU1cIfozX+uQSPWeBQ2p5Ebc2xf3J
        QhP/581tt8Ok5vTH1yRKvfWxraMkLCqvUiiKjvr/MW+BMU2QspBbJLdD1AdXqUIf
        PstBQitE8UcUsrTdKU4ru5ObEExEqASfYe9pFlMTcDasSkuZ1/upSFCDYmc/VH1f
        0Lx3/yZHmbFG6Ve82fPK6gVLI36qrzcs26YEkKNf/cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IUoT2y
        qEtBHFAFuB79MrspiA7L+Ga6nqd4foadbxsMg=; b=i62LpLV/57xPrHOcLzfPcH
        2++k+hcBXSe7ZxAkBfziuri1to0e61Cmm3v1Co1mWN/XLsYQXG5tiav5vzN8NmgC
        TtvV7/WcIE6ImocT/xKhOxTJPzKyTTDLZQ8/V9esDEK92MgA5aWcqtchVtYvC/Ce
        OoOxZkvVAtX6WmdGgPhtYR4RTHLKb0PdquZcTsZAo9Noeg+ORDOpyNb3k+zknAsm
        yHYaEHtFf7j6fKCN3KKuGc0mrEf+kAty1d5P3YBTSOlBVChcFhUvCEGJqpMPajuT
        fMsM00csX2thrTvWyBu4DbxDmtgMQCw5QRdg9a+5gb5X20Ba3MPg3SOzrFwCCvcQ
        ==
X-ME-Sender: <xms:9tSNXgOEgd6IJfNlE6-HoJ6dQ7-kn3qZULjt6algrduwCHexWQoOKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnh
    hordhtvggthh
X-ME-Proxy: <xmx:9tSNXsPwgnUSIfiOgI6Mqz9m9TyKB2Neswx0vre0vzq9f969NwjRAQ>
    <xmx:9tSNXo9UZ5PzjRtUO-KSfn4djrnyBeYqWlvrx1YIjoad_8r0KNyv-Q>
    <xmx:9tSNXg5xFMM0rMyWJktDdIurxLWC4CRNWA76_sfKuyHO-ZaBO4xEQA>
    <xmx:-NSNXl4KpBwXPI3gCRfZTgvgbQq-sHEfu9HgV-D8aQTC-BnVfNcuNA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id A462B328006A;
        Wed,  8 Apr 2020 09:43:17 -0400 (EDT)
Date:   Wed, 8 Apr 2020 15:43:15 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Robert Foss <robert.foss@linaro.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 1/3] media: dt-bindings: ov8856: Document YAML bindings
Message-ID: <20200408134315.a7cemmto6bi26arg@gilmour.lan>
References: <20200406083506.GE6127@valkosipuli.retiisi.org.uk>
 <20200407083647.4mocdl7aqa3x737q@gilmour.lan>
 <CAG3jFyvd32pWppubMoOoyH9eO2XLjwUXMC7p4xtv8m+JkPv6vw@mail.gmail.com>
 <20200407123232.ktvaifhqntgzvkap@gilmour.lan>
 <CAG3jFysSrZJRE2TvL0bWoRFNnscgDGj8yGr-iwWBm4=1wMbJ9A@mail.gmail.com>
 <20200407163916.GL6127@valkosipuli.retiisi.org.uk>
 <CAAFQd5BGFB5znb9QyyPVL47kc809Ktu33bssvqg5eA-WwvMgOw@mail.gmail.com>
 <20200407172035.GM6127@valkosipuli.retiisi.org.uk>
 <20200408122127.i27hrmjh3pbjeulk@gilmour.lan>
 <CAAFQd5DNyQra-XksVaSfT_FCkOHTzm9mbn+tMd1vACV=pb9_8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="owxezxtdimw2wppf"
Content-Disposition: inline
In-Reply-To: <CAAFQd5DNyQra-XksVaSfT_FCkOHTzm9mbn+tMd1vACV=pb9_8g@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--owxezxtdimw2wppf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2020 at 02:35:28PM +0200, Tomasz Figa wrote:
> On Wed, Apr 8, 2020 at 2:21 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Tue, Apr 07, 2020 at 08:20:35PM +0300, Sakari Ailus wrote:
> > > On Tue, Apr 07, 2020 at 06:46:06PM +0200, Tomasz Figa wrote:
> > > > On Tue, Apr 7, 2020 at 6:40 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > > > >
> > > > > On Tue, Apr 07, 2020 at 05:47:41PM +0200, Robert Foss wrote:
> > > > > > On Tue, 7 Apr 2020 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > >
> > > > > > > Hi Robert,
> > > > > > >
> > > > > > > On Tue, Apr 07, 2020 at 01:29:05PM +0200, Robert Foss wrote:
> > > > > > > > On Tue, 7 Apr 2020 at 10:36, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > > > On Mon, Apr 06, 2020 at 11:35:07AM +0300, Sakari Ailus wrote:
> > > > > > > > > > > But that 19.2MHz is not a limitation of the device itself, it's a
> > > > > > > > > > > limitation of our implementation, so we can instead implement
> > > > > > > > > > > something equivalent in Linux using a clk_set_rate to 19.2MHz (to make
> > > > > > > > > > > sure that our parent clock is configured at the right rate) and the
> > > > > > > > > > > clk_get_rate and compare that to 19.2MHz (to make sure that it's not
> > > > > > > > > > > been rounded too far apart from the frequency we expect).
> > > > > > > > > > >
> > > > > > > > > > > This is doing exactly the same thing, except that we don't encode our
> > > > > > > > > > > implementation limitations in the DT, but in the driver instead.
> > > > > > > > > >
> > > > > > > > > > What I really wanted to say that a driver that doesn't get the clock
> > > > > > > > > > frequency from DT but still sets that frequency is broken.
> > > > > > > > > >
> > > > > > > > > > This frequency is highly system specific, and in many cases only a certain
> > > > > > > > > > frequency is usable, for a few reasons: On many SoCs, not all common
> > > > > > > > > > frequencies can be used (e.g. 9,6 MHz, 19,2 MHz and 24 MHz; while others
> > > > > > > > > > are being used as well), and then that frequency affects the usable CSI-2
> > > > > > > > > > bus frequencies directly --- and of those, only safe, known-good ones
> > > > > > > > > > should be used. IOW, getting the external clock frequency wrong typically
> > > > > > > > > > has an effect that that none of the known-good CSI-2 bus clock frequencies
> > > > > > > > > > are available.
> > > > > > > > >
> > > > > > > > > So clock-frequency is not about the "Frequency of the xvclk clock in
> > > > > > > > > Hertz", but the frequency at which that clock must run on this
> > > > > > > > > particular SoC / board to be functional?
> > > > > > > > >
> > > > > > > > > If so, then yeah, we should definitely keep it, but the documentation
> > > > > > > > > of the binding should be made clearer as well.
> > > > > > > >
> > > > > > > > Alright so, let me summarise the desired approach then.
> > > > > > >
> > > > > > > There's a separate discussion on the same topic here:
> > > > > > > https://lore.kernel.org/linux-media/20200407122106.GD4751@pendragon.ideasonboard.com/
> > > > > >
> > > > > > Thanks for the link.
> > > > > >
> > > > > > >
> > > > > > > > ACPI:
> > > > > > > >   - Fetch the "clock-frequency" property
> > > > > > > >   - Verify it to be 19.2Mhz
> > > > > > > >
> > > > > > > > DT:
> > > > > > > >   - Fetch the "clock-frequency" property
> > > > > > > >   - Verify it to be 19.2Mhz
> > > > > > > >   - Get xvclk clock
> > > > > > > >   - Get xvclk clock rate
> > > > > > > >   - Verify xvclk clock rate to be 19.2Mhz
> > > > > > >
> > > > > > > The current status is that you should
> > > > > > > 's/clock-frequency/link-frequencies/', and in order to replace
> > > > > > > assigned-clock-rates, you'll want to have a clk_set_rate to 19.2MHz
> > > > > > > between steps 3 and 4
> > > > > >
> > > > > > Would we want to 's/clock-frequency/link-frequencies/' for ACPI too?
> > > > > > I imagine that would cause some breakage.
> > > > >
> > > > > It would, yes, and it would be no more correct on DT either.
> > > > >
> > > > > There are basically two possibilities here; either use the clock-frequency
> > > > > property and set the frequency, or rely on assigned-clock-rates, and get
> > > > > the frequency instead.
> > > > >
> > > > > The latter, while I understand it is generally preferred, comes with having
> > > > > to figure out the register list set that closest matches the frequency
> > > > > obtained. The former generally gets around this silently by the clock
> > > > > driver setting the closest frequency it can support.
> > > >
> > > > Wouldn't the former actually cause problems, because the closest
> > > > frequency the clock driver can support could be pretty far from the
> > > > one requested? (E.g. 19.2 MHz vs 24 MHz) The driver needs to check the
> > > > resulting frequency anyway.
> > >
> > > That's possible, yes; in this case there wouldn't be a guarantee the
> > > frequency wouldn't be far off.
> >
> > assigned-clock-rates is really fragile... There's zero guarantee on
> > how far the actual rate is going to be from the asked one, but more
> > importantly you have zero guarantee on the time frame that rate is
> > going to be enforced for.
>
> Is there such a guarantee if clk_set_rate() is called?

with clk_set_rate itself, no, but...

> > It's simply going to change the rate as a one-off thing, and if
> > there's the next millisecond someone else is going to change its rate
> > one way or another, it's going to do so and you won't have any
> > notification.

You can get notified, and you can use clk_set_rate_exclusive if you
*really* want to enforce it.

Maxime

--owxezxtdimw2wppf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXo3U8wAKCRDj7w1vZxhR
xbYmAQCvwxs2MFAuzyEDUKdjZldNLQc1jKizMLAFVwSMjo//4gD/S2vhR5TU6ijC
oj73IKft7f4jO+EVP4AM7f34omC7pQI=
=kKXt
-----END PGP SIGNATURE-----

--owxezxtdimw2wppf--
