Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4F6019E413
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 11:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgDDJXH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 05:23:07 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:45337 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725916AbgDDJXG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 Apr 2020 05:23:06 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id E4D20559;
        Sat,  4 Apr 2020 05:23:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sat, 04 Apr 2020 05:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=zAXUKspQq5prgl6hzmsLOhCpbcD
        vY33t8hPLzfl3Mpk=; b=x88wNBSRuL9WgOstkO9oxX9XHxgOKoeZbRnZRTJ0JRl
        /uDDGJ/aYg0FZ/WlQU/Ujmyka2mOjidrq+9g3XKJzpOsRmjHon8sMBLkidXO/eBt
        OUrLj1nyiNmjKGOxXjpRp8iPcPtbEzLHE1f6qJzfRRTg7rsGg0oUM6KOXpvtKw+x
        yH/toqc6nDCOVHESJiswU/JKy0GETM+grra03JW3hQpNPZXSE5JqNoRMY4A0mcop
        W89E1JrSzUoRUScKw7yUCyehKZjpDW7Zhkqi+XJK9FMBma+UZEDWtPu8wr9VnxwD
        ZhZvKHp3EswONOlY5XiiMIXPnhfZKSnSc/u2AJsHsHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zAXUKs
        pQq5prgl6hzmsLOhCpbcDvY33t8hPLzfl3Mpk=; b=UfJcgdkS6DCpxNFAcEAbQ7
        L2HW72+htWtkh83xNuooQS/5KtdBS9OcutltS5JC414KVNFMYHdlEtIIppolGrBt
        0cpm8XRpw+i4h/fer6yu7+jWu13XR4xeIx8k/kIqgBW0RF/s94SP/8+LBFWz43jg
        SwUKZlOVz+om95yyvJfKndhEllCLIKaKkdwe+K1Omn/pm6662cApHJHXx0idGouo
        iDza70xbLiHAKVjyvyqn/DRCEw99cfkVIzjdWcdgk7hPzr6sN8mY3nwI1yD7L0Kj
        4eBb2gyhv75pGjyJTS7Xtv6NpYQUTQhEKgqm4BSj5mzwhrhRSEiJO3ByGWzpSVaw
        ==
X-ME-Sender: <xms:91GIXi4atU7v-qfzvFlqUgNstppMxQNOLmrz9Wom7wR_SzrtWXyVog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdekgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
    epuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvse
    gtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:91GIXsXss3L2fc5gU-JusSxmijMlvIgN_GqmZcCku4rCQDeaJUiEVg>
    <xmx:91GIXhM-1PkeSjuTvTZuO22AWf1Vf1AMvKXovoIqy8z5Pl-h2Pzujg>
    <xmx:91GIXrhPORme2B6RZ0K27Lzp9nGQPrwaDR0C-8VoForoTVhNAm65FQ>
    <xmx:-FGIXuP1fb34VNnFnuoysS5qZyN_FsNMFD1R9yV7bpnbXECnDBobUQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2A9573280064;
        Sat,  4 Apr 2020 05:23:03 -0400 (EDT)
Date:   Sat, 4 Apr 2020 11:23:01 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 1/3] media: dt-bindings: ov8856: Document YAML bindings
Message-ID: <20200404092301.rb6imy7mlawm3qyk@gilmour.lan>
References: <20200331133346.372517-1-robert.foss@linaro.org>
 <20200331133346.372517-2-robert.foss@linaro.org>
 <20200401080705.j4goeqcqhoswhx4u@gilmour.lan>
 <CAG3jFyvUd08U9yNVPUD9Y=nd5Xpcx34GcHJRhtvAAycoq3qimg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fbziyfywvt4qmj3b"
Content-Disposition: inline
In-Reply-To: <CAG3jFyvUd08U9yNVPUD9Y=nd5Xpcx34GcHJRhtvAAycoq3qimg@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fbziyfywvt4qmj3b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Thu, Apr 02, 2020 at 12:10:00PM +0200, Robert Foss wrote:
> On Wed, 1 Apr 2020 at 10:07, Maxime Ripard <maxime@cerno.tech> wrote:
> > On Tue, Mar 31, 2020 at 03:33:44PM +0200, Robert Foss wrote:
> > > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > >
> > > This patch adds documentation of device tree in YAML schema for the
> > > OV8856 CMOS image sensor.
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > > ---
> > >
> > > - Changes since v5:
> > >   * Add assigned-clocks and assigned-clock-rates
> > >   * robher: dt-schema errors
> > >
> > > - Changes since v4:
> > >   * Fabio: Change reset-gpio to GPIO_ACTIVE_LOW, explain in description
> > >   * Add clock-lanes property to example
> > >   * robher: Fix syntax error in devicetree example
> > >
> > > - Changes since v3:
> > >   * robher: Fix syntax error
> > >   * robher: Removed maxItems
> > >   * Fixes yaml 'make dt-binding-check' errors
> > >
> > > - Changes since v2:
> > >   Fixes comments from from Andy, Tomasz, Sakari, Rob.
> > >   * Convert text documentation to YAML schema.
> > >
> > > - Changes since v1:
> > >   Fixes comments from Sakari, Tomasz
> > >   * Add clock-frequency and link-frequencies in DT
> > >
> > >  .../devicetree/bindings/media/i2c/ov8856.yaml | 150 ++++++++++++++++++
> > >  MAINTAINERS                                   |   1 +
> > >  2 files changed, 151 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > new file mode 100644
> > > index 000000000000..beeddfbb8709
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > @@ -0,0 +1,150 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +# Copyright (c) 2019 MediaTek Inc.
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Omnivision OV8856 CMOS Sensor Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Ben Kao <ben.kao@intel.com>
> > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > +
> > > +description: |-
> > > +  The Omnivision OV8856 is a high performance, 1/4-inch, 8 megapixel, CMOS
> > > +  image sensor that delivers 3264x2448 at 30fps. It provides full-frame,
> > > +  sub-sampled, and windowed 10-bit MIPI images in various formats via the
> > > +  Serial Camera Control Bus (SCCB) interface. This chip is programmable
> > > +  through I2C and two-wire SCCB. The sensor output is available via CSI-2
> > > +  serial data output (up to 4-lane).
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ovti,ov8856
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    description:
> > > +      Input clock for the sensor.
> > > +    items:
> > > +      - const: xvclk
> > > +
> > > +  clock-frequency:
> > > +    description:
> > > +      Frequency of the xvclk clock in Hertz.
> >
> > We also had that discussion recently for another omnivision sensor
> > (ov5645 iirc), but what is clock-frequency useful for?
> >
> > It seems that the sensor is passed in clocks, so if you need to
> > retrieve the clock rate you should use the clock API instead.
> >
> > Looking at the driver, it looks like it first retrieves the clock, set
> > it to clock-frequency, and then checks that this is OV8856_XVCLK_19_2
> > (19.2 MHz).
>
> As far as I understand it, 19.2MHz is requirement for the sensor mode
> that currently defaults to. Some modes require higher clock speeds
> than this however.
>
> >
> > The datasheet says that the sensor can have any frequency in the 6 -
> > 27 MHz range, so this is a driver limitation and should be set in the
> > driver using the clock API, and you can always bail out if it doesn't
> > provide a rate that is not acceptable for the drivers assumption.
> >
> > In any case, you don't need clock-frequency here...
>
> So your suggestion is that we remove all clocks-rate properties, and
> replace the clk_get_rate() calls in the driver with clk_set_rate()
> calls for the desired frequencies?

Yep, and if you need to make sure that the frequency that your
provider rounded to is matching 19.2MHz like you were doing, then you
can throw a clk_get_rate after it. It seems overly-restrictive to me,
but the device might be picky

Maxime

--fbziyfywvt4qmj3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXohR9QAKCRDj7w1vZxhR
xYMIAP9O3aHTl6TJZQh2I4fW24DKoOLFc28VD+Ru6S6bXreuxAD/bREvO1EVpsOY
fXas/arjWZ3N/JkpIRHokGYpS2LGIQw=
=sQRP
-----END PGP SIGNATURE-----

--fbziyfywvt4qmj3b--
