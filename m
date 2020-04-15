Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552CC1A9619
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 10:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635811AbgDOITq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 04:19:46 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:53603 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2635807AbgDOITi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 04:19:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id A23FA580371;
        Wed, 15 Apr 2020 04:19:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 15 Apr 2020 04:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=c0+mwcl7MBFk9Sv+S+plTQlxlIQ
        dL7tFQ04GXjKv5tI=; b=KkhyMUNnh36NOj3Nnul7Fa6JQEYClOglTowhdfLcTQT
        UG+TIem4dU5tbEfbL7zSQQ0JH1LSDHJP4/u4tUJ3fdM6vcMYOZoprKIRButDou8S
        mRz+Yb6jltNsysr3vKQDG9UyW3XelLp8J79GfukjDe9mmjKZwJcwcTrLcebUMzVO
        5F1bYekHk87UOYjw6MldtKZCzB7lY4GdYUljAXshgLql9yPplMwdu59Jgw1kSZuI
        j41n8sjx6ECWLbewMLZYhgrFT5lfKiyicFj4aoeonW60gIcrVcpgvu7e0ye1PJkq
        31N2a6cCpSVsoR7PSdUKtdeaHetSmxKiDaS8bQGtAHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=c0+mwc
        l7MBFk9Sv+S+plTQlxlIQdL7tFQ04GXjKv5tI=; b=nADR2rguZ7s4c+kE2oDF56
        DXXKNWlQ/iQ/09LmaBuw3YX4mxfbEJCIOkbr43cXTz9MGQ6vv6m+CrJosyQpBxoy
        pFAQnaegbUJr0Z9IgYlVGQf+Ni3oDYp7wC9WxtY1zqrN+oTta4iHY+0PJh/HfqGi
        x95RLlsKpaucI6hoyB9yM1sVTG86xtd9VnoXYW+4F2MbQI9d5En186anXGMGjBX5
        XTRhm0XCIPIDUlv71RvBGgsB/eCGYH8dEbxvY25Vq1S9brucbdULzmnwhwrCJ+0P
        WvtJ1c9iZVYq8+0+8uCZ69bypVW6BoMfDzShfAARidpLBLkmV0X9h4KYY1iHmTsw
        ==
X-ME-Sender: <xms:k8OWXuE1nsq17RoGqaLMh63BpT8nUCJzeaAuy8Kn2Ih8AagawAnYNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeefgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:k8OWXqN-ll_sbO6qIK-6AvySogJ9BplzTTsx4ZUMXFlyqCqP2-vs5w>
    <xmx:k8OWXpE9Jm-DBZGkPAj5NR4XAstQPpZd0i6X2LUtBFoBSK-bkFMgGQ>
    <xmx:k8OWXvHaGilhPc0H75v92cRANlgRYGo04b1fIrPWsqDHGij2P_YH-g>
    <xmx:lMOWXnHH2kpnmtvbldbHTFYZYP3J8SQ-6a-GPg_rnsgrVhqgyWBsrg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1AC523280069;
        Wed, 15 Apr 2020 04:19:31 -0400 (EDT)
Date:   Wed, 15 Apr 2020 10:19:29 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v5 2/5] media: i2c: ov5645: Drop reading clock-frequency
 dt-property
Message-ID: <20200415081929.pijnlycz6p2esfjq@gilmour.lan>
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200406165108.GA7646@kekkonen.localdomain>
 <20200406173234.GD16885@pendragon.ideasonboard.com>
 <20200407062241.GA8883@kekkonen.localdomain>
 <20200407122106.GD4751@pendragon.ideasonboard.com>
 <20200407151401.GA5206@paasikivi.fi.intel.com>
 <20200414205552.GN19819@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uookw37fazu2qid4"
Content-Disposition: inline
In-Reply-To: <20200414205552.GN19819@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--uookw37fazu2qid4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2020 at 11:55:52PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
>
> On Tue, Apr 07, 2020 at 06:14:01PM +0300, Sakari Ailus wrote:
> > On Tue, Apr 07, 2020 at 03:21:06PM +0300, Laurent Pinchart wrote:
> > > On Tue, Apr 07, 2020 at 09:22:41AM +0300, Sakari Ailus wrote:
> > >> On Mon, Apr 06, 2020 at 08:32:34PM +0300, Laurent Pinchart wrote:
> > >>> On Mon, Apr 06, 2020 at 07:51:08PM +0300, Sakari Ailus wrote:
> > >>>> On Mon, Apr 06, 2020 at 05:42:38PM +0100, Lad Prabhakar wrote:
> > >>>>> Modes in the driver are based on xvclk frequency fixed to 24MHz, but where
> > >>>>> as the OV5645 sensor can support the xvclk frequency ranging from 6MHz to
> > >>>>> 24MHz. So instead making clock-frequency as dt-property just let the
> > >>>>> driver enforce the required clock frequency.
> > >>>>
> > >>>> Even if some current systems where the driver is used are using 24 MHz
> > >>>> clock, that doesn't mean there wouldn't be systems using another frequency
> > >>>> that the driver does not support right now.
> > >>>>
> > >>>> The driver really should not set the frequency unless it gets it from DT,
> > >>>> but I think the preferred means is to use assigned-clock-rates instead, and
> > >>>> not to involve the driver with setting the frequency.
> > >>>>
> > >>>> Otherwise we'll make it impossible to support other frequencies, at least
> > >>>> without more or less random defaults.
> > >>>
> > >>> We're running in circles here.
> > >>>
> > >>> As the driver only supports 24MHz at the moment, the frequency should be
> > >>> set by the driver, as it's a driver limitation. We can then work on
> > >>> supporting additional frequencies, which will require DT to provide a
> > >>> list of supported frequencies for the system, but that can be done on
> > >>> top.
> > >>
> > >> I guess it would be possible to use different external clock frequencies on
> > >> a sensor in a given system but that seems to be a bit far fetched, to the
> > >> extent I've never seen anyone doing that in practice.
> > >>
> > >> Originally, the driver set the frequency based on the clock-frequency
> > >> property. If we're removing that but use a fixed frequency instead, then
> > >> how is that going to work going forward when someone adds support for other
> > >> frequencies in the driver and has a system requiring that, while there are
> > >> some other platforms relying on the driver setting a particular frequency?
> > >
> > > The standard property for this is link-frequencies, not clock-frequency.
> > > Deprecating clock-frequency now paves the way to use the standard
> > > property later when/if someone implements support for additional
> > > frequencies.
> >
> > The external clock frequency and link frequency are different indeed, but
> > they are related. The link frequency has been selected in a way that it is
> > possible to generate that exact frequency using the chosen external clock
> > frequency. If you change the external clock frequency, chances are good
> > there is no PLL configuration to generate that link frequency.
>
> But aren't we supposed to pick the clock frequency based on the link
> frequency specified in DT ?
>
> In any case, this policy needs to be carefully documented.
>
> > >> Although, if you're saying that this driver only needs to work with DT that
> > >> comes with the kernel and you don't care about DT binary compatibility,
> > >> this would be fine.
> > >
> > > I believe this series to not break backward compatibility, as the driver
> > > only works with a 24MHz clock, so I expect all DTs to specify that.
> >
> > What you're still doing here is defining the DT bindings based on the
> > current driver implementation, not the device properties.
>
> Quite the contrary, the device doesn't require any particular input
> clock frequency, so we're removing that from DT :-) Specifying the clock
> frequency in DT is in my opinion a manual workaround for not computing
> it at runtime based on the desired link frequency, while the link
> frequency is a property of the system as it specifies the range of link
> frequencies that are safe to use from an EMC point of view.

I 100% agree with this.

Maxime

--uookw37fazu2qid4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpbDkQAKCRDj7w1vZxhR
xTu3AP4zRe3CyeaoVdSz5mN1PaQe1gzY8JJb8T2PC0y14N/mTAD/aB2f/I5JIh07
wglUb0GJggeJUp064hFN3uwBKf7OZA4=
=8n6u
-----END PGP SIGNATURE-----

--uookw37fazu2qid4--
