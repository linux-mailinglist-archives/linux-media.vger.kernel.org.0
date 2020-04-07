Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949531A0DB0
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 14:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgDGMcj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 08:32:39 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:36275 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728482AbgDGMci (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Apr 2020 08:32:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 21EA15C01CC;
        Tue,  7 Apr 2020 08:32:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 07 Apr 2020 08:32:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=AJJDe/ySRz3tiDgYe4Ah8eWUjMw
        PlBWYVnjlrFiwgpU=; b=CCPrM+UmHvchU6T42mFGaM+xWH2yZfApfdGSBDlSWgo
        Xh0OdoLnFs1sa+9urnGFkIrs92XYTBbvgLkAfCVLf/SlQ2Ofghm4AdZjNqtXQiXa
        qIEhanCDEdrxsfpWLM7yVbQGadXlRW+bPu0Ep0gcqfn8pG4//FtyKQK5xl6weXtX
        wcTHaHaZhDdoEbTJCvwVC07o9NwVbEBGhCVSINs9sXwjnU1+jSo62wRbShe8KLDd
        r4EQoxgv7KimD0NnfKN0IoUwSAJhT3Dz0g8QkLai4azf5+3zS+Wly+staUfJnR3v
        akLSQ9NEaTOFnE7B6+E1FojbdGQI5g2JBkQSvyF2xEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AJJDe/
        ySRz3tiDgYe4Ah8eWUjMwPlBWYVnjlrFiwgpU=; b=t4RqkwNMROgv8J04ULLbet
        vNfJFqLnjMojnj+Psea7DWXuOh/qi9j0f4iqKSVPucAeaeOl9kZO/LXN0dCIlU+7
        LXC3dT0yeGEVqRglpbS/n1NLioGN1BZ1A5m3gecAfIwtHsDgFMDk+PXhf/GIx2gv
        ZJP3yM2GEzEyqmG2Ty1tfya4a6EzFZ9CTL4vfwZeZQrpkycghppMBk/2V+5ysSDj
        m0D8zoRXlNJ0Vq3WfczsexvqVfeOWrAHElIXsWIXpWmSAe/1fcnL6+6OV6aGJ4TS
        /ITx6gNMVYtlXXnYqzt2Y+KLuj6qxbJ4ZcKJEBmzlriPHJK9/6istrrP1vJkXakw
        ==
X-ME-Sender: <xms:4nKMXhxx3OJoYu1Ih5_UrKqWFi8ciC_sOMQacN_tG3ySHv8nyBfG5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehgdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnh
    hordhtvggthh
X-ME-Proxy: <xmx:4nKMXuejvC_z9AjzWbD98-bH3EL_wkH29hXxmJoTIFqH24JDdymWHA>
    <xmx:4nKMXjXiFNgG_f_d-m57ibzOGjIuern_3XWhdOFyfXhyx7MCUIL_Yg>
    <xmx:4nKMXkMVbbbdHht8-D-F5Xy6xouh6UYJmHL_yohmUauBaFNe6-cwoA>
    <xmx:5XKMXrqDifzzqHNJWRY_TK0e2EdA0gCx0lQX52w0uDmaoK7YUzidxA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1E3CC328005E;
        Tue,  7 Apr 2020 08:32:34 -0400 (EDT)
Date:   Tue, 7 Apr 2020 14:32:32 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Robert Foss <robert.foss@linaro.org>
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
Subject: Re: [PATCH v6 1/3] media: dt-bindings: ov8856: Document YAML bindings
Message-ID: <20200407123232.ktvaifhqntgzvkap@gilmour.lan>
References: <20200331133346.372517-1-robert.foss@linaro.org>
 <20200331133346.372517-2-robert.foss@linaro.org>
 <20200401080705.j4goeqcqhoswhx4u@gilmour.lan>
 <CAG3jFyvUd08U9yNVPUD9Y=nd5Xpcx34GcHJRhtvAAycoq3qimg@mail.gmail.com>
 <20200403232736.GA6127@valkosipuli.retiisi.org.uk>
 <20200404093446.vuvwrhn5436h4d3s@gilmour.lan>
 <20200406083506.GE6127@valkosipuli.retiisi.org.uk>
 <20200407083647.4mocdl7aqa3x737q@gilmour.lan>
 <CAG3jFyvd32pWppubMoOoyH9eO2XLjwUXMC7p4xtv8m+JkPv6vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l6xvrv4jf2wbahni"
Content-Disposition: inline
In-Reply-To: <CAG3jFyvd32pWppubMoOoyH9eO2XLjwUXMC7p4xtv8m+JkPv6vw@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--l6xvrv4jf2wbahni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Tue, Apr 07, 2020 at 01:29:05PM +0200, Robert Foss wrote:
> On Tue, 7 Apr 2020 at 10:36, Maxime Ripard <maxime@cerno.tech> wrote:
> > On Mon, Apr 06, 2020 at 11:35:07AM +0300, Sakari Ailus wrote:
> > > > But that 19.2MHz is not a limitation of the device itself, it's a
> > > > limitation of our implementation, so we can instead implement
> > > > something equivalent in Linux using a clk_set_rate to 19.2MHz (to make
> > > > sure that our parent clock is configured at the right rate) and the
> > > > clk_get_rate and compare that to 19.2MHz (to make sure that it's not
> > > > been rounded too far apart from the frequency we expect).
> > > >
> > > > This is doing exactly the same thing, except that we don't encode our
> > > > implementation limitations in the DT, but in the driver instead.
> > >
> > > What I really wanted to say that a driver that doesn't get the clock
> > > frequency from DT but still sets that frequency is broken.
> > >
> > > This frequency is highly system specific, and in many cases only a certain
> > > frequency is usable, for a few reasons: On many SoCs, not all common
> > > frequencies can be used (e.g. 9,6 MHz, 19,2 MHz and 24 MHz; while others
> > > are being used as well), and then that frequency affects the usable CSI-2
> > > bus frequencies directly --- and of those, only safe, known-good ones
> > > should be used. IOW, getting the external clock frequency wrong typically
> > > has an effect that that none of the known-good CSI-2 bus clock frequencies
> > > are available.
> >
> > So clock-frequency is not about the "Frequency of the xvclk clock in
> > Hertz", but the frequency at which that clock must run on this
> > particular SoC / board to be functional?
> >
> > If so, then yeah, we should definitely keep it, but the documentation
> > of the binding should be made clearer as well.
>
> Alright so, let me summarise the desired approach then.

There's a separate discussion on the same topic here:
https://lore.kernel.org/linux-media/20200407122106.GD4751@pendragon.ideasonboard.com/

> ACPI:
>   - Fetch the "clock-frequency" property
>   - Verify it to be 19.2Mhz
>
> DT:
>   - Fetch the "clock-frequency" property
>   - Verify it to be 19.2Mhz
>   - Get xvclk clock
>   - Get xvclk clock rate
>   - Verify xvclk clock rate to be 19.2Mhz

The current status is that you should
's/clock-frequency/link-frequencies/', and in order to replace
assigned-clock-rates, you'll want to have a clk_set_rate to 19.2MHz
between steps 3 and 4

Maxime

--l6xvrv4jf2wbahni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXoxy4AAKCRDj7w1vZxhR
xVapAQCajMfkGy5KObQodKq6TMZ/f6RLIlLUEGI+a//+esc7rQEA2Ln60lZuEk5u
dZFJEBn6+y8Nrkp5GApl67Yq210tSQ4=
=eEag
-----END PGP SIGNATURE-----

--l6xvrv4jf2wbahni--
